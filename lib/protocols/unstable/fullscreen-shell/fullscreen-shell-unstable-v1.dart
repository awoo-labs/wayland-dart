// Generated by dart-wayland-scanner
// https://github.com/your-repo/dart-wayland-scanner
// XML file : https://gitlab.freedesktop.org/wayland/wayland-protocols/-/raw/main/unstable/fullscreen-shell/fullscreen-shell-unstable-v1.xml
//
// fullscreen_shell_unstable_v1 Protocol Copyright:
///
/// Copyright © 2016 Yong Bakos
/// Copyright © 2015 Jason Ekstrand
/// Copyright © 2015 Jonas Ådahl
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

/// advertises a capability of the compositor
///
/// Advertises a single capability of the compositor.
///
/// When the wl_fullscreen_shell interface is bound, this event is emitted
/// once for each capability advertised.  Valid capabilities are given by
/// the wl_fullscreen_shell.capability enum.  If clients want to take
/// advantage of any of these capabilities, they should use a
/// wl_display.sync request immediately after binding to ensure that they
/// receive all the capability events.
///
class ZwpFullscreenShellV1CapabilityEvent {
  ///
  final int capability;

  ZwpFullscreenShellV1CapabilityEvent(
    this.capability,
  );

  @override
  toString() {
    return "ZwpFullscreenShellV1CapabilityEvent (capability: $capability)";
  }
}

typedef ZwpFullscreenShellV1CapabilityEventHandler = void Function(
    ZwpFullscreenShellV1CapabilityEvent);

/// displays a single surface per output
///
/// Displays a single surface per output.
///
/// This interface provides a mechanism for a single client to display
/// simple full-screen surfaces.  While there technically may be multiple
/// clients bound to this interface, only one of those clients should be
/// shown at a time.
///
/// To present a surface, the client uses either the present_surface or
/// present_surface_for_mode requests.  Presenting a surface takes effect
/// on the next wl_surface.commit.  See the individual requests for
/// details about scaling and mode switches.
///
/// The client can have at most one surface per output at any time.
/// Requesting a surface to be presented on an output that already has a
/// surface replaces the previously presented surface.  Presenting a null
/// surface removes its content and effectively disables the output.
/// Exactly what happens when an output is "disabled" is
/// compositor-specific.  The same surface may be presented on multiple
/// outputs simultaneously.
///
/// Once a surface is presented on an output, it stays on that output
/// until either the client removes it or the compositor destroys the
/// output.  This way, the client can update the output's contents by
/// simply attaching a new buffer.
///
/// Warning! The protocol described in this file is experimental and
/// backward incompatible changes may be made. Backward compatible changes
/// may be added together with the corresponding interface version bump.
/// Backward incompatible changes are done by bumping the version number in
/// the protocol and interface names and resetting the interface version.
/// Once the protocol is to be declared stable, the 'z' prefix and the
/// version number in the protocol and interface names are removed and the
/// interface version number is reset.
///
class ZwpFullscreenShellV1 extends Proxy implements Dispatcher {
  final Context innerContext;
  final version = 1;

  ZwpFullscreenShellV1(this.innerContext)
      : super(innerContext.allocateClientId()) {
    innerContext.register(this);
  }

  @override
  toString() {
    return "ZwpFullscreenShellV1 {name: 'zwp_fullscreen_shell_v1', id: '$objectId', version: '1',}";
  }

