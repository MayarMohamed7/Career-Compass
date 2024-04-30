class User {
  final String email;
  final String fullname;
  final String password;
  final String confirmPassword;
  String name;
  String phoneNumber;
  int age;
  String educationalLevel;
  String jobStatus;
  String fieldOfInterests;

  User({
    required this.email,
    required this.fullname,
    required this.password,
    required this.confirmPassword,
    required this.name,
    required this.phoneNumber,
    required this.age,
    required this.educationalLevel,
    required this.jobStatus,
    required this.fieldOfInterests,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'] ?? '',
      fullname: json['fullname'] ?? '',
      password: json['password'] ?? '',
      confirmPassword: json['confirmPassword'] ?? '',
      name: json['name'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      age: json['age'] ?? 0,
      educationalLevel: json['educationalLevel'] ?? '',
      jobStatus: json['jobStatus'] ?? '',
      fieldOfInterests: json['fieldOfInterests'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'fullname': fullname,
      'password': password,
      'confirmPassword': confirmPassword,
      'name': name,
      'phoneNumber': phoneNumber,
      'age': age,
      'educationalLevel': educationalLevel,
      'jobStatus': jobStatus,
      'fieldOfInterests': fieldOfInterests,
    };
  }
}
