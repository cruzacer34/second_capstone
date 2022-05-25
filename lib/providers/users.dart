import 'package:flutter/foundation.dart';

class Users {
  final int id;
  final String emailAddress;
  final String userName;
  final String password;

  Users({
    required this.id,
    required this.emailAddress,
    required this.userName,
    required this.password,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['id'] ?? 0,
      emailAddress: json['emailAddress'] ?? '',
      userName: json['userName'] ?? '',
      password: json['password'] ?? '',
    );
  }
}

class UsersManager extends ChangeNotifier {
  final List<Map<String, dynamic>> _users = [
    {
      'id': 1,
      'emailAddress': 'IanLancelot@account.com',
      'userName': 'member1',
      'password': 'Password1',
    },
    {
      'id': 2,
      'emailAddress': 'FrancesPearson@account.com',
      'userName': 'member2',
      'password': 'password2',
    }
  ];

  List<Users> get users => List.unmodifiable(_users);

  String verifyUser(String emailAddress, String password) {
    String result = '';
    var user = _users.where((users) => users['emailAddress'] == emailAddress);
    if (user.isNotEmpty) {
      for (var element in user) {
        if (element['password'] == password) {
          result = 'Success';
        } else {
          result = 'Wrong Pass';
        }
      }
    } else {
      result = 'No User Found';
    }
    return result;
  }

  void addUser({
    required String userName,
    required String emailAddress,
    required String password,
  }) {
    int newId = _users.last['id'] + 1;
    _users.add({
      'id': newId,
      'userName': userName,
      'emailAddress': emailAddress,
      'password': password,
    });
  }

  String existingUserValidation(String userName, String emailAddress) {
    String existingUser = '';
    var userNameCheck = _users.where((users) => users['userName'] == userName);
    var emailAddressCheck = _users.where((users) => users['emailAddress'] == emailAddress);
    if(userNameCheck.isNotEmpty) {
      existingUser = 'Username already exists.';
    } else {
      if (emailAddressCheck.isNotEmpty) {
        existingUser = 'Email Address is already in used.';
      } else {
        existingUser = 'Success';
      }
    }
    return existingUser;
  }
}