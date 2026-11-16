import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/backend/schema/structs/index.dart';
import '/components/claim_voucher_component_widget.dart';
import '/components/empty_component_widget.dart';
import '/components/empty_store_gallerys_component_widget.dart';
import '/components/leaderboard_component_widget.dart';
import '/components/redeem_confirmation_widget.dart';
import '/components/redeem_details_widget.dart';
import '/components/redeem_fail_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:badges/badges.dart' as badges;
import 'package:map_launcher/map_launcher.dart' as $ml;
import 'store_details_widget.dart' show StoreDetailsWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class StoreDetailsModel extends FlutterFlowModel<StoreDetailsWidget> {
  ///  Local state fields for this page.

  String? generatedID;

  StoresRecord? pageLocalStoreDetail;

  BranchesRecord? selectedBranch;

  String? selectedCategory;

  dynamic googleReviewJson;

  bool addCardIsPressed = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in StoreDetails widget.
  StoresRecord? dynamicLinkStore;
  // Stores action output result for [Custom Action - searchGooglePlacesReview] action in StoreDetails widget.
  dynamic? googlePlaceSearchResult;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for StaggeredView widget.

  PagingController<DocumentSnapshot?, RedeemablesRecord>?
      staggeredViewPagingController1;
  Query? staggeredViewPagingQuery1;
  List<StreamSubscription?> staggeredViewStreamSubscriptions1 = [];

  // Stores action output result for [Backend Call - Create Document] action in RedeemableItem widget.
  UserTransactionsRecord? userTransactionCopy;
  // Stores action output result for [Backend Call - Create Document] action in RedeemableItem widget.
  TransactionsRecord? storeTransactionCopy;
  // Stores action output result for [Custom Action - generateID10Char] action in RedeemableItem widget.
  String? generated100CharIDCopy;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  UserTransactionsRecord? userTransaction;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TransactionsRecord? storeTransaction;
  // Stores action output result for [Custom Action - generateID10Char] action in Button widget.
  String? generated100CharID;
  // Stores action output result for [Firestore Query - Query a collection] action in Card widget.
  StoreCardsRecord? matchedStoreCardCopy;
  // Stores action output result for [Backend Call - Create Document] action in Card widget.
  UserCardsRecord? createdUserCardCopy;
  // Stores action output result for [Backend Call - Create Document] action in Card widget.
  UserCardsRecord? createdUserCardAlternate;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Model for LeaderboardComponent component.
  late LeaderboardComponentModel leaderboardComponentModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Card widget.
  StoreCardsRecord? matchedStoreCardCopyVoucher;
  // Stores action output result for [Backend Call - Create Document] action in Card widget.
  UserCardsRecord? createdUserCardCopyVoucher;
  // Stores action output result for [Backend Call - Create Document] action in Card widget.
  UserCardsRecord? createdUserCardAlternateVoucher;
  // Stores action output result for [Firestore Query - Query a collection] action in FloatingActionButton widget.
  StoreCardsRecord? matchedStoreCard;
  // Stores action output result for [Backend Call - Create Document] action in FloatingActionButton widget.
  UserCardsRecord? createdUserCard;
  // Stores action output result for [Backend Call - Create Document] action in FloatingActionButton widget.
  UserCardsRecord? createdUserCardAlterCopy;

  @override
  void initState(BuildContext context) {
    leaderboardComponentModel =
        createModel(context, () => LeaderboardComponentModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    staggeredViewStreamSubscriptions1.forEach((s) => s?.cancel());
    staggeredViewPagingController1?.dispose();

    leaderboardComponentModel.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, RedeemablesRecord>
      setStaggeredViewController1(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    staggeredViewPagingController1 ??=
        _createStaggeredViewController1(query, parent);
    if (staggeredViewPagingQuery1 != query) {
      staggeredViewPagingQuery1 = query;
      staggeredViewPagingController1?.refresh();
    }
    return staggeredViewPagingController1!;
  }

  PagingController<DocumentSnapshot?, RedeemablesRecord>
      _createStaggeredViewController1(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller = PagingController<DocumentSnapshot?, RedeemablesRecord>(
        firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryRedeemablesRecordPage(
          parent: parent,
          queryBuilder: (_) => staggeredViewPagingQuery1 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: staggeredViewStreamSubscriptions1,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
