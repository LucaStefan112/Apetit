class UserData {
  final String? email;
  final String? password;
  final String fullName;
  final String dateOfBirth;
  final String? gender;

  UserData({
    this.email,
    this.password,
    required this.fullName,
    required this.dateOfBirth,
    this.gender
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      fullName: json['fullName'],
      dateOfBirth: json['dateOfBirth'],
      email: json['email'],
      password: json['password'],
      gender: json['gender'] ?? ''
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'fullName': fullName,
      'dateOfBirth': dateOfBirth,
      'gender': gender,
    };
  }
}

