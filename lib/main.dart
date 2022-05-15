import 'package:app_anime_info/screens/anime_info.dart';
import 'package:app_anime_info/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/homePage",
      routes: <String, WidgetBuilder>{
        "/homePage": (BuildContext _) => const HomePage(),
      },
    );
  }
}
