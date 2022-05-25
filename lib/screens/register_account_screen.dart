import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_capstone/components/components.dart';
import 'package:second_capstone/providers/users.dart';

class RegisterAccountScreen extends StatefulWidget {
  const RegisterAccountScreen({Key? key}) : super(key: key);

  @override
  State<RegisterAccountScreen> createState() => _RegisterAccountScreenState();
}

class _RegisterAccountScreenState extends State<RegisterAccountScreen> {
  final _userController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool _isShown = false;
  String _existingUserResult = '';
  String _user = '';
  String _email = '';
  String _pass = '';

  @override
  void initState() {
    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
      });
    });
    _userController.addListener(() {
      setState(() {
        _user = _userController.text;
      });
    });
    _passController.addListener(() {
      setState(() {
        _pass = _passController.text;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final users = Provider.of<UsersManager>(context, listen: false);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.white,
        border: AppBarBorder.noElevation,
        leading: backButton(),
      ),
      child: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: LoginRegisterTitle(title: 'Register Account'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      LoginRegisterTextField(
                        hint: 'User Name',
                        icon: CupertinoIcons.person,
                        isShown: true,
                        controller: _userController,
                      ),
                      const SizedBox(height: 24),
                      LoginRegisterTextField(
                        hint: 'Email Address',
                        icon: CupertinoIcons.mail,
                        isShown: true,
                        controller: _emailController,
                      ),
                      const SizedBox(height: 24),
                      LoginRegisterTextField(
                        hint: 'Password',
                        icon: CupertinoIcons.lock,
                        isShown: _isShown,
                        controller: _passController,
                        showPassword: () {
                          setState(() {
                            _isShown = !_isShown;
                          });
                        },
                      ),
                      const SizedBox(height: 40),
                      LoginRegisterButton(
                        isWelcomeScreen: false,
                        onPressed: () {
                          bool emailIsValid = EmailValidator.validate(_email);
                          if (emailIsValid) {
                            bool passIsValid = passValidator();
                            if (passIsValid) {
                              existingUserValidation(users);
                            }
                          } else {
                            invalidInputDialog(context, true);
                          }
                        },
                      ),
                      const SizedBox(height: 40),
                      OrContinueWith(
                        isWelcomeScreen: false,
                        createOrLogIn: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget backButton() {
    return Material(
      color: Colors.transparent,
      child: IconButton(
        icon: const Icon(
          CupertinoIcons.back,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  bool passValidator() {
    bool passIsValid = false;
    RegExp numReg = RegExp(r".*[0-9].*");
    RegExp capitalLetterReg = RegExp(r".*[A-Z].*");

    if (!capitalLetterReg.hasMatch(_pass) || !numReg.hasMatch(_pass)) {
      invalidInputDialog(context, false);
      return passIsValid = false;
    } else {
      return passIsValid = true;
    }
  }

  Future<dynamic> successDialog(BuildContext context) {
    return showCupertinoModalPopup(
      context: context,
      builder: (context) => const CupertinoAlertDialog(
        title: Text('You have successfully signed up!'),
      ),
    );
  }

  Future<dynamic> invalidInputDialog(BuildContext context, bool isEmail) {
    return showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(isEmail
            ? 'Please input a valid email'
            : 'Password must include an uppercase letter and a number'),
      ),
    );
  }

  Future<dynamic> existingUserValidation(UsersManager users) async {
    _existingUserResult =
    users.existingUserValidation(_user, _email);
    if (_existingUserResult == 'Username already exists.') {
      return existingUserDialog(context);
    } else if (_existingUserResult == 'Email Address is already in used.') {
      return existingUserDialog(context);
    } else if (_existingUserResult == 'Success') {
      users.addUser(
        userName: _user,
        emailAddress: _email,
        password: _pass,
      );
      successDialog(context);
    }
  }

  Future<dynamic> existingUserDialog(BuildContext context) {
    return showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(_existingUserResult),
      ),
    );
  }
}
