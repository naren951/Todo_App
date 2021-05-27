import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:todo/models/task.dart';
import 'dart:collection';
import 'package:shared_preferences/shared_preferences.dart';
int id=0;
List<Task> _taskList=[];
class TaskData extends ChangeNotifier{
  List<String>? task = [];
  List<String>? boxValue = [];
  List<String>? dates=[];
  List<String>? uid=[];
  Future getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //prefs.clear();
    task!.clear();
    boxValue!.clear();
    _taskList.clear();
    task = prefs.getStringList("task");
    boxValue = prefs.getStringList("check");
    dates=prefs.getStringList("date");
    uid=prefs.getStringList("id");
    if(task==null) {
      task=["Long Press to clear tasks"];
      boxValue=["false"];
      dates=["2021-05-24 02:18:04Z"];
      uid=[id.toString()];
    }
    for(int i=0;i<boxValue!.length;i++){
      _taskList.add(Task(name: task![i],isDone: boxValue![i]=='true',date: DateTime.parse(dates![i]),id:int.parse(uid![i])));
    }
    id=int.parse(uid!.last);
    id+=2;
    notifyListeners();
  }

  void setData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    task!.clear();
    boxValue!.clear();
    dates!.clear();
    uid!.clear();
    for(int i=0;i<_taskList.length;i++){
      task!.add(_taskList[i].name!);
      boxValue!.add(_taskList[i].isDone.toString());
      dates!.add(_taskList[i].date.toString());
      uid!.add(_taskList[i].id.toString());
    }
    await prefs.setStringList("task", task!);
    await prefs.setStringList("check", boxValue!);
    await prefs.setStringList("date", dates!);
    await prefs.setStringList("id", uid!);
    notifyListeners();
  }

  UnmodifiableListView<Task> get tasks{
    return UnmodifiableListView(_taskList);
  }

  void addTask(String t,DateTime d,int uid){
    _taskList.add(Task(name: t,date: d,id: uid));
    setData();
    notifyListeners();
  }
  int get taskCount{
    return _taskList.length;
  }

  void updateTask(Task task){
      task.toggleDone();
      setData();
      notifyListeners();
  }

  void deleteTask(Task t){
      _taskList.remove(t);
      setData();
      notifyListeners();
  }
  }
