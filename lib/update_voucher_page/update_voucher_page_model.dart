import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'update_voucher_page_widget.dart' show UpdateVoucherPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class UpdateVoucherPageModel extends FlutterFlowModel<UpdateVoucherPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'r0kbxrip' /* Title is required */,
      );
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'xk6eyofs' /* Description is required */,
      );
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for DiscountValueTextField widget.
  FocusNode? discountValueTextFieldFocusNode;
  TextEditingController? discountValueTextFieldTextController;
  String? Function(BuildContext, String?)?
      discountValueTextFieldTextControllerValidator;
  String? _discountValueTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'wod5tomp' /* Discount Value is required */,
      );
    }

    return null;
  }

  // State field(s) for VoucherStockTextField widget.
  FocusNode? voucherStockTextFieldFocusNode;
  TextEditingController? voucherStockTextFieldTextController;
  String? Function(BuildContext, String?)?
      voucherStockTextFieldTextControllerValidator;
  String? _voucherStockTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'znfny90f' /* Total Voucher Stock is require... */,
      );
    }

    return null;
  }

  DateTime? datePicked1;
  DateTime? datePicked2;

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
    textController2Validator = _textController2Validator;
    discountValueTextFieldTextControllerValidator =
        _discountValueTextFieldTextControllerValidator;
    voucherStockTextFieldTextControllerValidator =
        _voucherStockTextFieldTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    discountValueTextFieldFocusNode?.dispose();
    discountValueTextFieldTextController?.dispose();

    voucherStockTextFieldFocusNode?.dispose();
    voucherStockTextFieldTextController?.dispose();
  }
}
