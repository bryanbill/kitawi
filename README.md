# Kitawi

Introducing Kitawi - the UI-first framework that will take your web development game to the next level!

Kitawi is the perfect choice for developers who value beautiful and intuitive user interfaces. With its powerful set of tools and easy-to-use components, Kitawi lets you create stunning web applications with ease.

With Kitawi, you can say goodbye to the tedious process of writing complex CSS and HTML code from scratch. Instead, you can focus on what really matters - creating engaging and interactive user experiences. Plus, our framework is designed with responsiveness in mind, so your web app will look great on any device.

## Getting Started

### Prerequisites

Kitawi is written in Dart and compiled to JavaScript. To use Kitawi, you need to install the Dart SDK and the Dartium browser. You can find the installation instructions [here](https://www.dartlang.org/tools/sdk#install).

Once you have Dart installed, you can start using Kitawi by adding the following line to your `pubspec.yaml` file:

    dependencies:
      kitawi: any

Then, run `pub get` to install the package.

### Usage

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

## Documentation

You can find the documentation for Kitawi [here](https://kitawi.github.io/kitawi/).

## Contributing

We welcome contributions to Kitawi! If you would like to contribute, please read our [contribution guidelines](CONTRIBUT.md).

## License

Kitawi is licensed under the [MIT License](LICENSE).
