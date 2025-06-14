// Generated by dart-wayland-scanner
// https://github.com/your-repo/dart-wayland-scanner
// XML file : https://gitlab.freedesktop.org/wayland/wayland-protocols/-/raw/main/unstable/pointer-gestures/pointer-gestures-unstable-v1.xml
//
// pointer_gestures_unstable_v1 Protocol Copyright:
///

library client;

import 'package:wayland/wayland.dart';
import 'package:wayland/protocols/wayland.dart';
import 'dart:typed_data';
// AWOO-MIXINS

/// touchpad gestures
///
/// A global interface to provide semantic touchpad gestures for a given
/// pointer.
///
/// Three gestures are currently supported: swipe, pinch, and hold.
/// Pinch and swipe gestures follow a three-stage cycle: begin, update,
/// end, hold gestures follow a two-stage cycle: begin and end. All
/// gestures are identified by a unique id.
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
class ZwpPointerGesturesV1 extends Proxy {
  final Context innerContext;
  final version = 3;

  ZwpPointerGesturesV1(this.innerContext)
      : super(innerContext.allocateClientId()) {
    innerContext.register(this);
  }

  @override
  toString() {
    return "ZwpPointerGesturesV1 {name: 'zwp_pointer_gestures_v1', id: '$objectId', version: '3',}";
  }

  /// get swipe gesture
  ///
  /// Create a swipe gesture object. See the
  /// wl_pointer_gesture_swipe interface for details.
  ///
  /// [id]:
  /// [pointer]:
  Result<ZwpPointerGestureSwipeV1, Object> getSwipeGesture(Pointer pointer) {
    var id = ZwpPointerGestureSwipeV1(innerContext);
    logLn("ZwpPointerGesturesV1::getSwipeGesture  id: $id pointer: $pointer");
    var arguments = [id, pointer];
    var argTypes = <WaylandType>[WaylandType.newId, WaylandType.object];
    var calclulatedSize = calculateSize(argTypes, arguments);
    final bytesBuilder = BytesBuilder();
    bytesBuilder.add(
        Uint32List.fromList([objectId, (calclulatedSize << 16) | 0])
            .buffer
            .asUint8List());
    bytesBuilder.add(Uint32List.fromList([id.objectId]).buffer.asUint8List());
    bytesBuilder
        .add(Uint32List.fromList([pointer.objectId]).buffer.asUint8List());
    try {
      innerContext.sendMessage(
        bytesBuilder.toBytes(),
      );
    } catch (e) {
      logLn("Exception in ZwpPointerGesturesV1::getSwipeGesture: $e");
      return Failure(e);
    }
    return Success(id);
  }

  /// get pinch gesture
  ///
  /// Create a pinch gesture object. See the
  /// wl_pointer_gesture_pinch interface for details.
  ///
  /// [id]:
  /// [pointer]:
  Result<ZwpPointerGesturePinchV1, Object> getPinchGesture(Pointer pointer) {
    var id = ZwpPointerGesturePinchV1(innerContext);
    logLn("ZwpPointerGesturesV1::getPinchGesture  id: $id pointer: $pointer");
    var arguments = [id, pointer];
    var argTypes = <WaylandType>[WaylandType.newId, WaylandType.object];
    var calclulatedSize = calculateSize(argTypes, arguments);
    final bytesBuilder = BytesBuilder();
    bytesBuilder.add(
        Uint32List.fromList([objectId, (calclulatedSize << 16) | 1])
            .buffer
            .asUint8List());
    bytesBuilder.add(Uint32List.fromList([id.objectId]).buffer.asUint8List());
    bytesBuilder
        .add(Uint32List.fromList([pointer.objectId]).buffer.asUint8List());
    try {
      innerContext.sendMessage(
        bytesBuilder.toBytes(),
      );
    } catch (e) {
      logLn("Exception in ZwpPointerGesturesV1::getPinchGesture: $e");
      return Failure(e);
    }
    return Success(id);
  }

