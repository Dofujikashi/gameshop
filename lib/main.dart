import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gameshop/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';
import 'screens/login.dart';
import 'package:path/path.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory dir = await getApplicationDocumentsDirectory();
  Store store = Store(
    getObjectBoxModel(),
    directory: join(dir.path, 'objectbox'),
  );
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store store;
  const MyApp({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'Game Shop',
      home: Login(store: store),
      debugShowCheckedModeBanner: false,
    );
  }
}
