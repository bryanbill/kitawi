# Kitawi - Declarative UI for the web

Kitawi is a declarative UI library for the web. It is inspired by [Flutter](https://flutter.dev) and [Vue](https://vuejs.org).
With Kitawi, you can say goodbye to the tedious process of writing complex CSS and HTML code from scratch. Instead, you can focus on what really matters - creating engaging and interactive user experiences. Plus, our framework is designed with responsiveness in mind, so your web app will look great on any device.

<p style="color:red">Kitawi is still in early evelopment and is not ready for production use.</p>

## Getting Started

### Prerequisites

Kitawi is written in Dart and compiled to JavaScript. To use Kitawi, you need to install the Dart SDK. You can find the installation instructions [here](https://www.dartlang.org/tools/sdk#install).

Once you have Dart installed, you can install Kitawi by running the following command:

```bash
dart pub global activate kitawi
```

### Usage

To create a new Kitawi project, run the following command:

```bash
kitawi create <project_name>

```

This will create a new directory called `<project_name>` in your current directory. Inside this directory, you will find a `pubspec.yaml` file and a `web` directory. The `pubspec.yaml` file contains the dependencies and the PWA configurations for your project. The `web` directory contains the source code for your project.

To run your project, run the following command:

```bash
kitawi run
```

This will start a local server on port `8080`. If the port is in use, you can specify a different port by running the following command:

```bash
kitawi run --port <port_number>
```

 You can now access your project by navigating to `http://localhost:<port_number>` in your browser.

 To build your project, run the following command:

 ```bash
  kitawi build
  ```

This will create a `build` directory in your project directory. This directory contains the compiled JavaScript and CSS files for your project. You can now deploy your project to any web server. [See this Vercel guide for more information](https://vercel.com/docs/concepts/deployments/overview#vercel-cli)

Kitawi is a PWA first framework. This means that your Kitawi project will be a PWA by default. To learn more about PWA, check out [this](https://web.dev/progressive-web-apps/) article.

To build the app without the PWA configurations, run the following command:

```bash
kitawi build --no-pwa
```

### Example

Here is a simple example of a Kitawi project:

```dart
import 'package:kitawi/kitawi.dart';

void main() {
  run(
    [
      Route(
        builder: (args) => App(), 
        path: "/app", 
        name: "App"
      ),
    ],
    id: <app_id>, // This is the id of element that will contain your app
    env: Environment.dev,
  );
}

class App extends Layout {

  @override
  Widget build() {
    return Container(
      color: Colors.green,
      child: Text("Hello, world!"),
    );
  }
}
```

This will create a div with a green container that contains a black border and the text(p) "Hello, world!".

## Documentation

You can find the documentation for Kitawi [here](https://pub.dev/documentation/kitawi/latest/).

## Contributing

We welcome contributions to Kitawi! If you would like to contribute, please read our [contribution guidelines](CONTRIBUTE.md).

## License

Kitawi is licensed under the [MIT License](LICENSE).