  /// destroy the pointer gesture object
  ///
  /// Destroy the pointer gesture object. Swipe, pinch and hold objects
  /// created via this gesture object remain valid.
  ///
  Result<void, Object> release() {
    innerContext.unRegister(this);
    logLn("ZwpPointerGesturesV1::release ");
    var arguments = [];
    var argTypes = <WaylandType>[];
    var calclulatedSize = calculateSize(argTypes, arguments);
    final bytesBuilder = BytesBuilder();
    bytesBuilder.add(
        Uint32List.fromList([objectId, (calclulatedSize << 16) | 2])
            .buffer
            .asUint8List());
    try {
      innerContext.sendMessage(
        bytesBuilder.toBytes(),
      );
    } catch (e) {
      logLn("Exception in ZwpPointerGesturesV1::release: $e");
      return Failure(e);
    }
    return Success(Object());
  }

  /// get hold gesture
  ///
  /// Create a hold gesture object. See the
  /// wl_pointer_gesture_hold interface for details.
  ///
  /// [id]:
  /// [pointer]:
  Result<ZwpPointerGestureHoldV1, Object> getHoldGesture(Pointer pointer) {
    var id = ZwpPointerGestureHoldV1(innerContext);
    logLn("ZwpPointerGesturesV1::getHoldGesture  id: $id pointer: $pointer");
    var arguments = [id, pointer];
    var argTypes = <WaylandType>[WaylandType.newId, WaylandType.object];
    var calclulatedSize = calculateSize(argTypes, arguments);
    final bytesBuilder = BytesBuilder();
    bytesBuilder.add(
        Uint32List.fromList([objectId, (calclulatedSize << 16) | 3])
            .buffer
            .asUint8List());
    bytesBuilder.add(Uint32List.fromList([id.objectId]).buffer.asUint8List());
    bytesBuilder
        .add(Uint32List.fromList([pointer.objectId]).buffer.asUint8List());
    try {
      innerContext.sendMessage(
        bytesBuilder.toBytes(),
      );
    } catch (e) {
      logLn("Exception in ZwpPointerGesturesV1::getHoldGesture: $e");
      return Failure(e);
    }
    return Success(id);
  }
}

/// multi-finger swipe begin
///
/// This event is sent when a multi-finger swipe gesture is detected
/// on the device.
///
class ZwpPointerGestureSwipeV1BeginEvent {
  ///
  final int serial;

  /// timestamp with millisecond granularity
  final int time;

  ///
  final int surface;

  /// number of fingers
  final int fingers;

  ZwpPointerGestureSwipeV1BeginEvent(
    this.serial,
    this.time,
    this.surface,
    this.fingers,
  );

  @override
  toString() {
    return "ZwpPointerGestureSwipeV1BeginEvent (serial: $serial, time: $time, surface: $surface, fingers: $fingers)";
  }
}

typedef ZwpPointerGestureSwipeV1BeginEventHandler = void Function(
    ZwpPointerGestureSwipeV1BeginEvent);

/// multi-finger swipe motion
///
/// This event is sent when a multi-finger swipe gesture changes the
/// position of the logical center.
///
/// The dx and dy coordinates are relative coordinates of the logical
/// center of the gesture compared to the previous event.
///
class ZwpPointerGestureSwipeV1UpdateEvent {
  /// timestamp with millisecond granularity
  final int time;

  /// delta x coordinate in surface coordinate space
  final double dx;

  /// delta y coordinate in surface coordinate space
  final double dy;

  ZwpPointerGestureSwipeV1UpdateEvent(
    this.time,
    this.dx,
    this.dy,
  );

  @override
  toString() {
    return "ZwpPointerGestureSwipeV1UpdateEvent (time: $time, dx: $dx, dy: $dy)";
  }
}

typedef ZwpPointerGestureSwipeV1UpdateEventHandler = void Function(
    ZwpPointerGestureSwipeV1UpdateEvent);

/// multi-finger swipe end
///
/// This event is sent when a multi-finger swipe gesture ceases to
/// be valid. This may happen when one or more fingers are lifted or
/// the gesture is cancelled.
///
/// When a gesture is cancelled, the client should undo state changes
/// caused by this gesture. What causes a gesture to be cancelled is
/// implementation-dependent.
///
class ZwpPointerGestureSwipeV1EndEvent {
  ///
  final int serial;

  /// timestamp with millisecond granularity
  final int time;

  /// 1 if the gesture was cancelled, 0 otherwise
  final int cancelled;

  ZwpPointerGestureSwipeV1EndEvent(
    this.serial,
    this.time,
    this.cancelled,
  );

  @override
  toString() {
    return "ZwpPointerGestureSwipeV1EndEvent (serial: $serial, time: $time, cancelled: $cancelled)";
  }
}

