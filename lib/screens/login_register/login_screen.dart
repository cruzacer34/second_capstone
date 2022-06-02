import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_capstone/components/components.dart';
import 'package:second_capstone/components/custom_cupertino_buttons.dart';
import 'package:second_capstone/models/freeze.dart';
import 'package:second_capstone/providers/users_provider.dart';
import 'package:second_capstone/screens/login_register/widgets/login_register_title.dart';
import 'package:second_capstone/screens/login_register/widgets/or_continue_with.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  String _email = '';
  String _pass = '';
  bool _isShown = false;

  var loginResult = const LoginResult.loading();

  @override
  void initState() {
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

  void showPass() {
    setState(() {
      _isShown = !_isShown;
    });
  }

  void login(UsersProvider usersProv) {
    bool isEmailValid = usersProv.emailValidator(context, _email);
    if (isEmailValid) {
      bool isUsersFound = usersProv.findUser(context, _email, _pass);
      if (isUsersFound) {
        loginResult = LoginResult.success(_email);
      } else {
        loginResult = const LoginResult.failure('Either user not found or wrong pass');
      }
    } else {
      loginResult = const LoginResult.failure('Email is not valid');
    }

    loginResult.when(
      loading: () {
        showCupertinoDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) => const CupertinoAlertDialog(
            title: Text('Wait we are loading the data'),
          ),
        );
      },
      success: (value) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          '/home',
          arguments: usersProv.selectedUser(),
              (route) => false,
        );
        showCupertinoDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) => CupertinoAlertDialog(
            title: Text('Welcome ${usersProv.selectedUser().fullName}'),
          ),
        );
      },
      failure: (value) {
        return showCupertinoDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) => CupertinoAlertDialog(
            title: Text(value),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final usersProv = Provider.of<UsersProvider>(context, listen: false);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: CupertinoPageScaffold(
        resizeToAvoidBottomInset: false,
        child: Padding(
          padding: CustomPadding.loginRegisterPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const LoginRegisterTitle(title: 'Welcome Back!'),
              CustomCupertinoTextField(
                hint: 'Email Address',
                prefixIcon: CupertinoIcons.mail,
                controller: _emailController,
              ),
              Column(
                children: [
                  CustomCupertinoTextField(
                    hint: 'Password',
                    prefixIcon: CupertinoIcons.lock,
                    isShown: _isShown,
                    controller: _passController,
                    onSuffixPressed: () => showPass(),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      style: CustomPadding.noPaddingTextButton,
                      child: const PoppinsText(
                        text: 'Forgot Password?',
                        size: 12,
                        weight: FontWeight.w400,
                        color: CustomColor.grey,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              CustomCupertinoButtons(
                width: MediaQuery.of(context).size.width,
                child: const PoppinsText(
                  text: 'LOG IN',
                  size: 16,
                  weight: FontWeight.w500,
                ),
                onPressed: () => login(usersProv),
              ),
              OrContinueWith(
                isWelcomeScreen: true,
                createOrLogIn: () =>
                    Navigator.of(context).pushNamed('/registerAccountScreen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
