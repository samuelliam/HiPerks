import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/user_voucher_detail_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/random_data_util.dart' as random_data;
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
import 'claim_voucher_component_model.dart';
export 'claim_voucher_component_model.dart';

/// create an component for voucher preview
class ClaimVoucherComponentWidget extends StatefulWidget {
  const ClaimVoucherComponentWidget({
    super.key,
    required this.currentVoucher,
  });

  final VoucherRecord? currentVoucher;

  @override
  State<ClaimVoucherComponentWidget> createState() =>
      _ClaimVoucherComponentWidgetState();
}

class _ClaimVoucherComponentWidgetState
    extends State<ClaimVoucherComponentWidget> {
  late ClaimVoucherComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClaimVoucherComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CLAIM_VOUCHER_COMPONENT_ClaimVoucherComp');
      logFirebaseEvent('ClaimVoucherComponent_firestore_query');
      _model.currentUserVouchers = await queryUserVouchersRecordOnce(
        parent: currentUserReference,
      );
      if (_model.currentUserVouchers!
              .where(
                  (e) => e.storeVoucherRef == widget!.currentVoucher?.reference)
              .toList()
              .length >
          0) {
        logFirebaseEvent('ClaimVoucherComponent_update_component_s');
        _model.isClaimed = true;
        safeSetState(() {});
      } else {
        logFirebaseEvent('ClaimVoucherComponent_update_component_s');
        _model.isClaimed = false;
        safeSetState(() {});
      }
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      alignment: AlignmentDirectional(0.0, -1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 700.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).alternate,
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  widget!.currentVoucher!.title,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        font: GoogleFonts.outfit(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
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
                              Flexible(
                                child: Text(
                                  widget!.currentVoucher!.description,
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
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 0.0, 8.0),
                        child: Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).accent2,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Icon(
                            Icons.local_offer,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 28.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                StyledDivider(
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).primaryText,
                  lineStyle: DividerLineStyle.dashed,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Valid Until ${dateTimeFormat(
                        "yMMMd",
                        widget!.currentVoucher?.validUntil,
                        locale: FFLocalizations.of(context).languageCode,
                      )}',
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            font: GoogleFonts.readexPro(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .fontStyle,
                          ),
                    ),
                  ].divide(SizedBox(height: 4.0)),
                ),
                Builder(
                  builder: (context) => FFButtonWidget(
                    onPressed: () {
                      if (widget!.currentVoucher!.stock <=
                          widget!.currentVoucher!.userVouchers.length) {
                        return true;
                      } else if (getCurrentTimestamp >=
                          widget!.currentVoucher!.validUntil!) {
                        return true;
                      } else {
                        return false;
                      }
                    }()
                        ? null
                        : () async {
                            logFirebaseEvent(
                                'CLAIM_VOUCHER_COMPONENT_Button_9qirkmvv_');
                            if ((widget!.currentVoucher!.stock >
                                    widget!
                                        .currentVoucher!.userVouchers.length) &&
                                (valueOrDefault<bool>(
                                        currentUserDocument?.isBusinessAccount,
                                        false) ==
                                    false)) {
                              if (_model.currentUserVouchers!
                                      .where((e) =>
                                          e.storeVoucherRef ==
                                          widget!.currentVoucher?.reference)
                                      .toList()
                                      .length >
                                  0) {
                                logFirebaseEvent(
                                    'Button_update_component_state');
                                _model.isClaimed = true;
                                safeSetState(() {});
                                logFirebaseEvent('Button_firestore_query');
                                _model.claimedUserVoucherReTap =
                                    await queryUserVouchersRecordOnce(
                                  parent: currentUserReference,
                                  queryBuilder: (userVouchersRecord) =>
                                      userVouchersRecord.where(
                                    'storeVoucherRef',
                                    isEqualTo:
                                        widget!.currentVoucher?.reference,
                                  ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);
                                logFirebaseEvent('Button_alert_dialog');
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: WebViewAware(
                                        child: UserVoucherDetailWidget(
                                          currentVoucher:
                                              _model.claimedUserVoucherReTap!,
                                          storeVoucher: widget!.currentVoucher!,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              } else {
                                if (getCurrentTimestamp <=
                                    widget!.currentVoucher!.validUntil!) {
                                  if (_model.isClaimed) {
                                    logFirebaseEvent('Button_firestore_query');
                                    _model.claimedUserVoucher =
                                        await queryUserVouchersRecordOnce(
                                      parent: currentUserReference,
                                      queryBuilder: (userVouchersRecord) =>
                                          userVouchersRecord.where(
                                        'storeVoucherRef',
                                        isEqualTo:
                                            widget!.currentVoucher?.reference,
                                      ),
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);
                                    logFirebaseEvent('Button_alert_dialog');
                                    await showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: WebViewAware(
                                            child: UserVoucherDetailWidget(
                                              currentVoucher:
                                                  _model.claimedUserVoucher!,
                                              storeVoucher:
                                                  widget!.currentVoucher!,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  } else {
                                    logFirebaseEvent('Button_backend_call');

                                    var userVouchersRecordReference =
                                        UserVouchersRecord.createDoc(
                                            currentUserReference!);
                                    await userVouchersRecordReference
                                        .set(createUserVouchersRecordData(
                                      storeVoucherRef:
                                          widget!.currentVoucher?.reference,
                                      storeRef: widget!
                                          .currentVoucher?.storeReferrence,
                                      voucherID: random_data.randomString(
                                        8,
                                        8,
                                        true,
                                        false,
                                        true,
                                      ),
                                      addedDate: getCurrentTimestamp,
                                      isClaimed: false,
                                    ));
                                    _model.currentUserVoucher =
                                        UserVouchersRecord.getDocumentFromData(
                                            createUserVouchersRecordData(
                                              storeVoucherRef: widget!
                                                  .currentVoucher?.reference,
                                              storeRef: widget!.currentVoucher
                                                  ?.storeReferrence,
                                              voucherID:
                                                  random_data.randomString(
                                                8,
                                                8,
                                                true,
                                                false,
                                                true,
                                              ),
                                              addedDate: getCurrentTimestamp,
                                              isClaimed: false,
                                            ),
                                            userVouchersRecordReference);
                                    logFirebaseEvent('Button_backend_call');

                                    await widget!.currentVoucher!.reference
                                        .update({
                                      ...mapToFirestore(
                                        {
                                          'userVouchers':
                                              FieldValue.arrayUnion([
                                            _model.currentUserVoucher?.reference
                                          ]),
                                        },
                                      ),
                                    });
                                    logFirebaseEvent(
                                        'Button_update_component_state');
                                    _model.isClaimed = true;
                                    safeSetState(() {});
                                    logFirebaseEvent('Button_haptic_feedback');
                                    HapticFeedback.selectionClick();
                                    logFirebaseEvent('Button_show_snack_bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Voucher Claimed! 🎉',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                    logFirebaseEvent('Button_alert_dialog');
                                    await showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: WebViewAware(
                                            child: UserVoucherDetailWidget(
                                              currentVoucher:
                                                  _model.currentUserVoucher!,
                                              storeVoucher:
                                                  widget!.currentVoucher!,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  }
                                }
                              }
                            }

                            safeSetState(() {});
                          },
                    text: () {
                      if (_model.isClaimed) {
                        return 'View Voucher';
                      } else if (getCurrentTimestamp >=
                          widget!.currentVoucher!.validUntil!) {
                        return 'Expired';
                      } else if (widget!.currentVoucher!.stock <=
                          widget!.currentVoucher!.userVouchers.length) {
                        return 'Fully redeemed';
                      } else {
                        return 'Claim';
                      }
                    }(),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 50.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: () {
                        if (_model.isClaimed) {
                          return FlutterFlowTheme.of(context).success;
                        } else if (getCurrentTimestamp >=
                            widget!.currentVoucher!.validUntil!) {
                          return FlutterFlowTheme.of(context).error;
                        } else if (widget!.currentVoucher!.stock <=
                            widget!.currentVoucher!.userVouchers.length) {
                          return FlutterFlowTheme.of(context).secondaryText;
                        } else {
                          return FlutterFlowTheme.of(context).primary;
                        }
                      }(),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                font: GoogleFonts.readexPro(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                                color: Colors.white,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(12.0),
                      disabledColor: FlutterFlowTheme.of(context).secondaryText,
                      disabledTextColor:
                          FlutterFlowTheme.of(context).primaryText,
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 12.0)),
            ),
          ),
        ),
      ),
    );
  }
}