typedef ZwpPointerGestureSwipeV1EndEventHandler = void Function(
    ZwpPointerGestureSwipeV1EndEvent);

/// a swipe gesture object
///
/// A swipe gesture object notifies a client about a multi-finger swipe
/// gesture detected on an indirect input device such as a touchpad.
/// The gesture is usually initiated by multiple fingers moving in the
/// same direction but once initiated the direction may change.
/// The precise conditions of when such a gesture is detected are
/// implementation-dependent.
///
/// A gesture consists of three stages: begin, update (optional) and end.
/// There cannot be multiple simultaneous hold, pinch or swipe gestures on a
/// same pointer/seat, how compositors prevent these situations is
/// implementation-dependent.
///
/// A gesture may be cancelled by the compositor or the hardware.
/// Clients should not consider performing permanent or irreversible
/// actions until the end of a gesture has been received.
///
class ZwpPointerGestureSwipeV1 extends Proxy implements Dispatcher {
  final Context innerContext;
  final version = 2;

  ZwpPointerGestureSwipeV1(this.innerContext)
      : super(innerContext.allocateClientId()) {
    innerContext.register(this);
  }

  @override
  toString() {
    return "ZwpPointerGestureSwipeV1 {name: 'zwp_pointer_gesture_swipe_v1', id: '$objectId', version: '2',}";
  }

  /// destroy the pointer swipe gesture object
  ///
  Result<void, Object> destroy() {
    innerContext.unRegister(this);
    logLn("ZwpPointerGestureSwipeV1::destroy ");
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
      logLn("Exception in ZwpPointerGestureSwipeV1::destroy: $e");
      return Failure(e);
    }
    return Success(Object());
  }

  /// multi-finger swipe begin
  ///
  /// This event is sent when a multi-finger swipe gesture is detected
  /// on the device.
  ///
  /// Event handler for Begin
  /// - [serial]:
  /// - [time]: timestamp with millisecond granularity
  /// - [surface]:
  /// - [fingers]: number of fingers
  void onBegin(ZwpPointerGestureSwipeV1BeginEventHandler handler) {
    _beginHandler = handler;
  }

  ZwpPointerGestureSwipeV1BeginEventHandler? _beginHandler;

  /// multi-finger swipe motion
  ///
  /// This event is sent when a multi-finger swipe gesture changes the
  /// position of the logical center.
  ///
  /// The dx and dy coordinates are relative coordinates of the logical
  /// center of the gesture compared to the previous event.
  ///
  /// Event handler for Update
  /// - [time]: timestamp with millisecond granularity
  /// - [dx]: delta x coordinate in surface coordinate space
  /// - [dy]: delta y coordinate in surface coordinate space
  void onUpdate(ZwpPointerGestureSwipeV1UpdateEventHandler handler) {
    _updateHandler = handler;
  }

  ZwpPointerGestureSwipeV1UpdateEventHandler? _updateHandler;

  /// multi-finger swipe end
  ///
  /// This event is sent when a multi-finger swipe gesture ceases to
  /// be valid. This may happen when one or more fingers are lifted or
  /// the gesture is cancelled.
  ///
  /// When a gesture is cancelled, the client should undo state changes
  /// caused by this gesture. What causes a gesture to be cancelled is
  /// implementation-dependent.
  ///
  /// Event handler for End
  /// - [serial]:
  /// - [time]: timestamp with millisecond granularity
  /// - [cancelled]: 1 if the gesture was cancelled, 0 otherwise
  void onEnd(ZwpPointerGestureSwipeV1EndEventHandler handler) {
    _endHandler = handler;
  }

  ZwpPointerGestureSwipeV1EndEventHandler? _endHandler;

  @override
  void dispatch(int opcode, int fd, Uint8List data) {
    logLn("ZwpPointerGestureSwipeV1.dispatch($opcode, $fd, $data)");
    switch (opcode) {
      case 0:
        if (_beginHandler != null) {
          var offset = 0;
          final serial =
              ByteData.view(data.buffer).getUint32(offset, Endian.little);
          offset += 4;
          final time =
              ByteData.view(data.buffer).getUint32(offset, Endian.little);
          offset += 4;
          final surface = innerContext
              .getProxy(
                  ByteData.view(data.buffer).getUint32(offset, Endian.little))
              .objectId;
          offset += 4;
          final fingers =
              ByteData.view(data.buffer).getUint32(offset, Endian.little);
          offset += 4;
          var event = ZwpPointerGestureSwipeV1BeginEvent(
            serial,
            time,
            surface,
            fingers,
          );
          _beginHandler!(event);
        }
        break;
      case 1:
        if (_updateHandler != null) {
          var offset = 0;
          final time =
              ByteData.view(data.buffer).getUint32(offset, Endian.little);
          offset += 4;
          final dx = fixedToDouble(
              ByteData.view(data.buffer).getInt32(offset, Endian.little));
          offset += 4;
          final dy = fixedToDouble(
              ByteData.view(data.buffer).getInt32(offset, Endian.little));
          offset += 4;
          var event = ZwpPointerGestureSwipeV1UpdateEvent(
            time,
            dx,
            dy,
          );
          _updateHandler!(event);
        }
        break;
      case 2:
        if (_endHandler != null) {
          var offset = 0;
          final serial =
              ByteData.view(data.buffer).getUint32(offset, Endian.little);
          offset += 4;
          final time =
              ByteData.view(data.buffer).getUint32(offset, Endian.little);
          offset += 4;
          final cancelled =
              ByteData.view(data.buffer).getInt32(offset, Endian.little);
          offset += 4;
          var event = ZwpPointerGestureSwipeV1EndEvent(
            serial,
            time,
            cancelled,
          );
          _endHandler!(event);
        }
        break;
    }
  }
}

