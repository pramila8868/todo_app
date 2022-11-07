// ignore_for_file: prefer_collection_literals

class User {
  late String userId;
  late String userName;
  late String emailAddress;
  late String password;
  late String gender;

  User(
      {required this.userId,
      required this.userName,
      required this.emailAddress,
      required this.password,
      required this.gender});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
    emailAddress = json['email_address'];
    password = json['password'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['user_id'] = userId;
    data['user_name'] = userName;
    data['email_address'] = emailAddress;
    data['password'] = password;
    data['gender'] = gender;
    return data;
  }
}
