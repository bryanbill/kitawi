# Kitawi - A Dart Web Library

Kitawi is a Dart web library for building web user interfaces.
It's highly customizable and can be used with any Dart package that can run on the web.

The project can be compiled to wasm for Chromium-based browsers, others use the dart2js compiler.

## Disclaimer

This project is still in development and is not yet ready for production use. The API is subject to change. Use at your own risk.

## Installation

1. Using the kitawi CLI:

```bash
dart pub global activate kitawi
```

The run the following command to create a new project:

```bash
kitawi new my_project
```

Get the dependencies:

```bash
cd my_project
kitawi get
```

Add dependencies:

```bash
kitawi get http
```

Run the project:

```bash
kitawi run
```

Build the project:

```bash
kitawi build
```

2. As a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  kitawi: 0.1.3
```

## Contributing

We welcome contributions to kitawi

## License

kitawi is licensed under the MIT License.
