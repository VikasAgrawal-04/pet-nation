import 'package:flutter/material.dart';

class ServerException implements Exception {
  ServerException({
    this.code = 404,
    this.message = 'Could not process your request',
  });
  final int? code;
  final String? message;

  @override
  String toString() {
    debugPrint('$message,$code');
    return super.toString();
  }
}
