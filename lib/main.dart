import 'package:flutter/material.dart';
import 'package:basic_flutter/example/button_screen.dart';
import 'package:basic_flutter/example/column_screen.dart';
import 'package:basic_flutter/example/components/app_theme.dart';
import 'package:basic_flutter/example/custom_screen.dart';
import 'package:basic_flutter/example/splash_screen.dart';
import 'package:basic_flutter/example/grid_screen.dart';
import 'package:basic_flutter/example/image_screen.dart';
import 'package:basic_flutter/example/list_style_screen.dart';
import 'package:basic_flutter/example/list_view_screen.dart';
import 'package:basic_flutter/example/null_aware_screen.dart';
import 'package:basic_flutter/example/row_screen.dart';
import 'package:basic_flutter/example/wisata_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final lightTheme = AppLightTheme();
    final darkTheme = AppDarkTheme();
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: lightTheme.primarySwatch,
        appBarTheme: lightTheme.appBarTheme,
        scaffoldBackgroundColor: lightTheme.scaffoldBackgroundColor,
        floatingActionButtonTheme: lightTheme.floatingActionButtonTheme,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: darkTheme.primarySwatch,
        appBarTheme: darkTheme.appBarTheme,
        scaffoldBackgroundColor: darkTheme.scaffoldBackgroundColor,
        floatingActionButtonTheme: darkTheme.floatingActionButtonTheme,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/column': (context) => const ColumnScreen(),
        '/row': (context) => const RowScreen(),
        '/image': (context) => const ImageScreen(),
        '/button': (context) => const ButtonScreen(),
        '/customScroll': (context) => const CustomScrollScreen(),
        '/listView': (context) => const ListViewScreen(),
        '/gridView': (context) => const GridScreen(),
        '/listWithStyle': (context) => const ListWithStyleScreen(),
        '/safetyNull': (context) => NullAwareScreen(),
        '/wisata': (context) => const WisataListScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Submission Flutter Pemula Dicoding'),
        leading: const Text('Kiri'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            Text(
              '$_counter',
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}