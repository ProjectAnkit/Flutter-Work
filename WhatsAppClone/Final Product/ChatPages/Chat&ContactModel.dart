// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

class ChatModel {
     String Name;
     String Message;
     String timing;
     bool isGroup;
  ChatModel({
    required this.Name,
    required this.Message,
    required this.timing,
    required this.isGroup,
  });
}

class ContactModel {
  String Name;
  String Status;
  AssetImage iimage;
  bool select = false;
  ContactModel({
    required this.Name,
    required this.Status,
    required this.iimage,
    this.select = false,
  });
}
