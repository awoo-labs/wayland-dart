# **ALERT**
This library will no longer be maintained or updated by me. I will be primarily moving away from Dart.

# Dart Wayland Client Library

A robust and efficient Dart implementation of the Wayland client protocols. This library provides a comprehensive set of tools for building Wayland clients in Dart, offering seamless integration with the Wayland display server system.

## Features

- Full implementation of core Wayland protocols
- Support for XDG shell and other common extensions
- Efficient message parsing and serialization
- Asynchronous event handling
- Memory management utilities including shared memory support
- Cross-platform compatibility (Linux, BSD)

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  wayland: ^1.0.0


## Example usage

```dart
import 'package:wayland/wayland.dart';

void main() async {
  final app = App();
  await app.initWindow();
  while (!app.shouldExit) {
    app.dispatch();
  }
}

class App {
  Context? context;
  Display? display;
  // ... other necessary objects

  initWindow() async {
    context = Context();
    await context?.connect();

    display = Display(context!);
    // ... set up registry, surfaces, and other objects

    // Handle events
    xdgSurface?.onConfigure((con) {
      // Handle surface configuration
    });

    // ... more event handling and window setup
  }

  dispatch() {
    context?.dispatch();
  }

  // ... other methods for drawing, handling input, etc.
}
```

~~see the example directory [example](example) for how to use this library.~~

## Awoo-Mixins

This distribution of `wayland-dart` comes with additions named Awoo-Mixins. They ensure `wayland-dart` is easy to maintain during times where Wayland rapidly updates. Please view the [awoo-mixins](awoo-mixins) directory to see their usage in development and updating.
