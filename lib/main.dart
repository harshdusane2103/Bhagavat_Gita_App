import 'package:bhagavat_gita/Provider/detailpage_provider.dart';
import 'package:bhagavat_gita/Provider/provider_gita.dart';
import 'package:bhagavat_gita/View/Splash.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Gitaprovider()),
        ChangeNotifierProvider(create: (context) => DetailProvider()),
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.light,
            colorScheme: ColorScheme.light(
              primary: Colors.white,
            )),
        darkTheme: ThemeData(
            brightness: Brightness.dark,
            colorScheme: ColorScheme.dark(
              primary: Colors.white,
            )),
        themeMode: Provider.of<Gitaprovider>(context).isDark
            ? ThemeMode.dark
            : ThemeMode.light,
        home: SplashScreen(),
      ),
    );
  }
}
