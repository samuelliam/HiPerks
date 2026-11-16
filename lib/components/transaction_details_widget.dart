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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'transaction_details_model.dart';
export 'transaction_details_model.dart';

class TransactionDetailsWidget extends StatefulWidget {
  const TransactionDetailsWidget({
    super.key,
    required this.transaction,
  });

  final TransactionsRecord? transaction;

  @override
  State<TransactionDetailsWidget> createState() =>
      _TransactionDetailsWidgetState();
}

class _TransactionDetailsWidgetState extends State<TransactionDetailsWidget> {
  late TransactionDetailsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransactionDetailsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 7.0,
            color: Color(0x2F1D2429),
            offset: Offset(
              0.0,
              3.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 32.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'TRANSACTION_DETAILS_Container_830wfzwv_O');
                          logFirebaseEvent('Container_close_dialog_drawer_etc');
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 100.0,
                          height: 10.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primaryText,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'TRANSACTION_DETAILS_Text_92plrd5l_ON_TAP');
                                logFirebaseEvent('Text_backend_call');
                                _model.storeCard =
                                    await StoreCardsRecord.getDocumentOnce(
                                        widget!.transaction!.cardReferrence!);
                                logFirebaseEvent('Text_firestore_query');
                                _model.queryUserCard =
                                    await queryUserCardsRecordOnce(
                                  parent: widget!.transaction?.ownerReferrence,
                                  queryBuilder: (userCardsRecord) =>
                                      userCardsRecord.where(
                                    'CardStringID',
                                    isEqualTo: widget!.transaction?.cardId,
                                  ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);
                                logFirebaseEvent('Text_navigate_to');

                                context.pushNamed(
                                  MemberDetailsWidget.routeName,
                                  queryParameters: {
                                    'userCard': serializeParam(
                                      _model.queryUserCard,
                                      ParamType.Document,
                                    ),
                                    'storeCard': serializeParam(
                                      _model.storeCard,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'userCard': _model.queryUserCard,
                                    'storeCard': _model.storeCard,
                                  },
                                );

                                safeSetState(() {});
                              },
                              child: Text(
                                valueOrDefault<String>(
                                  widget!.transaction?.cardOwner,
                                  '-',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      font: GoogleFonts.outfit(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                          FlutterFlowIconButton(
                            borderRadius: 8.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              Icons.chat_outlined,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'TRANSACTION_DETAILS_chat_outlined_ICN_ON');
                              logFirebaseEvent('IconButton_backend_call');
                              _model.storeCardChat =
                                  await StoreCardsRecord.getDocumentOnce(
                                      widget!.transaction!.cardReferrence!);
                              logFirebaseEvent('IconButton_navigate_to');

                              context.pushNamed(
                                ChatWidget.routeName,
                                queryParameters: {
                                  'customerUserRef': serializeParam(
                                    _model.storeCardChat?.cardOwner,
                                    ParamType.DocumentReference,
                                  ),
                                  'storeUserRef': serializeParam(
                                    widget!.transaction?.ownerReferrence,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                              );

                              safeSetState(() {});
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: SelectionArea(
                                child: Text(
                              valueOrDefault<String>(
                                widget!.transaction?.cardId,
                                '-',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                            )),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: RichText(
                              textScaler: MediaQuery.of(context).textScaler,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      '8ivnfvhg' /* Transaction ID:  */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.readexPro(
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  TextSpan(
                                    text: valueOrDefault<String>(
                                      widget!.transaction?.transactionID,
                                      '-',
                                    ),
                                    style: TextStyle(),
                                  )
                                ],
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.readexPro(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (!widget!.transaction!.isPointsAdded &&
                            !widget!.transaction!.isRemovedPoints)
                          Flexible(
                            child: RichText(
                              textScaler: MediaQuery.of(context).textScaler,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      'wgtv5q7n' /* Redeemed:  */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.readexPro(
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  TextSpan(
                                    text: valueOrDefault<String>(
                                      widget!.transaction?.redeemedItemName,
                                      '-',
                                    ),
                                    style: TextStyle(),
                                  )
                                ],
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.readexPro(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: RichText(
                              textScaler: MediaQuery.of(context).textScaler,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: () {
                                      if (widget!.transaction!.isPointsAdded) {
                                        return 'Points Added: ';
                                      } else if (widget!
                                          .transaction!.isRemovedPoints) {
                                        return 'Removed Points: ';
                                      } else {
                                        return 'Points Used: ';
                                      }
                                    }(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.readexPro(
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  TextSpan(
                                    text: valueOrDefault<String>(
                                      widget!.transaction?.pointsUsed
                                          ?.toString(),
                                      '-',
                                    ),
                                    style: TextStyle(),
                                  )
                                ],
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.readexPro(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (widget!.transaction?.hasTeamMember() ?? true)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        'fw8k5d3s' /* Team Member:  */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.readexPro(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    TextSpan(
                                      text: valueOrDefault<String>(
                                        widget!.transaction?.teamMember
                                            ?.memberName,
                                        '-',
                                      ),
                                      style: TextStyle(),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.readexPro(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (widget!.transaction?.hasTeamMember() ?? true)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        '3zlr2ayh' /* Role:  */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.readexPro(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    TextSpan(
                                      text: valueOrDefault<String>(
                                        widget!.transaction?.teamMember
                                            ?.memberRole?.name,
                                        '-',
                                      ),
                                      style: TextStyle(),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.readexPro(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (widget!.transaction?.hasBranchName() ?? true)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        'gmhwi5xv' /* Branch:  */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.readexPro(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    TextSpan(
                                      text: valueOrDefault<String>(
                                        widget!.transaction?.branchName,
                                        '-',
                                      ),
                                      style: TextStyle(),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.readexPro(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: RichText(
                              textScaler: MediaQuery.of(context).textScaler,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      'codhj6kx' /* Date:  */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.readexPro(
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  TextSpan(
                                    text: valueOrDefault<String>(
                                      dateTimeFormat(
                                        "MMM d, yyyy - h:mm a",
                                        widget!.transaction?.datetime,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      '-',
                                    ),
                                    style: TextStyle(),
                                  )
                                ],
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.readexPro(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (widget!.transaction?.hasConfirmationDate() ?? true)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        '65d823b9' /* Confirmation Date:  */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.readexPro(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    TextSpan(
                                      text: valueOrDefault<String>(
                                        dateTimeFormat(
                                          "MMM d, yyyy - h:mm a",
                                          widget!.transaction?.confirmationDate,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '-',
                                      ),
                                      style: TextStyle(),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.readexPro(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (widget!.transaction?.hasCatalogItemOrders() ?? true)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            '86mcpnx4' /* Orders:  */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.readexPro(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.readexPro(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 2.0, 0.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final order = widget!
                                                .transaction?.catalogItemOrders
                                                ?.toList() ??
                                            [];

                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: List.generate(order.length,
                                              (orderIndex) {
                                            final orderItem = order[orderIndex];
                                            return RichText(
                                              textScaler: MediaQuery.of(context)
                                                  .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: orderItem.orderCount
                                                        .toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .readexPro(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                  TextSpan(
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'haa0ax39' /* x  */,
                                                    ),
                                                    style: TextStyle(),
                                                  ),
                                                  TextSpan(
                                                    text: orderItem
                                                        .catalogItemName,
                                                    style: TextStyle(),
                                                  ),
                                                  TextSpan(
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'uljqxv1j' /*  ( */,
                                                    ),
                                                    style: TextStyle(),
                                                  ),
                                                  TextSpan(
                                                    text: orderItem
                                                        .variant.variationName,
                                                    style: TextStyle(),
                                                  ),
                                                  TextSpan(
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'giz4ez1x' /* ) */,
                                                    ),
                                                    style: TextStyle(),
                                                  )
                                                ],
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font:
                                                          GoogleFonts.readexPro(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                              textAlign: TextAlign.start,
                                            );
                                          }),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (widget!.transaction?.hasTransactionNotes() ?? true)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        'q77ypbe7' /* Notes:  */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.readexPro(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    TextSpan(
                                      text: valueOrDefault<String>(
                                        widget!.transaction?.transactionNotes,
                                        '-',
                                      ),
                                      style: TextStyle(),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.readexPro(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          if (widget!.transaction?.hasIsConfirmed() ?? true)
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('TRANSACTION_DETAILS_CONFIRM_REDEEM_BTN_O');
                  if (!widget!.transaction!.isConfirmed) {
                    logFirebaseEvent('Button_alert_dialog');
                    var confirmDialogResponse = await showDialog<bool>(
                          context: context,
                          builder: (alertDialogContext) {
                            return WebViewAware(
                              child: AlertDialog(
                                title: Text('Are you sure to confirm redeem?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(
                                        alertDialogContext, false),
                                    child: Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext, true),
                                    child: Text('Confirm'),
                                  ),
                                ],
                              ),
                            );
                          },
                        ) ??
                        false;
                    if (confirmDialogResponse) {
                      if (widget!.transaction!.isRemovedPoints) {
                        if ((FFAppState().currentTeamMember.memberRole ==
                                AccessRole.Owner) ||
                            (FFAppState().currentTeamMember.memberRole ==
                                AccessRole.Manager) ||
                            (FFAppState().currentTeamMember == null)) {
                          logFirebaseEvent('Button_bottom_sheet');
                          Navigator.pop(context);
                          logFirebaseEvent('Button_backend_call');

                          await widget!.transaction!.cardReferrence!.update({
                            ...mapToFirestore(
                              {
                                'CurrentPoints': FieldValue.increment(
                                    widget!.transaction!.pointsUsed),
                              },
                            ),
                          });
                          logFirebaseEvent('Button_firestore_query');
                          _model.userCard = await queryUserCardsRecordOnce(
                            parent: widget!.transaction?.ownerReferrence,
                            queryBuilder: (userCardsRecord) =>
                                userCardsRecord.where(
                              'CardStringID',
                              isEqualTo: widget!.transaction?.cardId,
                            ),
                            singleRecord: true,
                          ).then((s) => s.firstOrNull);
                          logFirebaseEvent('Button_backend_call');

                          await _model.userCard!.reference.update({
                            ...mapToFirestore(
                              {
                                'CurrentPoints': FieldValue.increment(
                                    widget!.transaction!.pointsUsed),
                              },
                            ),
                          });
                          logFirebaseEvent('Button_backend_call');

                          await widget!.transaction!.reference
                              .update(createTransactionsRecordData(
                            isConfirmed: true,
                            branchName: FFAppState().currentBranchName,
                            branchReferrence: FFAppState().currentBranch,
                            confirmationDate: getCurrentTimestamp,
                          ));
                          logFirebaseEvent('Button_backend_call');

                          await UserTransactionsRecord.createDoc(
                                  widget!.transaction!.ownerReferrence!)
                              .set(createUserTransactionsRecordData(
                            cardOwner: widget!.transaction?.cardOwner,
                            pointsUsed: widget!.transaction?.pointsUsed,
                            cardId: widget!.transaction?.cardId,
                            transactionID: widget!.transaction?.transactionID,
                            datetime: widget!.transaction?.datetime,
                            isConfirmed: true,
                            isPointsAdded: false,
                            ownerReferrence:
                                widget!.transaction?.ownerReferrence,
                            isRemovedPoints: true,
                            confirmationDate: getCurrentTimestamp,
                            branchName: widget!.transaction?.branchName,
                            branchID: widget!.transaction?.branchID,
                            branchReferrence:
                                widget!.transaction?.branchReferrence,
                            storeReferrence:
                                widget!.transaction?.storeReferrence,
                            teamMember: updateTeamMemberAccessRolesStruct(
                              widget!.transaction?.teamMember,
                              clearUnsetFields: false,
                              create: true,
                            ),
                          ));
                          logFirebaseEvent('Button_trigger_push_notification');
                          triggerPushNotification(
                            notificationTitle: 'Redeem Confirmed!',
                            notificationText:
                                '${widget!.transaction?.redeemedItemName} redemption is now confirmed by the store! 🎉',
                            notificationSound: 'default',
                            userRefs: [widget!.transaction!.ownerReferrence!],
                            initialPageName: 'auth_4_Home',
                            parameterData: {},
                          );
                          logFirebaseEvent('Button_backend_call');
                          unawaited(
                            () async {
                              await PushNotificationHistoryRecord.collection
                                  .doc()
                                  .set({
                                ...createPushNotificationHistoryRecordData(
                                  notificationText:
                                      '${widget!.transaction?.redeemedItemName} redemption is now confirmed by the store! 🎉',
                                  notificationTitle: 'Redeem Confirmed!',
                                  sender: currentUserReference,
                                  timestamp: getCurrentTimestamp,
                                ),
                                ...mapToFirestore(
                                  {
                                    'receiver_user_refs': [
                                      widget!.transaction?.ownerReferrence
                                    ],
                                  },
                                ),
                              });
                            }(),
                          );
                        } else {
                          logFirebaseEvent('Button_alert_dialog');
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return WebViewAware(
                                child: AlertDialog(
                                  title: Text('Access Denied'),
                                  content: Text(
                                      'Only owner/manager can confirm deduction of points.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      } else {
                        logFirebaseEvent('Button_bottom_sheet');
                        Navigator.pop(context);
                        logFirebaseEvent('Button_backend_call');

                        await widget!.transaction!.reference
                            .update(createTransactionsRecordData(
                          isConfirmed: true,
                          branchName: FFAppState().currentBranchName,
                          branchReferrence: FFAppState().currentBranch,
                          confirmationDate: getCurrentTimestamp,
                        ));
                        logFirebaseEvent('Button_firestore_query');
                        _model.userTransaction =
                            await queryUserTransactionsRecordOnce(
                          parent: widget!.transaction?.ownerReferrence,
                          queryBuilder: (userTransactionsRecord) =>
                              userTransactionsRecord.where(
                            'transactionID',
                            isEqualTo: widget!.transaction?.transactionID,
                          ),
                          singleRecord: true,
                        ).then((s) => s.firstOrNull);
                        logFirebaseEvent('Button_backend_call');

                        await _model.userTransaction!.reference
                            .update(createUserTransactionsRecordData(
                          isConfirmed: true,
                          branchName: FFAppState().currentBranchName,
                          branchReferrence: FFAppState().currentBranch,
                          confirmationDate: getCurrentTimestamp,
                        ));
                        logFirebaseEvent('Button_trigger_push_notification');
                        triggerPushNotification(
                          notificationTitle: 'Redeem Confirmed!',
                          notificationText:
                              '${widget!.transaction?.redeemedItemName} redemption is now confirmed by the store! 🎉',
                          notificationSound: 'default',
                          userRefs: [widget!.transaction!.ownerReferrence!],
                          initialPageName: 'auth_4_Home',
                          parameterData: {},
                        );
                      }
                    }
                  }

                  safeSetState(() {});
                },
                text: () {
                  if (widget!.transaction!.isConfirmed) {
                    return 'Confirmed';
                  } else if (widget!.transaction!.isRemovedPoints) {
                    return 'Confirm Deduction';
                  } else {
                    return 'Confirm Redeem';
                  }
                }(),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 80.0,
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 32.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: valueOrDefault<Color>(
                    widget!.transaction!.isConfirmed
                        ? Color(0xFF36D2C0)
                        : FlutterFlowTheme.of(context).primary,
                    FlutterFlowTheme.of(context).primary,
                  ),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.readexPro(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                        color: Colors.white,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 0.0,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
