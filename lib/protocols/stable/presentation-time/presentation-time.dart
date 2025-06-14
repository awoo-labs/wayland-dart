// Generated by dart-wayland-scanner
// https://github.com/your-repo/dart-wayland-scanner
// XML file : https://gitlab.freedesktop.org/wayland/wayland-protocols/-/raw/main/stable/presentation-time/presentation-time.xml
//
// presentation_time Protocol Copyright:
///
/// Copyright © 2013-2014 Collabora, Ltd.
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

/// clock ID for timestamps
///
/// This event tells the client in which clock domain the
/// compositor interprets the timestamps used by the presentation
/// extension. This clock is called the presentation clock.
///
/// The compositor sends this event when the client binds to the
/// presentation interface. The presentation clock does not change
/// during the lifetime of the client connection.
///
/// The clock identifier is platform dependent. On POSIX platforms, the
/// identifier value is one of the clockid_t values accepted by
/// clock_gettime(). clock_gettime() is defined by POSIX.1-2001.
///
/// Timestamps in this clock domain are expressed as tv_sec_hi,
/// tv_sec_lo, tv_nsec triples, each component being an unsigned
/// 32-bit value. Whole seconds are in tv_sec which is a 64-bit
/// value combined from tv_sec_hi and tv_sec_lo, and the
/// additional fractional part in tv_nsec as nanoseconds. Hence,
/// for valid timestamps tv_nsec must be in [0, 999999999].
///
/// Note that clock_id applies only to the presentation clock,
/// and implies nothing about e.g. the timestamps used in the
/// Wayland core protocol input events.
///
/// Compositors should prefer a clock which does not jump and is
/// not slewed e.g. by NTP. The absolute value of the clock is
/// irrelevant. Precision of one millisecond or better is
/// recommended. Clients must be able to query the current clock
/// value directly, not by asking the compositor.
///
class WpPresentationClockIdEvent {
  /// platform clock identifier
  final int clkId;

  WpPresentationClockIdEvent(
    this.clkId,
  );

  @override
  toString() {
    return "WpPresentationClockIdEvent (clkId: $clkId)";
  }
}

typedef WpPresentationClockIdEventHandler = void Function(
    WpPresentationClockIdEvent);

/// timed presentation related wl_surface requests
///
///
///
///
/// The main feature of this interface is accurate presentation
/// timing feedback to ensure smooth video playback while maintaining
/// audio/video synchronization. Some features use the concept of a
/// presentation clock, which is defined in the
/// presentation.clock_id event.
///
/// A content update for a wl_surface is submitted by a
/// wl_surface.commit request. Request 'feedback' associates with
/// the wl_surface.commit and provides feedback on the content
/// update, particularly the final realized presentation time.
///
///
///
/// When the final realized presentation time is available, e.g.
/// after a framebuffer flip completes, the requested
/// presentation_feedback.presented events are sent. The final
/// presentation time can differ from the compositor's predicted
/// display update time and the update's target time, especially
/// when the compositor misses its target vertical blanking period.
///
class WpPresentation extends Proxy implements Dispatcher {
  final Context innerContext;
  final version = 1;

  WpPresentation(this.innerContext) : super(innerContext.allocateClientId()) {
    innerContext.register(this);
  }

  @override
  toString() {
    return "WpPresentation {name: 'wp_presentation', id: '$objectId', version: '1',}";
  }

