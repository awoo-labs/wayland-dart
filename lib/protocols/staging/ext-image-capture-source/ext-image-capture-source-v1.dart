// Generated by dart-wayland-scanner
// https://github.com/your-repo/dart-wayland-scanner
// XML file : https://gitlab.freedesktop.org/wayland/wayland-protocols/-/raw/main/staging/ext-image-capture-source/ext-image-capture-source-v1.xml
//
// ext_image_capture_source_v1 Protocol Copyright:
///
/// Copyright © 2022 Andri Yngvason
/// Copyright © 2024 Simon Ser
///
/// Permission is hereby granted, free of charge, to any person obtaining a
/// copy of this software and associated documentation files (the "Software"),
/// to deal in the Software without restriction, including without limitation
/// the rights to use, copy, modify, merge, publish, distribute, sublicense,
/// and/or sell copies of the Software, and to permit persons to whom the
/// Software is furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice (including the next
/// paragraph) shall be included in all copies or substantial portions of the
/// Software.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
/// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
/// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
/// DEALINGS IN THE SOFTWARE.
///

library client;

import 'package:wayland/wayland.dart';
import 'package:wayland/protocols/wayland.dart';
import 'dart:typed_data';
import 'package:wayland/protocols/staging/ext-foreign-toplevel-list/ext-foreign-toplevel-list-v1.dart';


/// opaque image capture source object
///
/// The image capture source object is an opaque descriptor for a capturable
/// resource.  This resource may be any sort of entity from which an image
/// may be derived.
///
/// Note, because ext_image_capture_source_v1 objects are created from multiple
/// independent factory interfaces, the ext_image_capture_source_v1 interface is
/// frozen at version 1.
///
class ExtImageCaptureSourceV1 extends Proxy {
  final Context innerContext;
  final version = 1;

  ExtImageCaptureSourceV1(this.innerContext)
      : super(innerContext.allocateClientId()) {
    innerContext.register(this);
  }

  @override
  toString() {
    return "ExtImageCaptureSourceV1 {name: 'ext_image_capture_source_v1', id: '$objectId', version: '1',}";
  }

  /// delete this object
  ///
  /// Destroys the image capture source. This request may be sent at any time
  /// by the client.
  ///
  Result<void, Object> destroy() {
    innerContext.unRegister(this);
    logLn("ExtImageCaptureSourceV1::destroy ");
    var arguments = [];
    var argTypes = <WaylandType>[];
    var calclulatedSize = calculateSize(argTypes, arguments);
    final bytesBuilder = BytesBuilder();
    bytesBuilder.add(
        Uint32List.fromList([objectId, (calclulatedSize << 16) | 0])
            .buffer
            .asUint8List());
    try {
      innerContext.sendMessage(
        bytesBuilder.toBytes(),
      );
    } catch (e) {
      logLn("Exception in ExtImageCaptureSourceV1::destroy: $e");
      return Failure(e);
    }
    return Success(Object());
  }
}

/// image capture source manager for outputs
///
/// A manager for creating image capture source objects for wl_output objects.
///
class ExtOutputImageCaptureSourceManagerV1 extends Proxy {
  final Context innerContext;
  final version = 1;

  ExtOutputImageCaptureSourceManagerV1(this.innerContext)
      : super(innerContext.allocateClientId()) {
    innerContext.register(this);
  }

  @override
  toString() {
    return "ExtOutputImageCaptureSourceManagerV1 {name: 'ext_output_image_capture_source_manager_v1', id: '$objectId', version: '1',}";
  }

  /// create source object for output
  ///
  /// Creates a source object for an output. Images captured from this source
  /// will show the same content as the output. Some elements may be omitted,
  /// such as cursors and overlays that have been marked as transparent to
  /// capturing.
  ///
  /// [source]:
  /// [output]:
  Result<ExtImageCaptureSourceV1, Object> createSource(Output output) {
    var source = ExtImageCaptureSourceV1(innerContext);
    logLn(
        "ExtOutputImageCaptureSourceManagerV1::createSource  source: $source output: $output");
    var arguments = [source, output];
    var argTypes = <WaylandType>[WaylandType.newId, WaylandType.object];
    var calclulatedSize = calculateSize(argTypes, arguments);
    final bytesBuilder = BytesBuilder();
    bytesBuilder.add(
        Uint32List.fromList([objectId, (calclulatedSize << 16) | 0])
            .buffer
            .asUint8List());
    bytesBuilder
        .add(Uint32List.fromList([source.objectId]).buffer.asUint8List());
    bytesBuilder
        .add(Uint32List.fromList([output.objectId]).buffer.asUint8List());
    try {
      innerContext.sendMessage(
        bytesBuilder.toBytes(),
      );
    } catch (e) {
      logLn(
          "Exception in ExtOutputImageCaptureSourceManagerV1::createSource: $e");
      return Failure(e);
    }
    return Success(source);
  }

