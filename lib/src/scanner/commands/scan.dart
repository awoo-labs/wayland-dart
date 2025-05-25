import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:wayland/src/scanner/generator.dart';
import 'package:wayland/src/scanner/types.dart';
import 'package:yaml/yaml.dart';
import 'package:wayland/src/scanner/awoo-mixins/import-mapper.dart';

const protocolCacheDir = '.wayland-protocol-cache';

class ScanCommand extends Command {
  String inputFile = '';
  String outputFile = '';
  String packageName = '';
  String prefix = '';
  String suffix = '';
  late Protocol protocol;
  late ImportMapper mapper;

  @override
  String get name => 'scan';

  @override
  String get description => 'Scan Wayland protocol XML and generate Dart code';

  ScanCommand() {
    argParser
      ..addOption('i',
          help: 'Remote url or local path of the protocol xml file')
      ..addOption('o',
          help: 'Path of the generated output dart file', defaultsTo: null)
      ..addOption('pkg', help: 'Dart package name', defaultsTo: 'wayland')
      ..addOption('prefix', help: 'Specify prefix to trim', defaultsTo: null)
      ..addOption('suffix', help: 'Specify suffix to trim', defaultsTo: null)
      ..addOption('import-map',
          help: '(Awoo addition) import map file',
          defaultsTo: 'awoo-mixins/import-map.yaml')
      ..addOption('format',
          help: 'format generated code using dart format', defaultsTo: null)
      ..addOption('clean',
          help: 'should first remove generated', defaultsTo: 'false')
      ..addOption('protocols',
          help: 'Specify yaml file to load protocols', defaultsTo: null)
      ..addOption('cache-dir', help: 'cache dir ', defaultsTo: protocolCacheDir)
      ..addOption('generation-dir',
          help: 'dir to store generated code', defaultsTo: 'lib/protocols');
  }

  @override
  void run() async {
    inputFile = argResults?['i'] ?? '';
    outputFile = argResults?['o'] ?? '';
    packageName = argResults?['pkg'] ?? '';
    prefix = argResults?['prefix'] as String? ?? '';
    suffix = argResults?['suffix'] as String? ?? '';
    // Initialize import mapper
    final mapPath = argResults?['import-map'] as String;
    mapper = ImportMapper(mapPath: mapPath);
    var generationDir = argResults?['generation-dir'] as String;

    bool format = false;

    if (argResults?['format'] == 'true') {
      format = true;
    }

    if (argResults?['clean'] == 'true') {
      if (await Directory(generationDir).exists()) {
        await Directory(generationDir).delete(recursive: true);
      }
    }

    if (argResults?['protocols'] != null) {
      final yamlContent =
          await File(argResults?['protocols'] as String).readAsString();

      final yamlMap = loadYaml(yamlContent) as YamlMap;
      final protocolsList = yamlMap['protocols'] as YamlList;

      // (Awoo addition) Apply import-map to each protocol

      var generators = protocolsList.map((protocol) {
        final protocolMap = protocol as YamlMap;
        final importPath = "$generationDir/${protocolMap['output']}";

        List<String> dependencies = [];
        var yamlDeps = protocolMap['dependencies'] as YamlList?;

        if (yamlDeps != null) {
          for (var dep in yamlDeps) {
            dependencies.add(dep);
          }
        }

        return Generator(
            packageName: packageName,
            prefix: prefix,
            suffix: suffix,
            inputFile: protocolMap['input'],
            outputFile: importPath,
            imports: dependencies,
            format: format,
            cacheDir: protocolCacheDir);
      }).toList();

      await Future.wait(generators.map((generator) {
        return generator.run();
      }));

      if (format) {
        await tryFmt();
        await tryFix();
      }

      for (var generator in generators) {
        var importDeps = mapper.applyToInterface(generator.outputFile);
        if (importDeps.isNotEmpty) {
          File f = File(generator.outputFile);
          var content = f.readAsStringSync();
          var imports = '';
          for (var dep in importDeps) {
            imports += "import '$dep';\n";
          }
          content = content.replaceFirst('// AWOO-MIXINS', imports);
          f.writeAsStringSync(content);
          logLn('Added imports to ${generator.outputFile}');
        }
      }

      return;
    }

    // Single-file scan: auto-load dependencies from protocols.yaml if present
    var importDeps = <String>[];
    var protocolsFile = File('protocols.yaml');
    if (protocolsFile.existsSync()) {
      final yamlMap = loadYaml(protocolsFile.readAsStringSync()) as YamlMap;
      for (var proto in yamlMap['protocols'] as YamlList) {
        final m = proto as YamlMap;
        if ((m['input'] as String) == inputFile) {
          final deps = m['dependencies'] as YamlList?;
          if (deps != null) importDeps.addAll(deps.cast<String>());
          break;
        }
      }
    }
    // Apply import-map for single-file
    importDeps.addAll(mapper.applyToInterface(outputFile));
    Generator generator = Generator(
        inputFile: inputFile,
        outputFile: "$generationDir/$outputFile",
        packageName: packageName,
        prefix: prefix,
        suffix: suffix,
        imports: importDeps,
        format: format,
        cacheDir: protocolCacheDir);
    generator.run();

    return; // done
  }

  void logLn(String message) {
    print(message);
  }

  Future tryFmt() async {
    var dart = await findDartExecutable();

    if (dart == null) {
      logLn('Could not find dart executable');
      return;
    }
    await Process.run(dart, ['format', 'lib']);
  }

  Future tryFix() async {
    var dart = await findDartExecutable();

    if (dart == null) {
      logLn('Could not find dart executable');
      return;
    }
    await Process.run(dart, ['fix', 'lib', '--apply']);
  }

  Future<String?> findDartExecutable() async {
    try {
      var result = await Process.run('which', ['dart']);
      if (result.exitCode == 0) {
        return result.stdout.toString().trim();
      } else {
        logLn(
            'Could not find dart executable: ${result.stderr.toString().trim()}');
        return null;
      }
    } catch (e) {
      logLn('Could not find dart executable');
    }
    return null;
  }

  parseProtocolsYaml(String yamlContent) {
    final yamlMap = loadYaml(yamlContent) as YamlMap;
    final protocolsList = yamlMap['protocols'] as YamlList;

    protocolsList.map((protocol) {
      final protocolMap = protocol as YamlMap;
      return Generator(
          // name: protocolMap['name'],
          packageName: packageName,
          inputFile: protocolMap['input'],
          outputFile: protocolMap['output'],
          cacheDir: protocolCacheDir);
    }).toList();
  }
}
