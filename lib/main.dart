import 'package:flutter/material.dart';
import 'package:personaltaskmanagersystem/Tasks/providers/todo_model.dart';
import 'package:provider/provider.dart';

import 'Screens/splash_screen.dart';
import 'Screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TodosModel()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}


