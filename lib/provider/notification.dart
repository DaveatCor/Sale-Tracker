import 'package:flutter/material.dart';

class NotificationPro with ChangeNotifier {

  List<Message> notication = [];
}

class Message {
  
  String? img;
  DateTime? dateTime;
  String? item;
  String? status;
  Color? color;

  Message(this.img, this.dateTime, this.item, this.status, this.color);
}