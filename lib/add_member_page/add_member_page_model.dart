import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'add_member_page_widget.dart' show AddMemberPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddMemberPageModel extends FlutterFlowModel<AddMemberPageWidget> {
  ///  Local state fields for this page.

  String currentCountryCode = '+63';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameTextController;
  String? Function(BuildContext, String?)? yourNameTextControllerValidator;
  String? _yourNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ybgzy3q9' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for customerEmail widget.
  FocusNode? customerEmailFocusNode;
  TextEditingController? customerEmailTextController;
  String? Function(BuildContext, String?)? customerEmailTextControllerValidator;
  // State field(s) for customerPhoneNumber widget.
  FocusNode? customerPhoneNumberFocusNode;
  TextEditingController? customerPhoneNumberTextController;
  String? Function(BuildContext, String?)?
      customerPhoneNumberTextControllerValidator;
  String? _customerPhoneNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '1xgzz1pz' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for customerInitialPoints widget.
  FocusNode? customerInitialPointsFocusNode;
  TextEditingController? customerInitialPointsTextController;
  String? Function(BuildContext, String?)?
      customerInitialPointsTextControllerValidator;

  @override
  void initState(BuildContext context) {
    yourNameTextControllerValidator = _yourNameTextControllerValidator;
    customerPhoneNumberTextControllerValidator =
        _customerPhoneNumberTextControllerValidator;
  }

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameTextController?.dispose();

    customerEmailFocusNode?.dispose();
    customerEmailTextController?.dispose();

    customerPhoneNumberFocusNode?.dispose();
    customerPhoneNumberTextController?.dispose();

    customerInitialPointsFocusNode?.dispose();
    customerInitialPointsTextController?.dispose();
  }
}
