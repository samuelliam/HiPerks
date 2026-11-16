// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math';

Future<String> generateID10Char() async {
  // generate random id with 100 characters with numbers and character
  String id = '';
  var random = Random.secure();
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  for (var i = 0; i < 10; i++) {
    id += chars[random.nextInt(chars.length)];
  }

  return id;
}
