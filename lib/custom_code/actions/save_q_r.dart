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

import 'dart:ui';

import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:path_provider/path_provider.dart';

Future saveQR(String? storeLink) async {
  final qrCode = QrCode.fromData(
    data: storeLink ?? '',
    errorCorrectLevel: QrErrorCorrectLevel.H,
  );

  final qrImage = QrImage(qrCode);
  final qrImageBytes = await qrImage.toImageAsBytes(
      size: 1080,
      format: ImageByteFormat.png,
      decoration: PrettyQrDecoration(background: Colors.white));

  if (qrImageBytes != null) {
    final saveImage = await ImageGallerySaverPlus.saveImage(
        qrImageBytes.buffer.asUint8List());
  }
}
