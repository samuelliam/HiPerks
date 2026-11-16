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

import 'index.dart'; // Imports other custom widgets

import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({
    super.key,
    this.width,
    this.height,
    this.initialColor,
    this.didSelectColor,
  });

  final double? width;
  final double? height;
  final Color? initialColor;
  final Future Function(Color? selectedColor)? didSelectColor;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.height,
        width: widget.height,
        child: ColorPicker(
          didSelectColor: widget.didSelectColor,
          initialColor: widget.initialColor,
          key: widget.key,
        ));
  }
}
