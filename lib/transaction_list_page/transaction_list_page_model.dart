import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/empty_transaction_component_widget.dart';
import '/components/order_transaction_details_widget.dart';
import '/components/qr_scanner_widget.dart';
import '/components/transaction_details_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'transaction_list_page_widget.dart' show TransactionListPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class TransactionListPageModel
    extends FlutterFlowModel<TransactionListPageWidget> {
  ///  Local state fields for this page.

  bool? isPointAdded;

  bool? isConfirmed;

  DocumentReference? currentBranchRef;

  DateTimeRange? dateFiliter;

  bool? isRemovedPoints;

  bool? isPreOrder;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in TextField widget.
  StoreCardsRecord? searchStoreCard;
  // Stores action output result for [Firestore Query - Query a collection] action in TextField widget.
  UserCardsRecord? searchUsercard;
  // Stores action output result for [Firestore Query - Query a collection] action in TextField widget.
  TransactionsRecord? searchTransaction;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  TransactionsRecord? transaction;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  UserCardsRecord? scannedUsercard;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  StoreCardsRecord? scannedStoreCard;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
