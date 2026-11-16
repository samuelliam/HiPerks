import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/card_detail_and_add_points_widget.dart';
import '/components/order_transaction_details_widget.dart';
import '/components/transaction_details_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'member_details_widget.dart' show MemberDetailsWidget;
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MemberDetailsModel extends FlutterFlowModel<MemberDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for CardDetailAndAddPoints component.
  late CardDetailAndAddPointsModel cardDetailAndAddPointsModel;

  /// Query cache managers for this widget.

  final _memberDetailsTransactionCacheManager =
      StreamRequestManager<List<TransactionsRecord>>();
  Stream<List<TransactionsRecord>> memberDetailsTransactionCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<TransactionsRecord>> Function() requestFn,
  }) =>
      _memberDetailsTransactionCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMemberDetailsTransactionCacheCache() =>
      _memberDetailsTransactionCacheManager.clear();
  void clearMemberDetailsTransactionCacheCacheKey(String? uniqueKey) =>
      _memberDetailsTransactionCacheManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    cardDetailAndAddPointsModel =
        createModel(context, () => CardDetailAndAddPointsModel());
  }

  @override
  void dispose() {
    cardDetailAndAddPointsModel.dispose();

    /// Dispose query cache managers for this widget.

    clearMemberDetailsTransactionCacheCache();
  }
}
