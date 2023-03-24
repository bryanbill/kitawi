import 'dart:io';

import 'package:args/args.dart';
import 'dart:convert';

import 'package:yaml/yaml.dart';

void main(List<String> arguments) {
  final parser = ArgParser()
    ..addFlag('help',
        abbr: 'h', negatable: false, help: 'Show usage information')
    ..addCommand('run', _runCommandParser())
    ..addCommand('create', _createCommandParser())
    ..addCommand('build', _buildCommandParser());

  ArgResults argResults;
  try {
    argResults = parser.parse(arguments);
  } on FormatException catch (e) {
    print(e.message);
    print('');
    printUsage(parser);
    return;
  }

  if (argResults['help'] || argResults.command == null) {
    printUsage(parser);
    return;
  }

  final commandName = argResults.command!.name;
  switch (commandName) {
    case 'run':
      _handleRunCommand(argResults.command!);
      break;
    case 'create':
      _handleCreateCommand(argResults.command!);
      break;
    case 'build':
      _handleBuildCommand(argResults.command!);
      break;
    default:
      printUsage(parser);
      break;
  }
}

void printUsage(ArgParser parser) {
  print('Usage: kitawi <command> [arguments]\n');
  print('Commands:');
  print('  run    : Run a Kitawi application');
  print('  create : Create a new Kitawi project');
  print('  build  : Build a Kitawi project into an executable\n');
  print(parser.usage);
}

ArgParser _runCommandParser() {
  final parser = ArgParser();
  parser.addOption('port', abbr: 'p', help: 'The port number to listen on');
  return parser;
}

void _handleRunCommand(ArgResults args) async {
  final port = args['port'] ?? 8080;

  // Run webdev serve
  final webdev = await Process.start(
      'webdev', ['serve', 'web:$port', '--auto', 'refresh']);

  // Pipe the output of the webdev command to stdout
  webdev.stdout.listen((event) {
    stdout.add(event);
  });

  // Pipe the error output of the webdev command to stderr
  webdev.stderr.listen((event) {
    stderr.add(event);
  });

  // Wait for the webdev command to finish
  await webdev.exitCode;
}

ArgParser _createCommandParser() {
  final parser = ArgParser();

  parser.addOption('project_name',
      abbr: 'n', help: 'The name of the project to create');
  return parser;
}

void _handleCreateCommand(ArgResults args) async {
  final projectName = args['project_name'];

  // Enable webdev
  final webdev =
      await Process.start('dart', ['pub', 'global', 'activate', 'webdev']);

  // Pipe the output of the webdev command to stdout
  webdev.stdout.listen((event) {
    stdout.add(event);
  });

  // Pipe the error output of the webdev command to stderr
  webdev.stderr.listen((event) {
    stderr.add(event);
  });

  // Wait for the webdev command to finish
  await webdev.exitCode;

  // dart create web app
  final create =
      await Process.start('dart', ['create', '-t' 'web', projectName]);

  // Pipe the output of the create command to stdout
  create.stdout.listen((event) {
    stdout.add(event);
  });

  // Pipe the error output of the create command to stderr
  create.stderr.listen((event) {
    stderr.add(event);
  });

  // Wait for the create command to finish
  await create.exitCode;

  // scaffold the app
  scaffold(projectName);

  // Change directory to the newly created app
  Directory.current = projectName;

  // Add kitawi: any as a dependency in pubspec.yaml
  final pubspec = File('pubspec.yaml');

  // Read the contents of the pubspec.yaml file
  final contents = await pubspec.readAsString();

  // Add kitawi: any as a dependency
  var updatedContents =
      contents.replaceFirst('dependencies:', 'dependencies:\n  kitawi: ^0.0.5');

  final manifest = '''

manifest: 
  - name: $projectName
  - short_name: $projectName
  - id: /#/
  - start_url: /#/
  - display: standalone
  - background_color: "#ffffff"
  - theme_color: "#4DB6AC"
  - orientation: portrait-primary
  - icons:
      - src: /assets/images/icon.png
        sizes: 192x192
        type: image/png
''';

// add the manifest contents to the pubspec.yaml file
  updatedContents = contents.replaceFirst(
          'dependencies:', 'dependencies:\n  kitawi: ^0.0.6') +
      manifest;

  // Write the updated contents to the pubspec.yaml file
  await pubspec.writeAsString(updatedContents);

  // Run pub get to install the kitawi dependency
  final pubGet = await Process.start('dart', ['pub', 'get']);

  // Pipe the output of the pub get command to stdout
  pubGet.stdout.listen((event) {
    stdout.add(event);
  });

  // Pipe the error output of the pub get command to stderr
  pubGet.stderr.listen((event) {
    stderr.add(event);
  });

  // Wait for the pub get command to finish
  await pubGet.exitCode;
}

