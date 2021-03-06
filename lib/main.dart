import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:province_cambodia/provider/themeChanger.dart';
import 'package:province_cambodia/screen/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
        ChangeNotifierProvider<ThemeChanger>(
        create: (_) => ThemeChanger()),
        // ChangeNotifierProvider<UserBloc>(create: (_) => UserBloc())
      ],
      child: Builder(
        builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChanger>(context);
          return MaterialApp(
            title: 'Dark Theme Demo',
            themeMode: themeChanger.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              primaryColor: Color(0xff4C9BE2),
              //primarySwatch: Color(0xff94b1dc),
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
            ),
            home: homePage(),
          );
        },
      ),
    );
    // return MaterialApp(
    //     title: 'Flutter Demo',
    //     theme: ThemeData(
    //       primarySwatch: Colors.blue,
    //     ),
    //     home: homePage());
  }
}