  /// release the wl_fullscreen_shell interface
  ///
  /// Release the binding from the wl_fullscreen_shell interface.
  ///
  /// This destroys the server-side object and frees this binding.  If
  /// the client binds to wl_fullscreen_shell multiple times, it may wish
  /// to free some of those bindings.
  ///
  Result<void, Object> release() {
    innerContext.unRegister(this);
    logLn("ZwpFullscreenShellV1::release ");
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
      logLn("Exception in ZwpFullscreenShellV1::release: $e");
      return Failure(e);
    }
    return Success(Object());
  }

  /// present surface for display
  ///
  /// Present a surface on the given output.
  ///
  /// If the output is null, the compositor will present the surface on
  /// whatever display (or displays) it thinks best.  In particular, this
  /// may replace any or all surfaces currently presented so it should
  /// not be used in combination with placing surfaces on specific
  /// outputs.
  ///
  /// The method parameter is a hint to the compositor for how the surface
  /// is to be presented.  In particular, it tells the compositor how to
  /// handle a size mismatch between the presented surface and the
  /// output.  The compositor is free to ignore this parameter.
  ///
  /// The "zoom", "zoom_crop", and "stretch" methods imply a scaling
  /// operation on the surface.  This will override any kind of output
  /// scaling, so the buffer_scale property of the surface is effectively
  /// ignored.
  ///
  /// This request gives the surface the role of a fullscreen shell surface.
  /// If the surface already has another role, it raises a role protocol
  /// error.
  ///
  /// [surface]:
  /// [method]:
  /// [output]:
  Result<void, Object> presentSurface(
      Surface surface, int method, Output output) {
    logLn(
        "ZwpFullscreenShellV1::presentSurface  surface: $surface method: $method output: $output");
    var arguments = [surface, method, output];
    var argTypes = <WaylandType>[
      WaylandType.object,
      WaylandType.uint,
      WaylandType.object
    ];
    var calclulatedSize = calculateSize(argTypes, arguments);
    final bytesBuilder = BytesBuilder();
    bytesBuilder.add(
        Uint32List.fromList([objectId, (calclulatedSize << 16) | 1])
            .buffer
            .asUint8List());
    bytesBuilder
        .add(Uint32List.fromList([surface.objectId]).buffer.asUint8List());
    bytesBuilder.add(Uint32List.fromList([method]).buffer.asUint8List());
    bytesBuilder
        .add(Uint32List.fromList([output.objectId]).buffer.asUint8List());
    try {
      innerContext.sendMessage(
        bytesBuilder.toBytes(),
      );
    } catch (e) {
      logLn("Exception in ZwpFullscreenShellV1::presentSurface: $e");
      return Failure(e);
    }
    return Success(Object());
  }

  /// present surface for display at a particular mode
  ///
  /// Presents a surface on the given output for a particular mode.
  ///
  /// If the current size of the output differs from that of the surface,
  /// the compositor will attempt to change the size of the output to
  /// match the surface.  The result of the mode-switch operation will be
  /// returned via the provided wl_fullscreen_shell_mode_feedback object.
  ///
  /// If the current output mode matches the one requested or if the
  /// compositor successfully switches the mode to match the surface,
  /// then the mode_successful event will be sent and the output will
  /// contain the contents of the given surface.  If the compositor
  /// cannot match the output size to the surface size, the mode_failed
  /// will be sent and the output will contain the contents of the
  /// previously presented surface (if any).  If another surface is
  /// presented on the given output before either of these has a chance
  /// to happen, the present_cancelled event will be sent.
  ///
  /// Due to race conditions and other issues unknown to the client, no
  /// mode-switch operation is guaranteed to succeed.  However, if the
  /// mode is one advertised by wl_output.mode or if the compositor
  /// advertises the ARBITRARY_MODES capability, then the client should
  /// expect that the mode-switch operation will usually succeed.
  ///
  /// If the size of the presented surface changes, the resulting output
  /// is undefined.  The compositor may attempt to change the output mode
  /// to compensate.  However, there is no guarantee that a suitable mode
  /// will be found and the client has no way to be notified of success
  /// or failure.
  ///
  /// The framerate parameter specifies the desired framerate for the
  /// output in mHz.  The compositor is free to ignore this parameter.  A
  /// value of 0 indicates that the client has no preference.
  ///
  /// If the value of wl_output.scale differs from wl_surface.buffer_scale,
  /// then the compositor may choose a mode that matches either the buffer
  /// size or the surface size.  In either case, the surface will fill the
  /// output.
  ///
  /// This request gives the surface the role of a fullscreen shell surface.
  /// If the surface already has another role, it raises a role protocol
  /// error.
  ///
  /// [surface]:
  /// [output]:
  /// [framerate]:
  /// [feedback]:
  Result<ZwpFullscreenShellModeFeedbackV1, Object> presentSurfaceForMode(
      Surface surface, Output output, int framerate) {
    var feedback = ZwpFullscreenShellModeFeedbackV1(innerContext);
    logLn(
        "ZwpFullscreenShellV1::presentSurfaceForMode  surface: $surface output: $output framerate: $framerate feedback: $feedback");
    var arguments = [surface, output, framerate, feedback];
    var argTypes = <WaylandType>[
      WaylandType.object,
      WaylandType.object,
      WaylandType.int,
      WaylandType.newId
    ];
    var calclulatedSize = calculateSize(argTypes, arguments);
    final bytesBuilder = BytesBuilder();
    bytesBuilder.add(
        Uint32List.fromList([objectId, (calclulatedSize << 16) | 2])
            .buffer
            .asUint8List());
    bytesBuilder
        .add(Uint32List.fromList([surface.objectId]).buffer.asUint8List());
    bytesBuilder
        .add(Uint32List.fromList([output.objectId]).buffer.asUint8List());
    bytesBuilder.add(Int32List.fromList([framerate]).buffer.asUint8List());
    bytesBuilder
        .add(Uint32List.fromList([feedback.objectId]).buffer.asUint8List());
    try {
      innerContext.sendMessage(
        bytesBuilder.toBytes(),
      );
    } catch (e) {
      logLn("Exception in ZwpFullscreenShellV1::presentSurfaceForMode: $e");
      return Failure(e);
    }
    return Success(feedback);
  }

  /// advertises a capability of the compositor
  ///
  /// Advertises a single capability of the compositor.
  ///
  /// When the wl_fullscreen_shell interface is bound, this event is emitted
  /// once for each capability advertised.  Valid capabilities are given by
  /// the wl_fullscreen_shell.capability enum.  If clients want to take
  /// advantage of any of these capabilities, they should use a
  /// wl_display.sync request immediately after binding to ensure that they
  /// receive all the capability events.
  ///
  /// Event handler for Capability
  /// - [capability]:
  void onCapability(ZwpFullscreenShellV1CapabilityEventHandler handler) {
    _capabilityHandler = handler;
  }

  ZwpFullscreenShellV1CapabilityEventHandler? _capabilityHandler;

  @override
  void dispatch(int opcode, int fd, Uint8List data) {
    logLn("ZwpFullscreenShellV1.dispatch($opcode, $fd, $data)");
    switch (opcode) {
      case 0:
        if (_capabilityHandler != null) {
          var offset = 0;
          final capability =
              ByteData.view(data.buffer).getUint32(offset, Endian.little);
          offset += 4;
          var event = ZwpFullscreenShellV1CapabilityEvent(
            capability,
          );
          _capabilityHandler!(event);
        }
        break;
    }
  }
}

