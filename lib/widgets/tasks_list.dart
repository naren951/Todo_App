import 'package:flutter/material.dart';
import 'package:todo/screens/tasksScreen.dart';
import 'package:todo/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/tasks_data.dart';
import 'dart:core';

class TasksList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
       return ListView.builder(itemBuilder: (context, index) {
          return TaskTile(taskTitle: taskData.tasks[index].name, isChecked: taskData.tasks[index].isDone,
            timeLeft: taskData.tasks[index].date!.difference(DateTime.now()).inMinutes>0?('${taskData.tasks[index].date!.difference(DateTime.now()).inHours.toString()} Hours left'):'Time Expired',
            checkboxCallback: (checkBoxState) {
            taskData.updateTask(taskData.tasks[index]);
            },
          longPressCallback: (){
            if((taskData.tasks[index].id!)!=0 || (taskData.tasks[index].id!)!=1) {
              flutterLocalNotificationsPlugin.cancel(taskData.tasks[index].id!);
              flutterLocalNotificationsPlugin.cancel(
                  taskData.tasks[index].id! + 1);
            }
            taskData.deleteTask(taskData.tasks[index]);

          },
          notificationCallback: (){
            flutterLocalNotificationsPlugin.cancel(taskData.tasks[index].id!);
            flutterLocalNotificationsPlugin.cancel(taskData.tasks[index].id!+1);
          },);
        },
          itemCount: taskData.taskCount,
       );
      },
    );
  }
}
