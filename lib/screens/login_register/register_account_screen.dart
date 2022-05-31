import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:second_capstone/components/components.dart';
import 'package:second_capstone/components/custom_cupertino_buttons.dart';
import 'package:second_capstone/providers/users_provider.dart';
import 'package:second_capstone/screens/login_register/widgets/login_register_title.dart';
import 'package:second_capstone/screens/login_register/widgets/or_continue_with.dart';

import '../../components/app_bar/custom_cupertino_nav_bar.dart';

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

  void showPass() {
    setState(() {
      _isShown = !_isShown;
    });
  }

  void signUp(UsersProvider usersProv) {
    bool emailIsValid = usersProv.emailValidator(context, _email);
    if (emailIsValid) {
      bool isPassValid = usersProv.passValidator(context, _pass);
      if (isPassValid) {
        bool isExistingUserFound = usersProv.findExistingUser(
          context,
          _user,
          _email,
        );
        if (!isExistingUserFound) {
          usersProv.addUser(_user, _email, _pass);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final usersProv = Provider.of<UsersProvider>(context, listen: false);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: CupertinoPageScaffold(
        resizeToAvoidBottomInset: false,
        navigationBar: const CustomCupertinoNavBar(),
        child: Padding(
          padding: CustomPadding.loginRegisterPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const LoginRegisterTitle(title: 'Register Account'),
              CustomCupertinoTextField(
                hint: 'User Name',
                prefixIcon: CupertinoIcons.person,
                controller: _userController,
              ),
              CustomCupertinoTextField(
                hint: 'Email Address',
                prefixIcon: CupertinoIcons.mail,
                controller: _emailController,
              ),
              CustomCupertinoTextField(
                hint: 'Password',
                prefixIcon: CupertinoIcons.lock,
                isShown: _isShown,
                controller: _passController,
                onSuffixPressed: () => showPass(),
              ),
              CustomCupertinoButtons(
                width: MediaQuery.of(context).size.width,
                child: const PoppinsText(
                  text: 'SIGN UP',
                  size: 16,
                  weight: FontWeight.w500,
                ),
                onPressed: () => signUp(usersProv),
              ),
              OrContinueWith(
                isWelcomeScreen: false,
                createOrLogIn: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
