import '/backend/backend.dart';
import '/components/redeem_details_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'redeem_detail_page_widget.dart' show RedeemDetailPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class RedeemDetailPageModel extends FlutterFlowModel<RedeemDetailPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for RedeemDetails component.
  late RedeemDetailsModel redeemDetailsModel;

  @override
  void initState(BuildContext context) {
    redeemDetailsModel = createModel(context, () => RedeemDetailsModel());
  }

  @override
  void dispose() {
    redeemDetailsModel.dispose();
  }
}
