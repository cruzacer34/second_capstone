import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:second_capstone/providers/users_provider.dart';

class ProfilePic extends StatelessWidget {
  final double width;

  const ProfilePic({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UsersProvider>(context).selectedUser();
    return ClipOval(
      child: Image.asset(
        user.profilePicUrl,
        width: width,
      ),
    );
  }
}
