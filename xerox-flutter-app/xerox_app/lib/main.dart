// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:xerox_app/backend/firebase.dart';
import 'package:xerox_app/screens/login_screen.dart';
import 'package:xerox_app/screens/main_page.dart';
import 'package:xerox_app/screens/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'DTO/user.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseBackend().initNotification();
  runApp(
    Printer()
  );
}

class Printer extends StatelessWidget {
  const Printer({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/login",
       onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/login':
            return MaterialPageRoute(builder: (context) => LoginScreen());
          case '/register':
            return MaterialPageRoute(builder: (context) => RegisterScreen());
          case '/main_screen':
            // Extract arguments from settings.arguments
            User user = settings.arguments as User;
            return MaterialPageRoute(
              builder: (context) => MainPage(user: user),
            );
          default:
            return null;
        }
      },
    );
  }
}