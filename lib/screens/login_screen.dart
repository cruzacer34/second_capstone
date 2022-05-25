import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_capstone/components/components.dart';
import 'package:second_capstone/providers/users.dart';
import 'package:email_validator/email_validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool _isShown = false;
  String _loginResult = '';
  String _email = '';
  String _pass = '';

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

  @override
  Widget build(BuildContext context) {
    final users = Provider.of<UsersManager>(context, listen: false);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: CupertinoPageScaffold(
        child: SafeArea(
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
                      child: LoginRegisterTitle(title: 'Welcome Back!'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
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
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerRight,
                            child: forgotPassword(),
                          ),
                          const SizedBox(height: 40),
                          LoginRegisterButton(
                            isWelcomeScreen: true,
                            onPressed: () {
                              bool isValid = EmailValidator.validate(_email);
                              if (isValid) {
                                loginValidation(users);
                              } else {
                                invalidInputDialog(context, true);
                              }
                            },
                          ),
                          const SizedBox(height: 40),
                          OrContinueWith(
                            isWelcomeScreen: true,
                            createOrLogIn: () {
                              Navigator.of(context)
                                  .pushNamed('/registerAccountScreen');
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget forgotPassword() {
    return TextButton(
      style: NoButtonPadding.textButton,
      child: const TextWeight400(
        text: 'Forgot Password?',
        size: 12,
        color: CustomColor.grey,
      ),
      onPressed: () {},
    );
  }

  Future<dynamic> loginValidation(UsersManager users) async {
    _loginResult = users.verifyUser(_email, _pass);
    if (_loginResult == 'Wrong Pass') {
      return invalidInputDialog(context, false);
    } else if (_loginResult == 'No User Found') {
      return invalidInputDialog(context, false);
    } else if (_loginResult == 'Success') {
      Navigator.of(context).pushNamed('/homeScreen');
    }
  }

  Future<dynamic> invalidInputDialog(BuildContext context, bool isEmail) {
    return showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(isEmail ? 'Please input a valid email' : _loginResult),
      ),
    );
  }
}
