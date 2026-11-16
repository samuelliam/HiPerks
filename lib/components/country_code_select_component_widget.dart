import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'country_code_select_component_model.dart';
export 'country_code_select_component_model.dart';

class CountryCodeSelectComponentWidget extends StatefulWidget {
  const CountryCodeSelectComponentWidget({
    super.key,
    required this.countryCodeDidSelect,
  });

  final Future Function(String? countryCode)? countryCodeDidSelect;

  @override
  State<CountryCodeSelectComponentWidget> createState() =>
      _CountryCodeSelectComponentWidgetState();
}

class _CountryCodeSelectComponentWidgetState
    extends State<CountryCodeSelectComponentWidget> {
  late CountryCodeSelectComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CountryCodeSelectComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: custom_widgets.CountryCodePickerWidget(
                width: double.infinity,
                height: double.infinity,
                countryCodeDidSelect: (countryCode) async {
                  logFirebaseEvent('COUNTRY_CODE_SELECT_COMPONENT_Container_');
                  logFirebaseEvent('CountryCodePickerWidget_execute_callback');
                  await widget.countryCodeDidSelect?.call(
                    countryCode,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
