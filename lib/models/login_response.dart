class LoginResponse {
  final int errorCode;
  final String message;
  final String token;

  LoginResponse({
    required this.errorCode,
    required this.message,
    required this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json)
  {
    return LoginResponse(
      errorCode: json["errorCode"] , 
      message: json["message"], 
      token: json ["token"]
    );
  }
}