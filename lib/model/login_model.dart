class LoginModel {
  String message;
  LoginData data;

  LoginModel(this.message, this.data);

  LoginModel.fromJson( Map<String, dynamic> map ):
        message = map['message'],
        data = LoginData.fromJson(map['data']);

  @override
  String toString() {
    return 'LoginModel{message: $message, data: $data}';
  }
}

class LoginData {
  String id;
  String name;
  String email;
  String lastLogin;

  LoginData(this.id, this.name, this.email, this.lastLogin);

  // convert from Json to Map
  LoginData.fromJson( Map<String, dynamic> map ):
      id = map['id'],
      name = map['name'],
      email = map['email'],
      lastLogin = map['lastLogin'];

  @override
  String toString() {
    return 'LoginData{id: $id, name: $name, email: $email, lastLogin: $lastLogin}';
  }
}