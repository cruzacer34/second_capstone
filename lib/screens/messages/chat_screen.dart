import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_capstone/components/app_bar/custom_cupertino_nav_bar.dart';
import 'package:second_capstone/components/components.dart';
import 'package:second_capstone/components/custom_icon_button.dart';
import '../../models/chat.dart';
import '../../models/users.dart';
import '../../providers/chat_provider.dart';
import '../../providers/users_provider.dart';
import 'widgets/chat_tile.dart';

class ChatScreen extends StatefulWidget {
  final List<Chat> chatLogs;
  final Users friend;

  const ChatScreen({
    Key? key,
    required this.chatLogs,
    required this.friend,
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _chatController = TextEditingController();
  final _listScrollController = ScrollController();
  String _chat = '';

  @override
  void initState() {
    _chatController.addListener(() {
      _chat = _chatController.text;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_listScrollController.hasClients) {
        _listScrollController.animateTo(
          _listScrollController.position.maxScrollExtent,
          duration: const Duration(seconds: 1),
          curve: Curves.easeOut,
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final usersProv = Provider.of<UsersProvider>(context);
    var selectedUser = usersProv.selectedUser();
    return Consumer<ChatProvider>(
      builder: (context, chat, child) {
        return CupertinoPageScaffold(
          navigationBar: CustomCupertinoNavBar(
            trailing: CustomIconButton(
              icon: CupertinoIcons.phone_fill,
              onPressed: () => Navigator.of(context).pushNamed(
                '/callScreen',
                arguments: widget.friend,
              ),
            ),
            middle: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.asset(
                    widget.friend.profilePicUrl,
                    width: 40,
                  ),
                ),
                const SizedBox(width: 15),
                PoppinsText(
                  text: widget.friend.fullName,
                  size: 17,
                  weight: FontWeight.w500,
                ),
              ],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      controller: _listScrollController,
                      padding: const EdgeInsets.only(bottom: 20),
                      shrinkWrap: true,
                      itemBuilder: (context, index) =>
                          ChatTile(chat: widget.chatLogs[index]),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 20),
                      itemCount: widget.chatLogs.length,
                    ),
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor:
                            CupertinoTheme.of(context).primaryColor,
                        child: CustomIconButton(
                          icon: Icons.add,
                          onPressed: () {},
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CustomCupertinoTextField(
                          controller: _chatController,
                          hint: 'Type a message',
                          suffixIcon: CustomIconButton(
                            right: 10,
                            icon: Icons.send,
                            onPressed: () {
                              setState(() {
                                chat.newChat(
                                  selectedUser,
                                  widget.friend.fullName,
                                  _chat,
                                );
                                Timer(
                                  const Duration(milliseconds: 500),
                                  () => _listScrollController.animateTo(
                                    _listScrollController
                                        .position.maxScrollExtent,
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.easeOut,
                                  ),
                                );
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