  /// delete this object
  ///
  /// Destroys the manager. This request may be sent at any time by the client
  /// and objects created by the manager will remain valid after its
  /// destruction.
  ///
  Result<void, Object> destroy() {
    innerContext.unRegister(this);
    logLn("ExtOutputImageCaptureSourceManagerV1::destroy ");
    var arguments = [];
    var argTypes = <WaylandType>[];
    var calclulatedSize = calculateSize(argTypes, arguments);
    final bytesBuilder = BytesBuilder();
    bytesBuilder.add(
        Uint32List.fromList([objectId, (calclulatedSize << 16) | 1])
            .buffer
            .asUint8List());
    try {
      innerContext.sendMessage(
        bytesBuilder.toBytes(),
      );
    } catch (e) {
      logLn("Exception in ExtOutputImageCaptureSourceManagerV1::destroy: $e");
      return Failure(e);
    }
    return Success(Object());
  }
}

/// image capture source manager for foreign toplevels
///
/// A manager for creating image capture source objects for
/// ext_foreign_toplevel_handle_v1 objects.
///
class ExtForeignToplevelImageCaptureSourceManagerV1 extends Proxy {
  final Context innerContext;
  final version = 1;

  ExtForeignToplevelImageCaptureSourceManagerV1(this.innerContext)
      : super(innerContext.allocateClientId()) {
    innerContext.register(this);
  }

  @override
  toString() {
    return "ExtForeignToplevelImageCaptureSourceManagerV1 {name: 'ext_foreign_toplevel_image_capture_source_manager_v1', id: '$objectId', version: '1',}";
  }

  /// create source object for foreign toplevel
  ///
  /// Creates a source object for a foreign toplevel handle. Images captured
  /// from this source will show the same content as the toplevel.
  ///
  /// [source]:
  /// [toplevel_handle]:
  Result<ExtImageCaptureSourceV1, Object> createSource(
      ExtForeignToplevelHandleV1 toplevelHandle) {
    var source = ExtImageCaptureSourceV1(innerContext);
    logLn(
        "ExtForeignToplevelImageCaptureSourceManagerV1::createSource  source: $source toplevelHandle: $toplevelHandle");
    var arguments = [source, toplevelHandle];
    var argTypes = <WaylandType>[WaylandType.newId, WaylandType.object];
    var calclulatedSize = calculateSize(argTypes, arguments);
    final bytesBuilder = BytesBuilder();
    bytesBuilder.add(
        Uint32List.fromList([objectId, (calclulatedSize << 16) | 0])
            .buffer
            .asUint8List());
    bytesBuilder
        .add(Uint32List.fromList([source.objectId]).buffer.asUint8List());
    bytesBuilder.add(
        Uint32List.fromList([toplevelHandle.objectId]).buffer.asUint8List());
    try {
      innerContext.sendMessage(
        bytesBuilder.toBytes(),
      );
    } catch (e) {
      logLn(
          "Exception in ExtForeignToplevelImageCaptureSourceManagerV1::createSource: $e");
      return Failure(e);
    }
    return Success(source);
  }

  /// delete this object
  ///
  /// Destroys the manager. This request may be sent at any time by the client
  /// and objects created by the manager will remain valid after its
  /// destruction.
  ///
  Result<void, Object> destroy() {
    innerContext.unRegister(this);
    logLn("ExtForeignToplevelImageCaptureSourceManagerV1::destroy ");
    var arguments = [];
    var argTypes = <WaylandType>[];
    var calclulatedSize = calculateSize(argTypes, arguments);
    final bytesBuilder = BytesBuilder();
    bytesBuilder.add(
        Uint32List.fromList([objectId, (calclulatedSize << 16) | 1])
            .buffer
            .asUint8List());
    try {
      innerContext.sendMessage(
        bytesBuilder.toBytes(),
      );
    } catch (e) {
      logLn(
          "Exception in ExtForeignToplevelImageCaptureSourceManagerV1::destroy: $e");
      return Failure(e);
    }
    return Success(Object());
  }
}
