
import 'package:camera_app/db/db_functions.dart';
import 'package:camera_app/screens/splash.dart';
import 'package:flutter/material.dart';

    Future <void> main()async {
      WidgetsFlutterBinding.ensureInitialized();
      await initializeDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Splash(),
    );
  }
}


