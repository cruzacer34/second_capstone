import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_capstone/components/components.dart';
import 'package:second_capstone/components/custom_cupertino_buttons.dart';
import 'package:second_capstone/components/profile_pic.dart';
import 'package:second_capstone/models/models.dart';
import 'package:second_capstone/providers/providers.dart';
import '../components/app_bar/app_bar_middle_text.dart';
import '../components/app_bar/custom_cupertino_nav_bar.dart';

class EditProfileScreen extends StatefulWidget {
  final Users user;

  const EditProfileScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  String _name = '';
  String _email = '';
  String _pass = '';

  @override
  void initState() {
    _nameController.text = widget.user.fullName;
    _emailController.text = widget.user.emailAddress;
    _passController.text = widget.user.password;
    _name = widget.user.fullName;
    _email = widget.user.emailAddress;
    _pass = widget.user.password;
    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
      });
    });
    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
      });
    });
    _passController.addListener(() {
      setState(() {
        _pass = _passController.text;
      });
    });
    super.initState();
  }

  void saveNow(UsersProvider usersProv) {
    if (widget.user.fullName == _name &&
        widget.user.emailAddress == _email &&
        widget.user.password == _pass) {
      usersProv.alertDialog(context, 'No changes saved');
    } else {
      bool isEmailValid = usersProv.emailValidator(context, _email);
      if (isEmailValid) {
        bool isPassValid = usersProv.passValidator(context, _pass);
        if (isPassValid) {
          bool isEditable = usersProv.editProfileValidator(
            context,
            widget.user.emailAddress,
            _email,
          );
          if (isEditable) {
            usersProv.editProfile(widget.user.id, _name, _email, _pass);
            usersProv.alertDialog(context, 'Changes saved');
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final usersProv = Provider.of<UsersProvider>(context);
    Map<String, TextEditingController> fields = {
      'Name': _nameController,
      'Your Email': _emailController,
      'Password': _passController,
    };
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: CupertinoPageScaffold(
        resizeToAvoidBottomInset: false,
        navigationBar: const CustomCupertinoNavBar(
          middle: AppBarMiddleText(text: 'Profile'),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        const ProfilePic(width: 100),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 14,
                            child: CircleAvatar(
                              backgroundColor:
                                  CupertinoTheme.of(context).primaryColor,
                              radius: 12,
                              child: const Icon(
                                CupertinoIcons.pencil,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    PoppinsText(
                      text: widget.user.fullName,
                      size: 30,
                      weight: FontWeight.w500,
                    ),
                    const PoppinsText(
                      text: 'Edit Profile',
                      size: 14,
                      weight: FontWeight.w400,
                      color: CustomColor.grey,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PoppinsText(
                          text: fields.keys.toList()[index],
                          size: 16,
                          weight: FontWeight.w400,
                          color: CustomColor.grey,
                        ),
                        const SizedBox(height: 10),
                        CustomCupertinoTextField(
                          controller: fields.values.toList()[index],
                          isShown: (fields.keys.toList()[index] == 'Password')
                              ? false
                              : true,
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                  itemCount: fields.length,
                ),
                const SizedBox(height: 50),
                CustomCupertinoButtons(
                  width: MediaQuery.of(context).size.width,
                  child: const PoppinsText(
                    text: 'Save Now',
                    size: 16,
                    weight: FontWeight.w600,
                  ),
                  onPressed: () => saveNow(usersProv),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
