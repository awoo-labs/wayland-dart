// Generated by dart-wayland-scanner
// https://github.com/your-repo/dart-wayland-scanner
// XML file : https://gitlab.freedesktop.org/wayland/wayland-protocols/-/raw/main/unstable/linux-explicit-synchronization/linux-explicit-synchronization-unstable-v1.xml
//
// zwp_linux_explicit_synchronization_unstable_v1 Protocol Copyright:
///
/// Copyright 2016 The Chromium Authors.
/// Copyright 2017 Intel Corporation
/// Copyright 2018 Collabora, Ltd
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

/// protocol for providing explicit synchronization
///
/// This global is a factory interface, allowing clients to request
/// explicit synchronization for buffers on a per-surface basis.
///
/// See zwp_linux_surface_synchronization_v1 for more information.
///
/// This interface is derived from Chromium's
/// zcr_linux_explicit_synchronization_v1.
///
/// Note: this protocol is superseded by linux-drm-syncobj.
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
class ZwpLinuxExplicitSynchronizationV1 extends Proxy {
  final Context innerContext;
  final version = 2;

  ZwpLinuxExplicitSynchronizationV1(this.innerContext)
      : super(innerContext.allocateClientId()) {
    innerContext.register(this);
  }

  @override
  toString() {
    return "ZwpLinuxExplicitSynchronizationV1 {name: 'zwp_linux_explicit_synchronization_v1', id: '$objectId', version: '2',}";
  }

  /// destroy explicit synchronization factory object
  ///
  /// Destroy this explicit synchronization factory object. Other objects,
  /// including zwp_linux_surface_synchronization_v1 objects created by this
  /// factory, shall not be affected by this request.
  ///
  Result<void, Object> destroy() {
    innerContext.unRegister(this);
    logLn("ZwpLinuxExplicitSynchronizationV1::destroy ");
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
      logLn("Exception in ZwpLinuxExplicitSynchronizationV1::destroy: $e");
      return Failure(e);
    }
    return Success(Object());
  }

  /// extend surface interface for explicit synchronization
  ///
  /// Instantiate an interface extension for the given wl_surface to provide
  /// explicit synchronization.
  ///
  /// If the given wl_surface already has an explicit synchronization object
  /// associated, the synchronization_exists protocol error is raised.
  ///
  /// Graphics APIs, like EGL or Vulkan, that manage the buffer queue and
  /// commits of a wl_surface themselves, are likely to be using this
  /// extension internally. If a client is using such an API for a
  /// wl_surface, it should not directly use this extension on that surface,
  /// to avoid raising a synchronization_exists protocol error.
  ///
  /// [id]: the new synchronization interface id
  /// [surface]: the surface
  Result<ZwpLinuxSurfaceSynchronizationV1, Object> getSynchronization(
      Surface surface) {
    var id = ZwpLinuxSurfaceSynchronizationV1(innerContext);
    logLn(
        "ZwpLinuxExplicitSynchronizationV1::getSynchronization  id: $id surface: $surface");
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
      logLn(
          "Exception in ZwpLinuxExplicitSynchronizationV1::getSynchronization: $e");
      return Failure(e);
    }
    return Success(id);
  }
}

///
///

enum ZwpLinuxExplicitSynchronizationV1Error {
  /// the surface already has a synchronization object associated
  synchronizationExists("synchronization_exists", 0);

  const ZwpLinuxExplicitSynchronizationV1Error(this.enumName, this.enumValue);
  final int enumValue;
  final String enumName;
  @override
  toString() {
    return "ZwpLinuxExplicitSynchronizationV1Error {name: $enumName, value: $enumValue}";
  }
}

