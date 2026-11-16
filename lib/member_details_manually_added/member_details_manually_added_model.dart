import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/card_detail_and_add_points_copy_widget.dart';
import '/components/transaction_item_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'member_details_manually_added_widget.dart'
    show MemberDetailsManuallyAddedWidget;
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class MemberDetailsManuallyAddedModel
    extends FlutterFlowModel<MemberDetailsManuallyAddedWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for CardDetailAndAddPointsCopy component.
  late CardDetailAndAddPointsCopyModel cardDetailAndAddPointsCopyModel;

  @override
  void initState(BuildContext context) {
    cardDetailAndAddPointsCopyModel =
        createModel(context, () => CardDetailAndAddPointsCopyModel());
  }

  @override
  void dispose() {
    cardDetailAndAddPointsCopyModel.dispose();
  }
}
