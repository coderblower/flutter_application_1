// filepath: /d:/development/hss/flutter_application_1/lib/models/user.dart

class User {
  final String email;
  final String password;
  final String fullName;
  final String phone;

  User({
    required this.email,
    required this.password,
    required this.fullName,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'fullName': fullName,
      'phone': phone,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      password: json['password'],
      fullName: json['fullName'],
      phone: json['phone'],
    );
  }
}