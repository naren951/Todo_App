import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/widgets/tasks_list.dart';
import 'package:todo/screens/add_task_screen.dart';
import 'package:todo/models/tasks_data.dart';
import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../theme.dart';
bool theme=false;
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();
class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        child: Icon(Icons.add),
        backgroundColor: Colors.lightBlue,
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) => AddTaskScreen());
        },
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(

          padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Builder(
                builder:(context)=>FloatingActionButton(
                  onPressed: () {
                    Provider.of<ThemeModel>(context,listen: false).toggleTheme();
                  },
                  backgroundColor: Provider.of<ThemeModel>(context).currentTheme==ThemeData.dark()?Colors.black:Colors.white,
                  child: Icon(
                    Icons.list,
                    color: Colors.blueAccent,
                    size: 30,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Todo',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '${Provider.of<TaskData>(context).taskCount} Tasks',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(

            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TasksList(),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Provider.of<ThemeModel>(context).currentTheme==ThemeData.dark()?Colors.black:Colors.white,
            ),
          ),
        )
      ]),
    );
  }
}
// CircleAvatar(
// radius: 30,
// backgroundColor: Colors.white,
// child: Icon(
// Icons.list,
// color: Colors.blueAccent,
// size: 30,
// ),
// )
