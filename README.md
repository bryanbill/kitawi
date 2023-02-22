# Kitawi

Introducing Kitawi - the UI-first framework that will take your web development game to the next level!

Kitawi is the perfect choice for developers who value beautiful and intuitive user interfaces. With its powerful set of tools and easy-to-use components, Kitawi lets you create stunning web applications with ease.

With Kitawi, you can say goodbye to the tedious process of writing complex CSS and HTML code from scratch. Instead, you can focus on what really matters - creating engaging and interactive user experiences. Plus, our framework is designed with responsiveness in mind, so your web app will look great on any device.

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
kitawi create  --name <project_name>

```

This will create a new directory called `<project_name>` in your current directory. Inside this directory, you will find a `pubspec.yaml` file and a `web` directory. The `pubspec.yaml` file contains the dependencies for your project. The `web` directory contains the source code for your project.

To run your project, run the following command:

```bash
kitawi run --port <port_number>
```

This will start a local server on port `<port_number>`. You can now access your project by navigating to `http://localhost:<port_number>` in your browser.

### Example

Here is a simple example of a Kitawi project:

```dart
import 'package:kitawi/kitawi.dart';

void main() {
  start((){
    // Your code goes here
    ...
    run(Container(
        child: Text('Hello, world!'),
        decoration: Decoration(
            color: Colors.green,
            border: Border(color: Colors.black, width: 2.0),
    ));
  });
}
```

This will create a div with a green container that contains a black border and the text(p) "Hello, world!".

## Documentation

You can find the documentation for Kitawi [here](https://pub.dev/documentation/kitawi/latest/).

## Contributing

We welcome contributions to Kitawi! If you would like to contribute, please read our [contribution guidelines](CONTRIBUTE.md).

## License

Kitawi is licensed under the [MIT License](LICENSE).
