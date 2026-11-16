import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:styled_divider/styled_divider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_voucher_detail_model.dart';
export 'user_voucher_detail_model.dart';

/// create an component for voucher preview
class UserVoucherDetailWidget extends StatefulWidget {
  const UserVoucherDetailWidget({
    super.key,
    required this.currentVoucher,
    required this.storeVoucher,
  });

  final UserVouchersRecord? currentVoucher;
  final VoucherRecord? storeVoucher;

  @override
  State<UserVoucherDetailWidget> createState() =>
      _UserVoucherDetailWidgetState();
}

class _UserVoucherDetailWidgetState extends State<UserVoucherDetailWidget> {
  late UserVoucherDetailModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserVoucherDetailModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('USER_VOUCHER_DETAIL_UserVoucherDetail_ON');
      logFirebaseEvent('UserVoucherDetail_firestore_query');
      _model.currentUserVouchers = await queryUserVouchersRecordOnce(
        parent: currentUserReference,
      );
      if (_model.currentUserVouchers!
              .where(
                  (e) => e.storeVoucherRef == widget!.currentVoucher?.reference)
              .toList()
              .length >
          0) {
        logFirebaseEvent('UserVoucherDetail_update_component_state');
        _model.isClaimed = true;
        safeSetState(() {});
      } else {
        logFirebaseEvent('UserVoucherDetail_update_component_state');
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
              crossAxisAlignment: CrossAxisAlignment.center,
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
                                  widget!.storeVoucher!.title,
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
                                  widget!.storeVoucher!.description,
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
                        widget!.storeVoucher?.validUntil,
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
                Stack(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  children: [
                    Container(
                      width: 150.0,
                      height: 150.0,
                      child: custom_widgets.QRWithPhoto(
                        width: 150.0,
                        height: 150.0,
                        cardID: widget!.currentVoucher!.reference.path,
                        qrColor: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                    if ((widget!.currentVoucher?.isClaimed == true) ||
                        (widget!.storeVoucher!.validUntil! <=
                            getCurrentTimestamp))
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 10.0,
                              sigmaY: 10.0,
                            ),
                            child: Visibility(
                              visible:
                                  (widget!.currentVoucher?.isClaimed == true) ||
                                      (widget!.storeVoucher!.validUntil! <=
                                          getCurrentTimestamp),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 16.0),
                                child: Text(
                                  widget!.storeVoucher!.validUntil! <=
                                          getCurrentTimestamp
                                      ? 'Expired'
                                      : 'Redeemed',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .override(
                                        font: GoogleFonts.outfit(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .headlineLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineLarge
                                                  .fontStyle,
                                        ),
                                        color: widget!.storeVoucher!
                                                    .validUntil! <=
                                                getCurrentTimestamp
                                            ? FlutterFlowTheme.of(context).error
                                            : FlutterFlowTheme.of(context)
                                                .primary,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .headlineLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineLarge
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                Text(
                  FFLocalizations.of(context).getText(
                    's1uwqme9' /* Show this QR Code to cashier t... */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.readexPro(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
