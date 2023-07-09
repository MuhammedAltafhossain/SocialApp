import 'package:flutter/material.dart';
import 'package:social_app/component.dart';
import 'package:social_app/src/controllers/services/user_message/snackbar.dart';

abstract class AppExceptions {
  final String prefix;
  final String message;

  AppExceptions({this.prefix = "", this.message = ""}) {
    showSnackBar(
      title: prefix,
      message: message,
      icon: const Icon(Icons.error, color: defaultErrorColor),
    );
  }
}

class SocketException extends AppExceptions {
  SocketException({String? message}) : super(prefix: "Error", message: "No Internet Connection. ${message ?? ""}");
}

class ServiceUnavailable extends AppExceptions {
  ServiceUnavailable({String? message}) : super(prefix: "Error", message: "The server is temporarily busy, try again later! ${message ?? ""}");
}

class InternalError extends AppExceptions {
  InternalError({String? message}) : super(prefix: "Error", message: "There is an error while processing the request. ${message ?? ""}");
}

// Firebase
class UserAlreadyExistsException extends AppExceptions {
  UserAlreadyExistsException({String? message}) : super(prefix: "Error", message: "User already has an account. ${message ?? ""}");
}

class UserNotFoundException extends AppExceptions {
  UserNotFoundException({String? message}) : super(prefix: "Error", message: "Wrong user information ${message ?? ""}");
}
