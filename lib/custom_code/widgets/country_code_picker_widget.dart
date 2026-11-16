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

import 'package:country_code_picker/country_code_picker.dart';

class CountryCodePickerWidget extends StatefulWidget {
  const CountryCodePickerWidget({
    super.key,
    this.width,
    this.height,
    required this.countryCodeDidSelect,
  });

  final double? width;
  final double? height;
  final Future Function(String? countryCode) countryCodeDidSelect;

  @override
  State<CountryCodePickerWidget> createState() => _CountryCodePickerState();
}

class _CountryCodePickerState extends State<CountryCodePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CountryCodePicker(
          initialSelection: 'PH',
          favorite: ['+63', 'PH'],
          // optional. Shows only country name and flag
          showCountryOnly: false,
          // optional. Shows only country name and flag when popup is closed.
          showOnlyCountryWhenClosed: false,
          // optional. aligns the flag and the Text left
          alignLeft: false,
          dialogBackgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          dialogTextStyle:
              TextStyle(color: FlutterFlowTheme.of(context).primaryText),
          onChanged: (countryCode) {
            widget.countryCodeDidSelect(countryCode.dialCode);
          },
        ),
      ),
    );
  }
}