/// multi-finger pinch begin
///
/// This event is sent when a multi-finger pinch gesture is detected
/// on the device.
///
class ZwpPointerGesturePinchV1BeginEvent {
  ///
  final int serial;

  /// timestamp with millisecond granularity
  final int time;

  ///
  final int surface;

  /// number of fingers
  final int fingers;

  ZwpPointerGesturePinchV1BeginEvent(
    this.serial,
    this.time,
    this.surface,
    this.fingers,
  );

  @override
  toString() {
    return "ZwpPointerGesturePinchV1BeginEvent (serial: $serial, time: $time, surface: $surface, fingers: $fingers)";
  }
}

typedef ZwpPointerGesturePinchV1BeginEventHandler = void Function(
    ZwpPointerGesturePinchV1BeginEvent);

/// multi-finger pinch motion
///
/// This event is sent when a multi-finger pinch gesture changes the
/// position of the logical center, the rotation or the relative scale.
///
/// The dx and dy coordinates are relative coordinates in the
/// surface coordinate space of the logical center of the gesture.
///
/// The scale factor is an absolute scale compared to the
/// pointer_gesture_pinch.begin event, e.g. a scale of 2 means the fingers
/// are now twice as far apart as on pointer_gesture_pinch.begin.
///
/// The rotation is the relative angle in degrees clockwise compared to the previous
/// pointer_gesture_pinch.begin or pointer_gesture_pinch.update event.
///
class ZwpPointerGesturePinchV1UpdateEvent {
  /// timestamp with millisecond granularity
  final int time;

  /// delta x coordinate in surface coordinate space
  final double dx;

  /// delta y coordinate in surface coordinate space
  final double dy;

  /// scale relative to the initial finger position
  final double scale;

  /// angle in degrees cw relative to the previous event
  final double rotation;

  ZwpPointerGesturePinchV1UpdateEvent(
    this.time,
    this.dx,
    this.dy,
    this.scale,
    this.rotation,
  );

  @override
  toString() {
    return "ZwpPointerGesturePinchV1UpdateEvent (time: $time, dx: $dx, dy: $dy, scale: $scale, rotation: $rotation)";
  }
}

typedef ZwpPointerGesturePinchV1UpdateEventHandler = void Function(
    ZwpPointerGesturePinchV1UpdateEvent);

/// multi-finger pinch end
///
/// This event is sent when a multi-finger pinch gesture ceases to
/// be valid. This may happen when one or more fingers are lifted or
/// the gesture is cancelled.
///
/// When a gesture is cancelled, the client should undo state changes
/// caused by this gesture. What causes a gesture to be cancelled is
/// implementation-dependent.
///
class ZwpPointerGesturePinchV1EndEvent {
  ///
  final int serial;

  /// timestamp with millisecond granularity
  final int time;

  /// 1 if the gesture was cancelled, 0 otherwise
  final int cancelled;

  ZwpPointerGesturePinchV1EndEvent(
    this.serial,
    this.time,
    this.cancelled,
  );

