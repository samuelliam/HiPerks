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

import 'package:mobile_scanner/mobile_scanner.dart';

class MobileScanner extends StatefulWidget {
  const MobileScanner({
    super.key,
    this.width,
    this.height,
    this.scanned,
  });

  final double? width;
  final double? height;
  final Future Function(String? scannedQR)? scanned;

  @override
  State<MobileScanner> createState() => _MobileScannerState();
}

class _MobileScannerState extends State<MobileScanner> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: MobileScanner(
        scanned: (capture) async {
          if (widget.scanned != null) {
            await widget.scanned!(capture);
          }
        },
      ),
    );
  }
}
