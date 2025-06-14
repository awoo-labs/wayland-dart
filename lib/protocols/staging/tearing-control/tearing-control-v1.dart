// Generated by dart-wayland-scanner
// https://github.com/your-repo/dart-wayland-scanner
// XML file : https://gitlab.freedesktop.org/wayland/wayland-protocols/-/raw/main/staging/tearing-control/tearing-control-v1.xml
//
// tearing_control_v1 Protocol Copyright:
///
/// Copyright © 2021 Xaver Hugl
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
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
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

/// protocol for tearing control
///
/// For some use cases like games or drawing tablets it can make sense to
/// reduce latency by accepting tearing with the use of asynchronous page
/// flips. This global is a factory interface, allowing clients to inform
/// which type of presentation the content of their surfaces is suitable for.
///
/// Graphics APIs like EGL or Vulkan, that manage the buffer queue and commits
/// of a wl_surface themselves, are likely to be using this extension
/// internally. If a client is using such an API for a wl_surface, it should
/// not directly use this extension on that surface, to avoid raising a
/// tearing_control_exists protocol error.
///
/// Warning! The protocol described in this file is currently in the testing
/// phase. Backward compatible changes may be added together with the
/// corresponding interface version bump. Backward incompatible changes can
/// only be done by creating a new major version of the extension.
///
class WpTearingControlManagerV1 extends Proxy {
  final Context innerContext;
  final version = 1;

  WpTearingControlManagerV1(this.innerContext)
      : super(innerContext.allocateClientId()) {
    innerContext.register(this);
  }

  @override
  toString() {
    return "WpTearingControlManagerV1 {name: 'wp_tearing_control_manager_v1', id: '$objectId', version: '1',}";
  }

  /// destroy tearing control factory object
  ///
  /// Destroy this tearing control factory object. Other objects, including
  /// wp_tearing_control_v1 objects created by this factory, are not affected
  /// by this request.
  ///
  Result<void, Object> destroy() {
    innerContext.unRegister(this);
    logLn("WpTearingControlManagerV1::destroy ");
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
      logLn("Exception in WpTearingControlManagerV1::destroy: $e");
      return Failure(e);
    }
    return Success(Object());
  }

  /// extend surface interface for tearing control
  ///
  /// Instantiate an interface extension for the given wl_surface to request
  /// asynchronous page flips for presentation.
  ///
  /// If the given wl_surface already has a wp_tearing_control_v1 object
  /// associated, the tearing_control_exists protocol error is raised.
  ///
  /// [id]:
  /// [surface]:
  Result<WpTearingControlV1, Object> getTearingControl(Surface surface) {
    var id = WpTearingControlV1(innerContext);
    logLn(
        "WpTearingControlManagerV1::getTearingControl  id: $id surface: $surface");
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
      logLn("Exception in WpTearingControlManagerV1::getTearingControl: $e");
      return Failure(e);
    }
    return Success(id);
  }
}

///
///

enum WpTearingControlManagerV1Error {
  /// the surface already has a tearing object associated
  tearingControlExists("tearing_control_exists", 0);

  const WpTearingControlManagerV1Error(this.enumName, this.enumValue);
  final int enumValue;
  final String enumName;
  @override
  toString() {
    return "WpTearingControlManagerV1Error {name: $enumName, value: $enumValue}";
  }
}

/// per-surface tearing control interface
///
/// An additional interface to a wl_surface object, which allows the client
/// to hint to the compositor if the content on the surface is suitable for
/// presentation with tearing.
/// The default presentation hint is vsync. See presentation_hint for more
/// details.
///
/// If the associated wl_surface is destroyed, this object becomes inert and
/// should be destroyed.
///
class WpTearingControlV1 extends Proxy {
  final Context innerContext;
  final version = 1;

  WpTearingControlV1(this.innerContext)
      : super(innerContext.allocateClientId()) {
    innerContext.register(this);
  }

  @override
  toString() {
    return "WpTearingControlV1 {name: 'wp_tearing_control_v1', id: '$objectId', version: '1',}";
  }

  /// set presentation hint
  ///
  /// Set the presentation hint for the associated wl_surface. This state is
  /// double-buffered, see wl_surface.commit.
  ///
  /// The compositor is free to dynamically respect or ignore this hint based
  /// on various conditions like hardware capabilities, surface state and
  /// user preferences.
  ///
  /// [hint]:
  Result<void, Object> setPresentationHint(int hint) {
    logLn("WpTearingControlV1::setPresentationHint  hint: $hint");
    var arguments = [hint];
    var argTypes = <WaylandType>[WaylandType.uint];
    var calclulatedSize = calculateSize(argTypes, arguments);
    final bytesBuilder = BytesBuilder();
    bytesBuilder.add(
        Uint32List.fromList([objectId, (calclulatedSize << 16) | 0])
            .buffer
            .asUint8List());
    bytesBuilder.add(Uint32List.fromList([hint]).buffer.asUint8List());
    try {
      innerContext.sendMessage(
        bytesBuilder.toBytes(),
      );
    } catch (e) {
      logLn("Exception in WpTearingControlV1::setPresentationHint: $e");
      return Failure(e);
    }
    return Success(Object());
  }

  /// destroy tearing control object
  ///
  /// Destroy this surface tearing object and revert the presentation hint to
  /// vsync. The change will be applied on the next wl_surface.commit.
  ///
  Result<void, Object> destroy() {
    innerContext.unRegister(this);
    logLn("WpTearingControlV1::destroy ");
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
      logLn("Exception in WpTearingControlV1::destroy: $e");
      return Failure(e);
    }
    return Success(Object());
  }
}

/// presentation hint values
///
/// This enum provides information for if submitted frames from the client
/// may be presented with tearing.
///

enum WpTearingControlV1PresentationHint {
  ///
  vsync("vsync", 0),

  ///
  async("async", 1);

  const WpTearingControlV1PresentationHint(this.enumName, this.enumValue);
  final int enumValue;
  final String enumName;
  @override
  toString() {
    return "WpTearingControlV1PresentationHint {name: $enumName, value: $enumValue}";
  }
}
