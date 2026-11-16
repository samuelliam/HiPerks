import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/add_point_confirm_component_widget.dart';
import '/components/add_points_catalog_item_component_widget.dart';
import '/components/add_quick_points_prompt_widget.dart';
import '/components/custom_loyalty_card_preview_widget.dart';
import '/components/paywall_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'card_detail_and_add_points_widget.dart'
    show CardDetailAndAddPointsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CardDetailAndAddPointsModel
    extends FlutterFlowModel<CardDetailAndAddPointsWidget> {
  ///  Local state fields for this component.

  int? currentAddPoints = 0;

  List<CatalogOrderStruct> orderList = [];
  void addToOrderList(CatalogOrderStruct item) => orderList.add(item);
  void removeFromOrderList(CatalogOrderStruct item) => orderList.remove(item);
  void removeAtIndexFromOrderList(int index) => orderList.removeAt(index);
  void insertAtIndexInOrderList(int index, CatalogOrderStruct item) =>
      orderList.insert(index, item);
  void updateOrderListAtIndex(
          int index, Function(CatalogOrderStruct) updateFn) =>
      orderList[index] = updateFn(orderList[index]);

  List<StoreCatalogRecord> catalogList = [];
  void addToCatalogList(StoreCatalogRecord item) => catalogList.add(item);
  void removeFromCatalogList(StoreCatalogRecord item) =>
      catalogList.remove(item);
  void removeAtIndexFromCatalogList(int index) => catalogList.removeAt(index);
  void insertAtIndexInCatalogList(int index, StoreCatalogRecord item) =>
      catalogList.insert(index, item);
  void updateCatalogListAtIndex(
          int index, Function(StoreCatalogRecord) updateFn) =>
      catalogList[index] = updateFn(catalogList[index]);

  List<ProductVariationStruct> orderWithVariationList = [];
  void addToOrderWithVariationList(ProductVariationStruct item) =>
      orderWithVariationList.add(item);
  void removeFromOrderWithVariationList(ProductVariationStruct item) =>
      orderWithVariationList.remove(item);
  void removeAtIndexFromOrderWithVariationList(int index) =>
      orderWithVariationList.removeAt(index);
  void insertAtIndexInOrderWithVariationList(
          int index, ProductVariationStruct item) =>
      orderWithVariationList.insert(index, item);
  void updateOrderWithVariationListAtIndex(
          int index, Function(ProductVariationStruct) updateFn) =>
      orderWithVariationList[index] = updateFn(orderWithVariationList[index]);

  String? currentTransactionID;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in CardDetailAndAddPoints widget.
  List<StoreCatalogRecord>? queriedCatalogList;
  // Model for CustomLoyaltyCardPreview component.
  late CustomLoyaltyCardPreviewModel customLoyaltyCardPreviewModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  BranchesRecord? currentBranch;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TransactionsRecord? transaction;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  UserTransactionsRecord? usertransaction;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  BranchesRecord? currentBranch2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TransactionsRecord? transaction2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  UserTransactionsRecord? usertransaction2;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  BranchesRecord? currentBranch3;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TransactionsRecord? transaction3;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  UserTransactionsRecord? usertransaction3;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  BranchesRecord? currentBranchRemove;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TransactionsRecord? transactionRemove;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  BranchesRecord? currentBranch2Remove;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TransactionsRecord? transaction2Remove;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  BranchesRecord? currentBranch3Remove;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TransactionsRecord? transaction3Remove;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {
    customLoyaltyCardPreviewModel =
        createModel(context, () => CustomLoyaltyCardPreviewModel());
  }

  @override
  void dispose() {
    customLoyaltyCardPreviewModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
