import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:second_capstone/components/app_bar/app_bar_middle_text.dart';
import 'package:second_capstone/components/app_bar/custom_cupertino_nav_bar.dart';
import 'package:second_capstone/providers/chat_provider.dart';
import 'package:second_capstone/providers/providers.dart';
import 'package:second_capstone/route_generator.dart';
import '../../components/custom_icon_button.dart';
import '../../components/poppins_text.dart';
import '../../models/chat.dart';
import '../../models/users.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    final usersProv = Provider.of<UsersProvider>(context);
    var selectedUser = usersProv.selectedUser();
    return Consumer<ChatProvider>(
      builder: (context, chat, child) {
        List<String> names = [];
        List<List<Chat>> chatLogs = [];
        var roomsWithSelectedUser = chat.chatRoom.entries.where((element) =>
            element.key.members.contains(selectedUser.fullName) &&
            element.key.copyOf == selectedUser.fullName);
        for (var value in roomsWithSelectedUser) {
          chatLogs.add(value.value);
          for (var value in value.key.members) {
            if (value != selectedUser.fullName) {
              names.add(value);
            }
          }
        }
        List<Users> users = List.generate(
          names.length,
          (index) => usersProv.users.firstWhere(
            (element) => element.fullName == names[index],
          ),
        );
        return CupertinoPageScaffold(
          navigationBar: CustomCupertinoNavBar(
            middle: const AppBarMiddleText(text: 'Message'),
            trailing: CustomIconButton(
              icon: CupertinoIcons.search,
              onPressed: () {},
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ListView.separated(
                itemBuilder: (context, index) => Slidable(
                  key: Key(
                    chat.chatRoom.entries
                        .firstWhere((element) =>
                            element.key.members
                                .contains(selectedUser.fullName) &&
                            element.key.members.contains(users[index].fullName))
                        .toString(),
                  ),
                  direction: Axis.horizontal,
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        backgroundColor: CupertinoColors.destructiveRed,
                        onPressed: (direction) => chat.deleteChat(
                          selectedUser,
                          users[index].fullName,
                        ),
                        borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(12),
                        ),
                        icon: CupertinoIcons.delete,
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        chat.toggleRead(index, chatLogs, users[index].fullName);
                      });
                      Navigator.of(context, rootNavigator: true).pushNamed(
                        '/chatScreen',
                        arguments: ChatScreenArguments(
                          chatLogs[index],
                          users[index],
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        ClipOval(
                          child: Image.asset(
                            users[index].profilePicUrl,
                            width: 50,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PoppinsText(
                                text: users[index].fullName,
                                size: 16,
                                weight: FontWeight.w500,
                              ),
                              PoppinsText(
                                text: chatLogs[index].last.message,
                                size: 14,
                                weight: FontWeight.w400,
                              ),
                            ],
                          ),
                        ),
                        if (chat.numberOfUnread(
                                index, chatLogs, users[index].fullName) !=
                            0)
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: CircleAvatar(
                              backgroundColor:
                                  CupertinoTheme.of(context).primaryColor,
                              radius: 14,
                              child: PoppinsText(
                                text: '${chat.numberOfUnread(
                                  index,
                                  chatLogs,
                                  users[index].fullName,
                                )}',
                                size: 12,
                                weight: FontWeight.w500,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 30),
                itemCount: users.length,
              ),
            ),
          ),
        );
      },
    );
  }
}
