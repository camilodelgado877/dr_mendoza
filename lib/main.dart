import 'package:flutter/material.dart';
import 'package:dr_mendoza/screens/screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dr_mendoza/firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agenda personal',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/':(context) => const Home(),
        'pageHorario':(context) => const PageHorario(),
        'notas_page':(context) =>  const homeNotas(),
        'Cocina_page':(context) => Cocina_page(),
        'mensajes_page':(context) => const mensajes_page(),
      },
    );
  }
}