/// per-surface explicit synchronization support
///
/// This object implements per-surface explicit synchronization.
///
/// Synchronization refers to co-ordination of pipelined operations performed
/// on buffers. Most GPU clients will schedule an asynchronous operation to
/// render to the buffer, then immediately send the buffer to the compositor
/// to be attached to a surface.
///
/// In implicit synchronization, ensuring that the rendering operation is
/// complete before the compositor displays the buffer is an implementation
/// detail handled by either the kernel or userspace graphics driver.
///
/// By contrast, in explicit synchronization, dma_fence objects mark when the
/// asynchronous operations are complete. When submitting a buffer, the
/// client provides an acquire fence which will be waited on before the
/// compositor accesses the buffer. The Wayland server, through a
/// zwp_linux_buffer_release_v1 object, will inform the client with an event
/// which may be accompanied by a release fence, when the compositor will no
/// longer access the buffer contents due to the specific commit that
/// requested the release event.
///
/// Each surface can be associated with only one object of this interface at
/// any time.
///
/// In version 1 of this interface, explicit synchronization is only
/// guaranteed to be supported for buffers created with any version of the
/// wp_linux_dmabuf buffer factory. Version 2 additionally guarantees
/// explicit synchronization support for opaque EGL buffers, which is a type
/// of platform specific buffers described in the EGL_WL_bind_wayland_display
/// extension. Compositors are free to support explicit synchronization for
/// additional buffer types.
///
class ZwpLinuxSurfaceSynchronizationV1 extends Proxy {
  final Context innerContext;
  final version = 2;

  ZwpLinuxSurfaceSynchronizationV1(this.innerContext)
      : super(innerContext.allocateClientId()) {
    innerContext.register(this);
  }

  @override
  toString() {
    return "ZwpLinuxSurfaceSynchronizationV1 {name: 'zwp_linux_surface_synchronization_v1', id: '$objectId', version: '2',}";
  }

  /// destroy synchronization object
  ///
  /// Destroy this explicit synchronization object.
  ///
  /// Any fence set by this object with set_acquire_fence since the last
  /// commit will be discarded by the server. Any fences set by this object
  /// before the last commit are not affected.
  ///
  /// zwp_linux_buffer_release_v1 objects created by this object are not
  /// affected by this request.
  ///
  Result<void, Object> destroy() {
    innerContext.unRegister(this);
    logLn("ZwpLinuxSurfaceSynchronizationV1::destroy ");
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
      logLn("Exception in ZwpLinuxSurfaceSynchronizationV1::destroy: $e");
      return Failure(e);
    }
    return Success(Object());
  }

  /// set the acquire fence
  ///
  /// Set the acquire fence that must be signaled before the compositor
  /// may sample from the buffer attached with wl_surface.attach. The fence
  /// is a dma_fence kernel object.
  ///
  /// The acquire fence is double-buffered state, and will be applied on the
  /// next wl_surface.commit request for the associated surface. Thus, it
  /// applies only to the buffer that is attached to the surface at commit
  /// time.
  ///
  /// If the provided fd is not a valid dma_fence fd, then an INVALID_FENCE
  /// error is raised.
  ///
  /// If a fence has already been attached during the same commit cycle, a
  /// DUPLICATE_FENCE error is raised.
  ///
  /// If the associated wl_surface was destroyed, a NO_SURFACE error is
  /// raised.
  ///
  /// If at surface commit time the attached buffer does not support explicit
  /// synchronization, an UNSUPPORTED_BUFFER error is raised.
  ///
  /// If at surface commit time there is no buffer attached, a NO_BUFFER
  /// error is raised.
  ///
  /// [fd]: acquire fence fd
  Result<void, Object> setAcquireFence(int fd) {
    logLn("ZwpLinuxSurfaceSynchronizationV1::setAcquireFence  fd: $fd");
    var arguments = [];
    var argTypes = <WaylandType>[];
    var calclulatedSize = calculateSize(argTypes, arguments);
    final bytesBuilder = BytesBuilder();
    bytesBuilder.add(
        Uint32List.fromList([objectId, (calclulatedSize << 16) | 1])
            .buffer
            .asUint8List());
    try {
      innerContext.sendMessage(bytesBuilder.toBytes(), fd);
    } catch (e) {
      logLn(
          "Exception in ZwpLinuxSurfaceSynchronizationV1::setAcquireFence: $e");
      return Failure(e);
    }
    return Success(Object());
  }

  /// release fence for last-attached buffer
  ///
  /// Create a listener for the release of the buffer attached by the
  /// client with wl_surface.attach. See zwp_linux_buffer_release_v1
  /// documentation for more information.
  ///
  /// The release object is double-buffered state, and will be associated
  /// with the buffer that is attached to the surface at wl_surface.commit
  /// time.
  ///
  /// If a zwp_linux_buffer_release_v1 object has already been requested for
  /// the surface in the same commit cycle, a DUPLICATE_RELEASE error is
  /// raised.
  ///
  /// If the associated wl_surface was destroyed, a NO_SURFACE error
  /// is raised.
  ///
  /// If at surface commit time there is no buffer attached, a NO_BUFFER
  /// error is raised.
  ///
  /// [release]: new zwp_linux_buffer_release_v1 object
  Result<ZwpLinuxBufferReleaseV1, Object> getRelease() {
    var release = ZwpLinuxBufferReleaseV1(innerContext);
    logLn("ZwpLinuxSurfaceSynchronizationV1::getRelease  release: $release");
    var arguments = [release];
    var argTypes = <WaylandType>[WaylandType.newId];
    var calclulatedSize = calculateSize(argTypes, arguments);
    final bytesBuilder = BytesBuilder();
    bytesBuilder.add(
        Uint32List.fromList([objectId, (calclulatedSize << 16) | 2])
            .buffer
            .asUint8List());
    bytesBuilder
        .add(Uint32List.fromList([release.objectId]).buffer.asUint8List());
    try {
      innerContext.sendMessage(
        bytesBuilder.toBytes(),
      );
    } catch (e) {
      logLn("Exception in ZwpLinuxSurfaceSynchronizationV1::getRelease: $e");
      return Failure(e);
    }
    return Success(release);
  }
}