  /// unbind from the presentation interface
  ///
  /// Informs the server that the client will no longer be using
  /// this protocol object. Existing objects created by this object
  /// are not affected.
  ///
  Result<void, Object> destroy() {
    innerContext.unRegister(this);
    logLn("WpPresentation::destroy ");
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
      logLn("Exception in WpPresentation::destroy: $e");
      return Failure(e);
    }
    return Success(Object());
  }

  /// request presentation feedback information
  ///
  /// Request presentation feedback for the current content submission
  /// on the given surface. This creates a new presentation_feedback
  /// object, which will deliver the feedback information once. If
  /// multiple presentation_feedback objects are created for the same
  /// submission, they will all deliver the same information.
  ///
  /// For details on what information is returned, see the
  /// presentation_feedback interface.
  ///
  /// [surface]: target surface
  /// [callback]: new feedback object
  Result<WpPresentationFeedback, Object> feedback(Surface surface) {
    var callback = WpPresentationFeedback(innerContext);
    logLn("WpPresentation::feedback  surface: $surface callback: $callback");
    var arguments = [surface, callback];
    var argTypes = <WaylandType>[WaylandType.object, WaylandType.newId];
    var calclulatedSize = calculateSize(argTypes, arguments);
    final bytesBuilder = BytesBuilder();
    bytesBuilder.add(
        Uint32List.fromList([objectId, (calclulatedSize << 16) | 1])
            .buffer
            .asUint8List());
    bytesBuilder
        .add(Uint32List.fromList([surface.objectId]).buffer.asUint8List());
    bytesBuilder
        .add(Uint32List.fromList([callback.objectId]).buffer.asUint8List());
    try {
      innerContext.sendMessage(
        bytesBuilder.toBytes(),
      );
    } catch (e) {
      logLn("Exception in WpPresentation::feedback: $e");
      return Failure(e);
    }
    return Success(callback);
  }

  /// clock ID for timestamps
  ///
  /// This event tells the client in which clock domain the
  /// compositor interprets the timestamps used by the presentation
  /// extension. This clock is called the presentation clock.
  ///
  /// The compositor sends this event when the client binds to the
  /// presentation interface. The presentation clock does not change
  /// during the lifetime of the client connection.
  ///
  /// The clock identifier is platform dependent. On POSIX platforms, the
  /// identifier value is one of the clockid_t values accepted by
  /// clock_gettime(). clock_gettime() is defined by POSIX.1-2001.
  ///
  /// Timestamps in this clock domain are expressed as tv_sec_hi,
  /// tv_sec_lo, tv_nsec triples, each component being an unsigned
  /// 32-bit value. Whole seconds are in tv_sec which is a 64-bit
  /// value combined from tv_sec_hi and tv_sec_lo, and the
  /// additional fractional part in tv_nsec as nanoseconds. Hence,
  /// for valid timestamps tv_nsec must be in [0, 999999999].
  ///
  /// Note that clock_id applies only to the presentation clock,
  /// and implies nothing about e.g. the timestamps used in the
  /// Wayland core protocol input events.
  ///
  /// Compositors should prefer a clock which does not jump and is
  /// not slewed e.g. by NTP. The absolute value of the clock is
  /// irrelevant. Precision of one millisecond or better is
  /// recommended. Clients must be able to query the current clock
  /// value directly, not by asking the compositor.
  ///
  /// Event handler for ClockId
  /// - [clk_id]: platform clock identifier
  void onClockId(WpPresentationClockIdEventHandler handler) {
    _clockIdHandler = handler;
  }

  WpPresentationClockIdEventHandler? _clockIdHandler;

  @override
  void dispatch(int opcode, int fd, Uint8List data) {
    logLn("WpPresentation.dispatch($opcode, $fd, $data)");
    switch (opcode) {
      case 0:
        if (_clockIdHandler != null) {
          var offset = 0;
          final clkId =
              ByteData.view(data.buffer).getUint32(offset, Endian.little);
          offset += 4;
          var event = WpPresentationClockIdEvent(
            clkId,
          );
          _clockIdHandler!(event);
        }
        break;
    }
  }
}

/// fatal presentation errors
///
/// These fatal protocol errors may be emitted in response to
/// illegal presentation requests.
///

enum WpPresentationError {
  /// invalid value in tv_nsec
  invalidTimestamp("invalid_timestamp", 0),

  /// invalid flag
  invalidFlag("invalid_flag", 1);

  const WpPresentationError(this.enumName, this.enumValue);
  final int enumValue;
  final String enumName;
  @override
  toString() {
    return "WpPresentationError {name: $enumName, value: $enumValue}";
  }
}

/// presentation synchronized to this output
///
/// As presentation can be synchronized to only one output at a
/// time, this event tells which output it was. This event is only
/// sent prior to the presented event.
///
/// As clients may bind to the same global wl_output multiple
/// times, this event is sent for each bound instance that matches
/// the synchronized output. If a client has not bound to the
/// right wl_output global at all, this event is not sent.
///
class WpPresentationFeedbackSyncOutputEvent {
  /// presentation output
  final int output;

  WpPresentationFeedbackSyncOutputEvent(
    this.output,
  );

  @override
  toString() {
    return "WpPresentationFeedbackSyncOutputEvent (output: $output)";
  }
}

typedef WpPresentationFeedbackSyncOutputEventHandler = void Function(
    WpPresentationFeedbackSyncOutputEvent);

