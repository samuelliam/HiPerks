import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/index.dart';
import 'transaction_details_widget.dart' show TransactionDetailsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class TransactionDetailsModel
    extends FlutterFlowModel<TransactionDetailsWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in Text widget.
  StoreCardsRecord? storeCard;
  // Stores action output result for [Firestore Query - Query a collection] action in Text widget.
  UserCardsRecord? queryUserCard;
  // Stores action output result for [Backend Call - Read Document] action in IconButton widget.
  StoreCardsRecord? storeCardChat;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UserCardsRecord? userCard;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UserTransactionsRecord? userTransaction;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
