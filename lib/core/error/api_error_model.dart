class ApiErrorModel {
  final int statusCode;
  final String message;
  final Map<String, dynamic>? errors;

  ApiErrorModel({required this.statusCode, required this.message, this.errors});

  factory ApiErrorModel.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      return ApiErrorModel(
        statusCode: json["statusCode"] ?? 0,
        message: json["message"] ?? json["Message"] ?? "",
        errors: json["errors"],
      );
    }
    return ApiErrorModel(
      statusCode: 0,
      message: json?.toString() ?? "Unknown error occurred",
    );
  }

  String get firstErrorMessage {
    if (errors != null && errors!.isNotEmpty) {
      final firstKey = errors!.keys.first;
      final messages = errors![firstKey];
      if (messages is List && messages.isNotEmpty) {
        return messages.first.toString();
      }
    }
    return message;
  }
}








// class ApiErrorModel {
//   final int statusCode;
//   final String message;
//   final Map<String, dynamic>? errors;
//
//   ApiErrorModel({required this.statusCode, required this.message, this.errors});
//
//   factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
//     return ApiErrorModel(
//       statusCode: json["statusCode"] ?? 0,
//       message: json["message"] ?? "",
//       errors: json["errors"],
//     );
//   }
//
//   String get firstErrorMessage {
//     if (errors != null && errors!.isNotEmpty) {
//       final firstKey = errors!.keys.first;
//
//       final messages = errors![firstKey];
//
//       if (messages is List && messages.isNotEmpty) {
//         return messages.first;
//       }
//     }
//
//     return message;
//   }
// }
