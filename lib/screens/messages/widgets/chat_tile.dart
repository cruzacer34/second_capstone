import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_capstone/components/poppins_text.dart';
import 'package:second_capstone/components/utils.dart';
import '../../../models/chat.dart';
import '../../../providers/users_provider.dart';

class ChatTile extends StatelessWidget {
  final Chat chat;

  const ChatTile({
    Key? key,
    required this.chat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usersProv = Provider.of<UsersProvider>(context);
    return Align(
      alignment: (chat.sentBy == usersProv.selectedUser().fullName)
          ? Alignment.bottomRight
          : Alignment.bottomLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        padding: const EdgeInsets.all(20),
        decoration: (chat.sentBy == usersProv.selectedUser().fullName)
            ? CustomBorder.senderChatBox
            : CustomBorder.whiteBoxRadius12,
        child: Column(
          children: [
            PoppinsText(
              text: chat.message,
              size: 15,
              weight: FontWeight.w400,
              maxLines: 4,
            ),
            const SizedBox(height: 5),
            PoppinsText(
              text: chat.time,
              size: 13,
              weight: FontWeight.w400,
            ),
          ],
        ),
      ),
    );
  }
}
