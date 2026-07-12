// class ApiErrorModel {
//   final int statusCode;
//   final String message;
//   final Map<String, List<String>>? errors;

//   ApiErrorModel({required this.statusCode, required this.message, this.errors});

//   factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
//     return ApiErrorModel(
//       statusCode: json["statusCode"] ?? 0,
//       message: json["message"] ?? "",
//       errors: json["errors"] != null
//           ? Map<String, List<String>>.from(
//               json["errors"].map(
//                 (key, value) => MapEntry(key, List<String>.from(value)),
//               ),
//             )
//           : null,
//     );
//   }

//   String get errorMessage {
//     if (errors != null && errors!.isNotEmpty) {
//       // هيرجع أول error موجود
//       final firstErrorList = errors!.values.first;

//       if (firstErrorList.isNotEmpty) {
//         return firstErrorList.first;
//       }
//     }

//     return message;
//   }

//   List<String> get allErrors {
//     if (errors != null && errors!.isNotEmpty) {
//       return errors!.values.expand((e) => e).toList();
//     }

//     return [message];
//   }
// }

class ApiErrorModel {
  final int statusCode;
  final String message;
  final Map<String, dynamic>? errors;

  ApiErrorModel({required this.statusCode, required this.message, this.errors});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
      statusCode: json["statusCode"] ?? 0,
      message: json["message"] ?? "",
      errors: json["errors"],
    );
  }

  String get errorMessage {
    if (errors != null && errors!.isNotEmpty) {
      // generalErrors
      if (errors!.containsKey("generalErrors")) {
        final generalErrors = errors!["generalErrors"];

        if (generalErrors is List && generalErrors.isNotEmpty) {
          return generalErrors.first.toString();
        }
      }

      // field errors
      final firstError = errors!.values.first;

      if (firstError is List && firstError.isNotEmpty) {
        return firstError.first.toString();
      }
    }

    return message;
  }
}
