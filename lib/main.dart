import 'package:flutter/material.dart';
import 'package:flutter_application_todo/controller/provider.dart';
import 'package:flutter_application_todo/views/list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Homeprovider(),
      child: MaterialApp(
        title: 'Todo App',
        home: const ListPage(),
        // theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
