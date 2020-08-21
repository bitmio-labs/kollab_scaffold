import 'package:flutter/material.dart';
import 'package:kollab_scaffold/kollab_scaffold.dart';

void main() {
  runApp(ExampleApp());
}

const _primaryColor = Color(0xFF6200EE);

class ExampleApp extends StatelessWidget {
  static const String defaultRoute = '/home';

  final String title = 'Example App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      initialRoute: ExampleApp.defaultRoute,
      routes: {
        ExampleApp.defaultRoute: (context) => ExampleScaffold(),
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

class ExampleScaffold extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ExampleScaffoldState();
}

class ExampleScaffoldState extends State<ExampleScaffold> {
  Stream<ScaffoldConfigModel> _model = (() async* {
    final model = await ScaffoldConfigModel.example;
    //await Future.delayed(Duration(milliseconds: 3000));
    yield model;
  })();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ScaffoldConfigModel>(
        stream: _model,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active ||
              snapshot.connectionState == ConnectionState.done) {
            print(snapshot.data.app_title);
            return HomePage(model: snapshot.data);
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: const CircularProgressIndicator(),
                  width: 60,
                  height: 60,
                )
              ],
            );
          }
        });
  }
}