/// capabilities advertised by the compositor
///
/// Various capabilities that can be advertised by the compositor.  They
/// are advertised one-at-a-time when the wl_fullscreen_shell interface is
/// bound.  See the wl_fullscreen_shell.capability event for more details.
///
/// ARBITRARY_MODES:
/// This is a hint to the client that indicates that the compositor is
/// capable of setting practically any mode on its outputs.  If this
/// capability is provided, wl_fullscreen_shell.present_surface_for_mode
/// will almost never fail and clients should feel free to set whatever
/// mode they like.  If the compositor does not advertise this, it may
/// still support some modes that are not advertised through wl_global.mode
/// but it is less likely.
///
/// CURSOR_PLANE:
/// This is a hint to the client that indicates that the compositor can
/// handle a cursor surface from the client without actually compositing.
/// This may be because of a hardware cursor plane or some other mechanism.
/// If the compositor does not advertise this capability then setting
/// wl_pointer.cursor may degrade performance or be ignored entirely.  If
/// CURSOR_PLANE is not advertised, it is recommended that the client draw
/// its own cursor and set wl_pointer.cursor(NULL).
///

enum ZwpFullscreenShellV1Capability {
  /// compositor is capable of almost any output mode
  arbitraryModes("arbitrary_modes", 1),

  /// compositor has a separate cursor plane
  cursorPlane("cursor_plane", 2);