///
///

enum ZwpLinuxSurfaceSynchronizationV1Error {
  /// the fence specified by the client could not be imported
  invalidFence("invalid_fence", 0),

  /// multiple fences added for a single surface commit
  duplicateFence("duplicate_fence", 1),

  /// multiple releases added for a single surface commit
  duplicateRelease("duplicate_release", 2),

  /// the associated wl_surface was destroyed
  noSurface("no_surface", 3),

  /// the buffer does not support explicit synchronization
  unsupportedBuffer("unsupported_buffer", 4),

  /// no buffer was attached
  noBuffer("no_buffer", 5);

  const ZwpLinuxSurfaceSynchronizationV1Error(this.enumName, this.enumValue);
  final int enumValue;
  final String enumName;
  @override
  toString() {
    return "ZwpLinuxSurfaceSynchronizationV1Error {name: $enumName, value: $enumValue}";
  }
}

/// release buffer with fence
///
/// Sent when the compositor has finalised its usage of the associated
/// buffer for the relevant commit, providing a dma_fence which will be
/// signaled when all operations by the compositor on that buffer for that
/// commit have finished.
///
/// Once the fence has signaled, and assuming the associated buffer is not
/// pending release from other wl_surface.commit requests, no additional
/// explicit or implicit synchronization is required to safely reuse or
/// destroy the buffer.
///
/// This event destroys the zwp_linux_buffer_release_v1 object.
///
class ZwpLinuxBufferReleaseV1FencedReleaseEvent {
  /// fence for last operation on buffer
  final int fence;

  ZwpLinuxBufferReleaseV1FencedReleaseEvent(
    this.fence,
  );

  @override
  toString() {
    return "ZwpLinuxBufferReleaseV1FencedReleaseEvent (fence: $fence)";
  }
}

typedef ZwpLinuxBufferReleaseV1FencedReleaseEventHandler = void Function(
    ZwpLinuxBufferReleaseV1FencedReleaseEvent);

/// release buffer immediately
///
/// Sent when the compositor has finalised its usage of the associated
/// buffer for the relevant commit, and either performed no operations
/// using it, or has a guarantee that all its operations on that buffer for
/// that commit have finished.
///
/// Once this event is received, and assuming the associated buffer is not
/// pending release from other wl_surface.commit requests, no additional
/// explicit or implicit synchronization is required to safely reuse or
/// destroy the buffer.
///
/// This event destroys the zwp_linux_buffer_release_v1 object.
///
class ZwpLinuxBufferReleaseV1ImmediateReleaseEvent {
  ZwpLinuxBufferReleaseV1ImmediateReleaseEvent();

