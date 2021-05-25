import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TaskTile extends StatelessWidget{
  final bool? isChecked;
  final String? taskTitle;
  final Function? checkboxCallback;
  final Function longPressCallback;
  final Function notificationCallback;
  final String? timeLeft;
  TaskTile({this.isChecked=false, this.taskTitle,this.checkboxCallback,required this.longPressCallback,this.timeLeft,required this.notificationCallback()});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: (){
        longPressCallback();
      },
      title: Text(
            taskTitle!,
            style: TextStyle(
              fontSize: 20,
              color: (timeLeft!)=='Time Expired'?Colors.red:isChecked! ? Colors.green: null,
            ),
          ),
      subtitle:Text(isChecked!?'Completed':(timeLeft!),style: TextStyle(
        color: (timeLeft!)=='Time Expired'?Colors.red:isChecked! ? Colors.green: null,),),
      trailing:
          Checkbox(
            activeColor: Colors.lightBlueAccent,
            value: isChecked,
            onChanged: (value){
              if(value==true){
                notificationCallback();
              }
              checkboxCallback!(value);},
          ),
    );
  }
}
