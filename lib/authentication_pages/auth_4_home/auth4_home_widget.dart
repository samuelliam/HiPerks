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
import 'auth4_home_model.dart';
export 'auth4_home_model.dart';

class Auth4HomeWidget extends StatefulWidget {
  const Auth4HomeWidget({super.key});

  static String routeName = 'auth_4_Home';
  static String routePath = 'Home';

  @override
  State<Auth4HomeWidget> createState() => _Auth4HomeWidgetState();
}

class _Auth4HomeWidgetState extends State<Auth4HomeWidget>
    with TickerProviderStateMixin {
  late Auth4HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Auth4HomeModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'auth_4_Home'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('AUTH_4_HOME_auth_4_Home_ON_INIT_STATE');
      if (valueOrDefault<bool>(currentUserDocument?.isBusinessAccount, false) ==
          true) {
        if (currentUserDocument?.store != null) {
          await Future.wait([
            Future(() async {
              logFirebaseEvent('auth_4_Home_firestore_query');
              _model.allTransactionsOnLoad = await queryTransactionsRecordOnce(
                parent: currentUserDocument?.store,
              );
              logFirebaseEvent('auth_4_Home_update_app_state');
              FFAppState().totalPointsGiven = valueOrDefault<int>(
                functions
                    .computeTotalPoints(_model.allTransactionsOnLoad?.toList()),
                0,
              );
              safeSetState(() {});
              return;
            }),
            Future(() async {
              logFirebaseEvent('auth_4_Home_revenue_cat');
              final isEntitled =
                  await revenue_cat.isEntitled('BrewPerksBusiness') ?? false;
              if (!isEntitled) {
                await revenue_cat.loadOfferings();
              }

              if (isEntitled) {
                logFirebaseEvent('auth_4_Home_backend_call');

                await currentUserDocument!.store!.update(createStoresRecordData(
                  isSubscribed: true,
                ));
              } else {
                logFirebaseEvent('auth_4_Home_revenue_cat');
                final isEntitled =
                    await revenue_cat.isEntitled('BrewPerksBusinessElite') ??
                        false;
                if (!isEntitled) {
                  await revenue_cat.loadOfferings();
                }

                if (isEntitled) {
                  logFirebaseEvent('auth_4_Home_backend_call');

                  await currentUserDocument!.store!
                      .update(createStoresRecordData(
                    isSubscribed: true,
                  ));
                } else {
                  logFirebaseEvent('auth_4_Home_backend_call');

                  await currentUserDocument!.store!
                      .update(createStoresRecordData(
                    isSubscribed: false,
                  ));
                  logFirebaseEvent('auth_4_Home_bottom_sheet');
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return WebViewAware(
                        child: GestureDetector(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          child: Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: PaywallComponentWidget(
                              initialTabIndex: 0,
                            ),
                          ),
                        ),
                      );
                    },
                  ).then((value) => safeSetState(() {}));
                }

                return;
              }

              return;
            }),
          ]);
        } else {
          logFirebaseEvent('auth_4_Home_navigate_to');

          context.goNamed(Auth4OnboardingCompanyDetailsWidget.routeName);

          return;
        }
      } else {
        if (!(currentUserDisplayName != null && currentUserDisplayName != '')) {
          logFirebaseEvent('auth_4_Home_navigate_to');

          context.goNamed(
            Auth4OnboardingUserDetailsWidget.routeName,
            queryParameters: {
              'index': serializeParam(
                0,
                ParamType.int,
              ),
            }.withoutNulls,
          );
        }
        return;
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.698, 0),
            end: Offset(0, 0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.698, 0),
            end: Offset(0, 0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(115.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: PopScope(
        canPop: false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          floatingActionButton: Visibility(
            visible: valueOrDefault<bool>(
                currentUserDocument?.isBusinessAccount, false),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 70.0),
              child: AuthUserStreamWidget(
                builder: (context) => FloatingActionButton.extended(
                  onPressed: () async {
                    logFirebaseEvent(
                        'AUTH_4_HOME_FloatingActionButton_g8arq00');
                    logFirebaseEvent(
                        'FloatingActionButton_request_permissions');
                    await requestPermission(cameraPermission);
                    logFirebaseEvent(
                        'FloatingActionButton_scan_barcode_q_r_co');
                    _model.scannedQR = await FlutterBarcodeScanner.scanBarcode(
                      '#C62828', // scanning line color
                      FFLocalizations.of(context).getText(
                        'gz6diow4' /* Cancel */,
                      ), // cancel button text
                      true, // whether to show the torch (camera LED) toggle icon
                      ScanMode.QR,
                    );

                    logFirebaseEvent('FloatingActionButton_firestore_query');
                    _model.scannedStoreCard = await queryStoreCardsRecordOnce(
                      parent: currentUserDocument?.store,
                      queryBuilder: (storeCardsRecord) =>
                          storeCardsRecord.where(
                        'CardStringID',
                        isEqualTo: _model.scannedQR,
                      ),
                      singleRecord: true,
                    ).then((s) => s.firstOrNull);
                    if (_model.scannedStoreCard != null) {
                      logFirebaseEvent('FloatingActionButton_firestore_query');
                      _model.scannedusercard = await queryUserCardsRecordOnce(
                        parent: _model.scannedStoreCard?.cardOwner,
                        queryBuilder: (userCardsRecord) =>
                            userCardsRecord.where(
                          'StoreReferrence',
                          isEqualTo: currentUserDocument?.store,
                        ),
                        singleRecord: true,
                      ).then((s) => s.firstOrNull);
                      if (_model.scannedusercard != null) {
                        logFirebaseEvent('FloatingActionButton_navigate_to');

                        context.pushNamed(
                          MemberDetailsWidget.routeName,
                          queryParameters: {
                            'userCard': serializeParam(
                              _model.scannedusercard,
                              ParamType.Document,
                            ),
                            'storeCard': serializeParam(
                              _model.scannedStoreCard,
                              ParamType.Document,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            'userCard': _model.scannedusercard,
                            'storeCard': _model.scannedStoreCard,
                          },
                        );
                      } else {
                        logFirebaseEvent('FloatingActionButton_alert_dialog');
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return WebViewAware(
                              child: AlertDialog(
                                title: Text('No Member Found'),
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
                      logFirebaseEvent('FloatingActionButton_firestore_query');
                      _model.redeemTransaction =
                          await queryTransactionsRecordOnce(
                        parent: currentUserDocument?.store,
                        queryBuilder: (transactionsRecord) =>
                            transactionsRecord.where(
                          'transactionID',
                          isEqualTo: _model.scannedQR,
                        ),
                        singleRecord: true,
                      ).then((s) => s.firstOrNull);
                      if (_model.redeemTransaction != null) {
                        if (_model.redeemTransaction!.isPreOrder) {
                          logFirebaseEvent('FloatingActionButton_bottom_sheet');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return WebViewAware(
                                child: GestureDetector(
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.7,
                                      child: OrderTransactionDetailsWidget(
                                        transaction: _model.redeemTransaction!,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        } else {
                          logFirebaseEvent('FloatingActionButton_bottom_sheet');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return WebViewAware(
                                child: GestureDetector(
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.7,
                                      child: TransactionDetailsWidget(
                                        transaction: _model.redeemTransaction!,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        }
                      } else {
                        logFirebaseEvent('FloatingActionButton_custom_action');
                        _model.scannedUserVoucher =
                            await actions.getUserVoucherDocument(
                          _model.scannedQR,
                        );
                        if (_model.scannedUserVoucher != null) {
                          logFirebaseEvent('FloatingActionButton_backend_call');
                          _model.userVoucher =
                              await UserVouchersRecord.getDocumentOnce(
                                  _model.scannedUserVoucher!);
                          logFirebaseEvent('FloatingActionButton_navigate_to');

                          context.pushNamed(
                            VoucherConfirmationWidget.routeName,
                            queryParameters: {
                              'userVoucherRef': serializeParam(
                                _model.scannedUserVoucher,
                                ParamType.DocumentReference,
                              ),
                              'storeVoucher': serializeParam(
                                _model.userVoucher?.storeVoucherRef,
                                ParamType.DocumentReference,
                              ),
                            }.withoutNulls,
                          );
                        } else {
                          logFirebaseEvent('FloatingActionButton_alert_dialog');
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return WebViewAware(
                                child: AlertDialog(
                                  title: Text('No Transaction Found'),
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
                      }
                    }

                    safeSetState(() {});
                  },
                  backgroundColor: FlutterFlowTheme.of(context).primaryText,
                  icon: Icon(
                    Icons.qr_code_scanner_rounded,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 15.0,
                  ),
                  elevation: 8.0,
                  label: Text(
                    FFLocalizations.of(context).getText(
                      'y49bxvzn' /* Scan QR */,
                    ),
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          font: GoogleFonts.readexPro(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).alternate,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontStyle,
                        ),
                  ),
                ),
              ),
            ),
          ),
          endDrawer: Drawer(
            elevation: 16.0,
            child: WebViewAware(
              child: Container(
                width: 320.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 16.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'wp536kee' /* Account Options */,
                                    ),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.readexPro(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 8.0, 12.0, 8.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'AUTH_4_HOME_PAGE_Row_vk2l79or_ON_TAP');
                                if (valueOrDefault<bool>(
                                    currentUserDocument?.isBusinessAccount,
                                    false)) {
                                  logFirebaseEvent('Row_backend_call');
                                  _model.currentStore =
                                      await StoresRecord.getDocumentOnce(
                                          currentUserDocument!.store!);
                                  logFirebaseEvent('Row_navigate_to');

                                  context.pushNamed(
                                    StoreDetailsWidget.routeName,
                                    pathParameters: {
                                      'storeID': serializeParam(
                                        _model.currentStore?.storeId,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                }

                                safeSetState(() {});
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 4.0, 0.0),
                                    child: Container(
                                      width: 40.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(2.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: Image.network(
                                              FFAppState()
                                                          .currentTeamMember
                                                          .hasMemberImage() ==
                                                      true
                                                  ? FFAppState()
                                                      .currentTeamMember
                                                      .memberImage
                                                  : currentUserPhoto,
                                              width: 37.0,
                                              height: 37.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 0.0, 0.0, 0.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => Text(
                                            FFAppState()
                                                        .currentTeamMember
                                                        .hasMemberName() ==
                                                    true
                                                ? FFAppState()
                                                    .currentTeamMember
                                                    .memberName
                                                : currentUserDisplayName,
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
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ),
                                      if (FFAppState()
                                              .currentTeamMember
                                              .hasMemberRole() ==
                                          true)
                                        Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          elevation: 4.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 2.0, 8.0, 2.0),
                                            child: Text(
                                              FFAppState()
                                                  .currentTeamMember
                                                  .memberRole
                                                  .name,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.readexPro(
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
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
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 1.0,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 16.0, 4.0),
                              child: Container(
                                width: double.infinity,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'AUTH_4_HOME_Container_h42c7kha_ON_TAP');
                                            logFirebaseEvent(
                                                'Container_set_dark_mode_settings');
                                            setDarkModeSetting(
                                                context, ThemeMode.light);
                                          },
                                          child: Container(
                                            width: 115.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.light
                                                  ? FlutterFlowTheme.of(context)
                                                      .secondaryBackground
                                                  : FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                color: Theme.of(context)
                                                            .brightness ==
                                                        Brightness.light
                                                    ? Color(0xFFE0E3E7)
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.wb_sunny_rounded,
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.light
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                  size: 16.0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'tjlhrsdl' /* Light Mode */,
                                                    ),
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .readexPro(
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: Theme.of(context)
                                                                          .brightness ==
                                                                      Brightness
                                                                          .light
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                              letterSpacing:
                                                                  0.0,
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
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'AUTH_4_HOME_Container_rak9fc76_ON_TAP');
                                            logFirebaseEvent(
                                                'Container_set_dark_mode_settings');
                                            setDarkModeSetting(
                                                context, ThemeMode.dark);
                                          },
                                          child: Container(
                                            width: 115.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? FlutterFlowTheme.of(context)
                                                      .secondaryBackground
                                                  : FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                color: Theme.of(context)
                                                            .brightness ==
                                                        Brightness.dark
                                                    ? Color(0xFFE0E3E7)
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.nightlight_round,
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                  size: 16.0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'w16w0d00' /* Dark Mode */,
                                                    ),
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .readexPro(
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: Theme.of(context)
                                                                          .brightness ==
                                                                      Brightness
                                                                          .dark
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                              letterSpacing:
                                                                  0.0,
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
                                                ),
                                              ],
                                            ),
                                          ),
                                        ).animateOnActionTrigger(
                                          animationsMap[
                                              'containerOnActionTriggerAnimation']!,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (!valueOrDefault<bool>(
                              currentUserDocument?.isBusinessAccount, false))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 8.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'AUTH_4_HOME_PAGE_convertComponent_ON_TAP');
                                    if (valueOrDefault<bool>(
                                        currentUserDocument?.isBusinessAccount,
                                        false)) {
                                      if ((FFAppState()
                                                  .currentTeamMember
                                                  .memberRole ==
                                              AccessRole.Owner) ||
                                          (FFAppState()
                                                  .currentTeamMember
                                                  .hasMemberRole() ==
                                              false)) {
                                        logFirebaseEvent(
                                            'convertComponent_navigate_to');

                                        context.pushNamed(
                                          UpdateCompanyDetailsWidget.routeName,
                                          queryParameters: {
                                            'index': serializeParam(
                                              0,
                                              ParamType.int,
                                            ),
                                          }.withoutNulls,
                                        );
                                      } else {
                                        logFirebaseEvent(
                                            'convertComponent_alert_dialog');
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                title: Text('Access Denied'),
                                                content: Text(
                                                    'You don\'t have the access for this feature'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      }
                                    } else {
                                      logFirebaseEvent(
                                          'convertComponent_navigate_to');

                                      context.pushNamed(
                                        UpdateUserDetailsWidget.routeName,
                                        queryParameters: {
                                          'index': serializeParam(
                                            0,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    }
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 150),
                                    curve: Curves.easeInOut,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Icon(
                                              Icons.person,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 20.0,
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'cr9t6cce' /* Update Profile */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font:
                                                          GoogleFonts.readexPro(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
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
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          if (!valueOrDefault<bool>(
                              currentUserDocument?.isBusinessAccount, false))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'AUTH_4_HOME_TransactionHistory_ON_TAP');
                                    logFirebaseEvent(
                                        'TransactionHistory_firestore_query');
                                    _model.transactionCount =
                                        await queryUserTransactionsRecordCount(
                                      parent: currentUserReference,
                                    );
                                    if (!valueOrDefault<bool>(
                                            currentUserDocument
                                                ?.isBusinessAccount,
                                            false) &&
                                        (_model.transactionCount! > 0)) {
                                      logFirebaseEvent(
                                          'TransactionHistory_navigate_to');

                                      context.pushNamed(
                                          UserTransactionHistoryWidget
                                              .routeName);
                                    } else {
                                      logFirebaseEvent(
                                          'TransactionHistory_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: Text('Transactions'),
                                              content: Text(
                                                  'No transactions made yet.'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    }

                                    safeSetState(() {});
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 150),
                                    curve: Curves.easeInOut,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Icon(
                                              Icons.list_alt,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 20.0,
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'wd4zk1qb' /* Transaction History */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font:
                                                          GoogleFonts.readexPro(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
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
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          if (valueOrDefault<bool>(
                              currentUserDocument?.isBusinessAccount, false))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'AUTH_4_HOME_PushNotificationMarketin_ON_');
                                    if (() {
                                      if (FFAppState().currentTeamMember ==
                                          null) {
                                        return true;
                                      } else if (FFAppState()
                                              .currentTeamMember
                                              .memberRole ==
                                          AccessRole.Owner) {
                                        return true;
                                      } else {
                                        return false;
                                      }
                                    }()) {
                                      logFirebaseEvent(
                                          'PushNotificationMarketin_navigate_to');

                                      context.pushNamed(
                                          PushNotificationFormWidget.routeName);
                                    } else {
                                      logFirebaseEvent(
                                          'PushNotificationMarketin_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: Text(
                                                  'You don\'t have access to this feature.'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    }
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 150),
                                    curve: Curves.easeInOut,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Icon(
                                              Icons.notification_add_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 20.0,
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '7vx6qiae' /* Push Notification Marketing */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font:
                                                          GoogleFonts.readexPro(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
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
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          if (valueOrDefault<bool>(
                              currentUserDocument?.isBusinessAccount, false))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'AUTH_4_HOME_PAGE_BranchSetting_ON_TAP');
                                    logFirebaseEvent(
                                        'BranchSetting_backend_call');
                                    _model.settingsCurrentStore =
                                        await StoresRecord.getDocumentOnce(
                                            currentUserDocument!.store!);
                                    if (() {
                                      if (!(_model.settingsCurrentStore!
                                          .teamMembers.isNotEmpty)) {
                                        return true;
                                      } else if (FFAppState()
                                              .currentTeamMember
                                              .memberRole ==
                                          AccessRole.Owner) {
                                        return true;
                                      } else {
                                        return false;
                                      }
                                    }()) {
                                      logFirebaseEvent(
                                          'BranchSetting_navigate_to');

                                      context.pushNamed(
                                          MainSettingsWidget.routeName);
                                    } else {
                                      logFirebaseEvent(
                                          'BranchSetting_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: Text('Access Denied'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    }

                                    safeSetState(() {});
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 150),
                                    curve: Curves.easeInOut,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Icon(
                                              Icons.store_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 20.0,
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'ul2oyuef' /* Business Settings */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font:
                                                          GoogleFonts.readexPro(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
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
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          if (!valueOrDefault<bool>(
                              currentUserDocument?.isBusinessAccount, false))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'AUTH_4_HOME_PAGE_convertComponent_ON_TAP');
                                    var _shouldSetState = false;
                                    logFirebaseEvent(
                                        'convertComponent_biometric_verification');
                                    final _localAuth = LocalAuthentication();
                                    bool _isBiometricSupported =
                                        await _localAuth.isDeviceSupported();

                                    if (_isBiometricSupported) {
                                      try {
                                        _model.isVerified =
                                            await _localAuth.authenticate(
                                                localizedReason:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                          'an5mih8n' /* Please authenticate to proceed... */,
                                        ));
                                      } on PlatformException {
                                        _model.isVerified = false;
                                      }
                                      safeSetState(() {});
                                    }

                                    _shouldSetState = true;
                                    if (_model.isVerified!) {
                                      if (valueOrDefault<bool>(
                                          currentUserDocument
                                              ?.isBusinessAccount,
                                          false)) {
                                        logFirebaseEvent(
                                            'convertComponent_alert_dialog');
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        title: Text(
                                                            'Delete Account'),
                                                        content: Text(
                                                            'Are you sure to request delete your business account ? '),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child:
                                                                Text('Cancel'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child:
                                                                Text('Confirm'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (confirmDialogResponse) {
                                          logFirebaseEvent(
                                              'convertComponent_backend_call');

                                          await BusinessAccountDeleteRequestRecord
                                              .collection
                                              .doc()
                                              .set(
                                                  createBusinessAccountDeleteRequestRecordData(
                                                email: currentUserEmail,
                                                businessName:
                                                    currentUserDisplayName,
                                                businessReferrence:
                                                    currentUserDocument?.store,
                                                accountReferrence:
                                                    currentUserReference,
                                              ));
                                          logFirebaseEvent(
                                              'convertComponent_alert_dialog');
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  title: Text(
                                                      'Deletion Requested'),
                                                  content: Text(
                                                      'Request is submitted for deletion. We will be reviewing it and send you an notification.'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                          logFirebaseEvent(
                                              'convertComponent_navigate_to');

                                          context.goNamed(
                                              Auth4WelcomeWidget.routeName);
                                        } else {
                                          logFirebaseEvent(
                                              'convertComponent_close_dialog_drawer_etc');
                                          Navigator.pop(context);
                                        }
                                      } else {
                                        logFirebaseEvent(
                                            'convertComponent_alert_dialog');
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        title: Text(
                                                            'Delete Account'),
                                                        content: Text(
                                                            'Are you sure to delete your account ? '),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child:
                                                                Text('Cancel'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child:
                                                                Text('Confirm'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (confirmDialogResponse) {
                                          logFirebaseEvent(
                                              'convertComponent_auth');
                                          await authManager.deleteUser(context);
                                          logFirebaseEvent(
                                              'convertComponent_navigate_to');

                                          context.goNamed(
                                              Auth4WelcomeWidget.routeName);
                                        } else {
                                          logFirebaseEvent(
                                              'convertComponent_close_dialog_drawer_etc');
                                          Navigator.pop(context);
                                        }
                                      }
                                    } else {
                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    }

                                    if (_shouldSetState) safeSetState(() {});
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 150),
                                    curve: Curves.easeInOut,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Icon(
                                              Icons.delete_forever_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 20.0,
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'f3r3eqy4' /* Delete Account */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font:
                                                          GoogleFonts.readexPro(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
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
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          if ((valueOrDefault<bool>(
                                      currentUserDocument?.isBusinessAccount,
                                      false) ==
                                  true) &&
                              (FFAppState().currentTeamMember.hasMemberRole() ==
                                  true))
                            AuthUserStreamWidget(
                              builder: (context) => InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'AUTH_4_HOME_PAGE_convertComponent_ON_TAP');
                                  logFirebaseEvent(
                                      'convertComponent_navigate_to');

                                  context.goNamed(
                                      TeamMemberSelectionWidget.routeName);
                                },
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 150),
                                  curve: Curves.easeInOut,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 0.0, 0.0),
                                          child: Icon(
                                            Icons.account_box,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 20.0,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '62qs7i16' /* Switch Account */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.readexPro(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          if (valueOrDefault<bool>(
                              currentUserDocument?.isBusinessAccount, false))
                            AuthUserStreamWidget(
                              builder: (context) => InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'AUTH_4_HOME_PAGE_convertComponent_ON_TAP');
                                  logFirebaseEvent(
                                      'convertComponent_navigate_to');

                                  context.pushNamed(WIkiPageWidget.routeName);
                                },
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 150),
                                  curve: Curves.easeInOut,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 0.0, 0.0),
                                          child: Icon(
                                            Icons.question_mark_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 20.0,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ngf93du4' /* Tips & Guides */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.readexPro(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          if (valueOrDefault<bool>(
                              currentUserDocument?.isBusinessAccount, false))
                            AuthUserStreamWidget(
                              builder: (context) => InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'AUTH_4_HOME_PAGE_convertComponent_ON_TAP');
                                  logFirebaseEvent(
                                      'convertComponent_navigate_to');

                                  context.pushNamed(
                                      FeatureSuggestionWidget.routeName);
                                },
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 150),
                                  curve: Curves.easeInOut,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 0.0, 0.0),
                                          child: Icon(
                                            Icons.fiber_new,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 20.0,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '2m7ia6vb' /* Feature Request */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.readexPro(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'AUTH_4_HOME_PAGE_convertComponent_ON_TAP');
                              logFirebaseEvent(
                                  'convertComponent_update_app_state');
                              FFAppState().currentBranch = null;
                              FFAppState().currentBranchName = '';
                              FFAppState().totalPointsGiven = 0;
                              FFAppState().currentTeamMember =
                                  TeamMemberAccessRolesStruct
                                      .fromSerializableMap(
                                          jsonDecode('{\"member_role\":\"\"}'));
                              FFAppState().Orders = [];
                              safeSetState(() {});
                              logFirebaseEvent('convertComponent_auth');
                              GoRouter.of(context).prepareAuthEvent();
                              await authManager.signOut();
                              GoRouter.of(context).clearRedirectLocation();

                              context.goNamedAuth(Auth4WelcomeWidget.routeName,
                                  context.mounted);
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 150),
                              curve: Curves.easeInOut,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                      child: Icon(
                                        Icons.login_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 20.0,
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '6mnn4h1m' /* Log out */,
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
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
          body: NestedScrollView(
            floatHeaderSlivers: false,
            headerSliverBuilder: (context, _) => [
              SliverAppBar(
                pinned: true,
                floating: false,
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                automaticallyImplyLeading: false,
                title: AuthUserStreamWidget(
                  builder: (context) => GradientText(
                    valueOrDefault<bool>(
                            currentUserDocument?.isBusinessAccount, false)
                        ? 'Hi Perks Business'
                        : 'Hi Perks',
                    style: FlutterFlowTheme.of(context).displaySmall.override(
                          font: GoogleFonts.outfit(
                            fontWeight: FlutterFlowTheme.of(context)
                                .displaySmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .displaySmall
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .displaySmall
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .displaySmall
                              .fontStyle,
                        ),
                    colors: [
                      FlutterFlowTheme.of(context).primary,
                      FlutterFlowTheme.of(context).secondary
                    ],
                    gradientDirection: GradientDirection.ltr,
                    gradientType: GradientType.linear,
                  ),
                ),
                actions: [
                  FlutterFlowIconButton(
                    borderRadius: 20.0,
                    borderWidth: 0.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.menu,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent('AUTH_4_HOME_PAGE_menu_ICN_ON_TAP');
                      logFirebaseEvent('IconButton_drawer');
                      scaffoldKey.currentState!.openEndDrawer();
                    },
                  ),
                ],
                centerTitle: false,
                elevation: 0.0,
              )
            ],
            body: Builder(
              builder: (context) {
                return Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(),
                        child: Builder(
                          builder: (context) {
                            if (!valueOrDefault<bool>(
                                currentUserDocument?.isBusinessAccount,
                                false)) {
                              return SingleChildScrollView(
                                controller: _model.columnController,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    StreamBuilder<List<UserVouchersRecord>>(
                                      stream: queryUserVouchersRecord(
                                        parent: currentUserReference,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: SpinKitRipple(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 50.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<UserVouchersRecord>
                                            containerUserVouchersRecordList =
                                            snapshot.data!;

                                        return Container(
                                          decoration: BoxDecoration(),
                                          child: Visibility(
                                            visible:
                                                containerUserVouchersRecordList
                                                    .isNotEmpty,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 8.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'AUTH_4_HOME_PAGE_Row_1nrytv3u_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Row_navigate_to');

                                                      context.pushNamed(
                                                          CustomerRedeemListPageWidget
                                                              .routeName);
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Flexible(
                                                          child: GradientText(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '6o4puu03' /* Vouchers */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .outfit(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontStyle,
                                                                ),
                                                            colors: [
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary
                                                            ],
                                                            gradientDirection:
                                                                GradientDirection
                                                                    .ltr,
                                                            gradientType:
                                                                GradientType
                                                                    .linear,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 0.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final containerVar =
                                                            containerUserVouchersRecordList
                                                                .toList();

                                                        return Container(
                                                          width:
                                                              double.infinity,
                                                          height: 200.0,
                                                          child: CarouselSlider
                                                              .builder(
                                                            itemCount:
                                                                containerVar
                                                                    .length,
                                                            itemBuilder: (context,
                                                                containerVarIndex,
                                                                _) {
                                                              final containerVarItem =
                                                                  containerVar[
                                                                      containerVarIndex];
                                                              return UserVoucherPreviewWidget(
                                                                key: Key(
                                                                    'Keysru_${containerVarIndex}_of_${containerVar.length}'),
                                                                voucher:
                                                                    containerVarItem,
                                                              );
                                                            },
                                                            carouselController:
                                                                _model.carouselController ??=
                                                                    CarouselSliderController(),
                                                            options:
                                                                CarouselOptions(
                                                              initialPage: max(
                                                                  0,
                                                                  min(
                                                                      0,
                                                                      containerVar
                                                                              .length -
                                                                          1)),
                                                              viewportFraction:
                                                                  0.85,
                                                              disableCenter:
                                                                  true,
                                                              enlargeCenterPage:
                                                                  true,
                                                              enlargeFactor:
                                                                  0.25,
                                                              enableInfiniteScroll:
                                                                  false,
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              autoPlay: true,
                                                              autoPlayAnimationDuration:
                                                                  Duration(
                                                                      milliseconds:
                                                                          800),
                                                              autoPlayInterval:
                                                                  Duration(
                                                                      milliseconds:
                                                                          (800 +
                                                                              4000)),
                                                              autoPlayCurve:
                                                                  Curves.linear,
                                                              pauseAutoPlayInFiniteScroll:
                                                                  false,
                                                              onPageChanged:
                                                                  (index, _) =>
                                                                      _model.carouselCurrentIndex =
                                                                          index,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    StreamBuilder<List<UserTransactionsRecord>>(
                                      stream: queryUserTransactionsRecord(
                                        parent: currentUserReference,
                                        queryBuilder:
                                            (userTransactionsRecord) =>
                                                userTransactionsRecord
                                                    .where(
                                                      'isPointsAdded',
                                                      isEqualTo: false,
                                                    )
                                                    .where(
                                                      'points_used',
                                                      isGreaterThan: 0,
                                                    ),
                                        limit: 5,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: SpinKitRipple(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 50.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<UserTransactionsRecord>
                                            containerUserTransactionsRecordList =
                                            snapshot.data!;

                                        return Container(
                                          decoration: BoxDecoration(),
                                          child: Visibility(
                                            visible:
                                                containerUserTransactionsRecordList
                                                    .isNotEmpty,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 8.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'AUTH_4_HOME_PAGE_Row_b9ume42w_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Row_navigate_to');

                                                      context.pushNamed(
                                                          CustomerRedeemListPageWidget
                                                              .routeName);
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Flexible(
                                                          child: GradientText(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '6r7sedzc' /* Redeems */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .outfit(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontStyle,
                                                                ),
                                                            colors: [
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary
                                                            ],
                                                            gradientDirection:
                                                                GradientDirection
                                                                    .ltr,
                                                            gradientType:
                                                                GradientType
                                                                    .linear,
                                                          ),
                                                        ),
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'h5pyi9cr' /* See All */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineLarge
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .outfit(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLarge
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLarge
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLarge
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(),
                                                  child: Visibility(
                                                    visible:
                                                        containerUserTransactionsRecordList
                                                            .isNotEmpty,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final containerVar =
                                                              containerUserTransactionsRecordList
                                                                  .sortedList(
                                                                      keyOf: (e) =>
                                                                          e.datetime!,
                                                                      desc: true)
                                                                  .toList();

                                                          return SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            controller: _model
                                                                .rowController1,
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: List.generate(
                                                                      containerVar
                                                                          .length,
                                                                      (containerVarIndex) {
                                                                final containerVarItem =
                                                                    containerVar[
                                                                        containerVarIndex];
                                                                return Container(
                                                                  width: 150.0,
                                                                  height: 150.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: StreamBuilder<
                                                                      RedeemablesRecord>(
                                                                    stream: RedeemablesRecord.getDocument(
                                                                        containerVarItem
                                                                            .redeemedItemReferrence!),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            child:
                                                                                SpinKitRipple(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 50.0,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }

                                                                      final cardRedeemablesRecord =
                                                                          snapshot
                                                                              .data!;

                                                                      return InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'AUTH_4_HOME_PAGE_Card_vjfgmmpw_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'Card_bottom_sheet');
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return WebViewAware(
                                                                                child: GestureDetector(
                                                                                  onTap: () {
                                                                                    FocusScope.of(context).unfocus();
                                                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                                                  },
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.viewInsetsOf(context),
                                                                                    child: Container(
                                                                                      height: MediaQuery.sizeOf(context).height * 0.9,
                                                                                      child: RedeemDetailsWidget(
                                                                                        currentTransaction: containerVarItem.reference,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              safeSetState(() {}));
                                                                        },
                                                                        child:
                                                                            Card(
                                                                          clipBehavior:
                                                                              Clip.antiAliasWithSaveLayer,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          elevation:
                                                                              4.0,
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Stack(
                                                                                children: [
                                                                                  ClipRRect(
                                                                                    borderRadius: BorderRadius.only(),
                                                                                    child: CachedNetworkImage(
                                                                                      fadeInDuration: Duration(milliseconds: 500),
                                                                                      fadeOutDuration: Duration(milliseconds: 500),
                                                                                      imageUrl: cardRedeemablesRecord.itemImage,
                                                                                      width: double.infinity,
                                                                                      height: 100.0,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                  Card(
                                                                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    elevation: 4.0,
                                                                                    shape: RoundedRectangleBorder(
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                                                                      child: Text(
                                                                                        containerVarItem.isConfirmed ? 'Confirmed' : 'Pending',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.readexPro(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              color: containerVarItem.isConfirmed ? Color(0xFF39D8C5) : Color(0xFFEA895E),
                                                                                              fontSize: 14.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Flexible(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                  child: AutoSizeText(
                                                                                    cardRedeemablesRecord.itemName,
                                                                                    minFontSize: 9.0,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.readexPro(
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          fontSize: 16.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                );
                                                              })
                                                                  .addToStart(
                                                                      SizedBox(
                                                                          width:
                                                                              8.0))
                                                                  .addToEnd(
                                                                      SizedBox(
                                                                          width:
                                                                              8.0)),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    StreamBuilder<List<UserTransactionsRecord>>(
                                      stream: queryUserTransactionsRecord(
                                        parent: currentUserReference,
                                        queryBuilder:
                                            (userTransactionsRecord) =>
                                                userTransactionsRecord
                                                    .where(
                                                      'isPreOrder',
                                                      isEqualTo: true,
                                                    )
                                                    .orderBy('datetime',
                                                        descending: true),
                                        limit: 5,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: SpinKitRipple(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 50.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<UserTransactionsRecord>
                                            containerUserTransactionsRecordList =
                                            snapshot.data!;

                                        return Container(
                                          decoration: BoxDecoration(),
                                          child: Visibility(
                                            visible:
                                                containerUserTransactionsRecordList
                                                    .isNotEmpty,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 8.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'AUTH_4_HOME_PAGE_Row_th49k3cc_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Row_navigate_to');

                                                      context.pushNamed(
                                                          CustomerOrdersListPageWidget
                                                              .routeName);
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Flexible(
                                                          child: GradientText(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'qc0a7het' /* Orders */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .outfit(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontStyle,
                                                                ),
                                                            colors: [
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary
                                                            ],
                                                            gradientDirection:
                                                                GradientDirection
                                                                    .ltr,
                                                            gradientType:
                                                                GradientType
                                                                    .linear,
                                                          ),
                                                        ),
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '7p2hpf30' /* See All */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineLarge
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .outfit(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLarge
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLarge
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLarge
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(),
                                                  child: Visibility(
                                                    visible:
                                                        containerUserTransactionsRecordList
                                                            .isNotEmpty,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final userOrders =
                                                              containerUserTransactionsRecordList
                                                                  .sortedList(
                                                                      keyOf: (e) =>
                                                                          e.datetime!,
                                                                      desc: true)
                                                                  .toList();

                                                          return SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            controller: _model
                                                                .rowController2,
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: List.generate(
                                                                      userOrders
                                                                          .length,
                                                                      (userOrdersIndex) {
                                                                final userOrdersItem =
                                                                    userOrders[
                                                                        userOrdersIndex];
                                                                return Container(
                                                                  width: 150.0,
                                                                  height: 150.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: StreamBuilder<
                                                                      StoreCatalogRecord>(
                                                                    stream: StoreCatalogRecord.getDocument(userOrdersItem
                                                                        .catalogItemOrders
                                                                        .firstOrNull!
                                                                        .catalogItemReferrence!),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            child:
                                                                                SpinKitRipple(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 50.0,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }

                                                                      final cardStoreCatalogRecord =
                                                                          snapshot
                                                                              .data!;

                                                                      return InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'AUTH_4_HOME_PAGE_Card_ccvizqcn_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'Card_bottom_sheet');
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return WebViewAware(
                                                                                child: GestureDetector(
                                                                                  onTap: () {
                                                                                    FocusScope.of(context).unfocus();
                                                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                                                  },
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.viewInsetsOf(context),
                                                                                    child: Container(
                                                                                      height: MediaQuery.sizeOf(context).height * 0.9,
                                                                                      child: OrderDetailsWidget(
                                                                                        currentTransaction: userOrdersItem.reference,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              safeSetState(() {}));
                                                                        },
                                                                        child:
                                                                            Card(
                                                                          clipBehavior:
                                                                              Clip.antiAliasWithSaveLayer,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          elevation:
                                                                              4.0,
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Stack(
                                                                                children: [
                                                                                  ClipRRect(
                                                                                    borderRadius: BorderRadius.only(),
                                                                                    child: CachedNetworkImage(
                                                                                      fadeInDuration: Duration(milliseconds: 500),
                                                                                      fadeOutDuration: Duration(milliseconds: 500),
                                                                                      imageUrl: cardStoreCatalogRecord.itemImage,
                                                                                      width: double.infinity,
                                                                                      height: 100.0,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                  Card(
                                                                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    elevation: 4.0,
                                                                                    shape: RoundedRectangleBorder(
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                                                                      child: Text(
                                                                                        () {
                                                                                          if (userOrdersItem.isConfirmed) {
                                                                                            return 'Confirmed';
                                                                                          } else if (userOrdersItem.isCancelled) {
                                                                                            return 'Cancelled';
                                                                                          } else {
                                                                                            return 'Pending';
                                                                                          }
                                                                                        }(),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.readexPro(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              color: () {
                                                                                                if (userOrdersItem.isConfirmed) {
                                                                                                  return Color(0xFF39D8C5);
                                                                                                } else if (userOrdersItem.isCancelled) {
                                                                                                  return FlutterFlowTheme.of(context).error;
                                                                                                } else {
                                                                                                  return Color(0xFFEA895E);
                                                                                                }
                                                                                              }(),
                                                                                              fontSize: 14.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Flexible(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                  child: AutoSizeText(
                                                                                    'Order ${userOrdersItem.transactionID}',
                                                                                    minFontSize: 10.0,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.readexPro(
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          fontSize: 16.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                );
                                                              })
                                                                  .addToStart(
                                                                      SizedBox(
                                                                          width:
                                                                              8.0))
                                                                  .addToEnd(
                                                                      SizedBox(
                                                                          width:
                                                                              8.0)),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 8.0, 0.0),
                                        child: GradientText(
                                          FFLocalizations.of(context).getText(
                                            'gnwfd895' /* Cards */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                font: GoogleFonts.outfit(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmall
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .fontStyle,
                                              ),
                                          colors: [
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                            FlutterFlowTheme.of(context)
                                                .secondary
                                          ],
                                          gradientDirection:
                                              GradientDirection.ltr,
                                          gradientType: GradientType.linear,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Builder(
                                        builder: (context) => Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          child: StreamBuilder<
                                              List<UserCardsRecord>>(
                                            stream: queryUserCardsRecord(
                                              parent: currentUserReference,
                                              queryBuilder: (userCardsRecord) =>
                                                  userCardsRecord.orderBy(
                                                      'MemberSince',
                                                      descending: true),
                                            )..listen((snapshot) {
                                                List<UserCardsRecord>
                                                    wrapUserCardsRecordList =
                                                    snapshot;
                                                if (_model.wrapPreviousSnapshot !=
                                                        null &&
                                                    !const ListEquality(
                                                            UserCardsRecordDocumentEquality())
                                                        .equals(
                                                            wrapUserCardsRecordList,
                                                            _model
                                                                .wrapPreviousSnapshot)) {
                                                  () async {
                                                    logFirebaseEvent(
                                                        'AUTH_4_HOME_Wrap_9ahk1mk3_ON_DATA_CHANGE');
                                                    logFirebaseEvent(
                                                        'Wrap_alert_dialog');
                                                    await showDialog(
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return Dialog(
                                                          elevation: 0,
                                                          insetPadding:
                                                              EdgeInsets.zero,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          alignment: AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child: WebViewAware(
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                FocusScope.of(
                                                                        dialogContext)
                                                                    .unfocus();
                                                                FocusManager
                                                                    .instance
                                                                    .primaryFocus
                                                                    ?.unfocus();
                                                              },
                                                              child:
                                                                  PointsEarnedComponentWidget(),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );

                                                    safeSetState(() {});
                                                  }();
                                                }
                                                _model.wrapPreviousSnapshot =
                                                    snapshot;
                                              }),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return EmptyMinimizedViewWidget();
                                              }
                                              List<UserCardsRecord>
                                                  wrapUserCardsRecordList =
                                                  snapshot.data!;
                                              if (wrapUserCardsRecordList
                                                  .isEmpty) {
                                                return Center(
                                                  child:
                                                      EmptyHomeComponentWidget(),
                                                );
                                              }

                                              return Wrap(
                                                spacing: 4.0,
                                                runSpacing: 4.0,
                                                alignment: WrapAlignment.center,
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.center,
                                                direction: Axis.horizontal,
                                                runAlignment:
                                                    WrapAlignment.center,
                                                verticalDirection:
                                                    VerticalDirection.down,
                                                clipBehavior: Clip.none,
                                                children: List.generate(
                                                    wrapUserCardsRecordList
                                                        .length, (wrapIndex) {
                                                  final wrapUserCardsRecord =
                                                      wrapUserCardsRecordList[
                                                          wrapIndex];
                                                  return CustomLoyaltyCardWidget(
                                                    key: Key(
                                                        'Keybe5_${wrapIndex}_of_${wrapUserCardsRecordList.length}'),
                                                    currentCard:
                                                        wrapUserCardsRecord,
                                                  );
                                                }),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]
                                      .divide(SizedBox(height: 16.0))
                                      .addToStart(SizedBox(height: 16.0))
                                      .addToEnd(SizedBox(height: 100.0)),
                                ),
                              );
                            } else {
                              return AuthUserStreamWidget(
                                builder: (context) =>
                                    StreamBuilder<List<StoreCardsRecord>>(
                                  stream: queryStoreCardsRecord(
                                    queryBuilder: (storeCardsRecord) =>
                                        storeCardsRecord.where(
                                      'StoreReferrence',
                                      isEqualTo: currentUserDocument?.store,
                                    ),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: SpinKitRipple(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<StoreCardsRecord>
                                        containerStoreCardsRecordList =
                                        snapshot.data!;

                                    return Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: SingleChildScrollView(
                                        controller: _model
                                            .businessColumnScrollController,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      8.0, 32.0, 8.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 3.0,
                                                      color: Color(0x33000000),
                                                      offset: Offset(
                                                        0.0,
                                                        1.0,
                                                      ),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 4.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    8.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          FFAppState().currentBranchName !=
                                                                      null &&
                                                                  FFAppState()
                                                                          .currentBranchName !=
                                                                      ''
                                                              ? '${FFAppState().currentBranchName} Dashboard'
                                                              : 'Dashboard',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .outfit(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    0.0,
                                                                    8.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'dfjn1jmq' /* Summary Overview */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .readexPro(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    8.0,
                                                                    16.0,
                                                                    8.0),
                                                        child: Wrap(
                                                          spacing: 8.0,
                                                          runSpacing: 8.0,
                                                          alignment:
                                                              WrapAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              WrapCrossAlignment
                                                                  .center,
                                                          direction:
                                                              Axis.horizontal,
                                                          runAlignment:
                                                              WrapAlignment
                                                                  .start,
                                                          verticalDirection:
                                                              VerticalDirection
                                                                  .down,
                                                          clipBehavior:
                                                              Clip.none,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'AUTH_4_HOME_Container_lawq9bl0_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'ToolsComponent_navigate_to');

                                                                      context.pushNamed(
                                                                          MemberListPageWidget
                                                                              .routeName);
                                                                    },
                                                                    child:
                                                                        wrapWithModel(
                                                                      model: _model
                                                                          .toolsComponentModel1,
                                                                      updateCallback:
                                                                          () =>
                                                                              safeSetState(() {}),
                                                                      child:
                                                                          ToolsComponentWidget(
                                                                        toolName:
                                                                            'Members',
                                                                        toolColor:
                                                                            FlutterFlowTheme.of(context).secondary,
                                                                        toolIcon: containerStoreCardsRecordList
                                                                            .length
                                                                            .toString(),
                                                                        textColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'AUTH_4_HOME_Container_0nszxpdn_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'ToolsComponent_navigate_to');

                                                                      context.pushNamed(
                                                                          BusinessMetricsPageWidget
                                                                              .routeName);
                                                                    },
                                                                    child:
                                                                        wrapWithModel(
                                                                      model: _model
                                                                          .toolsComponentModel2,
                                                                      updateCallback:
                                                                          () =>
                                                                              safeSetState(() {}),
                                                                      child:
                                                                          ToolsComponentWidget(
                                                                        toolName:
                                                                            'Business Metrics',
                                                                        toolColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        toolIcon:
                                                                            '📊',
                                                                        textColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'AUTH_4_HOME_Container_ia7m4rv2_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'ToolsComponent_backend_call');
                                                                      _model.settingsHomeCurrentStore =
                                                                          await StoresRecord.getDocumentOnce(
                                                                              currentUserDocument!.store!);
                                                                      if (() {
                                                                        if (!(_model
                                                                            .settingsHomeCurrentStore!
                                                                            .teamMembers
                                                                            .isNotEmpty)) {
                                                                          return true;
                                                                        } else if (FFAppState().currentTeamMember.memberRole ==
                                                                            AccessRole.Owner) {
                                                                          return true;
                                                                        } else {
                                                                          return false;
                                                                        }
                                                                      }()) {
                                                                        logFirebaseEvent(
                                                                            'ToolsComponent_navigate_to');

                                                                        context.pushNamed(
                                                                            MainSettingsWidget.routeName);
                                                                      } else {
                                                                        logFirebaseEvent(
                                                                            'ToolsComponent_alert_dialog');
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return WebViewAware(
                                                                              child: AlertDialog(
                                                                                title: Text('Access Denied'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext),
                                                                                    child: Text('Ok'),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            );
                                                                          },
                                                                        );
                                                                      }

                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        wrapWithModel(
                                                                      model: _model
                                                                          .toolsComponentModel3,
                                                                      updateCallback:
                                                                          () =>
                                                                              safeSetState(() {}),
                                                                      updateOnChange:
                                                                          true,
                                                                      child:
                                                                          ToolsComponentWidget(
                                                                        toolName:
                                                                            'Store Settings',
                                                                        toolColor:
                                                                            Color(0xFF2156D0),
                                                                        toolIcon:
                                                                            '⚙️',
                                                                        textColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'AUTH_4_HOME_Container_oram5xmt_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'ToolsComponent_navigate_to');

                                                                      context.pushNamed(
                                                                          ReviewFeedbackPageWidget
                                                                              .routeName);
                                                                    },
                                                                    child:
                                                                        wrapWithModel(
                                                                      model: _model
                                                                          .toolsComponentModel4,
                                                                      updateCallback:
                                                                          () =>
                                                                              safeSetState(() {}),
                                                                      updateOnChange:
                                                                          true,
                                                                      child:
                                                                          ToolsComponentWidget(
                                                                        toolName:
                                                                            'Customer\nFeedbacks',
                                                                        toolColor:
                                                                            Color(0xFF21D0A7),
                                                                        toolIcon:
                                                                            '🎉',
                                                                        textColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'AUTH_4_HOME_Container_1cx3nxmx_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'ToolsComponent_navigate_to');

                                                                      context.pushNamed(
                                                                          WIkiPageWidget
                                                                              .routeName);
                                                                    },
                                                                    child:
                                                                        wrapWithModel(
                                                                      model: _model
                                                                          .toolsComponentModel5,
                                                                      updateCallback:
                                                                          () =>
                                                                              safeSetState(() {}),
                                                                      updateOnChange:
                                                                          true,
                                                                      child:
                                                                          ToolsComponentWidget(
                                                                        toolName:
                                                                            'Tips & Guides',
                                                                        toolColor:
                                                                            Color(0xFFB921D0),
                                                                        toolIcon:
                                                                            '💡',
                                                                        textColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'AUTH_4_HOME_Container_os20rhhq_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'ToolsComponent_navigate_to');

                                                                      context.pushNamed(
                                                                          RedeemablePageWidget
                                                                              .routeName);
                                                                    },
                                                                    child:
                                                                        wrapWithModel(
                                                                      model: _model
                                                                          .toolsComponentModel6,
                                                                      updateCallback:
                                                                          () =>
                                                                              safeSetState(() {}),
                                                                      updateOnChange:
                                                                          true,
                                                                      child:
                                                                          ToolsComponentWidget(
                                                                        toolName:
                                                                            'Redeemables',
                                                                        toolColor:
                                                                            Color(0xFFD021B7),
                                                                        toolIcon:
                                                                            '🎁',
                                                                        textColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'AUTH_4_HOME_Container_3zg2enop_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'ToolsComponent_backend_call');
                                                                      _model.currentStoreProfileAction =
                                                                          await StoresRecord.getDocumentOnce(
                                                                              currentUserDocument!.store!);
                                                                      logFirebaseEvent(
                                                                          'ToolsComponent_navigate_to');

                                                                      context
                                                                          .pushNamed(
                                                                        StoreDetailsWidget
                                                                            .routeName,
                                                                        pathParameters:
                                                                            {
                                                                          'storeID':
                                                                              serializeParam(
                                                                            _model.currentStoreProfileAction?.storeId,
                                                                            ParamType.String,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        queryParameters:
                                                                            {
                                                                          'initialIndex':
                                                                              serializeParam(
                                                                            0,
                                                                            ParamType.int,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );

                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        wrapWithModel(
                                                                      model: _model
                                                                          .toolsComponentModel7,
                                                                      updateCallback:
                                                                          () =>
                                                                              safeSetState(() {}),
                                                                      updateOnChange:
                                                                          true,
                                                                      child:
                                                                          ToolsComponentWidget(
                                                                        toolName:
                                                                            'Store Profile',
                                                                        toolColor:
                                                                            Color(0xFF21D03C),
                                                                        toolIcon:
                                                                            '🏪',
                                                                        textColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'AUTH_4_HOME_Container_sn2m2gnp_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'ToolsComponent_navigate_to');

                                                                      context.pushNamed(
                                                                          StoreGoogleReviewPageWidget
                                                                              .routeName);
                                                                    },
                                                                    child:
                                                                        wrapWithModel(
                                                                      model: _model
                                                                          .toolsComponentModel8,
                                                                      updateCallback:
                                                                          () =>
                                                                              safeSetState(() {}),
                                                                      updateOnChange:
                                                                          true,
                                                                      child:
                                                                          ToolsComponentWidget(
                                                                        toolName:
                                                                            ' Google Reviews',
                                                                        toolColor:
                                                                            Color(0xFF23EA00),
                                                                        toolIcon:
                                                                            '🎉',
                                                                        textColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'AUTH_4_HOME_Container_bgaktsl6_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'ToolsComponent_navigate_to');

                                                                      context
                                                                          .pushNamed(
                                                                        LeaderboardPageWidget
                                                                            .routeName,
                                                                        queryParameters:
                                                                            {
                                                                          'storeRef':
                                                                              serializeParam(
                                                                            currentUserDocument?.store,
                                                                            ParamType.DocumentReference,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );
                                                                    },
                                                                    child:
                                                                        wrapWithModel(
                                                                      model: _model
                                                                          .toolsComponentModel9,
                                                                      updateCallback:
                                                                          () =>
                                                                              safeSetState(() {}),
                                                                      updateOnChange:
                                                                          true,
                                                                      child:
                                                                          ToolsComponentWidget(
                                                                        toolName:
                                                                            'Leaderboard',
                                                                        toolColor:
                                                                            Color(0xFFEA006E),
                                                                        toolIcon:
                                                                            '🏆',
                                                                        textColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'AUTH_4_HOME_Container_4vcqbciw_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'ToolsComponent_navigate_to');

                                                                      context.pushNamed(
                                                                          StorePageCustomisationWidget
                                                                              .routeName);
                                                                    },
                                                                    child:
                                                                        wrapWithModel(
                                                                      model: _model
                                                                          .toolsComponentModel10,
                                                                      updateCallback:
                                                                          () =>
                                                                              safeSetState(() {}),
                                                                      updateOnChange:
                                                                          true,
                                                                      child:
                                                                          ToolsComponentWidget(
                                                                        toolName:
                                                                            'Design Your\nStore Page',
                                                                        toolColor:
                                                                            Color(0xFFEA006E),
                                                                        toolIcon:
                                                                            '🎨',
                                                                        textColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'AUTH_4_HOME_Container_cugcmbc4_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'ToolsComponent_navigate_to');

                                                                      context.pushNamed(
                                                                          PushNotificationFormWidget
                                                                              .routeName);
                                                                    },
                                                                    child:
                                                                        wrapWithModel(
                                                                      model: _model
                                                                          .toolsComponentModel11,
                                                                      updateCallback:
                                                                          () =>
                                                                              safeSetState(() {}),
                                                                      updateOnChange:
                                                                          true,
                                                                      child:
                                                                          ToolsComponentWidget(
                                                                        toolName:
                                                                            'Push Notification\nMarketing',
                                                                        toolColor:
                                                                            Color(0xFF0034EA),
                                                                        toolIcon:
                                                                            '📢',
                                                                        textColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'AUTH_4_HOME_Container_miu3znvb_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'ToolsComponent_backend_call');
                                                                      _model.currentVoucherStore =
                                                                          await StoresRecord.getDocumentOnce(
                                                                              currentUserDocument!.store!);
                                                                      if (() {
                                                                        if (!(_model
                                                                            .currentVoucherStore!
                                                                            .teamMembers
                                                                            .isNotEmpty)) {
                                                                          return true;
                                                                        } else if (FFAppState().currentTeamMember.memberRole ==
                                                                            AccessRole
                                                                                .Owner) {
                                                                          return true;
                                                                        } else if (FFAppState().currentTeamMember.memberRole ==
                                                                            AccessRole.Manager) {
                                                                          return true;
                                                                        } else {
                                                                          return false;
                                                                        }
                                                                      }()) {
                                                                        logFirebaseEvent(
                                                                            'ToolsComponent_revenue_cat');
                                                                        final isEntitled =
                                                                            await revenue_cat.isEntitled(FFAppConstants.BusinessEliteEntitlement) ??
                                                                                false;
                                                                        if (!isEntitled) {
                                                                          await revenue_cat
                                                                              .loadOfferings();
                                                                        }

                                                                        if (isEntitled) {
                                                                          logFirebaseEvent(
                                                                              'ToolsComponent_navigate_to');

                                                                          context
                                                                              .pushNamed(StoreVoucherPageWidget.routeName);
                                                                        } else {
                                                                          logFirebaseEvent(
                                                                              'ToolsComponent_bottom_sheet');
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            enableDrag:
                                                                                false,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return WebViewAware(
                                                                                child: GestureDetector(
                                                                                  onTap: () {
                                                                                    FocusScope.of(context).unfocus();
                                                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                                                  },
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.viewInsetsOf(context),
                                                                                    child: Container(
                                                                                      height: MediaQuery.sizeOf(context).height * 0.9,
                                                                                      child: PaywallComponentWidget(
                                                                                        initialTabIndex: 1,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              safeSetState(() {}));
                                                                        }
                                                                      } else {
                                                                        logFirebaseEvent(
                                                                            'ToolsComponent_alert_dialog');
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return WebViewAware(
                                                                              child: AlertDialog(
                                                                                title: Text('Access Denied'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext),
                                                                                    child: Text('Ok'),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            );
                                                                          },
                                                                        );
                                                                      }

                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        wrapWithModel(
                                                                      model: _model
                                                                          .toolsComponentModel12,
                                                                      updateCallback:
                                                                          () =>
                                                                              safeSetState(() {}),
                                                                      updateOnChange:
                                                                          true,
                                                                      child:
                                                                          ToolsComponentWidget(
                                                                        toolName:
                                                                            'Vouchers',
                                                                        toolColor:
                                                                            Color(0xFFE083FF),
                                                                        toolIcon:
                                                                            '💯',
                                                                        textColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'AUTH_4_HOME_Container_q4evw526_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'ToolsComponent_navigate_to');

                                                                      context.pushNamed(
                                                                          MarketingMaterialsWidget
                                                                              .routeName);
                                                                    },
                                                                    child:
                                                                        wrapWithModel(
                                                                      model: _model
                                                                          .toolsComponentModel13,
                                                                      updateCallback:
                                                                          () =>
                                                                              safeSetState(() {}),
                                                                      updateOnChange:
                                                                          true,
                                                                      child:
                                                                          ToolsComponentWidget(
                                                                        toolName:
                                                                            'Download Marketing Materials',
                                                                        toolColor:
                                                                            Color(0xFF00EAE7),
                                                                        toolIcon:
                                                                            '🌠',
                                                                        textColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ).animateOnPageLoad(animationsMap[
                                                  'containerOnPageLoadAnimation1']!),
                                            ),
                                            Flexible(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 12.0, 8.0, 100.0),
                                                child: StreamBuilder<
                                                    List<TransactionsRecord>>(
                                                  stream:
                                                      queryTransactionsRecord(
                                                    parent: currentUserDocument
                                                        ?.store,
                                                    queryBuilder:
                                                        (transactionsRecord) =>
                                                            transactionsRecord
                                                                .where(
                                                                  'branchReferrence',
                                                                  isEqualTo:
                                                                      FFAppState()
                                                                          .currentBranch,
                                                                )
                                                                .orderBy(
                                                                    'datetime',
                                                                    descending:
                                                                        true),
                                                    limit: 6,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child: SpinKitRipple(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 50.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<TransactionsRecord>
                                                        taskDetailsTransactionsRecordList =
                                                        snapshot.data!;

                                                    return Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 3.0,
                                                            color: Color(
                                                                0x33000000),
                                                            offset: Offset(
                                                              0.0,
                                                              1.0,
                                                            ),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'AUTH_4_HOME_PAGE_Row_1y4zuhtq_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Row_navigate_to');

                                                                  context.pushNamed(
                                                                      TransactionListPageWidget
                                                                          .routeName);
                                                                },
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            4.0,
                                                                            12.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                              child: AutoSizeText(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'sctr0crd' /* Transactions */,
                                                                                ),
                                                                                minFontSize: 10.0,
                                                                                style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                      font: GoogleFonts.outfit(
                                                                                        fontWeight: FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                                      ),
                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 8.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  '52xw1mrr' /* Member's latest redeems */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                      font: GoogleFonts.readexPro(
                                                                                        fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                      ),
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Flexible(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'tecz3xq3' /* See All */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.readexPro(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        13.0,
                                                                        0.0,
                                                                        16.0,
                                                                        8.0),
                                                                child:
                                                                    SingleChildScrollView(
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  controller: _model
                                                                      .rowController3,
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Flexible(
                                                                        child:
                                                                            Card(
                                                                          clipBehavior:
                                                                              Clip.antiAliasWithSaveLayer,
                                                                          color:
                                                                              Color(0xFFF08D62),
                                                                          elevation:
                                                                              4.0,
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                4.0,
                                                                                8.0,
                                                                                4.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '9tgel66w' /* Redeem Pending */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.readexPro(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: Colors.white,
                                                                                    fontSize: 10.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Flexible(
                                                                        child:
                                                                            Card(
                                                                          clipBehavior:
                                                                              Clip.antiAliasWithSaveLayer,
                                                                          color:
                                                                              Color(0xFF3CDAC6),
                                                                          elevation:
                                                                              4.0,
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                4.0,
                                                                                8.0,
                                                                                4.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'bu5y9whg' /* Redeem Confirmed */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.readexPro(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: Colors.white,
                                                                                    fontSize: 10.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Flexible(
                                                                        child:
                                                                            Card(
                                                                          clipBehavior:
                                                                              Clip.antiAliasWithSaveLayer,
                                                                          color:
                                                                              Color(0xFF4936F4),
                                                                          elevation:
                                                                              4.0,
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                4.0,
                                                                                8.0,
                                                                                4.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'p6frx5i9' /* Points Added */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.readexPro(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: Colors.white,
                                                                                    fontSize: 10.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Flexible(
                                                                        child:
                                                                            Card(
                                                                          clipBehavior:
                                                                              Clip.antiAliasWithSaveLayer,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          elevation:
                                                                              4.0,
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                4.0,
                                                                                8.0,
                                                                                4.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'i3a2rt0f' /* Pre-Order */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.readexPro(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: Colors.white,
                                                                                    fontSize: 10.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          8.0,
                                                                          16.0,
                                                                          8.0),
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            _model.textController,
                                                                        focusNode:
                                                                            _model.textFieldFocusNode,
                                                                        onFieldSubmitted:
                                                                            (_) async {
                                                                          logFirebaseEvent(
                                                                              'AUTH_4_HOME_TextField_z7bacopv_ON_TEXTFI');
                                                                          logFirebaseEvent(
                                                                              'TextField_firestore_query');
                                                                          _model.searchStoreCard =
                                                                              await queryStoreCardsRecordOnce(
                                                                            parent:
                                                                                currentUserDocument?.store,
                                                                            queryBuilder: (storeCardsRecord) =>
                                                                                storeCardsRecord.where(
                                                                              'CardStringID',
                                                                              isEqualTo: _model.textController.text,
                                                                            ),
                                                                            singleRecord:
                                                                                true,
                                                                          ).then((s) => s.firstOrNull);
                                                                          if (_model.searchStoreCard !=
                                                                              null) {
                                                                            logFirebaseEvent('TextField_firestore_query');
                                                                            _model.searchUsercard =
                                                                                await queryUserCardsRecordOnce(
                                                                              parent: _model.searchStoreCard?.cardOwner,
                                                                              queryBuilder: (userCardsRecord) => userCardsRecord.where(
                                                                                'StoreReferrence',
                                                                                isEqualTo: currentUserDocument?.store,
                                                                              ),
                                                                              singleRecord: true,
                                                                            ).then((s) => s.firstOrNull);
                                                                            if (_model.searchUsercard !=
                                                                                null) {
                                                                              logFirebaseEvent('TextField_navigate_to');

                                                                              context.pushNamed(
                                                                                MemberDetailsWidget.routeName,
                                                                                queryParameters: {
                                                                                  'userCard': serializeParam(
                                                                                    _model.searchUsercard,
                                                                                    ParamType.Document,
                                                                                  ),
                                                                                  'storeCard': serializeParam(
                                                                                    _model.searchStoreCard,
                                                                                    ParamType.Document,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                                extra: <String, dynamic>{
                                                                                  'userCard': _model.searchUsercard,
                                                                                  'storeCard': _model.searchStoreCard,
                                                                                },
                                                                              );
                                                                            } else {
                                                                              logFirebaseEvent('TextField_alert_dialog');
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return WebViewAware(
                                                                                    child: AlertDialog(
                                                                                      title: Text('No Member Found'),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                          child: Text('Ok'),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              );
                                                                            }
                                                                          } else {
                                                                            logFirebaseEvent('TextField_firestore_query');
                                                                            _model.searchTransaction =
                                                                                await queryTransactionsRecordOnce(
                                                                              parent: currentUserDocument?.store,
                                                                              queryBuilder: (transactionsRecord) => transactionsRecord.where(
                                                                                'transactionID',
                                                                                isEqualTo: _model.textController.text,
                                                                              ),
                                                                              singleRecord: true,
                                                                            ).then((s) => s.firstOrNull);
                                                                            if (_model.searchTransaction !=
                                                                                null) {
                                                                              if (_model.searchTransaction!.isPreOrder) {
                                                                                logFirebaseEvent('TextField_bottom_sheet');
                                                                                await showModalBottomSheet(
                                                                                  isScrollControlled: true,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return WebViewAware(
                                                                                      child: GestureDetector(
                                                                                        onTap: () {
                                                                                          FocusScope.of(context).unfocus();
                                                                                          FocusManager.instance.primaryFocus?.unfocus();
                                                                                        },
                                                                                        child: Padding(
                                                                                          padding: MediaQuery.viewInsetsOf(context),
                                                                                          child: Container(
                                                                                            height: MediaQuery.sizeOf(context).height * 0.7,
                                                                                            child: OrderTransactionDetailsWidget(
                                                                                              transaction: _model.searchTransaction!,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ).then((value) => safeSetState(() {}));
                                                                              } else {
                                                                                logFirebaseEvent('TextField_bottom_sheet');
                                                                                await showModalBottomSheet(
                                                                                  isScrollControlled: true,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return WebViewAware(
                                                                                      child: GestureDetector(
                                                                                        onTap: () {
                                                                                          FocusScope.of(context).unfocus();
                                                                                          FocusManager.instance.primaryFocus?.unfocus();
                                                                                        },
                                                                                        child: Padding(
                                                                                          padding: MediaQuery.viewInsetsOf(context),
                                                                                          child: Container(
                                                                                            height: MediaQuery.sizeOf(context).height * 0.7,
                                                                                            child: TransactionDetailsWidget(
                                                                                              transaction: _model.searchTransaction!,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ).then((value) => safeSetState(() {}));
                                                                              }
                                                                            } else {
                                                                              logFirebaseEvent('TextField_alert_dialog');
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return WebViewAware(
                                                                                    child: AlertDialog(
                                                                                      title: Text('No Transaction Found'),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                          child: Text('Ok'),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              );
                                                                            }
                                                                          }

                                                                          logFirebaseEvent(
                                                                              'TextField_clear_text_fields_pin_codes');
                                                                          safeSetState(
                                                                              () {
                                                                            _model.textController?.clear();
                                                                          });

                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                        autofocus:
                                                                            false,
                                                                        textCapitalization:
                                                                            TextCapitalization.characters,
                                                                        textInputAction:
                                                                            TextInputAction.search,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          labelText:
                                                                              FFLocalizations.of(context).getText(
                                                                            'rs19ug6y' /* Search Transaction ID */,
                                                                          ),
                                                                          labelStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                font: GoogleFonts.readexPro(
                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                              ),
                                                                          hintStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                font: GoogleFonts.readexPro(
                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                              ),
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          errorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.readexPro(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                        validator: _model
                                                                            .textControllerValidator
                                                                            .asValidator(context),
                                                                        inputFormatters: [
                                                                          if (!isAndroid &&
                                                                              !isiOS)
                                                                            TextInputFormatter.withFunction((oldValue,
                                                                                newValue) {
                                                                              return TextEditingValue(
                                                                                selection: newValue.selection,
                                                                                text: newValue.text.toCapitalization(TextCapitalization.characters),
                                                                              );
                                                                            }),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          Divider(
                                                            height: 2.0,
                                                            thickness: 0.5,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        16.0),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final transaction =
                                                                    taskDetailsTransactionsRecordList
                                                                        .toList();
                                                                if (transaction
                                                                    .isEmpty) {
                                                                  return EmptyTransactionComponentWidget(
                                                                    discoverDidPressed:
                                                                        () async {},
                                                                  );
                                                                }

                                                                return ListView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  primary:
                                                                      false,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      transaction
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          transactionIndex) {
                                                                    final transactionItem =
                                                                        transaction[
                                                                            transactionIndex];
                                                                    return Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          1.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'AUTH_4_HOME_PAGE_listItem_ON_TAP');
                                                                          if (transactionItem
                                                                              .isPreOrder) {
                                                                            logFirebaseEvent('listItem_bottom_sheet');
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              useSafeArea: true,
                                                                              context: context,
                                                                              builder: (context) {
                                                                                return WebViewAware(
                                                                                  child: GestureDetector(
                                                                                    onTap: () {
                                                                                      FocusScope.of(context).unfocus();
                                                                                      FocusManager.instance.primaryFocus?.unfocus();
                                                                                    },
                                                                                    child: Padding(
                                                                                      padding: MediaQuery.viewInsetsOf(context),
                                                                                      child: OrderTransactionDetailsWidget(
                                                                                        transaction: transactionItem,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                safeSetState(() {}));
                                                                          } else {
                                                                            logFirebaseEvent('listItem_bottom_sheet');
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              useSafeArea: true,
                                                                              context: context,
                                                                              builder: (context) {
                                                                                return WebViewAware(
                                                                                  child: GestureDetector(
                                                                                    onTap: () {
                                                                                      FocusScope.of(context).unfocus();
                                                                                      FocusManager.instance.primaryFocus?.unfocus();
                                                                                    },
                                                                                    child: Padding(
                                                                                      padding: MediaQuery.viewInsetsOf(context),
                                                                                      child: TransactionDetailsWidget(
                                                                                        transaction: transactionItem,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                safeSetState(() {}));
                                                                          }
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                blurRadius: 0.0,
                                                                                color: Color(0xFFE0E3E7),
                                                                                offset: Offset(
                                                                                  0.0,
                                                                                  1.0,
                                                                                ),
                                                                              )
                                                                            ],
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                2.0,
                                                                                0.0,
                                                                                2.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                SizedBox(
                                                                                  height: 100.0,
                                                                                  child: VerticalDivider(
                                                                                    width: 24.0,
                                                                                    thickness: 4.0,
                                                                                    indent: 12.0,
                                                                                    endIndent: 12.0,
                                                                                    color: () {
                                                                                      if (transactionItem.isPreOrder) {
                                                                                        return FlutterFlowTheme.of(context).primary;
                                                                                      } else if (transactionItem.isPointsAdded) {
                                                                                        return Color(0xFF4B39EA);
                                                                                      } else if (transactionItem.isConfirmed) {
                                                                                        return Color(0xFF39CBB9);
                                                                                      } else {
                                                                                        return Color(0xFFF08D62);
                                                                                      }
                                                                                    }(),
                                                                                  ),
                                                                                ),
                                                                                Flexible(
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 12.0, 16.0, 12.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              child: Text(
                                                                                                transactionItem.cardOwner,
                                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                      font: GoogleFonts.readexPro(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            Icon(
                                                                                              Icons.keyboard_arrow_right_rounded,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              size: 24.0,
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Flexible(
                                                                                                child: Text(
                                                                                                  transactionItem.cardId,
                                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                        font: GoogleFonts.readexPro(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                        ),
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        if (transactionItem.hasRedeemedItemName())
                                                                                          RichText(
                                                                                            textScaler: MediaQuery.of(context).textScaler,
                                                                                            text: TextSpan(
                                                                                              children: [
                                                                                                TextSpan(
                                                                                                  text: transactionItem.redeemedItemName,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.readexPro(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                )
                                                                                              ],
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    font: GoogleFonts.readexPro(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                    fontSize: 15.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        if (transactionItem.isPreOrder)
                                                                                          RichText(
                                                                                            textScaler: MediaQuery.of(context).textScaler,
                                                                                            text: TextSpan(
                                                                                              children: [
                                                                                                TextSpan(
                                                                                                  text: FFLocalizations.of(context).getText(
                                                                                                    'rs1rfg0q' /* Orders: */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.readexPro(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                )
                                                                                              ],
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    font: GoogleFonts.readexPro(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                    fontSize: 15.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        if (transactionItem.isPreOrder)
                                                                                          Builder(
                                                                                            builder: (context) {
                                                                                              final currentOrder = transactionItem.catalogItemOrders.toList();

                                                                                              return Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: List.generate(currentOrder.length, (currentOrderIndex) {
                                                                                                  final currentOrderItem = currentOrder[currentOrderIndex];
                                                                                                  return RichText(
                                                                                                    textScaler: MediaQuery.of(context).textScaler,
                                                                                                    text: TextSpan(
                                                                                                      children: [
                                                                                                        TextSpan(
                                                                                                          text: currentOrderItem.orderCount.toString(),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                font: GoogleFonts.readexPro(
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                        ),
                                                                                                        TextSpan(
                                                                                                          text: FFLocalizations.of(context).getText(
                                                                                                            'siivr462' /* x  */,
                                                                                                          ),
                                                                                                          style: TextStyle(),
                                                                                                        ),
                                                                                                        TextSpan(
                                                                                                          text: currentOrderItem.catalogItemName,
                                                                                                          style: TextStyle(),
                                                                                                        )
                                                                                                      ],
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            font: GoogleFonts.readexPro(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                            fontSize: 15.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                    ),
                                                                                                  );
                                                                                                }),
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        if (transactionItem.pointsUsed > 0)
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                            child: RichText(
                                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                                              text: TextSpan(
                                                                                                children: [
                                                                                                  TextSpan(
                                                                                                    text: transactionItem.isPointsAdded ? '+' : '-',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          font: GoogleFonts.readexPro(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                  ),
                                                                                                  TextSpan(
                                                                                                    text: FFLocalizations.of(context).getText(
                                                                                                      'b8q335wb' /* ⭐️ */,
                                                                                                    ),
                                                                                                    style: TextStyle(),
                                                                                                  ),
                                                                                                  TextSpan(
                                                                                                    text: transactionItem.pointsUsed.toString(),
                                                                                                    style: TextStyle(),
                                                                                                  )
                                                                                                ],
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.readexPro(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: Text(
                                                                                                  dateTimeFormat(
                                                                                                    "relative",
                                                                                                    transactionItem.datetime!,
                                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.readexPro(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                  controller: _model
                                                                      .listViewController,
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'containerOnPageLoadAnimation2']!);
                                                  },
                                                ),
                                              ),
                                            ),
                                          ].addToEnd(SizedBox(height: 80.0)),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Container(
                        width: double.infinity,
                        height: 70.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 8.0, 8.0, 16.0),
                                child: FlutterFlowIconButton(
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 50.0,
                                  icon: Icon(
                                    Icons.home,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'AUTH_4_HOME_PAGE_home_ICN_ON_TAP');
                                    logFirebaseEvent('IconButton_scroll_to');
                                    await _model.businessColumnScrollController
                                        ?.animateTo(
                                      0,
                                      duration: Duration(milliseconds: 100),
                                      curve: Curves.ease,
                                    );
                                    logFirebaseEvent('IconButton_scroll_to');
                                    await _model.columnController?.animateTo(
                                      0,
                                      duration: Duration(milliseconds: 100),
                                      curve: Curves.ease,
                                    );
                                  },
                                ),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 8.0, 8.0, 16.0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 50.0,
                                  icon: Icon(
                                    Icons.manage_search_sharp,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'AUTH_4_HOME_manage_search_sharp_ICN_ON_T');
                                    logFirebaseEvent('IconButton_navigate_to');
                                    if (Navigator.of(context).canPop()) {
                                      context.pop();
                                    }
                                    context.pushNamed(
                                      StoreDiscoveryWidget.routeName,
                                      extra: <String, dynamic>{
                                        '__transition_info__': TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 8.0, 8.0, 16.0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 50.0,
                                icon: Icon(
                                  Icons.chat_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'AUTH_4_HOME_chat_outlined_ICN_ON_TAP');
                                  logFirebaseEvent('IconButton_navigate_to');
                                  if (Navigator.of(context).canPop()) {
                                    context.pop();
                                  }
                                  context.pushNamed(
                                    MessagesWidget.routeName,
                                    extra: <String, dynamic>{
                                      '__transition_info__': TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );
                                },
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 8.0, 8.0, 16.0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 50.0,
                                  icon: Icon(
                                    Icons.notifications_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'AUTH_4_HOME_notifications_rounded_ICN_ON');
                                    logFirebaseEvent('IconButton_navigate_to');
                                    if (Navigator.of(context).canPop()) {
                                      context.pop();
                                    }
                                    context.pushNamed(
                                      NotificationsPageWidget.routeName,
                                      extra: <String, dynamic>{
                                        '__transition_info__': TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
