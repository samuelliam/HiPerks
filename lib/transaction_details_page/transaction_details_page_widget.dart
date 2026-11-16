import '/backend/backend.dart';
import '/components/order_transaction_details_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'transaction_details_page_model.dart';
export 'transaction_details_page_model.dart';

class TransactionDetailsPageWidget extends StatefulWidget {
  const TransactionDetailsPageWidget({
    super.key,
    required this.transaction,
  });

  final TransactionsRecord? transaction;

  static String routeName = 'TransactionDetailsPage';
  static String routePath = 'transactionDetailsPage';

  @override
  State<TransactionDetailsPageWidget> createState() =>
      _TransactionDetailsPageWidgetState();
}

class _TransactionDetailsPageWidgetState
    extends State<TransactionDetailsPageWidget> {
  late TransactionDetailsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransactionDetailsPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'TransactionDetailsPage'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('TRANSACTION_DETAILS_arrow_back_rounded_I');
              logFirebaseEvent('IconButton_navigate_back');
              context.safePop();
            },
          ),
          title: GradientText(
            FFLocalizations.of(context).getText(
              'f44hjvbt' /* Transaction Details */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.outfit(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).alternate,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
            colors: [
              FlutterFlowTheme.of(context).primary,
              FlutterFlowTheme.of(context).secondary
            ],
            gradientDirection: GradientDirection.ltr,
            gradientType: GradientType.linear,
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              wrapWithModel(
                model: _model.orderTransactionDetailsModel,
                updateCallback: () => safeSetState(() {}),
                updateOnChange: true,
                child: OrderTransactionDetailsWidget(
                  transaction: widget!.transaction!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