  @override
  toString() {
    return "ZwpPointerGesturePinchV1EndEvent (serial: $serial, time: $time, cancelled: $cancelled)";
  }
}

typedef ZwpPointerGesturePinchV1EndEventHandler = void Function(
    ZwpPointerGesturePinchV1EndEvent);

/// a pinch gesture object
///
/// A pinch gesture object notifies a client about a multi-finger pinch
/// gesture detected on an indirect input device such as a touchpad.
/// The gesture is usually initiated by multiple fingers moving towards
/// each other or away from each other, or by two or more fingers rotating
/// around a logical center of gravity. The precise conditions of when
/// such a gesture is detected are implementation-dependent.
///
/// A gesture consists of three stages: begin, update (optional) and end.
/// There cannot be multiple simultaneous hold, pinch or swipe gestures on a
/// same pointer/seat, how compositors prevent these situations is
/// implementation-dependent.
///
/// A gesture may be cancelled by the compositor or the hardware.
/// Clients should not consider performing permanent or irreversible
/// actions until the end of a gesture has been received.
///
class ZwpPointerGesturePinchV1 extends Proxy implements Dispatcher {
  final Context innerContext;
  final version = 2;

  ZwpPointerGesturePinchV1(this.innerContext)
      : super(innerContext.allocateClientId()) {
    innerContext.register(this);
  }

  @override
  toString() {
    return "ZwpPointerGesturePinchV1 {name: 'zwp_pointer_gesture_pinch_v1', id: '$objectId', version: '2',}";
  }

  /// destroy the pinch gesture object
  ///
  Result<void, Object> destroy() {
    innerContext.unRegister(this);
    logLn("ZwpPointerGesturePinchV1::destroy ");
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
      logLn("Exception in ZwpPointerGesturePinchV1::destroy: $e");
      return Failure(e);
    }
    return Success(Object());
  }

  /// multi-finger pinch begin
  ///
  /// This event is sent when a multi-finger pinch gesture is detected
  /// on the device.
  ///
  /// Event handler for Begin
  /// - [serial]:
  /// - [time]: timestamp with millisecond granularity
  /// - [surface]:
  /// - [fingers]: number of fingers
  void onBegin(ZwpPointerGesturePinchV1BeginEventHandler handler) {
    _beginHandler = handler;
  }

  ZwpPointerGesturePinchV1BeginEventHandler? _beginHandler;

  /// multi-finger pinch motion
  ///
  /// This event is sent when a multi-finger pinch gesture changes the
  /// position of the logical center, the rotation or the relative scale.
  ///
  /// The dx and dy coordinates are relative coordinates in the
  /// surface coordinate space of the logical center of the gesture.
  ///
  /// The scale factor is an absolute scale compared to the
  /// pointer_gesture_pinch.begin event, e.g. a scale of 2 means the fingers
  /// are now twice as far apart as on pointer_gesture_pinch.begin.
  ///
  /// The rotation is the relative angle in degrees clockwise compared to the previous
  /// pointer_gesture_pinch.begin or pointer_gesture_pinch.update event.
  ///
  /// Event handler for Update
  /// - [time]: timestamp with millisecond granularity
  /// - [dx]: delta x coordinate in surface coordinate space
  /// - [dy]: delta y coordinate in surface coordinate space
  /// - [scale]: scale relative to the initial finger position
  /// - [rotation]: angle in degrees cw relative to the previous event
  void onUpdate(ZwpPointerGesturePinchV1UpdateEventHandler handler) {
    _updateHandler = handler;
  }

  ZwpPointerGesturePinchV1UpdateEventHandler? _updateHandler;

  /// multi-finger pinch end
  ///
  /// This event is sent when a multi-finger pinch gesture ceases to
  /// be valid. This may happen when one or more fingers are lifted or
  /// the gesture is cancelled.
  ///
  /// When a gesture is cancelled, the client should undo state changes
  /// caused by this gesture. What causes a gesture to be cancelled is
  /// implementation-dependent.
  ///
  /// Event handler for End
  /// - [serial]:
  /// - [time]: timestamp with millisecond granularity
  /// - [cancelled]: 1 if the gesture was cancelled, 0 otherwise
  void onEnd(ZwpPointerGesturePinchV1EndEventHandler handler) {
    _endHandler = handler;
  }

  ZwpPointerGesturePinchV1EndEventHandler? _endHandler;

  @override
  void dispatch(int opcode, int fd, Uint8List data) {
    logLn("ZwpPointerGesturePinchV1.dispatch($opcode, $fd, $data)");
    switch (opcode) {
      case 0:
        if (_beginHandler != null) {
          var offset = 0;
          final serial =
              ByteData.view(data.buffer).getUint32(offset, Endian.little);
          offset += 4;
          final time =
              ByteData.view(data.buffer).getUint32(offset, Endian.little);
          offset += 4;
          final surface = innerContext
              .getProxy(
                  ByteData.view(data.buffer).getUint32(offset, Endian.little))
              .objectId;
          offset += 4;
          final fingers =
              ByteData.view(data.buffer).getUint32(offset, Endian.little);
          offset += 4;
          var event = ZwpPointerGesturePinchV1BeginEvent(
            serial,
            time,
            surface,
            fingers,
          );
          _beginHandler!(event);
        }
        break;
      case 1:
        if (_updateHandler != null) {
          var offset = 0;
          final time =
              ByteData.view(data.buffer).getUint32(offset, Endian.little);
          offset += 4;
          final dx = fixedToDouble(
              ByteData.view(data.buffer).getInt32(offset, Endian.little));
          offset += 4;
          final dy = fixedToDouble(
              ByteData.view(data.buffer).getInt32(offset, Endian.little));
          offset += 4;
          final scale = fixedToDouble(
              ByteData.view(data.buffer).getInt32(offset, Endian.little));
          offset += 4;
          final rotation = fixedToDouble(
              ByteData.view(data.buffer).getInt32(offset, Endian.little));
          offset += 4;
          var event = ZwpPointerGesturePinchV1UpdateEvent(
            time,
            dx,
            dy,
            scale,
            rotation,
          );
          _updateHandler!(event);
        }
        break;
      case 2:
        if (_endHandler != null) {
          var offset = 0;
          final serial =
              ByteData.view(data.buffer).getUint32(offset, Endian.little);
          offset += 4;
          final time =
              ByteData.view(data.buffer).getUint32(offset, Endian.little);
          offset += 4;
          final cancelled =
              ByteData.view(data.buffer).getInt32(offset, Endian.little);
          offset += 4;
          var event = ZwpPointerGesturePinchV1EndEvent(
            serial,
            time,
            cancelled,
          );
          _endHandler!(event);
        }
        break;
    }
  }
}

