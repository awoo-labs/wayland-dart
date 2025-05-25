import 'dart:io';
import 'package:yaml/yaml.dart';
import 'package:path/path.dart' as p;

class ImportMapper {
  final String mapPath;
  final String baseDir;
  late YamlMap _map;

  ImportMapper({
    required this.mapPath,
    this.baseDir = 'lib/protocols',
  }) {
    _loadMap();
  }

  void _loadMap() {
    final content = File(mapPath).readAsStringSync();
    final yaml = loadYaml(content) as YamlMap;
    _map = yaml['map'] as YamlMap;
  }

  List<String> applyToInterface(String filePath) {
    final segments = p.split(filePath);
    String env = 'stable';
    for (final e in ['staging', 'unstable']) {
      if (segments.contains(e)) {
        env = e;
        break;
      }
    }
    final base = p.basenameWithoutExtension(filePath);
    final parts = base.split('-').toList();
    if (parts.isNotEmpty && parts.last.contains(RegExp(r'\d'))) {
      parts.removeLast();
    }
    if (parts.isNotEmpty && parts.last == env) {
      parts.removeLast();
    }
    final key = parts.join('-');

    final results = <String>{};
    final envMap = _map[env] as YamlMap?;
    if (envMap != null) {
      final entry = envMap[key] as YamlMap?;
      if (entry != null && entry['imports'] is YamlMap) {
        (entry['imports'] as YamlMap).forEach((impEnv, list) {
          _recurseProto(list, impEnv, results);
        });
      }
      final matches = envMap['match'] as YamlList?;
      if (matches != null) {
        for (final m in matches) {
          final pattern = m['pattern'] as String;
          if (RegExp(pattern).hasMatch(key)) {
            final imps = m['imports'] as YamlMap;
            imps.forEach((impEnv, list) {
              _recurseProto(list, impEnv, results);
            });
          }
        }
      }
    }
    return results.toList();
  }

  void _recurseProto(dynamic list, String impEnv, Set<String> results) {
    final prefix = "package:wayland/protocols";
    for (final proto in list as YamlList) {
      final directory = Directory(p.join(baseDir, impEnv, proto));
      if (directory.existsSync()) {
        if (impEnv == 'stable') {
          results.add('$prefix/$impEnv/$proto/$proto.dart');
          continue;
        }
        final files = directory.listSync();
        final sorted = files
            .whereType<File>()
            .map((file) => p.basenameWithoutExtension(file.path))
            .map((file) => file.split("-").last)
            .where((file) => file.contains(RegExp(r'^v\d$')))
            .toList()
          ..sort();
        if (sorted.isNotEmpty) {
          final latest = sorted.last;
          if (impEnv == 'unstable') {
            results.add('$prefix/$impEnv/$proto/$proto-unstable-$latest.dart');
          } else {
            results.add('$prefix/$impEnv/$proto/$proto-$latest.dart');
          }
        } else {
          throw Exception(
              'No version found for $impEnv/$proto. Verify it has been specified properly.');
        }
      } else {
        throw Exception(
            'Directory $impEnv/$proto does not exist. Verify it has been specified properly.');
      }
    }
  }
}
