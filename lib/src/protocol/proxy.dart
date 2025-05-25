import 'dart:typed_data';
import 'package:wayland/src/protocol/context.dart';

class Proxy {
  int _id;

  set id(int id) {
    _id = id;
  }

  int get objectId => _id;

  Proxy(this._id);
}

class UnknownProxy extends Proxy {
  UnknownProxy(super.id, Context context);
}

abstract class Dispatcher {
  void dispatch(int opcode, int fd, Uint8List data);
}
