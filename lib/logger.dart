
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Logger {

  static logError(String message) {
    print("[SINFO Heroes] [ERROR] " + message);
  }

  static logAction(String message) {
    print("[SINFO Heroes] [ACTION] " + message);
  }

}