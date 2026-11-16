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

import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

Future<String> scanQR() async {
  // Add your function code here!
  String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
      Colors.black.toHexString(), 'Cancel', true, ScanMode.QR);
  return barcodeScanRes;
}
