import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/redeem_confirmation_widget.dart';
import '/components/redeem_fail_widget.dart';
import '/components/redeem_success_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'member_redeemable_details_widget.dart'
    show MemberRedeemableDetailsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MemberRedeemableDetailsModel
    extends FlutterFlowModel<MemberRedeemableDetailsWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  StoresRecord? currentStore;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TransactionsRecord? redeemDetailStoreTransaction;
  // Stores action output result for [Custom Action - generateID10Char] action in Button widget.
  String? generatedID;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
