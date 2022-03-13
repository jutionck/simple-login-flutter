class ErrorModel {
  String message;

  ErrorModel(this.message);

  ErrorModel.fromJson( Map<String, dynamic> map ):
        message = map['message'];

  @override
  String toString() {
    return 'ErrorModel{message: $message}';
  }
}