  const ZwpFullscreenShellV1Capability(this.enumName, this.enumValue);
  final int enumValue;
  final String enumName;
  @override
  toString() {
    return "ZwpFullscreenShellV1Capability {name: $enumName, value: $enumValue}";
  }
}

/// different method to set the surface fullscreen
///
/// Hints to indicate to the compositor how to deal with a conflict
/// between the dimensions of the surface and the dimensions of the
/// output. The compositor is free to ignore this parameter.
///

enum ZwpFullscreenShellV1PresentMethod {
  /// no preference, apply default policy
  defaulted("default", 0),

  /// center the surface on the output
  center("center", 1),

  /// scale the surface, preserving aspect ratio, to the largest size that will fit on the output
  zoom("zoom", 2),

  /// scale the surface, preserving aspect ratio, to fully fill the output cropping if needed
  zoomCrop("zoom_crop", 3),

  /// scale the surface to the size of the output ignoring aspect ratio
  stretch("stretch", 4);

  const ZwpFullscreenShellV1PresentMethod(this.enumName, this.enumValue);
  final int enumValue;
  final String enumName;
  @override
  toString() {
    return "ZwpFullscreenShellV1PresentMethod {name: $enumName, value: $enumValue}";
  }
}

/// wl_fullscreen_shell error values
///
/// These errors can be emitted in response to wl_fullscreen_shell requests.
///

enum ZwpFullscreenShellV1Error {
  /// present_method is not known
  invalidMethod("invalid_method", 0),

  /// given wl_surface has another role
  role("role", 1);

  const ZwpFullscreenShellV1Error(this.enumName, this.enumValue);
  final int enumValue;
  final String enumName;
  @override
  toString() {
    return "ZwpFullscreenShellV1Error {name: $enumName, value: $enumValue}";
  }
}

/// mode switch succeeded
///
/// This event indicates that the attempted mode switch operation was
/// successful.  A surface of the size requested in the mode switch
/// will fill the output without scaling.
///
/// Upon receiving this event, the client should destroy the
/// wl_fullscreen_shell_mode_feedback object.
///
class ZwpFullscreenShellModeFeedbackV1ModeSuccessfulEvent {
  ZwpFullscreenShellModeFeedbackV1ModeSuccessfulEvent();

  @override
  toString() {
    return "ZwpFullscreenShellModeFeedbackV1ModeSuccessfulEvent ()";
  }
}

typedef ZwpFullscreenShellModeFeedbackV1ModeSuccessfulEventHandler = void
    Function(ZwpFullscreenShellModeFeedbackV1ModeSuccessfulEvent);

/// mode switch failed
///
/// This event indicates that the attempted mode switch operation
/// failed.  This may be because the requested output mode is not
/// possible or it may mean that the compositor does not want to allow it.
///
/// Upon receiving this event, the client should destroy the
/// wl_fullscreen_shell_mode_feedback object.
///
class ZwpFullscreenShellModeFeedbackV1ModeFailedEvent {
  ZwpFullscreenShellModeFeedbackV1ModeFailedEvent();

  @override
  toString() {
    return "ZwpFullscreenShellModeFeedbackV1ModeFailedEvent ()";
  }
}

typedef ZwpFullscreenShellModeFeedbackV1ModeFailedEventHandler = void Function(
    ZwpFullscreenShellModeFeedbackV1ModeFailedEvent);

