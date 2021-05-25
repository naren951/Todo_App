import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'models/tasks_data.dart';
import 'package:todo/screens/tasksScreen.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var initializationSettingsAndroid =
    AndroidInitializationSettings('app_icon');
    var initializationSettingsIOs = IOSInitializationSettings();
    var initSetttings = InitializationSettings(android: initializationSettingsAndroid,iOS: initializationSettingsIOs);
    flutterLocalNotificationsPlugin.initialize(initSetttings);
    TaskData taskData=TaskData();
    taskData.getData().whenComplete(() => Navigator.push(context, MaterialPageRoute(builder: (context){
      return TasksScreen();
    })
  ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinKitCircle(
        color: Colors.blue,
      ),

    );
  }
}
