import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:second_capstone/models/chat.dart';
import 'package:second_capstone/models/chat_room.dart';
import '../models/users.dart';

class ChatProvider extends ChangeNotifier {
  final Map<ChatRoom, List<Chat>> _chatRoom = {
    ChatRoom(
      members: [
        'John Price',
        'John Soap MacTavish',
      ],
      copyOf: 'John Soap MacTavish',
    ): [
      Chat(
        sentBy: 'John Price',
        message: 'Soap',
        time: '4:33 pm',
      ),
      Chat(
        sentBy: 'John Soap MacTavish',
        message: 'What do you want',
        time: '4:35 pm',
      ),
      Chat(
        sentBy: 'John Price',
        message: 'We got a new task, meeting at 6',
        time: '4:36 pm',
      ),
      Chat(
        sentBy: 'John Soap MacTavish',
        message: 'Where',
        time: '4:37 pm',
      ),
      Chat(
        sentBy: 'John Price',
        message: 'I\'ll send the location 5 minutes before',
        time: '4:38 pm',
        isRead: false,
      )
    ],
    ChatRoom(
      members: [
        'John Price',
        'John Soap MacTavish',
      ],
      copyOf: 'John Price',
    ): [
      Chat(
        sentBy: 'John Price',
        message: 'Soap',
        time: '4:33 pm',
      ),
      Chat(
        sentBy: 'John Soap MacTavish',
        message: 'What do you want',
        time: '4:35 pm',
      ),
      Chat(
        sentBy: 'John Price',
        message: 'We got a new task, meeting at 6',
        time: '4:36 pm',
      ),
      Chat(
        sentBy: 'John Soap MacTavish',
        message: 'Where',
        time: '4:37 pm',
      ),
      Chat(
        sentBy: 'John Price',
        message: 'I\'ll send the location 5 minutes before',
        time: '4:38 pm',
        isRead: false,
      )
    ],
    ChatRoom(
      members: [
        'Alejandro Rojas',
        'John Soap MacTavish',
      ],
      copyOf: 'John Soap MacTavish',
    ): [
      Chat(
        sentBy: 'John Soap MacTavish',
        message: 'You got the notice?',
        time: '4:40 pm',
      ),
      Chat(
        sentBy: 'Alejandro Rojas',
        message: 'Yeah',
        time: '4:42 pm',
        isRead: false,
      ),
      Chat(
        sentBy: 'Alejandro Rojas',
        message: 'You going to be late?',
        time: '4:43 pm',
        isRead: false,
      ),
    ],
    ChatRoom(
      members: [
        'Alejandro Rojas',
        'John Soap MacTavish',
      ],
      copyOf: 'Alejandro Rojas',
    ): [
      Chat(
        sentBy: 'John Soap MacTavish',
        message: 'You got the notice?',
        time: '4:40 pm',
      ),
      Chat(
        sentBy: 'Alejandro Rojas',
        message: 'Yeah',
        time: '4:42 pm',
        isRead: false,
      ),
      Chat(
        sentBy: 'Alejandro Rojas',
        message: 'You going to be late?',
        time: '4:43 pm',
        isRead: false,
      ),
    ],
    ChatRoom(
      members: [
        'Simon Riley',
        'Alejandro Rojas',
      ],
      copyOf: 'Alejandro Rojas',
    ): [
      Chat(
        sentBy: 'Alejandro Rojas',
        message: 'Are you there, Ghost?',
        time: '4:44 pm',
        isRead: false,
      ),
    ],
    ChatRoom(
      members: [
        'Simon Riley',
        'Alejandro Rojas',
      ],
      copyOf: 'Simon Riley',
    ): [
      Chat(
        sentBy: 'Alejandro Rojas',
        message: 'Are you there, Ghost?',
        time: '4:44 pm',
        isRead: false,
      ),
    ],
    ChatRoom(
      members: [
        'Kyle Garrick',
        'John Soap MacTavish',
      ],
      copyOf: 'John Soap MacTavish',
    ): [
      Chat(
        sentBy: 'John Soap MacTavish',
        message: 'Gaz, bring the car',
        time: '4:45 pm',
        isRead: false,
      ),
    ],
    ChatRoom(
      members: [
        'Kyle Garrick',
        'John Soap MacTavish',
      ],
      copyOf: 'Kyle Garrick',
    ): [
      Chat(
        sentBy: 'John Soap MacTavish',
        message: 'Gaz, bring the car',
        time: '4:45 pm',
        isRead: false,
      ),
    ],
    ChatRoom(
      members: [
        'Simon Riley',
        'John Soap MacTavish',
      ],
      copyOf: 'John Soap MacTavish',
    ): [
      Chat(
        sentBy: 'John Soap MacTavish',
        message: 'Will you not be joing us again?',
        time: '4:50 pm',
        isRead: true,
      ),
      Chat(
        sentBy: 'Simon Riley',
        message: 'I won\'t be on the same team as you guys',
        time: '4:51 pm',
        isRead: false,
      ),
    ],
    ChatRoom(
      members: [
        'Simon Riley',
        'John Soap MacTavish',
      ],
      copyOf: 'Simon Riley',
    ): [
      Chat(
        sentBy: 'John Soap MacTavish',
        message: 'Will you not be joing us again?',
        time: '4:50 pm',
        isRead: true,
      ),
      Chat(
        sentBy: 'Simon Riley',
        message: 'I won\'t be on the same team as you guys',
        time: '4:51 pm',
        isRead: false,
      ),
    ],
  };

  Map<ChatRoom, List<Chat>> get chatRoom => Map.unmodifiable(_chatRoom);

  int numberOfUnread(
      int index, List<List<Chat>> chatLogs, String receiverName) {
    int unread = 0;
    for (var value in chatLogs[index]) {
      if (value.isRead == false && value.sentBy == receiverName) {
        unread += 1;
      }
    }
    return unread;
  }

  void toggleRead(int index, List<List<Chat>> chatLogs, String receiverName) {
    for (var value in chatLogs[index]) {
      if (value.isRead == false && value.sentBy == receiverName) {
        value.isRead = true;
      }
    }
  }

  void newChat(Users selectedUser, String receiverName, String message) {
    var exactRoom = chatRoom.entries.firstWhere(
      (element) =>
          element.key.members.contains(selectedUser.fullName) &&
          element.key.members.contains(receiverName),
    );
    exactRoom.value.add(
      Chat(
        sentBy: selectedUser.fullName,
        message: message,
        time: DateFormat().add_jm().format(DateTime.now()),
        isRead: false,
      ),
    );
    notifyListeners();
  }

  void deleteChat(Users selectedUser, String receiverName) {
    _chatRoom.removeWhere((key, value) =>
        key.members.contains(selectedUser.fullName) && key.members.contains(receiverName) && key.copyOf == selectedUser.fullName);
    notifyListeners();
  }
}