/// multi-finger hold begin
///
/// This event is sent when a hold gesture is detected on the device.
///
class ZwpPointerGestureHoldV1BeginEvent {
  ///
  final int serial;

  /// timestamp with millisecond granularity
  final int time;

  ///
  final int surface;

  /// number of fingers
  final int fingers;

  ZwpPointerGestureHoldV1BeginEvent(
    this.serial,
    this.time,
    this.surface,
    this.fingers,
  );

  @override
  toString() {
    return "ZwpPointerGestureHoldV1BeginEvent (serial: $serial, time: $time, surface: $surface, fingers: $fingers)";
  }
}

typedef ZwpPointerGestureHoldV1BeginEventHandler = void Function(
    ZwpPointerGestureHoldV1BeginEvent);

/// multi-finger hold end
///
/// This event is sent when a hold gesture ceases to
/// be valid. This may happen when the holding fingers are lifted or
/// the gesture is cancelled, for example if the fingers move past an
/// implementation-defined threshold, the finger count changes or the hold
/// gesture changes into a different type of gesture.
///
/// When a gesture is cancelled, the client may need to undo state changes
/// caused by this gesture. What causes a gesture to be cancelled is
/// implementation-dependent.
///
class ZwpPointerGestureHoldV1EndEvent {
  ///
  final int serial;

  /// timestamp with millisecond granularity
  final int time;

  /// 1 if the gesture was cancelled, 0 otherwise
  final int cancelled;

  ZwpPointerGestureHoldV1EndEvent(
    this.serial,
    this.time,
    this.cancelled,
  );

  @override
  toString() {
    return "ZwpPointerGestureHoldV1EndEvent (serial: $serial, time: $time, cancelled: $cancelled)";
  }
}

typedef ZwpPointerGestureHoldV1EndEventHandler = void Function(
    ZwpPointerGestureHoldV1EndEvent);

