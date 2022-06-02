class Users {
  final int id;
  String emailAddress;
  String userName;
  String password;
  String profilePicUrl;
  String portraitPicUrl;
  String fullName;
  List<bool> notifications;

  Users({
    required this.id,
    required this.emailAddress,
    required this.userName,
    required this.password,
    this.profilePicUrl = 'assets/profile_pics/empty.png',
    this.portraitPicUrl = 'assets/profile_pics/empty.png',
    this.fullName = 'No Name',
  })  : notifications = List.generate(6, (index) => false);
}
