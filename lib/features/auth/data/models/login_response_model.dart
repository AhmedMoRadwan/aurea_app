class LoginResponseModel {
  final String accessToken;
  final String expiresAtUtc;
  final String refreshToken;

  LoginResponseModel({
    required this.accessToken,
    required this.expiresAtUtc,
    required this.refreshToken,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      accessToken: json["accessToken"],
      expiresAtUtc: json["expiresAtUtc"],
      refreshToken: json["refreshToken"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "accessToken": accessToken,
      "expiresAtUtc": expiresAtUtc,
      "refreshToken": refreshToken,
    };
  }
}
