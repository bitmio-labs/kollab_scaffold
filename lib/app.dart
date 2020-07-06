import 'package:flutter/material.dart';

import 'home.dart';

const _primaryColor = Color(0xFF6200EE);

class App extends StatelessWidget {
  static const String defaultRoute = '/home';

  final String title;

  App({this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      initialRoute: App.defaultRoute,
      routes: {
        App.defaultRoute: (context) => HomePage(),
      },
      theme: ThemeData(
        primaryColor: _primaryColor,
        highlightColor: Colors.transparent,
        colorScheme: const ColorScheme(
          primary: _primaryColor,
          primaryVariant: Color(0xFF3700B3),
          secondary: Color(0xFF03DAC6),
          secondaryVariant: Color(0xFF018786),
          background: Colors.white,
          surface: Colors.white,
          onBackground: Colors.black,
          error: Color(0xFFB00020),
          onError: Colors.white,
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onSurface: Colors.black,
          brightness: Brightness.light,
        ),
        dividerTheme: const DividerThemeData(
          thickness: 1,
          color: Color(0xFFE5E5E5),
        ),
      ),
    );
  }
}