/// a hold gesture object
///
/// A hold gesture object notifies a client about a single- or
/// multi-finger hold gesture detected on an indirect input device such as
/// a touchpad. The gesture is usually initiated by one or more fingers
/// being held down without significant movement. The precise conditions
/// of when such a gesture is detected are implementation-dependent.
///
/// In particular, this gesture may be used to cancel kinetic scrolling.
///
/// A hold gesture consists of two stages: begin and end. Unlike pinch and
/// swipe there is no update stage.
/// There cannot be multiple simultaneous hold, pinch or swipe gestures on a
/// same pointer/seat, how compositors prevent these situations is
/// implementation-dependent.
///
/// A gesture may be cancelled by the compositor or the hardware.
/// Clients should not consider performing permanent or irreversible
/// actions until the end of a gesture has been received.
///
class ZwpPointerGestureHoldV1 extends Proxy implements Dispatcher {
  final Context innerContext;
  final version = 3;

  ZwpPointerGestureHoldV1(this.innerContext)
      : super(innerContext.allocateClientId()) {
    innerContext.register(this);
  }

  @override
  toString() {
    return "ZwpPointerGestureHoldV1 {name: 'zwp_pointer_gesture_hold_v1', id: '$objectId', version: '3',}";
  }

  /// destroy the hold gesture object
  ///
  Result<void, Object> destroy() {
    innerContext.unRegister(this);
    logLn("ZwpPointerGestureHoldV1::destroy ");
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
      logLn("Exception in ZwpPointerGestureHoldV1::destroy: $e");
      return Failure(e);
    }
    return Success(Object());
  }

  /// multi-finger hold begin
  ///
  /// This event is sent when a hold gesture is detected on the device.
  ///
  /// Event handler for Begin
  /// - [serial]:
  /// - [time]: timestamp with millisecond granularity
  /// - [surface]:
  /// - [fingers]: number of fingers
  void onBegin(ZwpPointerGestureHoldV1BeginEventHandler handler) {
    _beginHandler = handler;
  }

  ZwpPointerGestureHoldV1BeginEventHandler? _beginHandler;

  /// multi-finger hold end
  ///
  /// This event is sent when a hold gesture ceases to
  /// be valid. This may happen when the holding fingers are lifted or
  /// the gesture is cancelled, for example if the fingers move past an
  /// implementation-defined threshold, the finger count changes or the hold
  /// gesture changes into a different type of gesture.
  ///
  /// When a gesture is cancelled, the client may need to undo state changes
  /// caused by this gesture. What causes a gesture to be cancelled is
  /// implementation-dependent.
  ///
  /// Event handler for End
  /// - [serial]:
  /// - [time]: timestamp with millisecond granularity
  /// - [cancelled]: 1 if the gesture was cancelled, 0 otherwise
  void onEnd(ZwpPointerGestureHoldV1EndEventHandler handler) {
    _endHandler = handler;
  }

  ZwpPointerGestureHoldV1EndEventHandler? _endHandler;

  @override
  void dispatch(int opcode, int fd, Uint8List data) {
    logLn("ZwpPointerGestureHoldV1.dispatch($opcode, $fd, $data)");
    switch (opcode) {
      case 0:
        if (_beginHandler != null) {
          var offset = 0;
          final serial =
              ByteData.view(data.buffer).getUint32(offset, Endian.little);
          offset += 4;
          final time =
              ByteData.view(data.buffer).getUint32(offset, Endian.little);
          offset += 4;
          final surface = innerContext
              .getProxy(
                  ByteData.view(data.buffer).getUint32(offset, Endian.little))
              .objectId;
          offset += 4;
          final fingers =
              ByteData.view(data.buffer).getUint32(offset, Endian.little);
          offset += 4;
          var event = ZwpPointerGestureHoldV1BeginEvent(
            serial,
            time,
            surface,
            fingers,
          );
          _beginHandler!(event);
        }
        break;
      case 1:
        if (_endHandler != null) {
          var offset = 0;
          final serial =
              ByteData.view(data.buffer).getUint32(offset, Endian.little);
          offset += 4;
          final time =
              ByteData.view(data.buffer).getUint32(offset, Endian.little);
          offset += 4;
          final cancelled =
              ByteData.view(data.buffer).getInt32(offset, Endian.little);
          offset += 4;
          var event = ZwpPointerGestureHoldV1EndEvent(
            serial,
            time,
            cancelled,
          );
          _endHandler!(event);
        }
        break;
    }
  }
}
