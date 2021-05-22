import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yatravel/screens/loading.dart';
import 'package:yatravel/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
                                          // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Text('SomethingWentWrong');
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
           return MaterialApp(
            title: 'YaTravel!',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Color(0xFFe3b081),
              accentColor: Color(0xFF033A34),
              scaffoldBackgroundColor: Color(0xFFf1c7bb),
            ),
            home: HomeScreen(),    ///takes you to SplashScreen
          );
        }
        // Otherwise, show something whilst waiting for initialization to complete
        return Loading();
      },
    );
  }
}
