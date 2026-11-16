import '/backend/backend.dart';
import '/components/order_transaction_details_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'transaction_details_page_widget.dart' show TransactionDetailsPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class TransactionDetailsPageModel
    extends FlutterFlowModel<TransactionDetailsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for OrderTransactionDetails component.
  late OrderTransactionDetailsModel orderTransactionDetailsModel;

  @override
  void initState(BuildContext context) {
    orderTransactionDetailsModel =
        createModel(context, () => OrderTransactionDetailsModel());
  }

  @override
  void dispose() {
    orderTransactionDetailsModel.dispose();
  }
}
