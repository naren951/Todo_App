import 'dart:core';

class Task{
  final String? name;
  bool isDone;
  DateTime? date;
  int? id;

  Task({this.name,this.isDone=false,this.date,required this.id});

   void toggleDone(){
     isDone=!isDone;
  }
}