import 'package:crunch/features/home/pressentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/login/views/login_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String ? token = prefs.getString("token");

  Widget startWidget = (token !=null)? HomeScreen() : LoginScreen() ;
  runApp(MyApp(startWidget: startWidget,));
}

class MyApp extends StatelessWidget {
  final Widget startWidget ;
  const MyApp({super.key, required this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
      ),
      home: startWidget,
    );
  }
}


