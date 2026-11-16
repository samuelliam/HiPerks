import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/custom_loyalty_card_widget.dart';
import '/components/empty_home_component_widget.dart';
import '/components/empty_minimized_view_widget.dart';
import '/components/empty_transaction_component_widget.dart';
import '/components/order_details_widget.dart';
import '/components/order_transaction_details_widget.dart';
import '/components/paywall_component_widget.dart';
import '/components/points_earned_component_widget.dart';
import '/components/redeem_details_widget.dart';
import '/components/tools_component_widget.dart';
import '/components/transaction_details_widget.dart';
import '/components/user_voucher_preview_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import '/index.dart';
import 'auth4_home_widget.dart' show Auth4HomeWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class Auth4HomeModel extends FlutterFlowModel<Auth4HomeWidget> {
  ///  Local state fields for this page.

  List<BranchesRecord> branches = [];
  void addToBranches(BranchesRecord item) => branches.add(item);
  void removeFromBranches(BranchesRecord item) => branches.remove(item);
  void removeAtIndexFromBranches(int index) => branches.removeAt(index);
  void insertAtIndexInBranches(int index, BranchesRecord item) =>
      branches.insert(index, item);
  void updateBranchesAtIndex(int index, Function(BranchesRecord) updateFn) =>
      branches[index] = updateFn(branches[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in auth_4_Home widget.
  List<TransactionsRecord>? allTransactionsOnLoad;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 0;

  // State field(s) for Row widget.
  ScrollController? rowController1;
  // State field(s) for Row widget.
  ScrollController? rowController2;
  List<UserCardsRecord>? wrapPreviousSnapshot;
  // State field(s) for BusinessColumn widget.
  ScrollController? businessColumnScrollController;
  // Model for ToolsComponent component.
  late ToolsComponentModel toolsComponentModel1;
  // Model for ToolsComponent component.
  late ToolsComponentModel toolsComponentModel2;
  // Model for ToolsComponent component.
  late ToolsComponentModel toolsComponentModel3;
  // Stores action output result for [Backend Call - Read Document] action in ToolsComponent widget.
  StoresRecord? settingsHomeCurrentStore;
  // Model for ToolsComponent component.
  late ToolsComponentModel toolsComponentModel4;
  // Model for ToolsComponent component.
  late ToolsComponentModel toolsComponentModel5;
  // Model for ToolsComponent component.
  late ToolsComponentModel toolsComponentModel6;
  // Model for ToolsComponent component.
  late ToolsComponentModel toolsComponentModel7;
  // Stores action output result for [Backend Call - Read Document] action in ToolsComponent widget.
  StoresRecord? currentStoreProfileAction;
  // Model for ToolsComponent component.
  late ToolsComponentModel toolsComponentModel8;
  // Model for ToolsComponent component.
  late ToolsComponentModel toolsComponentModel9;
  // Model for ToolsComponent component.
  late ToolsComponentModel toolsComponentModel10;
  // Model for ToolsComponent component.
  late ToolsComponentModel toolsComponentModel11;
  // Model for ToolsComponent component.
  late ToolsComponentModel toolsComponentModel12;
  // Stores action output result for [Backend Call - Read Document] action in ToolsComponent widget.
  StoresRecord? currentVoucherStore;
  // Model for ToolsComponent component.
  late ToolsComponentModel toolsComponentModel13;
  // State field(s) for Row widget.
  ScrollController? rowController3;
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
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // Stores action output result for [Backend Call - Read Document] action in Row widget.
  StoresRecord? currentStore;
  // Stores action output result for [Firestore Query - Query a collection] action in TransactionHistory widget.
  int? transactionCount;
  // Stores action output result for [Backend Call - Read Document] action in BranchSetting widget.
  StoresRecord? settingsCurrentStore;
  bool isVerified = false;
  var scannedQR = '';
  // Stores action output result for [Firestore Query - Query a collection] action in FloatingActionButton widget.
  StoreCardsRecord? scannedStoreCard;
  // Stores action output result for [Firestore Query - Query a collection] action in FloatingActionButton widget.
  UserCardsRecord? scannedusercard;
  // Stores action output result for [Firestore Query - Query a collection] action in FloatingActionButton widget.
  TransactionsRecord? redeemTransaction;
  // Stores action output result for [Custom Action - getUserVoucherDocument] action in FloatingActionButton widget.
  DocumentReference? scannedUserVoucher;
  // Stores action output result for [Backend Call - Read Document] action in FloatingActionButton widget.
  UserVouchersRecord? userVoucher;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    rowController1 = ScrollController();
    rowController2 = ScrollController();
    businessColumnScrollController = ScrollController();
    toolsComponentModel1 = createModel(context, () => ToolsComponentModel());
    toolsComponentModel2 = createModel(context, () => ToolsComponentModel());
    toolsComponentModel3 = createModel(context, () => ToolsComponentModel());
    toolsComponentModel4 = createModel(context, () => ToolsComponentModel());
    toolsComponentModel5 = createModel(context, () => ToolsComponentModel());
    toolsComponentModel6 = createModel(context, () => ToolsComponentModel());
    toolsComponentModel7 = createModel(context, () => ToolsComponentModel());
    toolsComponentModel8 = createModel(context, () => ToolsComponentModel());
    toolsComponentModel9 = createModel(context, () => ToolsComponentModel());
    toolsComponentModel10 = createModel(context, () => ToolsComponentModel());
    toolsComponentModel11 = createModel(context, () => ToolsComponentModel());
    toolsComponentModel12 = createModel(context, () => ToolsComponentModel());
    toolsComponentModel13 = createModel(context, () => ToolsComponentModel());
    rowController3 = ScrollController();
    listViewController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
    rowController1?.dispose();
    rowController2?.dispose();
    businessColumnScrollController?.dispose();
    toolsComponentModel1.dispose();
    toolsComponentModel2.dispose();
    toolsComponentModel3.dispose();
    toolsComponentModel4.dispose();
    toolsComponentModel5.dispose();
    toolsComponentModel6.dispose();
    toolsComponentModel7.dispose();
    toolsComponentModel8.dispose();
    toolsComponentModel9.dispose();
    toolsComponentModel10.dispose();
    toolsComponentModel11.dispose();
    toolsComponentModel12.dispose();
    toolsComponentModel13.dispose();
    rowController3?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    listViewController?.dispose();
  }
}
