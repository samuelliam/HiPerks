// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:pretty_qr_code/pretty_qr_code.dart';

class QRWithPhoto extends StatefulWidget {
  const QRWithPhoto({
    super.key,
    this.width,
    this.height,
    required this.cardID,
    required this.qrColor,
  });

  final double? width;
  final double? height;
  final String cardID;
  final Color qrColor;

  @override
  State<QRWithPhoto> createState() => _QRWithPhotoState();
}

class _QRWithPhotoState extends State<QRWithPhoto> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.height,
        width: widget.width,
        child: PrettyQrView.data(
            data: widget.cardID,
            decoration: PrettyQrDecoration(
                shape: PrettyQrSmoothSymbol(
                    roundFactor: 0.5, color: widget.qrColor))));
  }
}