/// mode switch cancelled
///
/// This event indicates that the attempted mode switch operation was
/// cancelled.  Most likely this is because the client requested a
/// second mode switch before the first one completed.
///
/// Upon receiving this event, the client should destroy the
/// wl_fullscreen_shell_mode_feedback object.
///
class ZwpFullscreenShellModeFeedbackV1PresentCancelledEvent {
  ZwpFullscreenShellModeFeedbackV1PresentCancelledEvent();

  @override
  toString() {
    return "ZwpFullscreenShellModeFeedbackV1PresentCancelledEvent ()";
  }
}

typedef ZwpFullscreenShellModeFeedbackV1PresentCancelledEventHandler = void
    Function(ZwpFullscreenShellModeFeedbackV1PresentCancelledEvent);

///
///
class ZwpFullscreenShellModeFeedbackV1 extends Proxy implements Dispatcher {
  final Context innerContext;
  final version = 1;

  ZwpFullscreenShellModeFeedbackV1(this.innerContext)
      : super(innerContext.allocateClientId()) {
    innerContext.register(this);
  }

  @override
  toString() {
    return "ZwpFullscreenShellModeFeedbackV1 {name: 'zwp_fullscreen_shell_mode_feedback_v1', id: '$objectId', version: '1',}";
  }

  /// mode switch succeeded
  ///
  /// This event indicates that the attempted mode switch operation was
  /// successful.  A surface of the size requested in the mode switch
  /// will fill the output without scaling.
  ///
  /// Upon receiving this event, the client should destroy the
  /// wl_fullscreen_shell_mode_feedback object.
  ///
  /// Event handler for ModeSuccessful
  void onModeSuccessful(
      ZwpFullscreenShellModeFeedbackV1ModeSuccessfulEventHandler handler) {
    _modeSuccessfulHandler = handler;
  }

  ZwpFullscreenShellModeFeedbackV1ModeSuccessfulEventHandler?
      _modeSuccessfulHandler;

  /// mode switch failed
  ///
  /// This event indicates that the attempted mode switch operation
  /// failed.  This may be because the requested output mode is not
  /// possible or it may mean that the compositor does not want to allow it.
  ///
  /// Upon receiving this event, the client should destroy the
  /// wl_fullscreen_shell_mode_feedback object.
  ///
  /// Event handler for ModeFailed
  void onModeFailed(
      ZwpFullscreenShellModeFeedbackV1ModeFailedEventHandler handler) {
    _modeFailedHandler = handler;
  }

  ZwpFullscreenShellModeFeedbackV1ModeFailedEventHandler? _modeFailedHandler;

  /// mode switch cancelled
  ///
  /// This event indicates that the attempted mode switch operation was
  /// cancelled.  Most likely this is because the client requested a
  /// second mode switch before the first one completed.
  ///
  /// Upon receiving this event, the client should destroy the
  /// wl_fullscreen_shell_mode_feedback object.
  ///
  /// Event handler for PresentCancelled
  void onPresentCancelled(
      ZwpFullscreenShellModeFeedbackV1PresentCancelledEventHandler handler) {
    _presentCancelledHandler = handler;
  }

  ZwpFullscreenShellModeFeedbackV1PresentCancelledEventHandler?
      _presentCancelledHandler;

  @override
  void dispatch(int opcode, int fd, Uint8List data) {
    logLn("ZwpFullscreenShellModeFeedbackV1.dispatch($opcode, $fd, $data)");
    switch (opcode) {
      case 0:
        if (_modeSuccessfulHandler != null) {
          _modeSuccessfulHandler!(
              ZwpFullscreenShellModeFeedbackV1ModeSuccessfulEvent());
        }
        break;
      case 1:
        if (_modeFailedHandler != null) {
          _modeFailedHandler!(
              ZwpFullscreenShellModeFeedbackV1ModeFailedEvent());
        }
        break;
      case 2:
        if (_presentCancelledHandler != null) {
          _presentCancelledHandler!(
              ZwpFullscreenShellModeFeedbackV1PresentCancelledEvent());
        }
        break;
    }
  }
}
