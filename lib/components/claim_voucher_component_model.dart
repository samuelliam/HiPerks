import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/user_voucher_detail_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'claim_voucher_component_widget.dart' show ClaimVoucherComponentWidget;
import 'package:styled_divider/styled_divider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ClaimVoucherComponentModel
    extends FlutterFlowModel<ClaimVoucherComponentWidget> {
  ///  Local state fields for this component.

  bool isClaimed = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in ClaimVoucherComponent widget.
  List<UserVouchersRecord>? currentUserVouchers;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UserVouchersRecord? claimedUserVoucherReTap;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UserVouchersRecord? claimedUserVoucher;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  UserVouchersRecord? currentUserVoucher;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
