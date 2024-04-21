//A user model can encapsulate the user's attributes and provide methods for interacting with the data.

class User {
  final String email;
  final String fullname;
  final String password;
  final String confirmPassword;
//constructor for the User class that takes the user's  required attributes as parameters
  User({
    required this.email,
    required this.fullname,
    required this.password,
    required this.confirmPassword,
  });
//we use a factory constructor in the user model to create User objects from
// JSON data retrieved from Firebase, encapsulating
// the logic for this conversion within the class itself.
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'] ?? '',
      fullname: json['fullname'] ?? '',
      password: json['password'] ?? '',
      confirmPassword: json['confirmpassword'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'fullname': fullname,
      'password': password,
      'confirmpassword': confirmPassword,
    };
  }
}
