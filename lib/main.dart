import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Loading_screen.dart';
import 'package:todo/models/tasks_data.dart';
import 'package:todo/theme.dart';

void main() {runApp(
  ChangeNotifierProvider<ThemeModel>(
    create: (context) => ThemeModel(),
    child: MyApp(),
  ),
);
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>TaskData(),
      child:MaterialApp(
        theme: Provider.of<ThemeModel>(context).currentTheme,
      home: LoadingScreen(),
      debugShowCheckedModeBanner: false,
    ));
  }
}

