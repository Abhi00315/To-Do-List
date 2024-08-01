import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './screens/home.dart';
import 'constants/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple, // Default swatch if primaryColor not used
          accentColor: secondaryColor,
        ).copyWith(
          primary: primaryColor,
          secondary: secondaryColor,
          background: backgroundColor,
        ),
        scaffoldBackgroundColor: backgroundColor,
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          bodyText1: TextStyle(color: textColor),
          bodyText2: TextStyle(color: hintColor),
        ),
      ),
      home: Home(),
    );
  }
}