ArgParser _buildCommandParser() {
  final parser = ArgParser();

  parser.addOption('no-pwa',
      help: 'Build a Kitawi project without PWA support');

  return parser;
}

void _handleBuildCommand(ArgResults args) async {
  final noPwa = args['no-pwa'] ?? false;
  if (noPwa) {
    var process = await Process.start('webdev', ['build']);

    // Pipe the output of the webdev command to stdout
    process.stdout.listen((event) {
      stdout.add(event);
    });

    // Pipe the error output of the webdev command to stderr
    process.stderr.listen((event) {
      stderr.add(event);
    });

    // Wait for the webdev command to finish
    await process.exitCode;
  } else {
    var process = await Process.start('webdev', ['build']);

    // Pipe the output of the webdev command to stdout
    process.stdout.listen((event) {
      stdout.add(event);
    });

    // Pipe the error output of the webdev command to stderr
    process.stderr.listen((event) {
      stderr.add(event);
    });

    // Wait for the webdev command to finish
    await process.exitCode;

    // read the pubscpec.yaml file and get the entries of manifest
    final pubspec = File('pubspec.yaml');

    // Read the contents of the pubspec.yaml file
    final contents = await pubspec.readAsString();

    //load the yaml file
    final yaml = loadYaml(contents);

    // get the manifest entries
    final manifest = yaml['manifest'];

    Map<String, dynamic> manifestMap = {};

    // convert the manifest entries to a map
    for (final entry in manifest) {
      manifestMap[entry.keys.first] = entry.values.first;
    }

    // create the manifest.json file
    final manifestFile = File('build/manifest.json');

    // write the contents of the manifest.json file
    await manifestFile.writeAsString(jsonEncode(manifestMap));

    // add the link to the manifest.json file in the index.html file
    final indexFile = File('build/index.html');

    // read the contents of the index.html file
    final indexContents = await indexFile.readAsString();

    // add the link to the manifest.json file in the index.html file

    final updatedIndexContents = indexContents.replaceFirst('</head>', '''
  <link rel="manifest" href="manifest.json">
</head>

        ''');

    // write the updated contents of the index.html file
    await indexFile.writeAsString(updatedIndexContents);
  }
}

void scaffold(String name) {
  try {
    // delete the index.html, style.css, and main.dart files in the <name>/web directory

    final deleteResources = Directory('$name/web').listSync();

    for (final file in deleteResources) {
      file.deleteSync();
    }
    // create the css directory in <name>/web/assets directory
    final cssDir = Directory('$name/web/assets/css');
    cssDir.createSync(recursive: true);

    // create the main.css in <name>/web/assets/css directory
    final mainCss = File('$name/web/assets/css/main.css');

    // Write the contents of the main.css file
    mainCss.writeAsStringSync('''
body {
  margin: 0;
  padding: 0;
  font-family: 'Roboto', sans-serif;
  font-size: 16px;
  color: #333;
  background-color: #fff;
}

 /* Hide scrollbar for all modern browsers except IE */
.scrollable::-webkit-scrollbar {
  width: 0;
  height: 0;
}

/* Hide scrollbar for IE, Edge and Firefox */
.scrollable {
  -ms-overflow-style: none; /* IE and Edge */
  scrollbar-width: none; /* Firefox */
}

/* Hide scrollbar thumb */
.scrollable::-webkit-scrollbar-thumb {
  background-color: rgba(0, 0, 0, 0);
  width: 0;
  height: 0;
}

''');

    // create a new index.html file in the <name>/web directory
    final index = File('$name/web/index.html');

    // Write the contents of the index.html file
    index.writeAsStringSync('''
<!DOCTYPE html>
<html lang="en">
  <head>    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Kitawi is a responsive UI framework for building modern web applications.">
    <meta name="keywords" content="kitawi, ui framework, web development">
    <meta name="author" content="Kitawi">
    <meta name="theme-color" content="#4DB6AC">
    
    <title>$name</title>
    <link rel="stylesheet" href="assets/css/main.css">
  </head>

  <body>
    <div id="root"></div>
    <script src="main.dart.js" defer></script>
  </body>

</html>
''');

// create new main.dart file in the <name>/web directory
    final main = File('$name/web/main.dart');

    // Write the contents of the main.dart file
    main.writeAsStringSync('''
import 'package:kitawi/kitawi.dart';

void main() {
  run(
    [
      Route(
        builder: (args) => App(), 
        path: "/", 
        name: "App"
      ),
    ],
    id: 'root', // This is the id of element that will contain your app
    env: Environment.dev,
  );
}

class App extends Layout {

  @override
  Widget build() {
    return Center(child: Text("Hello World!"));
  }
}
''');
  } catch (e) {
    print(e.toString());
  }
}
