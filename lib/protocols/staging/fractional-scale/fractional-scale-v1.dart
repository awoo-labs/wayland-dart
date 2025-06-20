// Generated by dart-wayland-scanner
// https://github.com/your-repo/dart-wayland-scanner
// XML file : https://gitlab.freedesktop.org/wayland/wayland-protocols/-/raw/main/staging/fractional-scale/fractional-scale-v1.xml
//
// fractional_scale_v1 Protocol Copyright:
///
/// Copyright © 2022 Kenny Levinsen
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
// AWOO-MIXINS

/// fractional surface scale information
///
/// A global interface for requesting surfaces to use fractional scales.
///
class WpFractionalScaleManagerV1 extends Proxy {
  final Context innerContext;
  final version = 1;

  WpFractionalScaleManagerV1(this.innerContext)
      : super(innerContext.allocateClientId()) {
    innerContext.register(this);
  }

  @override
  toString() {
    return "WpFractionalScaleManagerV1 {name: 'wp_fractional_scale_manager_v1', id: '$objectId', version: '1',}";
  }

  /// unbind the fractional surface scale interface
  ///
  /// Informs the server that the client will not be using this protocol
  /// object anymore. This does not affect any other objects,
  /// wp_fractional_scale_v1 objects included.
  ///
  Result<void, Object> destroy() {
    innerContext.unRegister(this);
    logLn("WpFractionalScaleManagerV1::destroy ");
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
      logLn("Exception in WpFractionalScaleManagerV1::destroy: $e");
      return Failure(e);
    }
    return Success(Object());
  }

  /// extend surface interface for scale information
  ///
  /// Create an add-on object for the the wl_surface to let the compositor
  /// request fractional scales. If the given wl_surface already has a
  /// wp_fractional_scale_v1 object associated, the fractional_scale_exists
  /// protocol error is raised.
  ///
  /// [id]: the new surface scale info interface id
  /// [surface]: the surface
  Result<WpFractionalScaleV1, Object> getFractionalScale(Surface surface) {
    var id = WpFractionalScaleV1(innerContext);
    logLn(
        "WpFractionalScaleManagerV1::getFractionalScale  id: $id surface: $surface");
    var arguments = [id, surface];
    var argTypes = <WaylandType>[WaylandType.newId, WaylandType.object];
    var calclulatedSize = calculateSize(argTypes, arguments);
    final bytesBuilder = BytesBuilder();
    bytesBuilder.add(
        Uint32List.fromList([objectId, (calclulatedSize << 16) | 1])
            .buffer
            .asUint8List());
    bytesBuilder.add(Uint32List.fromList([id.objectId]).buffer.asUint8List());
    bytesBuilder
        .add(Uint32List.fromList([surface.objectId]).buffer.asUint8List());
    try {
      innerContext.sendMessage(
        bytesBuilder.toBytes(),
      );
    } catch (e) {
      logLn("Exception in WpFractionalScaleManagerV1::getFractionalScale: $e");
      return Failure(e);
    }
    return Success(id);
  }
}

///
///

enum WpFractionalScaleManagerV1Error {
  /// the surface already has a fractional_scale object associated
  fractionalScaleExists("fractional_scale_exists", 0);

  const WpFractionalScaleManagerV1Error(this.enumName, this.enumValue);
  final int enumValue;
  final String enumName;
  @override
  toString() {
    return "WpFractionalScaleManagerV1Error {name: $enumName, value: $enumValue}";
  }
}

/// notify of new preferred scale
///
/// Notification of a new preferred scale for this surface that the
/// compositor suggests that the client should use.
///
/// The sent scale is the numerator of a fraction with a denominator of 120.
///
class WpFractionalScaleV1PreferredScaleEvent {
  /// the new preferred scale
  final int scale;

  WpFractionalScaleV1PreferredScaleEvent(
    this.scale,
  );

  @override
  toString() {
    return "WpFractionalScaleV1PreferredScaleEvent (scale: $scale)";
  }
}

typedef WpFractionalScaleV1PreferredScaleEventHandler = void Function(
    WpFractionalScaleV1PreferredScaleEvent);

/// fractional scale interface to a wl_surface
///
/// An additional interface to a wl_surface object which allows the compositor
/// to inform the client of the preferred scale.
///
class WpFractionalScaleV1 extends Proxy implements Dispatcher {
  final Context innerContext;
  final version = 1;

  WpFractionalScaleV1(this.innerContext)
      : super(innerContext.allocateClientId()) {
    innerContext.register(this);
  }

  @override
  toString() {
    return "WpFractionalScaleV1 {name: 'wp_fractional_scale_v1', id: '$objectId', version: '1',}";
  }

  /// remove surface scale information for surface
  ///
  /// Destroy the fractional scale object. When this object is destroyed,
  /// preferred_scale events will no longer be sent.
  ///
  Result<void, Object> destroy() {
    innerContext.unRegister(this);
    logLn("WpFractionalScaleV1::destroy ");
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
      logLn("Exception in WpFractionalScaleV1::destroy: $e");
      return Failure(e);
    }
    return Success(Object());
  }

  /// notify of new preferred scale
  ///
  /// Notification of a new preferred scale for this surface that the
  /// compositor suggests that the client should use.
  ///
  /// The sent scale is the numerator of a fraction with a denominator of 120.
  ///
  /// Event handler for PreferredScale
  /// - [scale]: the new preferred scale
  void onPreferredScale(WpFractionalScaleV1PreferredScaleEventHandler handler) {
    _preferredScaleHandler = handler;
  }

  WpFractionalScaleV1PreferredScaleEventHandler? _preferredScaleHandler;

  @override
  void dispatch(int opcode, int fd, Uint8List data) {
    logLn("WpFractionalScaleV1.dispatch($opcode, $fd, $data)");
    switch (opcode) {
      case 0:
        if (_preferredScaleHandler != null) {
          var offset = 0;
          final scale =
              ByteData.view(data.buffer).getUint32(offset, Endian.little);
          offset += 4;
          var event = WpFractionalScaleV1PreferredScaleEvent(
            scale,
          );
          _preferredScaleHandler!(event);
        }
        break;
    }
  }
}
