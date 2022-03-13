class RegisterModel {
  String message;

  RegisterModel(this.message);

  RegisterModel.fromJson(Map<String, dynamic> map) : message = map['message'];

  @override
  String toString() {
    return 'RegisterModel{message: $message}';
  }
}

class RegisterData {
  String? id;
  String name;
  String email;
  String password;
  String? lastLogin;

  RegisterData(
      {this.id,
      required this.name,
      required this.email,
      required this.password,
      this.lastLogin});

  // convert from Json to Map
  RegisterData.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        email = map['email'],
        password = map['password'],
        lastLogin = map['lastLogin'];

  @override
  String toString() {
    return 'RegisterData{id: $id, name: $name, email: $email, lastLogin: $lastLogin}';
  }
}
