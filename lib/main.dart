import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Needed for SystemChrome
import 'package:todo_app_setstate/screens/splashscreen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required before async calls
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TO DO',
      theme: ThemeData(textTheme: GoogleFonts.acmeTextTheme()),
      home: Splashscreen(),
    );
  }
}
