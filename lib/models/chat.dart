import 'package:second_capstone/models/users.dart';

class Chat {
  final String sentBy;
  final String message;
  final String time;
  bool isRead;

  Chat({
    required this.sentBy,
    required this.message,
    required this.time,
    this.isRead = true,
  });
}