/// the content update was displayed
///
/// The associated content update was displayed to the user at the
/// indicated time (tv_sec_hi/lo, tv_nsec). For the interpretation of
/// the timestamp, see presentation.clock_id event.
///
/// The timestamp corresponds to the time when the content update
/// turned into light the first time on the surface's main output.
/// Compositors may approximate this from the framebuffer flip
/// completion events from the system, and the latency of the
/// physical display path if known.
///
/// This event is preceded by all related sync_output events
/// telling which output's refresh cycle the feedback corresponds
/// to, i.e. the main output for the surface. Compositors are
/// recommended to choose the output containing the largest part
/// of the wl_surface, or keeping the output they previously
/// chose. Having a stable presentation output association helps
/// clients predict future output refreshes (vblank).
///
/// The 'refresh' argument gives the compositor's prediction of how
/// many nanoseconds after tv_sec, tv_nsec the very next output
/// refresh may occur. This is to further aid clients in
/// predicting future refreshes, i.e., estimating the timestamps
/// targeting the next few vblanks. If such prediction cannot
/// usefully be done, the argument is zero.
///
/// If the output does not have a constant refresh rate, explicit
/// video mode switches excluded, then the refresh argument must
/// be zero.
///
/// The 64-bit value combined from seq_hi and seq_lo is the value
/// of the output's vertical retrace counter when the content
/// update was first scanned out to the display. This value must
/// be compatible with the definition of MSC in
/// GLX_OML_sync_control specification. Note, that if the display
/// path has a non-zero latency, the time instant specified by
/// this counter may differ from the timestamp's.
///
/// If the output does not have a concept of vertical retrace or a
/// refresh cycle, or the output device is self-refreshing without
/// a way to query the refresh count, then the arguments seq_hi
/// and seq_lo must be zero.
///
class WpPresentationFeedbackPresentedEvent {
  /// high 32 bits of the seconds part of the presentation timestamp
  final int tvSecHi;

  /// low 32 bits of the seconds part of the presentation timestamp
  final int tvSecLo;

  /// nanoseconds part of the presentation timestamp
  final int tvNsec;

  /// nanoseconds till next refresh
  final int refresh;

  /// high 32 bits of refresh counter
  final int seqHi;

  /// low 32 bits of refresh counter
  final int seqLo;

  /// combination of 'kind' values
  final int flags;

  WpPresentationFeedbackPresentedEvent(
    this.tvSecHi,
    this.tvSecLo,
    this.tvNsec,
    this.refresh,
    this.seqHi,
    this.seqLo,
    this.flags,
  );

  @override
  toString() {
    return "WpPresentationFeedbackPresentedEvent (tvSecHi: $tvSecHi, tvSecLo: $tvSecLo, tvNsec: $tvNsec, ..., seqLo: $seqLo, flags: $flags)";
  }
}

typedef WpPresentationFeedbackPresentedEventHandler = void Function(
    WpPresentationFeedbackPresentedEvent);

/// the content update was not displayed
///
/// The content update was never displayed to the user.
///
class WpPresentationFeedbackDiscardedEvent {
  WpPresentationFeedbackDiscardedEvent();

  @override
  toString() {
    return "WpPresentationFeedbackDiscardedEvent ()";
  }
}

typedef WpPresentationFeedbackDiscardedEventHandler = void Function(
    WpPresentationFeedbackDiscardedEvent);

/// presentation time feedback event
///
/// A presentation_feedback object returns an indication that a
/// wl_surface content update has become visible to the user.
/// One object corresponds to one content update submission
/// (wl_surface.commit). There are two possible outcomes: the
/// content update is presented to the user, and a presentation
/// timestamp delivered; or, the user did not see the content
/// update because it was superseded or its surface destroyed,
/// and the content update is discarded.
///
/// Once a presentation_feedback object has delivered a 'presented'
/// or 'discarded' event it is automatically destroyed.
///
class WpPresentationFeedback extends Proxy implements Dispatcher {
  final Context innerContext;
  final version = 1;

  WpPresentationFeedback(this.innerContext)
      : super(innerContext.allocateClientId()) {
    innerContext.register(this);
  }

  @override
  toString() {
    return "WpPresentationFeedback {name: 'wp_presentation_feedback', id: '$objectId', version: '1',}";
  }

  /// presentation synchronized to this output
  ///
  /// As presentation can be synchronized to only one output at a
  /// time, this event tells which output it was. This event is only
  /// sent prior to the presented event.
  ///
  /// As clients may bind to the same global wl_output multiple
  /// times, this event is sent for each bound instance that matches
  /// the synchronized output. If a client has not bound to the
  /// right wl_output global at all, this event is not sent.
  ///
  /// Event handler for SyncOutput
  /// - [output]: presentation output
  void onSyncOutput(WpPresentationFeedbackSyncOutputEventHandler handler) {
    _syncOutputHandler = handler;
  }

  WpPresentationFeedbackSyncOutputEventHandler? _syncOutputHandler;

