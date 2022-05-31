import 'package:flutter/cupertino.dart';
import 'package:second_capstone/models/models.dart';

class UsersProvider extends ChangeNotifier {
  final List<Users> _users = [
    Users(
      id: 1,
      emailAddress: 'jprice@hotmail.com',
      userName: 'price141',
      password: 'asd',
      profilePicUrl: 'assets/profile_pics/price.jpg',
      fullName: 'John Price',
    ),
    Users(
      id: 2,
      emailAddress: 'soap@gmail.com',
      userName: 'soap141',
      password: 'asd',
      profilePicUrl: 'assets/profile_pics/soap.jpg',
      fullName: 'John Soap MacTavish',
    ),
  ];
  final List<String> _selectedUserCredential = [];

  List<Users> get users => List.unmodifiable(_users);

  bool findUser(BuildContext context, String emailAddress, String password) {
    bool isUserFound = false;
    var user = _users.where((user) => user.emailAddress == emailAddress);
    if (user.isNotEmpty) {
      for (var element in user) {
        if (element.password == password) {
          _selectedUserCredential.add(emailAddress);
          _selectedUserCredential.add(password);
          isUserFound = true;
        } else {
          alertDialog(context, 'Wrong Pass');
        }
      }
    } else {
      alertDialog(context, 'No User Found');
    }
    return isUserFound;
  }

  dynamic selectedUser() {
    Users foundUser;
    var user =
        _users.where((user) => user.emailAddress == _selectedUserCredential[0]);
    if (user.isNotEmpty) {
      for (var element in user) {
        if (element.password == _selectedUserCredential[1]) {
          return foundUser = element;
        }
      }
    }
    return null;
  }

  void addUser(String userName, String emailAddress, String password) {
    _users.add(
      Users(
        id: _users.last.id + 1,
        emailAddress: emailAddress,
        userName: userName,
        password: password,
      ),
    );
  }

  bool findExistingUser(context, String userName, String emailAddress) {
    bool isExistingUserFound = true;
    var userNameCheck = _users.where((users) => users.userName == userName);
    var emailAddressCheck =
        _users.where((users) => users.emailAddress == emailAddress);

    if (userNameCheck.isNotEmpty) {
      alertDialog(context, 'Username already exists.');
    } else if (userName == '') {
      alertDialog(context, 'Please input a Username.');
    } else {
      if (emailAddressCheck.isNotEmpty) {
        alertDialog(context, 'Email Address is already in used.');
      } else {
        alertDialog(context, 'You have successfully signed up!');
        isExistingUserFound = false;
      }
    }
    return isExistingUserFound;
  }

  bool passValidator(BuildContext context, String password) {
    bool isPassValid = false;
    RegExp numReg = RegExp(r".*[0-9].*");
    RegExp capitalLetterReg = RegExp(r".*[A-Z].*");

    if (!capitalLetterReg.hasMatch(password) || !numReg.hasMatch(password)) {
      alertDialog(
        context,
        'Password must include an uppercase letter and a number',
      );
    } else {
      isPassValid = true;
    }
    return isPassValid;
  }

  bool emailValidator(context, String email) {
    bool isEmailValid = false;
    List<String> split = email.split('');
    if (split.contains('@') &&
        email.substring(email.length - 4) == '.com' &&
        email.substring(email.length - 5) != '@' && split.first != '@') {
      isEmailValid = true;
    } else {
      alertDialog(context, 'Please input a valid email');
    }
    return isEmailValid;
  }

  bool editProfileValidator(context, String oldEmail, String newEmail) {
    bool isEditable = false;
    for (var value in users) {
      if (value.emailAddress.contains(newEmail) &&
          value.emailAddress == newEmail &&
          newEmail != oldEmail) {
        alertDialog(context, 'Email Address is already in used.');
        return isEditable;
      } else {
        isEditable = true;
      }
    }
    return isEditable;
  }

  void editProfile(int id, String fullName, String email, String pass) {
    _users.where((x) => x.id == id).first.fullName = fullName;
    _users.where((x) => x.id == id).first.emailAddress = email;
    _users.where((x) => x.id == id).first.password = pass;
    notifyListeners();
  }

  Future<dynamic> alertDialog(context, String text) {
    return showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(text),
      ),
    );
  }

  void logout() {
    _selectedUserCredential.clear();
  }
}
