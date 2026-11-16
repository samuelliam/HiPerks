import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/redeem_confirmation_widget.dart';
import '/components/redeem_fail_widget.dart';
import '/components/redeem_success_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'member_redeemable_details_model.dart';
export 'member_redeemable_details_model.dart';

class MemberRedeemableDetailsWidget extends StatefulWidget {
  const MemberRedeemableDetailsWidget({
    super.key,
    required this.redeemableItem,
    required this.userCard,
    required this.storeCard,
    required this.userReferrence,
  });

  final RedeemablesRecord? redeemableItem;
  final UserCardsRecord? userCard;
  final StoreCardsRecord? storeCard;
  final DocumentReference? userReferrence;

  @override
  State<MemberRedeemableDetailsWidget> createState() =>
      _MemberRedeemableDetailsWidgetState();
}

class _MemberRedeemableDetailsWidgetState
    extends State<MemberRedeemableDetailsWidget> {
  late MemberRedeemableDetailsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MemberRedeemableDetailsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
      child: Container(
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
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('MEMBER_REDEEMABLE_DETAILS_Container_qfa3');
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
            Flexible(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'MEMBER_REDEEMABLE_DETAILS_Image_g4wyk8jp');
                          logFirebaseEvent('Image_expand_image');
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              child: FlutterFlowExpandedImageView(
                                image: Image.network(
                                  widget!.redeemableItem!.itemImage,
                                  fit: BoxFit.contain,
                                ),
                                allowRotation: false,
                                tag: widget!.redeemableItem!.itemImage,
                                useHeroAnimation: true,
                              ),
                            ),
                          );
                        },
                        child: Hero(
                          tag: widget!.redeemableItem!.itemImage,
                          transitionOnUserGestures: true,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              widget!.redeemableItem!.itemImage,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              widget!.redeemableItem?.itemName,
                              '-',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  font: GoogleFonts.outfit(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontStyle,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            valueOrDefault<String>(
                              widget!.redeemableItem?.itemDescription,
                              '-',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
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
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Builder(
                      builder: (context) => FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'MEMBER_REDEEMABLE_DETAILS_REDEEM_BTN_ON_');
                          var _shouldSetState = false;
                          if (widget!.redeemableItem!.pointsCost <=
                              widget!.userCard!.currentPoints) {
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
                                    child: Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.7,
                                      child: RedeemConfirmationWidget(
                                        currentRedeemable:
                                            widget!.redeemableItem!,
                                        didRedeem: () async {
                                          logFirebaseEvent('_backend_call');

                                          await widget!.userCard!.reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'CurrentPoints':
                                                    FieldValue.increment(
                                                        -(widget!
                                                            .redeemableItem!
                                                            .pointsCost)),
                                              },
                                            ),
                                          });
                                          logFirebaseEvent('_backend_call');

                                          await widget!.storeCard!.reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'CurrentPoints':
                                                    FieldValue.increment(
                                                        -(widget!
                                                            .redeemableItem!
                                                            .pointsCost)),
                                              },
                                            ),
                                          });
                                          logFirebaseEvent('_custom_action');
                                          _model.generatedID =
                                              await actions.generateID10Char();
                                          logFirebaseEvent('_backend_call');

                                          var transactionsRecordReference =
                                              TransactionsRecord.createDoc(
                                                  widget!.storeCard!
                                                      .storeReferrence!);
                                          await transactionsRecordReference
                                              .set(createTransactionsRecordData(
                                            cardReferrence:
                                                widget!.storeCard?.reference,
                                            cardOwner: currentUserDisplayName,
                                            redeemedItemReferrence: widget!
                                                .redeemableItem?.reference,
                                            pointsUsed: widget!
                                                .redeemableItem?.pointsCost,
                                            cardId:
                                                widget!.userCard?.cardStringID,
                                            datetime: getCurrentTimestamp,
                                            ownerReferrence:
                                                currentUserReference,
                                            redeemedItemName: widget!
                                                .redeemableItem?.itemName,
                                            isPointsAdded: false,
                                            isConfirmed: false,
                                            transactionID: _model.generatedID,
                                            storeReferrence: widget!
                                                .storeCard?.storeReferrence,
                                          ));
                                          _model.redeemDetailStoreTransaction =
                                              TransactionsRecord.getDocumentFromData(
                                                  createTransactionsRecordData(
                                                    cardReferrence: widget!
                                                        .storeCard?.reference,
                                                    cardOwner:
                                                        currentUserDisplayName,
                                                    redeemedItemReferrence:
                                                        widget!.redeemableItem
                                                            ?.reference,
                                                    pointsUsed: widget!
                                                        .redeemableItem
                                                        ?.pointsCost,
                                                    cardId: widget!
                                                        .userCard?.cardStringID,
                                                    datetime:
                                                        getCurrentTimestamp,
                                                    ownerReferrence:
                                                        currentUserReference,
                                                    redeemedItemName: widget!
                                                        .redeemableItem
                                                        ?.itemName,
                                                    isPointsAdded: false,
                                                    isConfirmed: false,
                                                    transactionID:
                                                        _model.generatedID,
                                                    storeReferrence: widget!
                                                        .storeCard
                                                        ?.storeReferrence,
                                                  ),
                                                  transactionsRecordReference);
                                          logFirebaseEvent('_backend_call');

                                          await UserTransactionsRecord
                                                  .createDoc(
                                                      currentUserReference!)
                                              .set(
                                                  createUserTransactionsRecordData(
                                            cardOwner: currentUserDisplayName,
                                            redeemedItemReferrence: widget!
                                                .redeemableItem?.reference,
                                            pointsUsed: widget!
                                                .redeemableItem?.pointsCost,
                                            cardId:
                                                widget!.userCard?.cardStringID,
                                            userCard:
                                                widget!.userCard?.reference,
                                            redeemedItemName: widget!
                                                .redeemableItem?.itemName,
                                            datetime: _model
                                                .redeemDetailStoreTransaction
                                                ?.datetime,
                                            ownerReferrence:
                                                currentUserReference,
                                            isPointsAdded: false,
                                            isConfirmed: false,
                                            transactionID: _model.generatedID,
                                            storeReferrence: widget!
                                                .storeCard?.storeReferrence,
                                          ));
                                          logFirebaseEvent(
                                              '_trigger_push_notification');
                                          triggerPushNotification(
                                            notificationTitle: 'Hi Brew!',
                                            notificationText:
                                                '${currentUserDisplayName} just redeemed ${widget!.redeemableItem?.itemName} with ⭐️ ${widget!.redeemableItem?.pointsCost?.toString()} points.  Tap for more info.',
                                            notificationSound: 'default',
                                            userRefs: [widget!.userReferrence!],
                                            initialPageName: 'auth_4_Home',
                                            parameterData: {},
                                          );
                                          logFirebaseEvent(
                                              '_close_dialog_drawer_etc');
                                          Navigator.pop(context);
                                          logFirebaseEvent('_dismiss_dialog');
                                          Navigator.pop(context);
                                          logFirebaseEvent('_alert_dialog');
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: WebViewAware(
                                                  child: RedeemSuccessWidget(
                                                    itemName: widget!
                                                        .redeemableItem!
                                                        .itemName,
                                                    pointsUsed: widget!
                                                        .redeemableItem!
                                                        .pointsCost,
                                                  ),
                                                ),
                                              );
                                            },
                                          );

                                          logFirebaseEvent('_backend_call');
                                          _model.currentStore =
                                              await StoresRecord
                                                  .getDocumentOnce(widget!
                                                      .storeCard!
                                                      .storeReferrence!);
                                          logFirebaseEvent('_backend_call');
                                          unawaited(
                                            () async {
                                              await PushNotificationHistoryRecord
                                                  .collection
                                                  .doc()
                                                  .set({
                                                ...createPushNotificationHistoryRecordData(
                                                  notificationTitle:
                                                      'Hi ${_model.currentStore?.storeName}! ',
                                                  notificationText:
                                                      '${currentUserDisplayName} redeemed ${widget!.redeemableItem?.itemName} with ⭐️${widget!.redeemableItem?.pointsCost?.toString()} points. Tap for more info.',
                                                  sender: currentUserReference,
                                                  timestamp:
                                                      getCurrentTimestamp,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'receiver_user_refs': [
                                                      widget!.userReferrence
                                                    ],
                                                  },
                                                ),
                                              });
                                            }(),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          } else {
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
                                    child: RedeemFailWidget(),
                                  ),
                                );
                              },
                            );

                            if (_shouldSetState) safeSetState(() {});
                            return;
                          }

                          if (_shouldSetState) safeSetState(() {});
                        },
                        text:
                            'Redeem ⭐️${widget!.redeemableItem?.pointsCost?.toString()}',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context)
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
                                color: FlutterFlowTheme.of(context).alternate,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ].divide(SizedBox(width: 16.0)).around(SizedBox(width: 16.0)),
              ),
            ),
          ].divide(SizedBox(height: 8.0)),
        ),
      ),
    );
  }
}