  /// the content update was displayed
  ///
  /// The associated content update was displayed to the user at the
  /// indicated time (tv_sec_hi/lo, tv_nsec). For the interpretation of
  /// the timestamp, see presentation.clock_id event.
  ///
  /// The timestamp corresponds to the time when the content update
  /// turned into light the first time on the surface's main output.
  /// Compositors may approximate this from the framebuffer flip
  /// completion events from the system, and the latency of the
  /// physical display path if known.
  ///
  /// This event is preceded by all related sync_output events
  /// telling which output's refresh cycle the feedback corresponds
  /// to, i.e. the main output for the surface. Compositors are
  /// recommended to choose the output containing the largest part
  /// of the wl_surface, or keeping the output they previously
  /// chose. Having a stable presentation output association helps
  /// clients predict future output refreshes (vblank).
  ///
  /// The 'refresh' argument gives the compositor's prediction of how
  /// many nanoseconds after tv_sec, tv_nsec the very next output
  /// refresh may occur. This is to further aid clients in
  /// predicting future refreshes, i.e., estimating the timestamps
  /// targeting the next few vblanks. If such prediction cannot
  /// usefully be done, the argument is zero.
  ///
  /// If the output does not have a constant refresh rate, explicit
  /// video mode switches excluded, then the refresh argument must
  /// be zero.
  ///
  /// The 64-bit value combined from seq_hi and seq_lo is the value
  /// of the output's vertical retrace counter when the content
  /// update was first scanned out to the display. This value must
  /// be compatible with the definition of MSC in
  /// GLX_OML_sync_control specification. Note, that if the display
  /// path has a non-zero latency, the time instant specified by
  /// this counter may differ from the timestamp's.
  ///
  /// If the output does not have a concept of vertical retrace or a
  /// refresh cycle, or the output device is self-refreshing without
  /// a way to query the refresh count, then the arguments seq_hi
  /// and seq_lo must be zero.
  ///
  /// Event handler for Presented
  /// - [tv_sec_hi]: high 32 bits of the seconds part of the presentation timestamp
  /// - [tv_sec_lo]: low 32 bits of the seconds part of the presentation timestamp
  /// - [tv_nsec]: nanoseconds part of the presentation timestamp
  /// - [refresh]: nanoseconds till next refresh
  /// - [seq_hi]: high 32 bits of refresh counter
  /// - [seq_lo]: low 32 bits of refresh counter
  /// - [flags]: combination of 'kind' values
  void onPresented(WpPresentationFeedbackPresentedEventHandler handler) {
    _presentedHandler = handler;
  }

  WpPresentationFeedbackPresentedEventHandler? _presentedHandler;

  /// the content update was not displayed
  ///
  /// The content update was never displayed to the user.
  ///
  /// Event handler for Discarded
  void onDiscarded(WpPresentationFeedbackDiscardedEventHandler handler) {
    _discardedHandler = handler;
  }

  WpPresentationFeedbackDiscardedEventHandler? _discardedHandler;

  @override
  void dispatch(int opcode, int fd, Uint8List data) {
    logLn("WpPresentationFeedback.dispatch($opcode, $fd, $data)");
    switch (opcode) {
      case 0:
        if (_syncOutputHandler != null) {
          var offset = 0;
          final output = innerContext
              .getProxy(
                  ByteData.view(data.buffer).getUint32(offset, Endian.little))
              .objectId;
          offset += 4;
          var event = WpPresentationFeedbackSyncOutputEvent(
            output,
          );
          _syncOutputHandler!(event);
        }
        break;
      case 1:
        if (_presentedHandler != null) {
          var offset = 0;
          final tvSecHi =
              ByteData.view(data.buffer).getUint32(offset, Endian.little);
          offset += 4;
          final tvSecLo =
              ByteData.view(data.buffer).getUint32(offset, Endian.little);
          offset += 4;
          final tvNsec =
              ByteData.view(data.buffer).getUint32(offset, Endian.little);
          offset += 4;
          final refresh =
              ByteData.view(data.buffer).getUint32(offset, Endian.little);
          offset += 4;
          final seqHi =
              ByteData.view(data.buffer).getUint32(offset, Endian.little);
          offset += 4;
          final seqLo =
              ByteData.view(data.buffer).getUint32(offset, Endian.little);
          offset += 4;
          final flags =
              ByteData.view(data.buffer).getUint32(offset, Endian.little);
          offset += 4;
          var event = WpPresentationFeedbackPresentedEvent(
            tvSecHi,
            tvSecLo,
            tvNsec,
            refresh,
            seqHi,
            seqLo,
            flags,
          );
          _presentedHandler!(event);
        }
        break;
      case 2:
        if (_discardedHandler != null) {
          _discardedHandler!(WpPresentationFeedbackDiscardedEvent());
        }
        break;
    }
  }
}

/// bitmask of flags in presented event
///
/// These flags provide information about how the presentation of
/// the related content update was done. The intent is to help
/// clients assess the reliability of the feedback and the visual
/// quality with respect to possible tearing and timings.
///

enum WpPresentationFeedbackKind {
  ///
  vsync("vsync", 0x1),

  ///
  hwClock("hw_clock", 0x2),

  ///
  hwCompletion("hw_completion", 0x4),

  ///
  zeroCopy("zero_copy", 0x8);

  const WpPresentationFeedbackKind(this.enumName, this.enumValue);
  final int enumValue;
  final String enumName;
  @override
  toString() {
    return "WpPresentationFeedbackKind {name: $enumName, value: $enumValue}";
  }
}