  @override
  toString() {
    return "ZwpLinuxBufferReleaseV1ImmediateReleaseEvent ()";
  }
}

typedef ZwpLinuxBufferReleaseV1ImmediateReleaseEventHandler = void Function(
    ZwpLinuxBufferReleaseV1ImmediateReleaseEvent);

/// buffer release explicit synchronization
///
/// This object is instantiated in response to a
/// zwp_linux_surface_synchronization_v1.get_release request.
///
/// It provides an alternative to wl_buffer.release events, providing a
/// unique release from a single wl_surface.commit request. The release event
/// also supports explicit synchronization, providing a fence FD for the
/// client to synchronize against.
///
/// Exactly one event, either a fenced_release or an immediate_release, will
/// be emitted for the wl_surface.commit request. The compositor can choose
/// release by release which event it uses.
///
/// This event does not replace wl_buffer.release events; servers are still
/// required to send those events.
///
/// Once a buffer release object has delivered a 'fenced_release' or an
/// 'immediate_release' event it is automatically destroyed.
///
class ZwpLinuxBufferReleaseV1 extends Proxy implements Dispatcher {
  final Context innerContext;
  final version = 1;

  ZwpLinuxBufferReleaseV1(this.innerContext)
      : super(innerContext.allocateClientId()) {
    innerContext.register(this);
  }

  @override
  toString() {
    return "ZwpLinuxBufferReleaseV1 {name: 'zwp_linux_buffer_release_v1', id: '$objectId', version: '1',}";
  }

  /// release buffer with fence
  ///
  /// Sent when the compositor has finalised its usage of the associated
  /// buffer for the relevant commit, providing a dma_fence which will be
  /// signaled when all operations by the compositor on that buffer for that
  /// commit have finished.
  ///
  /// Once the fence has signaled, and assuming the associated buffer is not
  /// pending release from other wl_surface.commit requests, no additional
  /// explicit or implicit synchronization is required to safely reuse or
  /// destroy the buffer.
  ///
  /// This event destroys the zwp_linux_buffer_release_v1 object.
  ///
  /// Event handler for FencedRelease
  /// - [fence]: fence for last operation on buffer
  void onFencedRelease(
      ZwpLinuxBufferReleaseV1FencedReleaseEventHandler handler) {
    _fencedReleaseHandler = handler;
  }

  ZwpLinuxBufferReleaseV1FencedReleaseEventHandler? _fencedReleaseHandler;

  /// release buffer immediately
  ///
  /// Sent when the compositor has finalised its usage of the associated
  /// buffer for the relevant commit, and either performed no operations
  /// using it, or has a guarantee that all its operations on that buffer for
  /// that commit have finished.
  ///
  /// Once this event is received, and assuming the associated buffer is not
  /// pending release from other wl_surface.commit requests, no additional
  /// explicit or implicit synchronization is required to safely reuse or
  /// destroy the buffer.
  ///
  /// This event destroys the zwp_linux_buffer_release_v1 object.
  ///
  /// Event handler for ImmediateRelease
  void onImmediateRelease(
      ZwpLinuxBufferReleaseV1ImmediateReleaseEventHandler handler) {
    _immediateReleaseHandler = handler;
  }

  ZwpLinuxBufferReleaseV1ImmediateReleaseEventHandler? _immediateReleaseHandler;

  @override
  void dispatch(int opcode, int fd, Uint8List data) {
    logLn("ZwpLinuxBufferReleaseV1.dispatch($opcode, $fd, $data)");
    switch (opcode) {
      case 0:
        if (fd != -1) {}
        if (_fencedReleaseHandler != null) {
          var offset = 0;
          final fence = fd;
          var event = ZwpLinuxBufferReleaseV1FencedReleaseEvent(
            fence,
          );
          _fencedReleaseHandler!(event);
        }
        break;
      case 1:
        if (_immediateReleaseHandler != null) {
          _immediateReleaseHandler!(
              ZwpLinuxBufferReleaseV1ImmediateReleaseEvent());
        }
        break;
    }
  }
}
