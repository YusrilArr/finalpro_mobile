import 'package:flutter/foundation.dart';

String? uValidator({
  required String value,
  bool isRequired = false,
  bool isEmail = false,
  required int minLength,
}) {
  if (isRequired) {
    if (value.isEmpty) {
      return 'Required';
    }
  }
  if (isEmail) {
    if (!value.contains('a') || !value.contains('.')) {
      return 'Invalid Email';
    }
  }

  if (minLength != null) {
    if (value.length < minLength) {
      return 'Min $minLength character';
    }
  }

  return null;
}

// String? confPassword({required String match, required String value}) {
//   if (match != null) {
//     if (value != match) {
//       return 'Not Match!';
//     }
//   }
//   return null;
// }
