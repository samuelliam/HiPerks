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
import 'store_details_model.dart';
export 'store_details_model.dart';

class StoreDetailsWidget extends StatefulWidget {
  const StoreDetailsWidget({
    super.key,
    int? initialIndex,
    required this.storeID,
  }) : this.initialIndex = initialIndex ?? 0;

  final int initialIndex;
  final String? storeID;

  static String routeName = 'StoreDetails';
  static String routePath = 'storeDetails/:storeID';

  @override
  State<StoreDetailsWidget> createState() => _StoreDetailsWidgetState();
}

class _StoreDetailsWidgetState extends State<StoreDetailsWidget>
    with TickerProviderStateMixin {
  late StoreDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StoreDetailsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'StoreDetails'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('STORE_DETAILS_StoreDetails_ON_INIT_STATE');
      await Future.wait([
        Future(() async {
          logFirebaseEvent('StoreDetails_update_page_state');
          _model.generatedID = null;
          safeSetState(() {});
          if (widget!.storeID != null && widget!.storeID != '') {
            logFirebaseEvent('StoreDetails_firestore_query');
            _model.dynamicLinkStore = await queryStoresRecordOnce(
              queryBuilder: (storesRecord) => storesRecord.where(
                'store_id',
                isEqualTo: widget!.storeID,
              ),
              singleRecord: true,
            ).then((s) => s.firstOrNull);
            if (_model.dynamicLinkStore != null) {
              logFirebaseEvent('StoreDetails_update_page_state');
              _model.pageLocalStoreDetail = _model.dynamicLinkStore;
              safeSetState(() {});
              if ((_model.pageLocalStoreDetail?.isRatingVisible == true) &&
                  (_model.pageLocalStoreDetail?.googlePlaceID != null &&
                      _model.pageLocalStoreDetail?.googlePlaceID != '')) {
                logFirebaseEvent('StoreDetails_custom_action');
                _model.googlePlaceSearchResult =
                    await actions.searchGooglePlacesReview(
                  _model.pageLocalStoreDetail!.googlePlaceID,
                );
                logFirebaseEvent('StoreDetails_update_page_state');
                _model.googleReviewJson = _model.googlePlaceSearchResult;
                safeSetState(() {});
              }
            } else {
              logFirebaseEvent('StoreDetails_navigate_to');

              context.goNamed(StoreDiscoveryWidget.routeName);
            }
          } else {
            logFirebaseEvent('StoreDetails_navigate_back');
            context.safePop();
          }
        }),
      ]);
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 5,
      initialIndex: min(
          valueOrDefault<int>(
            widget!.initialIndex,
            0,
          ),
          4),
    )..addListener(() => safeSetState(() {}));

    animationsMap.addAll({
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 370.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 370.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'iconOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 370.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'richTextOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 370.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<UserCardsRecord>>(
      stream: queryUserCardsRecord(
        parent: currentUserReference,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor:
                _model.dynamicLinkStore?.storePageBackgroundColor != null
                    ? _model.dynamicLinkStore?.storePageBackgroundColor
                    : FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitRipple(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<UserCardsRecord> storeDetailsUserCardsRecordList = snapshot.data!;

        return Scaffold(
          key: scaffoldKey,
          backgroundColor:
              _model.dynamicLinkStore?.storePageBackgroundColor != null
                  ? _model.dynamicLinkStore?.storePageBackgroundColor
                  : FlutterFlowTheme.of(context).secondaryBackground,
          floatingActionButton: Visibility(
            visible: valueOrDefault<bool>(
              () {
                if (valueOrDefault<bool>(
                    currentUserDocument?.isBusinessAccount, false)) {
                  return false;
                } else if (FFAppState()
                        .Orders
                        .where((e) =>
                            e.storeReferrence ==
                            _model.pageLocalStoreDetail?.reference)
                        .toList()
                        .length >
                    0) {
                  return false;
                } else {
                  return true;
                }
              }(),
              true,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
              child: AuthUserStreamWidget(
                builder: (context) => FloatingActionButton.extended(
                  onPressed: () async {
                    logFirebaseEvent(
                        'STORE_DETAILS_FloatingActionButton_tt6y8');
                    if (_model.addCardIsPressed) {
                      logFirebaseEvent('FloatingActionButton_show_snack_bar');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Card Already Added',
                            style: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontStyle,
                                  ),
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .fontStyle,
                                ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).alternate,
                        ),
                      );
                    } else {
                      logFirebaseEvent(
                          'FloatingActionButton_update_page_state');
                      _model.addCardIsPressed = true;
                      safeSetState(() {});
                      if (storeDetailsUserCardsRecordList
                              .where((e) =>
                                  e.storeReferrence ==
                                  _model.pageLocalStoreDetail?.reference)
                              .toList()
                              .length >
                          0) {
                        logFirebaseEvent('FloatingActionButton_show_snack_bar');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Card Already Added',
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontStyle,
                                  ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).alternate,
                          ),
                        );
                      } else {
                        if (currentPhoneNumber != null &&
                            currentPhoneNumber != '') {
                          logFirebaseEvent(
                              'FloatingActionButton_firestore_query');
                          _model.matchedStoreCard =
                              await queryStoreCardsRecordOnce(
                            parent: _model.pageLocalStoreDetail?.reference,
                            queryBuilder: (storeCardsRecord) =>
                                storeCardsRecord.where(
                              'CardOwnerPhoneNumber',
                              isEqualTo: currentPhoneNumber,
                            ),
                            singleRecord: true,
                          ).then((s) => s.firstOrNull);
                          if ((_model.matchedStoreCard != null) &&
                              (currentPhoneNumber != null &&
                                  currentPhoneNumber != '')) {
                            logFirebaseEvent(
                                'FloatingActionButton_backend_call');

                            await UserCardsRecord.createDoc(
                                    currentUserReference!)
                                .set(createUserCardsRecordData(
                              cardOwner: currentUserReference,
                              storeReferrence:
                                  _model.matchedStoreCard?.storeReferrence,
                              currentPoints:
                                  _model.matchedStoreCard?.currentPoints,
                              memberSince: _model.matchedStoreCard?.memberSince,
                              cardStringID:
                                  _model.matchedStoreCard?.cardStringID,
                              cardOwnerName:
                                  _model.matchedStoreCard?.cardOwnerName,
                              cardOwnerPhoneNumber:
                                  _model.matchedStoreCard?.cardOwnerPhoneNumber,
                              cardOwnerEmail:
                                  _model.matchedStoreCard?.cardOwnerEmail,
                            ));
                            logFirebaseEvent(
                                'FloatingActionButton_backend_call');

                            await _model.matchedStoreCard!.reference
                                .update(createStoreCardsRecordData(
                              cardOwner: currentUserReference,
                            ));
                            logFirebaseEvent(
                                'FloatingActionButton_navigate_to');

                            context.goNamed(
                              Auth4HomeWidget.routeName,
                              extra: <String, dynamic>{
                                '__transition_info__': TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                ),
                              },
                            );
                          } else {
                            logFirebaseEvent(
                                'FloatingActionButton_update_page_state');
                            _model.generatedID = random_data
                                .randomInteger(1, 100000000)
                                .toString();
                            safeSetState(() {});
                            logFirebaseEvent(
                                'FloatingActionButton_backend_call');

                            var userCardsRecordReference2 =
                                UserCardsRecord.createDoc(
                                    currentUserReference!);
                            await userCardsRecordReference2
                                .set(createUserCardsRecordData(
                              cardOwner: currentUserReference,
                              storeReferrence:
                                  _model.pageLocalStoreDetail?.reference,
                              currentPoints: 0,
                              memberSince: getCurrentTimestamp,
                              cardStringID: _model.generatedID,
                              cardOwnerName: currentUserDisplayName,
                              cardOwnerPhoneNumber: currentPhoneNumber,
                              cardOwnerEmail: currentUserEmail,
                            ));
                            _model.createdUserCard =
                                UserCardsRecord.getDocumentFromData(
                                    createUserCardsRecordData(
                                      cardOwner: currentUserReference,
                                      storeReferrence: _model
                                          .pageLocalStoreDetail?.reference,
                                      currentPoints: 0,
                                      memberSince: getCurrentTimestamp,
                                      cardStringID: _model.generatedID,
                                      cardOwnerName: currentUserDisplayName,
                                      cardOwnerPhoneNumber: currentPhoneNumber,
                                      cardOwnerEmail: currentUserEmail,
                                    ),
                                    userCardsRecordReference2);
                            logFirebaseEvent(
                                'FloatingActionButton_backend_call');

                            await StoreCardsRecord.createDoc(
                                    _model.pageLocalStoreDetail!.reference)
                                .set(createStoreCardsRecordData(
                              cardOwner: currentUserReference,
                              storeReferrence:
                                  _model.pageLocalStoreDetail?.reference,
                              currentPoints:
                                  _model.createdUserCard?.currentPoints,
                              memberSince: _model.createdUserCard?.memberSince,
                              cardStringID: _model.generatedID,
                              cardOwnerName:
                                  _model.createdUserCard?.cardOwnerName,
                              cardOwnerPhoneNumber: currentPhoneNumber,
                              cardOwnerEmail: currentUserEmail,
                            ));
                            logFirebaseEvent(
                                'FloatingActionButton_navigate_to');

                            context.goNamed(
                              Auth4HomeWidget.routeName,
                              extra: <String, dynamic>{
                                '__transition_info__': TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                ),
                              },
                            );
                          }
                        } else {
                          logFirebaseEvent(
                              'FloatingActionButton_update_page_state');
                          _model.generatedID = random_data
                              .randomInteger(1, 100000000)
                              .toString();
                          safeSetState(() {});
                          logFirebaseEvent('FloatingActionButton_backend_call');

                          var userCardsRecordReference3 =
                              UserCardsRecord.createDoc(currentUserReference!);
                          await userCardsRecordReference3
                              .set(createUserCardsRecordData(
                            cardOwner: currentUserReference,
                            storeReferrence:
                                _model.pageLocalStoreDetail?.reference,
                            currentPoints: 0,
                            memberSince: getCurrentTimestamp,
                            cardStringID: _model.generatedID,
                            cardOwnerName: currentUserDisplayName,
                            cardOwnerPhoneNumber: currentPhoneNumber,
                            cardOwnerEmail: currentUserEmail,
                          ));
                          _model.createdUserCardAlterCopy =
                              UserCardsRecord.getDocumentFromData(
                                  createUserCardsRecordData(
                                    cardOwner: currentUserReference,
                                    storeReferrence:
                                        _model.pageLocalStoreDetail?.reference,
                                    currentPoints: 0,
                                    memberSince: getCurrentTimestamp,
                                    cardStringID: _model.generatedID,
                                    cardOwnerName: currentUserDisplayName,
                                    cardOwnerPhoneNumber: currentPhoneNumber,
                                    cardOwnerEmail: currentUserEmail,
                                  ),
                                  userCardsRecordReference3);
                          logFirebaseEvent('FloatingActionButton_backend_call');

                          await StoreCardsRecord.createDoc(
                                  _model.pageLocalStoreDetail!.reference)
                              .set(createStoreCardsRecordData(
                            cardOwner: currentUserReference,
                            storeReferrence:
                                _model.pageLocalStoreDetail?.reference,
                            currentPoints:
                                _model.createdUserCardAlterCopy?.currentPoints,
                            memberSince:
                                _model.createdUserCardAlterCopy?.memberSince,
                            cardStringID: _model.generatedID,
                            cardOwnerName:
                                _model.createdUserCardAlterCopy?.cardOwnerName,
                            cardOwnerPhoneNumber: currentPhoneNumber,
                            cardOwnerEmail: currentUserEmail,
                          ));
                          logFirebaseEvent('FloatingActionButton_navigate_to');

                          context.goNamed(
                            Auth4HomeWidget.routeName,
                            extra: <String, dynamic>{
                              '__transition_info__': TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                              ),
                            },
                          );
                        }
                      }
                    }

                    safeSetState(() {});
                  },
                  backgroundColor: FlutterFlowTheme.of(context).primaryText,
                  elevation: 8.0,
                  label: Text(
                    storeDetailsUserCardsRecordList
                                .where((e) =>
                                    e.storeReferrence ==
                                    _model.pageLocalStoreDetail?.reference)
                                .toList()
                                .length >
                            0
                        ? 'Card Added'
                        : 'Add Card',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.readexPro(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).alternate,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
              ),
            ),
          ),
          body: NestedScrollView(
            floatHeaderSlivers: false,
            headerSliverBuilder: (context, _) => [
              SliverAppBar(
                pinned: false,
                floating: false,
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                actions: [],
                flexibleSpace: FlexibleSpaceBar(
                  title: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (_model.pageLocalStoreDetail
                                                ?.storeLogo !=
                                            null &&
                                        _model.pageLocalStoreDetail
                                                ?.storeLogo !=
                                            '')
                                      Hero(
                                        tag: _model
                                            .pageLocalStoreDetail!.storeLogo,
                                        transitionOnUserGestures: true,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          child: CachedNetworkImage(
                                            fadeInDuration:
                                                Duration(milliseconds: 500),
                                            fadeOutDuration:
                                                Duration(milliseconds: 500),
                                            imageUrl: _model
                                                .pageLocalStoreDetail!
                                                .storeLogo,
                                            width: 130.0,
                                            height: 130.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    if (!_model
                                        .dynamicLinkStore!.isStoreNameHidden)
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 2.0, 16.0, 0.0),
                                          child: AutoSizeText(
                                            valueOrDefault<String>(
                                              _model.pageLocalStoreDetail
                                                  ?.storeName,
                                              '-',
                                            ),
                                            textAlign: TextAlign.center,
                                            maxLines: 3,
                                            minFontSize: 10.0,
                                            style: FlutterFlowTheme.of(context)
                                                .displaySmall
                                                .override(
                                                  font: GoogleFonts.outfit(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .displaySmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .displaySmall
                                                            .fontStyle,
                                                  ),
                                                  color: valueOrDefault<Color>(
                                                    _model.pageLocalStoreDetail
                                                        ?.storePageTextColor,
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                  ),
                                                  fontSize: 40.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .displaySmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .displaySmall
                                                          .fontStyle,
                                                ),
                                          ).animateOnPageLoad(animationsMap[
                                              'textOnPageLoadAnimation1']!),
                                        ),
                                      ),
                                    Flexible(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: AutoSizeText(
                                          valueOrDefault<String>(
                                            _model.pageLocalStoreDetail
                                                ?.storeDescription,
                                            '-',
                                          ),
                                          textAlign: TextAlign.center,
                                          maxLines: 3,
                                          minFontSize: 9.0,
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                font: GoogleFonts.readexPro(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontStyle,
                                                ),
                                                color: _model.dynamicLinkStore
                                                            ?.storePageTextColor !=
                                                        null
                                                    ? _model.dynamicLinkStore
                                                        ?.storePageTextColor
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                        ).animateOnPageLoad(animationsMap[
                                            'textOnPageLoadAnimation2']!),
                                      ),
                                    ),
                                    if (_model.pageLocalStoreDetail
                                                ?.storeAddress !=
                                            null &&
                                        _model.pageLocalStoreDetail
                                                ?.storeAddress !=
                                            '')
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 4.0, 16.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'STORE_DETAILS_PAGE_Text_3yd21si3_ON_TAP');
                                              logFirebaseEvent(
                                                  'Text_launch_map');
                                              await launchMap(
                                                mapType: $ml.MapType.google,
                                                location: _model
                                                    .pageLocalStoreDetail
                                                    ?.storeLocation,
                                                title: _model
                                                    .pageLocalStoreDetail!
                                                    .storeName,
                                              );
                                            },
                                            child: AutoSizeText(
                                              valueOrDefault<String>(
                                                _model.pageLocalStoreDetail
                                                    ?.storeAddress,
                                                '-',
                                              ),
                                              textAlign: TextAlign.center,
                                              maxLines: 4,
                                              minFontSize: 3.0,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelLarge
                                                  .override(
                                                    font: GoogleFonts.readexPro(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelLarge
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelLarge
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                              'textOnPageLoadAnimation3']!),
                                        ),
                                      ),
                                    FutureBuilder<int>(
                                      future: queryStoreCardsRecordCount(
                                        parent:
                                            _model.dynamicLinkStore?.reference,
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
                                        int containerCount = snapshot.data!;

                                        return Container(
                                          decoration: BoxDecoration(),
                                          child: Visibility(
                                            visible: containerCount > 0,
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 8.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.groups_3_outlined,
                                                    color:
                                                        valueOrDefault<Color>(
                                                      _model.dynamicLinkStore
                                                                  ?.storePageSecondaryColor !=
                                                              null
                                                          ? _model
                                                              .dynamicLinkStore
                                                              ?.storePageSecondaryColor
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                    ),
                                                    size: 18.0,
                                                  ).animateOnPageLoad(animationsMap[
                                                      'iconOnPageLoadAnimation']!),
                                                  Flexible(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  4.0,
                                                                  4.0,
                                                                  0.0),
                                                      child: RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: containerCount
                                                                  .toString(),
                                                              style:
                                                                  TextStyle(),
                                                            ),
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'x3gzep5a' /*  Members */,
                                                              ),
                                                              style:
                                                                  TextStyle(),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                font: GoogleFonts
                                                                    .readexPro(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  _model.dynamicLinkStore
                                                                              ?.storePageSecondaryColor !=
                                                                          null
                                                                      ? _model
                                                                          .dynamicLinkStore
                                                                          ?.storePageSecondaryColor
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                ),
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        maxLines: 4,
                                                      ).animateOnPageLoad(
                                                          animationsMap[
                                                              'richTextOnPageLoadAnimation']!),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    Container(
                                      decoration: BoxDecoration(),
                                      child: Visibility(
                                        visible:
                                            (_model.googleReviewJson != null) &&
                                                _model.pageLocalStoreDetail!
                                                    .isRatingVisible,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 8.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'STORE_DETAILS_PAGE_Row_bvsr058l_ON_TAP');
                                              logFirebaseEvent(
                                                  'Column_launch_u_r_l');
                                              await launchURL(
                                                  valueOrDefault<String>(
                                                getJsonField(
                                                  _model.googleReviewJson,
                                                  r'''$.googleMapsUri''',
                                                )?.toString(),
                                                'https://www.google.com/maps',
                                              ));
                                            },
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    if (_model
                                                            .googleReviewJson !=
                                                        null)
                                                      Flexible(
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          child:
                                                              RatingBarIndicator(
                                                            itemBuilder:
                                                                (context,
                                                                        index) =>
                                                                    Icon(
                                                              Icons
                                                                  .star_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                            ),
                                                            direction:
                                                                Axis.horizontal,
                                                            rating:
                                                                valueOrDefault<
                                                                    double>(
                                                              double.parse(
                                                                  valueOrDefault<
                                                                      String>(
                                                                getJsonField(
                                                                  _model
                                                                      .googleReviewJson,
                                                                  r'''$.rating''',
                                                                )?.toString(),
                                                                '0',
                                                              )),
                                                              0.0,
                                                            ),
                                                            unratedColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent1,
                                                            itemCount: 5,
                                                            itemSize: 30.0,
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    if (_model
                                                            .googleReviewJson !=
                                                        null)
                                                      Text(
                                                        '${getJsonField(
                                                          _model
                                                              .googleReviewJson,
                                                          r'''$.rating''',
                                                        ).toString()} Ratings',
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
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    _model.dynamicLinkStore?.storePageSecondaryColor !=
                                                                            null
                                                                        ? _model
                                                                            .dynamicLinkStore
                                                                            ?.storePageSecondaryColor
                                                                        : FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    if (_model
                                                            .googleReviewJson !=
                                                        null)
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'dfbwedgn' /* Google Review */,
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
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    _model.dynamicLinkStore?.storePageSecondaryColor !=
                                                                            null
                                                                        ? _model
                                                                            .dynamicLinkStore
                                                                            ?.storePageSecondaryColor
                                                                        : FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Icon(
                                                        Icons.info_outlined,
                                                        color: _model
                                                            .dynamicLinkStore
                                                            ?.storePageSecondaryColor,
                                                        size: 20.0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            if (_model.pageLocalStoreDetail
                                                        ?.instagramLink !=
                                                    null &&
                                                _model.pageLocalStoreDetail
                                                        ?.instagramLink !=
                                                    '')
                                              Flexible(
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 20.0,
                                                  borderWidth: 0.0,
                                                  buttonSize: 40.0,
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.instagram,
                                                    color: _model
                                                                .dynamicLinkStore
                                                                ?.storePageTextColor !=
                                                            null
                                                        ? _model
                                                            .dynamicLinkStore
                                                            ?.storePageTextColor
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    size: 24.0,
                                                  ),
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'STORE_DETAILS_PAGE_instagram_ICN_ON_TAP');
                                                    logFirebaseEvent(
                                                        'IconButton_launch_u_r_l');
                                                    await launchURL(_model
                                                        .pageLocalStoreDetail!
                                                        .instagramLink);
                                                  },
                                                ),
                                              ),
                                            if (_model.pageLocalStoreDetail
                                                        ?.faceboookLink !=
                                                    null &&
                                                _model.pageLocalStoreDetail
                                                        ?.faceboookLink !=
                                                    '')
                                              Flexible(
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 20.0,
                                                  borderWidth: 0.0,
                                                  buttonSize: 40.0,
                                                  icon: Icon(
                                                    Icons.facebook_sharp,
                                                    color: _model
                                                                .dynamicLinkStore
                                                                ?.storePageTextColor !=
                                                            null
                                                        ? _model
                                                            .dynamicLinkStore
                                                            ?.storePageTextColor
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    size: 24.0,
                                                  ),
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'STORE_DETAILS_facebook_sharp_ICN_ON_TAP');
                                                    logFirebaseEvent(
                                                        'IconButton_launch_u_r_l');
                                                    await launchURL(_model
                                                        .pageLocalStoreDetail!
                                                        .faceboookLink);
                                                  },
                                                ),
                                              ),
                                            if (_model.pageLocalStoreDetail
                                                        ?.websiteLink !=
                                                    null &&
                                                _model.pageLocalStoreDetail
                                                        ?.websiteLink !=
                                                    '')
                                              Flexible(
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 20.0,
                                                  borderWidth: 0.0,
                                                  buttonSize: 40.0,
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.globe,
                                                    color: _model
                                                                .dynamicLinkStore
                                                                ?.storePageTextColor !=
                                                            null
                                                        ? _model
                                                            .dynamicLinkStore
                                                            ?.storePageTextColor
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    size: 24.0,
                                                  ),
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'STORE_DETAILS_PAGE_globe_ICN_ON_TAP');
                                                    logFirebaseEvent(
                                                        'IconButton_launch_u_r_l');
                                                    await launchURL(_model
                                                        .pageLocalStoreDetail!
                                                        .websiteLink);
                                                  },
                                                ),
                                              ),
                                          ].divide(SizedBox(width: 10.0)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, -1.01),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 8.0, 8.0, 8.0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 20.0,
                                  borderWidth: 0.0,
                                  buttonSize: 50.0,
                                  icon: Icon(
                                    Icons.arrow_back_ios_sharp,
                                    color: valueOrDefault<Color>(
                                      _model.dynamicLinkStore?.storePageTextColor !=
                                              null
                                          ? _model.dynamicLinkStore
                                              ?.storePageTextColor
                                          : FlutterFlowTheme.of(context)
                                              .primaryText,
                                      FlutterFlowTheme.of(context).primaryText,
                                    ),
                                    size: 25.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'STORE_DETAILS_arrow_back_ios_sharp_ICN_O');
                                    logFirebaseEvent(
                                        'IconButton_navigate_back');
                                    context.safePop();
                                  },
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(1.0, -0.96),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 8.0, 8.0),
                                      child: FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 20.0,
                                        borderWidth: 0.0,
                                        buttonSize: 50.0,
                                        icon: Icon(
                                          Icons.chat_outlined,
                                          color: valueOrDefault<Color>(
                                            _model.dynamicLinkStore
                                                        ?.storePageTextColor !=
                                                    null
                                                ? _model.dynamicLinkStore
                                                    ?.storePageTextColor
                                                : FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                          size: 30.0,
                                        ),
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'STORE_DETAILS_chat_outlined_ICN_ON_TAP');
                                          if (valueOrDefault<bool>(
                                              currentUserDocument
                                                  ?.isBusinessAccount,
                                              false)) {
                                            logFirebaseEvent(
                                                'IconButton_alert_dialog');
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    title: Text(
                                                        'This feature is for customer only'),
                                                    content: Text(
                                                        'Please check your messages page to see your chats.'),
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
                                          } else {
                                            logFirebaseEvent(
                                                'IconButton_navigate_to');

                                            context.pushNamed(
                                              ChatWidget.routeName,
                                              queryParameters: {
                                                'customerUserRef':
                                                    serializeParam(
                                                  currentUserReference,
                                                  ParamType.DocumentReference,
                                                ),
                                                'storeUserRef': serializeParam(
                                                  _model.dynamicLinkStore
                                                      ?.storeOwner,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  centerTitle: true,
                  expandedTitleScale: 1.0,
                  titlePadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                ),
                toolbarHeight: 400.0,
                elevation: 0.0,
              )
            ],
            body: Builder(
              builder: (context) {
                return Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 800.0,
                    ),
                    decoration: BoxDecoration(),
                    child: Stack(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Flexible(
                              child: FutureBuilder<List<UsersRecord>>(
                                future: queryUsersRecordOnce(
                                  queryBuilder: (usersRecord) =>
                                      usersRecord.where(
                                    'Store',
                                    isEqualTo:
                                        _model.pageLocalStoreDetail?.reference,
                                  ),
                                  singleRecord: true,
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
                                  List<UsersRecord> tabBarUsersRecordList =
                                      snapshot.data!
                                          .where((u) => u.uid != currentUserUid)
                                          .toList();
                                  // Return an empty Container when the item does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final tabBarUsersRecord =
                                      tabBarUsersRecordList.isNotEmpty
                                          ? tabBarUsersRecordList.first
                                          : null;

                                  return Column(
                                    children: [
                                      Align(
                                        alignment: Alignment(0.0, 0),
                                        child: TabBar(
                                          isScrollable: true,
                                          tabAlignment: TabAlignment.center,
                                          labelColor: valueOrDefault<Color>(
                                            _model.dynamicLinkStore
                                                        ?.storePageTextColor !=
                                                    null
                                                ? _model.dynamicLinkStore
                                                    ?.storePageTextColor
                                                : FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                          unselectedLabelColor:
                                              valueOrDefault<Color>(
                                            _model.dynamicLinkStore
                                                        ?.storePageSecondaryColor !=
                                                    null
                                                ? _model.dynamicLinkStore
                                                    ?.storePageSecondaryColor
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                          ),
                                          labelPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 42.0, 16.0, 0.0),
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleMedium
                                              .override(
                                                font: GoogleFonts.readexPro(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                          unselectedLabelStyle: TextStyle(),
                                          indicatorColor: _model
                                                      .dynamicLinkStore
                                                      ?.storePageTextColor !=
                                                  null
                                              ? _model.dynamicLinkStore
                                                  ?.storePageTextColor
                                              : FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          tabs: [
                                            Tab(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'x36a4n8j' /* Gallery */,
                                              ),
                                            ),
                                            Tab(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'wsm4qtht' /* Redeem */,
                                              ),
                                            ),
                                            Tab(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'p5ostdl0' /* Menu */,
                                              ),
                                            ),
                                            Tab(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '8syedpbr' /* Leaderboard */,
                                              ),
                                            ),
                                            Tab(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'su9wfq9a' /* Vouchers */,
                                              ),
                                            ),
                                          ],
                                          controller: _model.tabBarController,
                                          onTap: (i) async {
                                            [
                                              () async {},
                                              () async {},
                                              () async {},
                                              () async {},
                                              () async {}
                                            ][i]();
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: TabBarView(
                                          controller: _model.tabBarController,
                                          children: [
                                            KeepAliveWidgetWrapper(
                                              builder: (context) => Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 0.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final storeImages = _model
                                                            .pageLocalStoreDetail
                                                            ?.storeImages
                                                            ?.toList() ??
                                                        [];
                                                    if (storeImages.isEmpty) {
                                                      return Center(
                                                        child:
                                                            EmptyStoreGallerysComponentWidget(
                                                          discoverDidPressed:
                                                              () async {},
                                                        ),
                                                      );
                                                    }

                                                    return GridView.builder(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                        0,
                                                        8.0,
                                                        0,
                                                        100.0,
                                                      ),
                                                      gridDelegate:
                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 2,
                                                        crossAxisSpacing: 10.0,
                                                        mainAxisSpacing: 10.0,
                                                        childAspectRatio: 1.0,
                                                      ),
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          storeImages.length,
                                                      itemBuilder: (context,
                                                          storeImagesIndex) {
                                                        final storeImagesItem =
                                                            storeImages[
                                                                storeImagesIndex];
                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'STORE_DETAILS_PAGE_Image_sl6jzc6m_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Image_expand_image');
                                                            await Navigator
                                                                .push(
                                                              context,
                                                              PageTransition(
                                                                type:
                                                                    PageTransitionType
                                                                        .fade,
                                                                child:
                                                                    FlutterFlowExpandedImageView(
                                                                  image:
                                                                      CachedNetworkImage(
                                                                    fadeInDuration:
                                                                        Duration(
                                                                            milliseconds:
                                                                                500),
                                                                    fadeOutDuration:
                                                                        Duration(
                                                                            milliseconds:
                                                                                500),
                                                                    imageUrl:
                                                                        storeImagesItem,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                    memCacheWidth:
                                                                        3080,
                                                                  ),
                                                                  allowRotation:
                                                                      false,
                                                                  tag:
                                                                      storeImagesItem,
                                                                  useHeroAnimation:
                                                                      true,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          child: Hero(
                                                            tag:
                                                                storeImagesItem,
                                                            transitionOnUserGestures:
                                                                true,
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  CachedNetworkImage(
                                                                fadeInDuration:
                                                                    Duration(
                                                                        milliseconds:
                                                                            500),
                                                                fadeOutDuration:
                                                                    Duration(
                                                                        milliseconds:
                                                                            500),
                                                                imageUrl:
                                                                    storeImagesItem,
                                                                width: double
                                                                    .infinity,
                                                                fit: BoxFit
                                                                    .cover,
                                                                memCacheWidth:
                                                                    3080,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                            KeepAliveWidgetWrapper(
                                              builder: (context) => Stack(
                                                children: [
                                                  AuthUserStreamWidget(
                                                    builder: (context) =>
                                                        Builder(
                                                      builder: (_) {
                                                        final child = Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: PagedMasonryGridView<
                                                              DocumentSnapshot<
                                                                  Object?>?,
                                                              RedeemablesRecord>.count(
                                                            pagingController: _model.setStaggeredViewController1(
                                                                RedeemablesRecord.collection(_model
                                                                        .pageLocalStoreDetail
                                                                        ?.reference)
                                                                    .orderBy(
                                                                        'points_cost'),
                                                                parent: _model
                                                                    .pageLocalStoreDetail
                                                                    ?.reference),
                                                            crossAxisCount: 2,
                                                            crossAxisSpacing:
                                                                10.0,
                                                            mainAxisSpacing:
                                                                10.0,
                                                            padding: EdgeInsets
                                                                .fromLTRB(
                                                              0,
                                                              16.0,
                                                              0,
                                                              16.0,
                                                            ),
                                                            builderDelegate:
                                                                PagedChildBuilderDelegate<
                                                                    RedeemablesRecord>(
                                                              // Customize what your widget looks like when it's loading the first page.
                                                              firstPageProgressIndicatorBuilder:
                                                                  (_) => Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      SpinKitRipple(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 50.0,
                                                                  ),
                                                                ),
                                                              ),
                                                              // Customize what your widget looks like when it's loading another page.
                                                              newPageProgressIndicatorBuilder:
                                                                  (_) => Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      SpinKitRipple(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 50.0,
                                                                  ),
                                                                ),
                                                              ),

                                                              itemBuilder: (context,
                                                                  _,
                                                                  staggeredViewIndex) {
                                                                final staggeredViewRedeemablesRecord = _model
                                                                        .staggeredViewPagingController1!
                                                                        .itemList![
                                                                    staggeredViewIndex];
                                                                return Builder(
                                                                  builder: (context) =>
                                                                      StreamBuilder<
                                                                          List<
                                                                              StoreCardsRecord>>(
                                                                    stream:
                                                                        queryStoreCardsRecord(
                                                                      parent: _model
                                                                          .pageLocalStoreDetail
                                                                          ?.reference,
                                                                    ),
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
                                                                      List<StoreCardsRecord>
                                                                          redeemableItemStoreCardsRecordList =
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
                                                                              'STORE_DETAILS_PAGE_RedeemableItem_ON_TAP');
                                                                          var _shouldSetState =
                                                                              false;
                                                                          if (storeDetailsUserCardsRecordList.where((e) => e.storeReferrence == _model.pageLocalStoreDetail?.reference).toList().length <=
                                                                              0) {
                                                                            if (_shouldSetState)
                                                                              safeSetState(() {});
                                                                            return;
                                                                          }

                                                                          if (staggeredViewRedeemablesRecord.pointsCost <=
                                                                              storeDetailsUserCardsRecordList.where((e) => e.storeReferrence == _model.pageLocalStoreDetail?.reference).toList().firstOrNull!.currentPoints) {
                                                                            logFirebaseEvent('RedeemableItem_alert_dialog');
                                                                            await showDialog(
                                                                              context: context,
                                                                              builder: (dialogContext) {
                                                                                return Dialog(
                                                                                  elevation: 0,
                                                                                  insetPadding: EdgeInsets.zero,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                  child: WebViewAware(
                                                                                    child: Container(
                                                                                      height: MediaQuery.sizeOf(context).height * 0.7,
                                                                                      child: RedeemConfirmationWidget(
                                                                                        currentRedeemable: staggeredViewRedeemablesRecord,
                                                                                        didRedeem: () async {
                                                                                          logFirebaseEvent('_backend_call');

                                                                                          await storeDetailsUserCardsRecordList.where((e) => e.storeReferrence == _model.pageLocalStoreDetail?.reference).toList().firstOrNull!.reference.update({
                                                                                            ...mapToFirestore(
                                                                                              {
                                                                                                'CurrentPoints': FieldValue.increment(-(staggeredViewRedeemablesRecord.pointsCost)),
                                                                                              },
                                                                                            ),
                                                                                          });
                                                                                          logFirebaseEvent('_backend_call');

                                                                                          await redeemableItemStoreCardsRecordList.where((e) => e.cardOwner == currentUserReference).toList().firstOrNull!.reference.update({
                                                                                            ...mapToFirestore(
                                                                                              {
                                                                                                'CurrentPoints': FieldValue.increment(-(staggeredViewRedeemablesRecord.pointsCost)),
                                                                                              },
                                                                                            ),
                                                                                          });
                                                                                          logFirebaseEvent('_custom_action');
                                                                                          _model.generated100CharIDCopy = await actions.generateID10Char();
                                                                                          logFirebaseEvent('_backend_call');

                                                                                          var transactionsRecordReference = TransactionsRecord.createDoc(_model.pageLocalStoreDetail!.reference);
                                                                                          await transactionsRecordReference.set(createTransactionsRecordData(
                                                                                            cardReferrence: redeemableItemStoreCardsRecordList.where((e) => e.cardOwner == currentUserReference).toList().firstOrNull?.reference,
                                                                                            cardOwner: currentUserDisplayName,
                                                                                            redeemedItemReferrence: staggeredViewRedeemablesRecord.reference,
                                                                                            pointsUsed: staggeredViewRedeemablesRecord.pointsCost,
                                                                                            cardId: redeemableItemStoreCardsRecordList.where((e) => e.cardOwner == currentUserReference).toList().firstOrNull?.cardStringID,
                                                                                            datetime: getCurrentTimestamp,
                                                                                            ownerReferrence: currentUserReference,
                                                                                            redeemedItemName: staggeredViewRedeemablesRecord.itemName,
                                                                                            isPointsAdded: false,
                                                                                            isConfirmed: false,
                                                                                            transactionID: _model.generated100CharIDCopy,
                                                                                            storeReferrence: _model.pageLocalStoreDetail?.reference,
                                                                                          ));
                                                                                          _model.storeTransactionCopy = TransactionsRecord.getDocumentFromData(
                                                                                              createTransactionsRecordData(
                                                                                                cardReferrence: redeemableItemStoreCardsRecordList.where((e) => e.cardOwner == currentUserReference).toList().firstOrNull?.reference,
                                                                                                cardOwner: currentUserDisplayName,
                                                                                                redeemedItemReferrence: staggeredViewRedeemablesRecord.reference,
                                                                                                pointsUsed: staggeredViewRedeemablesRecord.pointsCost,
                                                                                                cardId: redeemableItemStoreCardsRecordList.where((e) => e.cardOwner == currentUserReference).toList().firstOrNull?.cardStringID,
                                                                                                datetime: getCurrentTimestamp,
                                                                                                ownerReferrence: currentUserReference,
                                                                                                redeemedItemName: staggeredViewRedeemablesRecord.itemName,
                                                                                                isPointsAdded: false,
                                                                                                isConfirmed: false,
                                                                                                transactionID: _model.generated100CharIDCopy,
                                                                                                storeReferrence: _model.pageLocalStoreDetail?.reference,
                                                                                              ),
                                                                                              transactionsRecordReference);
                                                                                          logFirebaseEvent('_backend_call');

                                                                                          var userTransactionsRecordReference = UserTransactionsRecord.createDoc(currentUserReference!);
                                                                                          await userTransactionsRecordReference.set(createUserTransactionsRecordData(
                                                                                            cardOwner: currentUserDisplayName,
                                                                                            redeemedItemReferrence: staggeredViewRedeemablesRecord.reference,
                                                                                            pointsUsed: staggeredViewRedeemablesRecord.pointsCost,
                                                                                            cardId: storeDetailsUserCardsRecordList.where((e) => e.storeReferrence == _model.pageLocalStoreDetail?.reference).toList().firstOrNull?.cardStringID,
                                                                                            userCard: storeDetailsUserCardsRecordList.where((e) => e.storeReferrence == _model.pageLocalStoreDetail?.reference).toList().firstOrNull?.reference,
                                                                                            redeemedItemName: staggeredViewRedeemablesRecord.itemName,
                                                                                            datetime: _model.storeTransactionCopy?.datetime,
                                                                                            ownerReferrence: currentUserReference,
                                                                                            isPointsAdded: false,
                                                                                            isConfirmed: false,
                                                                                            transactionID: _model.generated100CharIDCopy,
                                                                                            storeReferrence: _model.pageLocalStoreDetail?.reference,
                                                                                          ));
                                                                                          _model.userTransactionCopy = UserTransactionsRecord.getDocumentFromData(
                                                                                              createUserTransactionsRecordData(
                                                                                                cardOwner: currentUserDisplayName,
                                                                                                redeemedItemReferrence: staggeredViewRedeemablesRecord.reference,
                                                                                                pointsUsed: staggeredViewRedeemablesRecord.pointsCost,
                                                                                                cardId: storeDetailsUserCardsRecordList.where((e) => e.storeReferrence == _model.pageLocalStoreDetail?.reference).toList().firstOrNull?.cardStringID,
                                                                                                userCard: storeDetailsUserCardsRecordList.where((e) => e.storeReferrence == _model.pageLocalStoreDetail?.reference).toList().firstOrNull?.reference,
                                                                                                redeemedItemName: staggeredViewRedeemablesRecord.itemName,
                                                                                                datetime: _model.storeTransactionCopy?.datetime,
                                                                                                ownerReferrence: currentUserReference,
                                                                                                isPointsAdded: false,
                                                                                                isConfirmed: false,
                                                                                                transactionID: _model.generated100CharIDCopy,
                                                                                                storeReferrence: _model.pageLocalStoreDetail?.reference,
                                                                                              ),
                                                                                              userTransactionsRecordReference);
                                                                                          logFirebaseEvent('_trigger_push_notification');
                                                                                          triggerPushNotification(
                                                                                            notificationTitle: 'Hi ${_model.pageLocalStoreDetail?.storeName}! ',
                                                                                            notificationText: '${currentUserDisplayName} redeemed ${staggeredViewRedeemablesRecord.itemName} with ⭐️${staggeredViewRedeemablesRecord.pointsCost.toString()} points. Tap for more info.',
                                                                                            notificationSound: 'default',
                                                                                            userRefs: [
                                                                                              tabBarUsersRecord!.reference
                                                                                            ],
                                                                                            initialPageName: 'auth_4_Home',
                                                                                            parameterData: {},
                                                                                          );
                                                                                          logFirebaseEvent('_backend_call');
                                                                                          unawaited(
                                                                                            () async {
                                                                                              await PushNotificationHistoryRecord.collection.doc().set({
                                                                                                ...createPushNotificationHistoryRecordData(
                                                                                                  notificationTitle: 'Hi ${_model.pageLocalStoreDetail?.storeName}! ',
                                                                                                  notificationText: '${currentUserDisplayName} redeemed ${staggeredViewRedeemablesRecord.itemName} with ⭐️${staggeredViewRedeemablesRecord.pointsCost.toString()} points. Tap for more info.',
                                                                                                  sender: currentUserReference,
                                                                                                  timestamp: getCurrentTimestamp,
                                                                                                ),
                                                                                                ...mapToFirestore(
                                                                                                  {
                                                                                                    'receiver_user_refs': [
                                                                                                      tabBarUsersRecord?.reference
                                                                                                    ],
                                                                                                  },
                                                                                                ),
                                                                                              });
                                                                                            }(),
                                                                                          );
                                                                                          logFirebaseEvent('_close_dialog_drawer_etc');
                                                                                          Navigator.pop(context);
                                                                                          logFirebaseEvent('_dismiss_dialog');
                                                                                          Navigator.pop(context);
                                                                                          logFirebaseEvent('_bottom_sheet');
                                                                                          await showModalBottomSheet(
                                                                                            isScrollControlled: true,
                                                                                            backgroundColor: Colors.transparent,
                                                                                            context: context,
                                                                                            builder: (context) {
                                                                                              return WebViewAware(
                                                                                                child: Padding(
                                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                                  child: Container(
                                                                                                    height: MediaQuery.sizeOf(context).height * 0.7,
                                                                                                    child: RedeemDetailsWidget(
                                                                                                      currentTransaction: _model.userTransactionCopy!.reference,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          ).then((value) => safeSetState(() {}));
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                          } else {
                                                                            logFirebaseEvent('RedeemableItem_alert_dialog');
                                                                            await showDialog(
                                                                              context: context,
                                                                              builder: (dialogContext) {
                                                                                return Dialog(
                                                                                  elevation: 0,
                                                                                  insetPadding: EdgeInsets.zero,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                  child: WebViewAware(
                                                                                    child: RedeemFailWidget(),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                          }

                                                                          if (_shouldSetState)
                                                                            safeSetState(() {});
                                                                        },
                                                                        child:
                                                                            Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          elevation:
                                                                              10.0,
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                            child:
                                                                                Container(
                                                                              width: 220.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
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
                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                              ),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        if (staggeredViewRedeemablesRecord.itemImage != null && staggeredViewRedeemablesRecord.itemImage != '')
                                                                                          ClipRRect(
                                                                                            borderRadius: BorderRadius.circular(10.0),
                                                                                            child: CachedNetworkImage(
                                                                                              fadeInDuration: Duration(milliseconds: 500),
                                                                                              fadeOutDuration: Duration(milliseconds: 500),
                                                                                              imageUrl: staggeredViewRedeemablesRecord.itemImage,
                                                                                              width: double.infinity,
                                                                                              fit: BoxFit.fitWidth,
                                                                                              memCacheWidth: 2080,
                                                                                            ),
                                                                                          ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            staggeredViewRedeemablesRecord.itemName,
                                                                                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                  font: GoogleFonts.readexPro(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                  ),
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Builder(
                                                                                    builder: (context) => Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                      child: FFButtonWidget(
                                                                                        onPressed: () async {
                                                                                          logFirebaseEvent('STORE_DETAILS_PAGE_REDEEM_BTN_ON_TAP');
                                                                                          var _shouldSetState = false;
                                                                                          if (storeDetailsUserCardsRecordList.where((e) => e.storeReferrence == _model.pageLocalStoreDetail?.reference).toList().length <= 0) {
                                                                                            if (_shouldSetState) safeSetState(() {});
                                                                                            return;
                                                                                          }

                                                                                          if (staggeredViewRedeemablesRecord.pointsCost <= storeDetailsUserCardsRecordList.where((e) => e.storeReferrence == _model.pageLocalStoreDetail?.reference).toList().firstOrNull!.currentPoints) {
                                                                                            logFirebaseEvent('Button_alert_dialog');
                                                                                            await showDialog(
                                                                                              context: context,
                                                                                              builder: (dialogContext) {
                                                                                                return Dialog(
                                                                                                  elevation: 0,
                                                                                                  insetPadding: EdgeInsets.zero,
                                                                                                  backgroundColor: Colors.transparent,
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                  child: WebViewAware(
                                                                                                    child: Container(
                                                                                                      height: MediaQuery.sizeOf(context).height * 0.7,
                                                                                                      child: RedeemConfirmationWidget(
                                                                                                        currentRedeemable: staggeredViewRedeemablesRecord,
                                                                                                        didRedeem: () async {
                                                                                                          logFirebaseEvent('_backend_call');

                                                                                                          await storeDetailsUserCardsRecordList.where((e) => e.storeReferrence == _model.pageLocalStoreDetail?.reference).toList().firstOrNull!.reference.update({
                                                                                                            ...mapToFirestore(
                                                                                                              {
                                                                                                                'CurrentPoints': FieldValue.increment(-(staggeredViewRedeemablesRecord.pointsCost)),
                                                                                                              },
                                                                                                            ),
                                                                                                          });
                                                                                                          logFirebaseEvent('_backend_call');

                                                                                                          await redeemableItemStoreCardsRecordList.where((e) => e.cardOwner == currentUserReference).toList().firstOrNull!.reference.update({
                                                                                                            ...mapToFirestore(
                                                                                                              {
                                                                                                                'CurrentPoints': FieldValue.increment(-(staggeredViewRedeemablesRecord.pointsCost)),
                                                                                                              },
                                                                                                            ),
                                                                                                          });
                                                                                                          logFirebaseEvent('_custom_action');
                                                                                                          _model.generated100CharID = await actions.generateID10Char();
                                                                                                          logFirebaseEvent('_backend_call');

                                                                                                          var transactionsRecordReference = TransactionsRecord.createDoc(_model.pageLocalStoreDetail!.reference);
                                                                                                          await transactionsRecordReference.set(createTransactionsRecordData(
                                                                                                            cardReferrence: redeemableItemStoreCardsRecordList.where((e) => e.cardOwner == currentUserReference).toList().firstOrNull?.reference,
                                                                                                            cardOwner: currentUserDisplayName,
                                                                                                            redeemedItemReferrence: staggeredViewRedeemablesRecord.reference,
                                                                                                            pointsUsed: staggeredViewRedeemablesRecord.pointsCost,
                                                                                                            cardId: redeemableItemStoreCardsRecordList.where((e) => e.cardOwner == currentUserReference).toList().firstOrNull?.cardStringID,
                                                                                                            datetime: getCurrentTimestamp,
                                                                                                            ownerReferrence: currentUserReference,
                                                                                                            redeemedItemName: staggeredViewRedeemablesRecord.itemName,
                                                                                                            isPointsAdded: false,
                                                                                                            isConfirmed: false,
                                                                                                            transactionID: _model.generated100CharID,
                                                                                                            storeReferrence: _model.pageLocalStoreDetail?.reference,
                                                                                                            isRemovedPoints: false,
                                                                                                          ));
                                                                                                          _model.storeTransaction = TransactionsRecord.getDocumentFromData(
                                                                                                              createTransactionsRecordData(
                                                                                                                cardReferrence: redeemableItemStoreCardsRecordList.where((e) => e.cardOwner == currentUserReference).toList().firstOrNull?.reference,
                                                                                                                cardOwner: currentUserDisplayName,
                                                                                                                redeemedItemReferrence: staggeredViewRedeemablesRecord.reference,
                                                                                                                pointsUsed: staggeredViewRedeemablesRecord.pointsCost,
                                                                                                                cardId: redeemableItemStoreCardsRecordList.where((e) => e.cardOwner == currentUserReference).toList().firstOrNull?.cardStringID,
                                                                                                                datetime: getCurrentTimestamp,
                                                                                                                ownerReferrence: currentUserReference,
                                                                                                                redeemedItemName: staggeredViewRedeemablesRecord.itemName,
                                                                                                                isPointsAdded: false,
                                                                                                                isConfirmed: false,
                                                                                                                transactionID: _model.generated100CharID,
                                                                                                                storeReferrence: _model.pageLocalStoreDetail?.reference,
                                                                                                                isRemovedPoints: false,
                                                                                                              ),
                                                                                                              transactionsRecordReference);
                                                                                                          logFirebaseEvent('_backend_call');

                                                                                                          var userTransactionsRecordReference = UserTransactionsRecord.createDoc(currentUserReference!);
                                                                                                          await userTransactionsRecordReference.set(createUserTransactionsRecordData(
                                                                                                            cardOwner: currentUserDisplayName,
                                                                                                            redeemedItemReferrence: staggeredViewRedeemablesRecord.reference,
                                                                                                            pointsUsed: staggeredViewRedeemablesRecord.pointsCost,
                                                                                                            cardId: storeDetailsUserCardsRecordList.where((e) => e.storeReferrence == _model.pageLocalStoreDetail?.reference).toList().firstOrNull?.cardStringID,
                                                                                                            userCard: storeDetailsUserCardsRecordList.where((e) => e.storeReferrence == _model.pageLocalStoreDetail?.reference).toList().firstOrNull?.reference,
                                                                                                            redeemedItemName: staggeredViewRedeemablesRecord.itemName,
                                                                                                            datetime: _model.storeTransaction?.datetime,
                                                                                                            ownerReferrence: currentUserReference,
                                                                                                            isPointsAdded: false,
                                                                                                            isConfirmed: false,
                                                                                                            transactionID: _model.generated100CharID,
                                                                                                            storeReferrence: _model.pageLocalStoreDetail?.reference,
                                                                                                            isRemovedPoints: false,
                                                                                                          ));
                                                                                                          _model.userTransaction = UserTransactionsRecord.getDocumentFromData(
                                                                                                              createUserTransactionsRecordData(
                                                                                                                cardOwner: currentUserDisplayName,
                                                                                                                redeemedItemReferrence: staggeredViewRedeemablesRecord.reference,
                                                                                                                pointsUsed: staggeredViewRedeemablesRecord.pointsCost,
                                                                                                                cardId: storeDetailsUserCardsRecordList.where((e) => e.storeReferrence == _model.pageLocalStoreDetail?.reference).toList().firstOrNull?.cardStringID,
                                                                                                                userCard: storeDetailsUserCardsRecordList.where((e) => e.storeReferrence == _model.pageLocalStoreDetail?.reference).toList().firstOrNull?.reference,
                                                                                                                redeemedItemName: staggeredViewRedeemablesRecord.itemName,
                                                                                                                datetime: _model.storeTransaction?.datetime,
                                                                                                                ownerReferrence: currentUserReference,
                                                                                                                isPointsAdded: false,
                                                                                                                isConfirmed: false,
                                                                                                                transactionID: _model.generated100CharID,
                                                                                                                storeReferrence: _model.pageLocalStoreDetail?.reference,
                                                                                                                isRemovedPoints: false,
                                                                                                              ),
                                                                                                              userTransactionsRecordReference);
                                                                                                          logFirebaseEvent('_trigger_push_notification');
                                                                                                          triggerPushNotification(
                                                                                                            notificationTitle: 'Hi ${_model.pageLocalStoreDetail?.storeName}! ',
                                                                                                            notificationText: '${currentUserDisplayName} redeemed ${staggeredViewRedeemablesRecord.itemName} with ⭐️${staggeredViewRedeemablesRecord.pointsCost.toString()} points. Tap for more info.',
                                                                                                            notificationSound: 'default',
                                                                                                            userRefs: [tabBarUsersRecord!.reference],
                                                                                                            initialPageName: 'auth_4_Home',
                                                                                                            parameterData: {},
                                                                                                          );
                                                                                                          logFirebaseEvent('_backend_call');
                                                                                                          unawaited(
                                                                                                            () async {
                                                                                                              await PushNotificationHistoryRecord.collection.doc().set({
                                                                                                                ...createPushNotificationHistoryRecordData(
                                                                                                                  notificationTitle: 'Hi ${_model.pageLocalStoreDetail?.storeName}! ',
                                                                                                                  notificationText: '${currentUserDisplayName} redeemed ${staggeredViewRedeemablesRecord.itemName} with ⭐️${staggeredViewRedeemablesRecord.pointsCost.toString()} points. Tap for more info.',
                                                                                                                  sender: currentUserReference,
                                                                                                                  timestamp: getCurrentTimestamp,
                                                                                                                ),
                                                                                                                ...mapToFirestore(
                                                                                                                  {
                                                                                                                    'receiver_user_refs': [tabBarUsersRecord?.reference],
                                                                                                                  },
                                                                                                                ),
                                                                                                              });
                                                                                                            }(),
                                                                                                          );
                                                                                                          logFirebaseEvent('_close_dialog_drawer_etc');
                                                                                                          Navigator.pop(context);
                                                                                                          logFirebaseEvent('_dismiss_dialog');
                                                                                                          Navigator.pop(context);
                                                                                                          logFirebaseEvent('_bottom_sheet');
                                                                                                          await showModalBottomSheet(
                                                                                                            isScrollControlled: true,
                                                                                                            backgroundColor: Colors.transparent,
                                                                                                            context: context,
                                                                                                            builder: (context) {
                                                                                                              return WebViewAware(
                                                                                                                child: Padding(
                                                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                                                  child: Container(
                                                                                                                    height: MediaQuery.sizeOf(context).height * 0.7,
                                                                                                                    child: RedeemDetailsWidget(
                                                                                                                      currentTransaction: _model.userTransaction!.reference,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              );
                                                                                                            },
                                                                                                          ).then((value) => safeSetState(() {}));
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
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                  child: WebViewAware(
                                                                                                    child: RedeemFailWidget(),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            );
                                                                                          }

                                                                                          if (_shouldSetState) safeSetState(() {});
                                                                                        },
                                                                                        text: 'Redeem ⭐️${staggeredViewRedeemablesRecord.pointsCost.toString()}',
                                                                                        options: FFButtonOptions(
                                                                                          width: double.infinity,
                                                                                          height: 40.0,
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                font: GoogleFonts.readexPro(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                ),
                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                              ),
                                                                                          borderSide: BorderSide(
                                                                                            color: Colors.transparent,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.only(),
                                                                                        ),
                                                                                        showLoadingIndicator: false,
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
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                        if ((storeDetailsUserCardsRecordList
                                                                    .where((e) =>
                                                                        e.storeReferrence ==
                                                                        _model
                                                                            .pageLocalStoreDetail
                                                                            ?.reference)
                                                                    .toList()
                                                                    .length <=
                                                                0) &&
                                                            !valueOrDefault<
                                                                    bool>(
                                                                currentUserDocument
                                                                    ?.isBusinessAccount,
                                                                false)) {
                                                          return ClipRect(
                                                            child:
                                                                ImageFiltered(
                                                              imageFilter:
                                                                  ImageFilter
                                                                      .blur(
                                                                sigmaX: 6.0,
                                                                sigmaY: 6.0,
                                                              ),
                                                              child: child,
                                                            ),
                                                          );
                                                        }
                                                        return child;
                                                      },
                                                    ),
                                                  ),
                                                  if ((storeDetailsUserCardsRecordList
                                                              .where((e) =>
                                                                  e.storeReferrence ==
                                                                  _model
                                                                      .pageLocalStoreDetail
                                                                      ?.reference)
                                                              .toList()
                                                              .length <=
                                                          0) &&
                                                      !valueOrDefault<bool>(
                                                          currentUserDocument
                                                              ?.isBusinessAccount,
                                                          false))
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, -0.2),
                                                      child:
                                                          AuthUserStreamWidget(
                                                        builder: (context) =>
                                                            InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'STORE_DETAILS_PAGE_Card_xr8qxs32_ON_TAP');
                                                            if (storeDetailsUserCardsRecordList
                                                                    .where((e) =>
                                                                        e.storeReferrence ==
                                                                        _model
                                                                            .pageLocalStoreDetail
                                                                            ?.reference)
                                                                    .toList()
                                                                    .length >
                                                                0) {
                                                              logFirebaseEvent(
                                                                  'Card_show_snack_bar');
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Card Already Added',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.readexPro(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                ),
                                                              );
                                                            } else {
                                                              if (currentPhoneNumber !=
                                                                      null &&
                                                                  currentPhoneNumber !=
                                                                      '') {
                                                                logFirebaseEvent(
                                                                    'Card_firestore_query');
                                                                _model.matchedStoreCardCopy =
                                                                    await queryStoreCardsRecordOnce(
                                                                  parent: _model
                                                                      .pageLocalStoreDetail
                                                                      ?.reference,
                                                                  queryBuilder:
                                                                      (storeCardsRecord) =>
                                                                          storeCardsRecord
                                                                              .where(
                                                                    'CardOwnerPhoneNumber',
                                                                    isEqualTo:
                                                                        currentPhoneNumber,
                                                                  ),
                                                                  singleRecord:
                                                                      true,
                                                                ).then((s) => s
                                                                        .firstOrNull);
                                                                if (_model
                                                                        .matchedStoreCardCopy !=
                                                                    null) {
                                                                  logFirebaseEvent(
                                                                      'Card_backend_call');

                                                                  await UserCardsRecord
                                                                          .createDoc(
                                                                              currentUserReference!)
                                                                      .set(
                                                                          createUserCardsRecordData(
                                                                    cardOwner:
                                                                        currentUserReference,
                                                                    storeReferrence: _model
                                                                        .pageLocalStoreDetail
                                                                        ?.reference,
                                                                    currentPoints: _model
                                                                        .matchedStoreCardCopy
                                                                        ?.currentPoints,
                                                                    memberSince: _model
                                                                        .matchedStoreCardCopy
                                                                        ?.memberSince,
                                                                    cardStringID: _model
                                                                        .matchedStoreCardCopy
                                                                        ?.cardStringID,
                                                                    cardOwnerName: _model
                                                                        .matchedStoreCardCopy
                                                                        ?.cardOwnerName,
                                                                    cardOwnerPhoneNumber: _model
                                                                        .matchedStoreCardCopy
                                                                        ?.cardOwnerPhoneNumber,
                                                                    cardOwnerEmail: _model
                                                                        .matchedStoreCardCopy
                                                                        ?.cardOwnerEmail,
                                                                  ));
                                                                  logFirebaseEvent(
                                                                      'Card_backend_call');

                                                                  await _model
                                                                      .matchedStoreCardCopy!
                                                                      .reference
                                                                      .update(
                                                                          createStoreCardsRecordData(
                                                                    cardOwner:
                                                                        currentUserReference,
                                                                  ));
                                                                  logFirebaseEvent(
                                                                      'Card_navigate_to');

                                                                  context
                                                                      .goNamed(
                                                                    Auth4HomeWidget
                                                                        .routeName,
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      '__transition_info__':
                                                                          TransitionInfo(
                                                                        hasTransition:
                                                                            true,
                                                                        transitionType:
                                                                            PageTransitionType.fade,
                                                                      ),
                                                                    },
                                                                  );
                                                                } else {
                                                                  logFirebaseEvent(
                                                                      'Card_update_page_state');
                                                                  _model.generatedID = random_data
                                                                      .randomInteger(
                                                                          1,
                                                                          100000000)
                                                                      .toString();
                                                                  safeSetState(
                                                                      () {});
                                                                  logFirebaseEvent(
                                                                      'Card_backend_call');

                                                                  var userCardsRecordReference2 =
                                                                      UserCardsRecord
                                                                          .createDoc(
                                                                              currentUserReference!);
                                                                  await userCardsRecordReference2
                                                                      .set(
                                                                          createUserCardsRecordData(
                                                                    cardOwner:
                                                                        currentUserReference,
                                                                    storeReferrence: _model
                                                                        .pageLocalStoreDetail
                                                                        ?.reference,
                                                                    currentPoints:
                                                                        0,
                                                                    memberSince:
                                                                        getCurrentTimestamp,
                                                                    cardStringID:
                                                                        _model
                                                                            .generatedID,
                                                                    cardOwnerName:
                                                                        currentUserDisplayName,
                                                                    cardOwnerPhoneNumber:
                                                                        currentPhoneNumber,
                                                                    cardOwnerEmail:
                                                                        currentUserEmail,
                                                                  ));
                                                                  _model.createdUserCardCopy =
                                                                      UserCardsRecord.getDocumentFromData(
                                                                          createUserCardsRecordData(
                                                                            cardOwner:
                                                                                currentUserReference,
                                                                            storeReferrence:
                                                                                _model.pageLocalStoreDetail?.reference,
                                                                            currentPoints:
                                                                                0,
                                                                            memberSince:
                                                                                getCurrentTimestamp,
                                                                            cardStringID:
                                                                                _model.generatedID,
                                                                            cardOwnerName:
                                                                                currentUserDisplayName,
                                                                            cardOwnerPhoneNumber:
                                                                                currentPhoneNumber,
                                                                            cardOwnerEmail:
                                                                                currentUserEmail,
                                                                          ),
                                                                          userCardsRecordReference2);
                                                                  logFirebaseEvent(
                                                                      'Card_backend_call');

                                                                  await StoreCardsRecord.createDoc(_model
                                                                          .pageLocalStoreDetail!
                                                                          .reference)
                                                                      .set(
                                                                          createStoreCardsRecordData(
                                                                    cardOwner:
                                                                        currentUserReference,
                                                                    storeReferrence: _model
                                                                        .pageLocalStoreDetail
                                                                        ?.reference,
                                                                    currentPoints: _model
                                                                        .createdUserCardCopy
                                                                        ?.currentPoints,
                                                                    memberSince: _model
                                                                        .createdUserCardCopy
                                                                        ?.memberSince,
                                                                    cardStringID:
                                                                        _model
                                                                            .generatedID,
                                                                    cardOwnerName: _model
                                                                        .createdUserCardCopy
                                                                        ?.cardOwnerName,
                                                                    cardOwnerPhoneNumber:
                                                                        currentPhoneNumber,
                                                                    cardOwnerEmail:
                                                                        currentUserEmail,
                                                                  ));
                                                                  logFirebaseEvent(
                                                                      'Card_navigate_to');

                                                                  context
                                                                      .goNamed(
                                                                    Auth4HomeWidget
                                                                        .routeName,
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      '__transition_info__':
                                                                          TransitionInfo(
                                                                        hasTransition:
                                                                            true,
                                                                        transitionType:
                                                                            PageTransitionType.fade,
                                                                      ),
                                                                    },
                                                                  );
                                                                }
                                                              } else {
                                                                logFirebaseEvent(
                                                                    'Card_update_page_state');
                                                                _model.generatedID = random_data
                                                                    .randomInteger(
                                                                        1,
                                                                        100000000)
                                                                    .toString();
                                                                safeSetState(
                                                                    () {});
                                                                logFirebaseEvent(
                                                                    'Card_backend_call');

                                                                var userCardsRecordReference3 =
                                                                    UserCardsRecord
                                                                        .createDoc(
                                                                            currentUserReference!);
                                                                await userCardsRecordReference3
                                                                    .set(
                                                                        createUserCardsRecordData(
                                                                  cardOwner:
                                                                      currentUserReference,
                                                                  storeReferrence: _model
                                                                      .pageLocalStoreDetail
                                                                      ?.reference,
                                                                  currentPoints:
                                                                      0,
                                                                  memberSince:
                                                                      getCurrentTimestamp,
                                                                  cardStringID:
                                                                      _model
                                                                          .generatedID,
                                                                  cardOwnerName:
                                                                      currentUserDisplayName,
                                                                  cardOwnerPhoneNumber:
                                                                      currentPhoneNumber,
                                                                  cardOwnerEmail:
                                                                      currentUserEmail,
                                                                ));
                                                                _model.createdUserCardAlternate =
                                                                    UserCardsRecord
                                                                        .getDocumentFromData(
                                                                            createUserCardsRecordData(
                                                                              cardOwner: currentUserReference,
                                                                              storeReferrence: _model.pageLocalStoreDetail?.reference,
                                                                              currentPoints: 0,
                                                                              memberSince: getCurrentTimestamp,
                                                                              cardStringID: _model.generatedID,
                                                                              cardOwnerName: currentUserDisplayName,
                                                                              cardOwnerPhoneNumber: currentPhoneNumber,
                                                                              cardOwnerEmail: currentUserEmail,
                                                                            ),
                                                                            userCardsRecordReference3);
                                                                logFirebaseEvent(
                                                                    'Card_backend_call');

                                                                await StoreCardsRecord.createDoc(_model
                                                                        .pageLocalStoreDetail!
                                                                        .reference)
                                                                    .set(
                                                                        createStoreCardsRecordData(
                                                                  cardOwner:
                                                                      currentUserReference,
                                                                  storeReferrence: _model
                                                                      .pageLocalStoreDetail
                                                                      ?.reference,
                                                                  currentPoints: _model
                                                                      .createdUserCardAlternate
                                                                      ?.currentPoints,
                                                                  memberSince: _model
                                                                      .createdUserCardAlternate
                                                                      ?.memberSince,
                                                                  cardStringID:
                                                                      _model
                                                                          .generatedID,
                                                                  cardOwnerName: _model
                                                                      .createdUserCardAlternate
                                                                      ?.cardOwnerName,
                                                                  cardOwnerPhoneNumber:
                                                                      currentPhoneNumber,
                                                                  cardOwnerEmail:
                                                                      currentUserEmail,
                                                                ));
                                                                logFirebaseEvent(
                                                                    'Card_navigate_to');

                                                                context.goNamed(
                                                                  Auth4HomeWidget
                                                                      .routeName,
                                                                  extra: <String,
                                                                      dynamic>{
                                                                    '__transition_info__':
                                                                        TransitionInfo(
                                                                      hasTransition:
                                                                          true,
                                                                      transitionType:
                                                                          PageTransitionType
                                                                              .fade,
                                                                    ),
                                                                  },
                                                                );
                                                              }
                                                            }

                                                            safeSetState(() {});
                                                          },
                                                          child: Card(
                                                            clipBehavior: Clip
                                                                .antiAliasWithSaveLayer,
                                                            color: Color(
                                                                0xFF1E2529),
                                                            elevation: 4.0,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(8.0),
                                                              child:
                                                                  GradientText(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'k1a5v0f7' /* Join The Club!
Unlock Perks! */
                                                                  ,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLarge
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .outfit(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .headlineLarge
                                                                            .fontStyle,
                                                                      ),
                                                                      letterSpacing:
                                                                          2.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineLarge
                                                                          .fontStyle,
                                                                    ),
                                                                colors: [
                                                                  Color(
                                                                      0xFF9A8FEE),
                                                                  Color(
                                                                      0xFF8CFFF0),
                                                                  Color(
                                                                      0xFFE9AE98)
                                                                ],
                                                                gradientType:
                                                                    GradientType
                                                                        .radial,
                                                                radius: 1.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                            KeepAliveWidgetWrapper(
                                              builder: (context) =>
                                                  SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final storeMenu = _model
                                                                  .pageLocalStoreDetail
                                                                  ?.storeMenuImages
                                                                  ?.toList() ??
                                                              [];

                                                          return MasonryGridView
                                                              .builder(
                                                            physics:
                                                                const NeverScrollableScrollPhysics(),
                                                            gridDelegate:
                                                                SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                                              crossAxisCount: 1,
                                                            ),
                                                            crossAxisSpacing:
                                                                20.0,
                                                            mainAxisSpacing:
                                                                20.0,
                                                            itemCount: storeMenu
                                                                .length,
                                                            padding: EdgeInsets
                                                                .fromLTRB(
                                                              0,
                                                              16.0,
                                                              0,
                                                              16.0,
                                                            ),
                                                            shrinkWrap: true,
                                                            itemBuilder: (context,
                                                                storeMenuIndex) {
                                                              final storeMenuItem =
                                                                  storeMenu[
                                                                      storeMenuIndex];
                                                              return InkWell(
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
                                                                      'STORE_DETAILS_PAGE_Image_4mpq3uuy_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Image_expand_image');
                                                                  await Navigator
                                                                      .push(
                                                                    context,
                                                                    PageTransition(
                                                                      type: PageTransitionType
                                                                          .fade,
                                                                      child:
                                                                          FlutterFlowExpandedImageView(
                                                                        image:
                                                                            CachedNetworkImage(
                                                                          fadeInDuration:
                                                                              Duration(milliseconds: 500),
                                                                          fadeOutDuration:
                                                                              Duration(milliseconds: 500),
                                                                          imageUrl:
                                                                              storeMenuItem,
                                                                          fit: BoxFit
                                                                              .contain,
                                                                          memCacheWidth:
                                                                              4080,
                                                                        ),
                                                                        allowRotation:
                                                                            false,
                                                                        tag:
                                                                            storeMenuItem,
                                                                        useHeroAnimation:
                                                                            true,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                                child: Hero(
                                                                  tag:
                                                                      storeMenuItem,
                                                                  transitionOnUserGestures:
                                                                      true,
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child:
                                                                        CachedNetworkImage(
                                                                      fadeInDuration:
                                                                          Duration(
                                                                              milliseconds: 500),
                                                                      fadeOutDuration:
                                                                          Duration(
                                                                              milliseconds: 500),
                                                                      imageUrl:
                                                                          storeMenuItem,
                                                                      width: double
                                                                          .infinity,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      memCacheWidth:
                                                                          4080,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    8.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: StreamBuilder<
                                                            List<
                                                                BranchesRecord>>(
                                                          stream:
                                                              queryBranchesRecord(
                                                            parent: _model
                                                                .pageLocalStoreDetail
                                                                ?.reference,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      SpinKitRipple(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 50.0,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<BranchesRecord>
                                                                containerBranchesRecordList =
                                                                snapshot.data!;

                                                            return Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child:
                                                                  FutureBuilder<
                                                                      int>(
                                                                future:
                                                                    queryStoreCatalogRecordCount(
                                                                  parent: _model
                                                                      .pageLocalStoreDetail
                                                                      ?.reference,
                                                                ),
                                                                builder: (context,
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              50.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  int containerCount =
                                                                      snapshot
                                                                          .data!;

                                                                  return Container(
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Visibility(
                                                                      visible: (containerBranchesRecordList
                                                                              .isNotEmpty) &&
                                                                          (containerCount >
                                                                              0) &&
                                                                          (containerBranchesRecordList.length >
                                                                              1),
                                                                      child: FlutterFlowDropDown<
                                                                          String>(
                                                                        controller:
                                                                            _model.dropDownValueController ??=
                                                                                FormFieldController<String>(
                                                                          _model
                                                                              .dropDownValue ??= containerBranchesRecordList.length >
                                                                                  1
                                                                              ? containerBranchesRecordList.firstOrNull?.branchName
                                                                              : null,
                                                                        ),
                                                                        options: containerBranchesRecordList
                                                                            .map((e) =>
                                                                                e.branchName)
                                                                            .toList(),
                                                                        onChanged:
                                                                            (val) async {
                                                                          safeSetState(() =>
                                                                              _model.dropDownValue = val);
                                                                          logFirebaseEvent(
                                                                              'STORE_DETAILS_DropDown_78k9rc6c_ON_FORM_');
                                                                          if (FFAppState().Orders.where((e) => e.storeReferrence == _model.pageLocalStoreDetail?.reference).toList().length >
                                                                              0) {
                                                                            logFirebaseEvent('DropDown_alert_dialog');
                                                                            var confirmDialogResponse = await showDialog<bool>(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return WebViewAware(
                                                                                      child: AlertDialog(
                                                                                        title: Text('Clear current orders to switch branch'),
                                                                                        content: Text('Do you wish to continue?'),
                                                                                        actions: [
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                            child: Text('Cancel'),
                                                                                          ),
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                            child: Text('Confirm'),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ) ??
                                                                                false;
                                                                            if (confirmDialogResponse) {
                                                                              logFirebaseEvent('DropDown_update_app_state');
                                                                              FFAppState().Orders = functions.removeAllOrderWithBranch(FFAppState().Orders.toList(), _model.pageLocalStoreDetail?.reference)!.toList().cast<CatalogOrderStruct>();
                                                                              safeSetState(() {});
                                                                              logFirebaseEvent('DropDown_update_page_state');
                                                                              _model.selectedBranch = containerBranchesRecordList.where((e) => e.branchName == _model.dropDownValue).toList().firstOrNull;
                                                                              safeSetState(() {});
                                                                            } else {
                                                                              logFirebaseEvent('DropDown_set_form_field');
                                                                              safeSetState(() {
                                                                                _model.dropDownValueController?.value = _model.selectedBranch!.branchName;
                                                                                _model.dropDownValue = _model.selectedBranch!.branchName;
                                                                              });
                                                                            }
                                                                          } else {
                                                                            logFirebaseEvent('DropDown_update_page_state');
                                                                            _model.selectedBranch =
                                                                                containerBranchesRecordList.where((e) => e.branchName == _model.dropDownValue).toList().firstOrNull;
                                                                            safeSetState(() {});
                                                                          }
                                                                        },
                                                                        width:
                                                                            200.0,
                                                                        height:
                                                                            50.0,
                                                                        searchHintTextStyle: FlutterFlowTheme.of(context)
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
                                                                        searchTextStyle: FlutterFlowTheme.of(context)
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
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.readexPro(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                        hintText:
                                                                            FFLocalizations.of(context).getText(
                                                                          'cwn3nijm' /* Select Branch */,
                                                                        ),
                                                                        searchHintText:
                                                                            FFLocalizations.of(context).getText(
                                                                          '7nfe18ur' /* Search */,
                                                                        ),
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .keyboard_arrow_down_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        elevation:
                                                                            2.0,
                                                                        borderColor:
                                                                            Colors.transparent,
                                                                        borderWidth:
                                                                            2.0,
                                                                        borderRadius:
                                                                            8.0,
                                                                        margin: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                        hidesUnderline:
                                                                            true,
                                                                        isOverButton:
                                                                            false,
                                                                        isSearchable:
                                                                            true,
                                                                        isMultiSelect:
                                                                            false,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    16.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: StreamBuilder<
                                                            List<
                                                                StoreCatalogRecord>>(
                                                          stream:
                                                              queryStoreCatalogRecord(
                                                            parent: _model
                                                                .pageLocalStoreDetail
                                                                ?.reference,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      SpinKitRipple(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 50.0,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<StoreCatalogRecord>
                                                                containerStoreCatalogRecordList =
                                                                snapshot.data!;

                                                            return Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                                child:
                                                                    FlutterFlowChoiceChips(
                                                                  options: _model
                                                                      .pageLocalStoreDetail!
                                                                      .storeCatalogCategories
                                                                      .map((label) =>
                                                                          ChipData(
                                                                              label))
                                                                      .toList(),
                                                                  onChanged:
                                                                      (val) async {
                                                                    safeSetState(() =>
                                                                        _model.choiceChipsValue =
                                                                            val?.firstOrNull);
                                                                    logFirebaseEvent(
                                                                        'STORE_DETAILS_ChoiceChips_tyzw1txf_ON_FO');
                                                                    if (_model
                                                                            .selectedCategory ==
                                                                        _model
                                                                            .choiceChipsValue) {
                                                                      logFirebaseEvent(
                                                                          'ChoiceChips_update_page_state');
                                                                      _model.selectedCategory =
                                                                          null;
                                                                      safeSetState(
                                                                          () {});
                                                                      logFirebaseEvent(
                                                                          'ChoiceChips_reset_form_fields');
                                                                      safeSetState(
                                                                          () {
                                                                        _model
                                                                            .choiceChipsValueController
                                                                            ?.reset();
                                                                      });
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'ChoiceChips_update_page_state');
                                                                      _model.selectedCategory =
                                                                          _model
                                                                              .choiceChipsValue;
                                                                      safeSetState(
                                                                          () {});
                                                                    }
                                                                  },
                                                                  selectedChipStyle:
                                                                      ChipStyle(
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.readexPro(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).info,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                    iconColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    iconSize:
                                                                        16.0,
                                                                    elevation:
                                                                        0.0,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  unselectedChipStyle:
                                                                      ChipStyle(
                                                                    backgroundColor:
                                                                        Color(
                                                                            0xFFF7FCFF),
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.readexPro(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                    iconColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    iconSize:
                                                                        16.0,
                                                                    elevation:
                                                                        0.0,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  chipSpacing:
                                                                      8.0,
                                                                  rowSpacing:
                                                                      8.0,
                                                                  multiselect:
                                                                      false,
                                                                  alignment:
                                                                      WrapAlignment
                                                                          .start,
                                                                  controller: _model
                                                                          .choiceChipsValueController ??=
                                                                      FormFieldController<
                                                                          List<
                                                                              String>>(
                                                                    [],
                                                                  ),
                                                                  wrapped: true,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    Builder(
                                                      builder: (context) {
                                                        if (_model.selectedCategory !=
                                                                null &&
                                                            _model.selectedCategory !=
                                                                '') {
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        16.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final category = _model
                                                                        .pageLocalStoreDetail
                                                                        ?.storeCatalogCategories
                                                                        ?.where((e) =>
                                                                            _model.selectedCategory ==
                                                                            e)
                                                                        .toList()
                                                                        ?.toList() ??
                                                                    [];

                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: List.generate(
                                                                      category
                                                                          .length,
                                                                      (categoryIndex) {
                                                                    final categoryItem =
                                                                        category[
                                                                            categoryIndex];
                                                                    return StreamBuilder<
                                                                        List<
                                                                            StoreCatalogRecord>>(
                                                                      stream:
                                                                          queryStoreCatalogRecord(
                                                                        parent: _model
                                                                            .dynamicLinkStore
                                                                            ?.reference,
                                                                        queryBuilder: (storeCatalogRecord) => storeCatalogRecord
                                                                            .where(
                                                                              'branch_availability',
                                                                              arrayContains: _model.selectedBranch?.reference,
                                                                            )
                                                                            .where(
                                                                              'category',
                                                                              isEqualTo: categoryItem != '' ? categoryItem : null,
                                                                            ),
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 50.0,
                                                                              height: 50.0,
                                                                              child: SpinKitRipple(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                size: 50.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        List<StoreCatalogRecord>
                                                                            containerStoreCatalogRecordList =
                                                                            snapshot.data!;

                                                                        return Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              ListView(
                                                                            padding:
                                                                                EdgeInsets.zero,
                                                                            primary:
                                                                                false,
                                                                            shrinkWrap:
                                                                                true,
                                                                            scrollDirection:
                                                                                Axis.vertical,
                                                                            children: [
                                                                              if (containerStoreCatalogRecordList.isNotEmpty)
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 0.0, 8.0),
                                                                                  child: Text(
                                                                                    categoryItem,
                                                                                    style: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                          font: GoogleFonts.outfit(
                                                                                            fontWeight: FontWeight.bold,
                                                                                            fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                          ),
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.bold,
                                                                                          fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              if (containerStoreCatalogRecordList.isNotEmpty)
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                  child: Builder(
                                                                                    builder: (context) {
                                                                                      final containerVar = containerStoreCatalogRecordList.toList();

                                                                                      return MasonryGridView.builder(
                                                                                        physics: const NeverScrollableScrollPhysics(),
                                                                                        gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                                                                          crossAxisCount: containerStoreCatalogRecordList.length == 1 ? 1 : 2,
                                                                                        ),
                                                                                        crossAxisSpacing: 8.0,
                                                                                        mainAxisSpacing: 8.0,
                                                                                        itemCount: containerVar.length,
                                                                                        padding: EdgeInsets.fromLTRB(
                                                                                          0,
                                                                                          0,
                                                                                          0,
                                                                                          0,
                                                                                        ),
                                                                                        shrinkWrap: true,
                                                                                        itemBuilder: (context, containerVarIndex) {
                                                                                          final containerVarItem = containerVar[containerVarIndex];
                                                                                          return Visibility(
                                                                                            visible: containerStoreCatalogRecordList.isNotEmpty,
                                                                                            child: InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                logFirebaseEvent('STORE_DETAILS_PAGE_RedeemableItem_ON_TAP');
                                                                                                if (containerVarItem.hasItemVariation()) {
                                                                                                  logFirebaseEvent('RedeemableItem_navigate_to');

                                                                                                  context.pushNamed(
                                                                                                    ProductSelectionPageWidget.routeName,
                                                                                                    queryParameters: {
                                                                                                      'currentStoreCatalog': serializeParam(
                                                                                                        containerVarItem,
                                                                                                        ParamType.Document,
                                                                                                      ),
                                                                                                      'selectedBranch': serializeParam(
                                                                                                        _model.selectedBranch,
                                                                                                        ParamType.Document,
                                                                                                      ),
                                                                                                    }.withoutNulls,
                                                                                                    extra: <String, dynamic>{
                                                                                                      'currentStoreCatalog': containerVarItem,
                                                                                                      'selectedBranch': _model.selectedBranch,
                                                                                                    },
                                                                                                  );
                                                                                                }
                                                                                              },
                                                                                              child: Material(
                                                                                                color: Colors.transparent,
                                                                                                elevation: 0.0,
                                                                                                shape: RoundedRectangleBorder(
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                child: ClipRRect(
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                  child: Container(
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                                                      border: Border.all(
                                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                                      ),
                                                                                                    ),
                                                                                                    alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsets.all(8.0),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.min,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Hero(
                                                                                                                tag: containerVarItem.itemImage,
                                                                                                                transitionOnUserGestures: true,
                                                                                                                child: ClipRRect(
                                                                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                                                                  child: CachedNetworkImage(
                                                                                                                    fadeInDuration: Duration(milliseconds: 500),
                                                                                                                    fadeOutDuration: Duration(milliseconds: 500),
                                                                                                                    imageUrl: containerVarItem.itemImage,
                                                                                                                    width: double.infinity,
                                                                                                                    height: (containerStoreCatalogRecordList.length == 1 ? 400 : 150).toDouble(),
                                                                                                                    fit: BoxFit.cover,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                                child: Text(
                                                                                                                  containerVarItem.itemName,
                                                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                                        font: GoogleFonts.readexPro(
                                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                                        ),
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                child: RichText(
                                                                                                                  textScaler: MediaQuery.of(context).textScaler,
                                                                                                                  text: TextSpan(
                                                                                                                    children: [
                                                                                                                      TextSpan(
                                                                                                                        text: FFLocalizations.of(context).getText(
                                                                                                                          '43kqsdog' /* Earn ⭐️ */,
                                                                                                                        ),
                                                                                                                        style: TextStyle(),
                                                                                                                      ),
                                                                                                                      TextSpan(
                                                                                                                        text: containerVarItem.hasItemVariation() ? containerVarItem.itemVariation.firstOrNull!.variationPoints.toString() : containerVarItem.itemPoints.toString(),
                                                                                                                        style: TextStyle(
                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                        ),
                                                                                                                      )
                                                                                                                    ],
                                                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                          font: GoogleFonts.readexPro(
                                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                                          ),
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                child: RichText(
                                                                                                                  textScaler: MediaQuery.of(context).textScaler,
                                                                                                                  text: TextSpan(
                                                                                                                    children: [
                                                                                                                      TextSpan(
                                                                                                                        text: FFLocalizations.of(context).getText(
                                                                                                                          'kr89o99g' /* Price:  */,
                                                                                                                        ),
                                                                                                                        style: TextStyle(),
                                                                                                                      ),
                                                                                                                      TextSpan(
                                                                                                                        text: containerVarItem.hasItemVariation() ? containerVarItem.itemVariation.firstOrNull!.variationPrice.toString() : containerVarItem.itemPrice.toString(),
                                                                                                                        style: TextStyle(
                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                        ),
                                                                                                                      )
                                                                                                                    ],
                                                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                          font: GoogleFonts.readexPro(
                                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                                          ),
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              if (containerVarItem.hasItemVariation())
                                                                                                                Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                  children: [
                                                                                                                    Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                      child: RichText(
                                                                                                                        textScaler: MediaQuery.of(context).textScaler,
                                                                                                                        text: TextSpan(
                                                                                                                          children: [
                                                                                                                            TextSpan(
                                                                                                                              text: FFLocalizations.of(context).getText(
                                                                                                                                'dn2c0z4e' /* Variations:  */,
                                                                                                                              ),
                                                                                                                              style: TextStyle(),
                                                                                                                            )
                                                                                                                          ],
                                                                                                                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                                font: GoogleFonts.readexPro(
                                                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                                                ),
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                                                fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Flexible(
                                                                                                                      child: Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                        child: Builder(
                                                                                                                          builder: (context) {
                                                                                                                            final variants = containerVarItem.itemVariation.toList();

                                                                                                                            return Wrap(
                                                                                                                              spacing: 2.0,
                                                                                                                              runSpacing: 2.0,
                                                                                                                              alignment: WrapAlignment.start,
                                                                                                                              crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                                              direction: Axis.horizontal,
                                                                                                                              runAlignment: WrapAlignment.start,
                                                                                                                              verticalDirection: VerticalDirection.down,
                                                                                                                              clipBehavior: Clip.none,
                                                                                                                              children: List.generate(variants.length, (variantsIndex) {
                                                                                                                                final variantsItem = variants[variantsIndex];
                                                                                                                                return Text(
                                                                                                                                  '${variantsItem.variationName}, ',
                                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                        font: GoogleFonts.readexPro(
                                                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                        ),
                                                                                                                                        fontSize: 10.0,
                                                                                                                                        letterSpacing: 0.0,
                                                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                      ),
                                                                                                                                );
                                                                                                                              }),
                                                                                                                            );
                                                                                                                          },
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                        if (containerVarItem.hasItemVariation())
                                                                                                          FFButtonWidget(
                                                                                                            onPressed: () async {
                                                                                                              logFirebaseEvent('STORE_DETAILS_PAGE_ORDER_BTN_ON_TAP');
                                                                                                              if (containerVarItem.hasItemVariation()) {
                                                                                                                logFirebaseEvent('Button_navigate_to');

                                                                                                                context.pushNamed(
                                                                                                                  ProductSelectionPageWidget.routeName,
                                                                                                                  queryParameters: {
                                                                                                                    'currentStoreCatalog': serializeParam(
                                                                                                                      containerVarItem,
                                                                                                                      ParamType.Document,
                                                                                                                    ),
                                                                                                                    'selectedBranch': serializeParam(
                                                                                                                      _model.selectedBranch,
                                                                                                                      ParamType.Document,
                                                                                                                    ),
                                                                                                                  }.withoutNulls,
                                                                                                                  extra: <String, dynamic>{
                                                                                                                    'currentStoreCatalog': containerVarItem,
                                                                                                                    'selectedBranch': _model.selectedBranch,
                                                                                                                  },
                                                                                                                );
                                                                                                              }
                                                                                                            },
                                                                                                            text: containerVarItem.isOutOfStock ? 'Out Of Stock' : 'Order',
                                                                                                            options: FFButtonOptions(
                                                                                                              width: double.infinity,
                                                                                                              height: 40.0,
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                              color: containerVarItem.isOutOfStock ? FlutterFlowTheme.of(context).error : FlutterFlowTheme.of(context).primary,
                                                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                    font: GoogleFonts.readexPro(
                                                                                                                      fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                                    ),
                                                                                                                    color: Colors.white,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                                  ),
                                                                                                              elevation: 0.0,
                                                                                                              borderSide: BorderSide(
                                                                                                                width: 0.0,
                                                                                                              ),
                                                                                                              borderRadius: BorderRadius.only(),
                                                                                                            ),
                                                                                                            showLoadingIndicator: false,
                                                                                                          ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  }).addToEnd(
                                                                      SizedBox(
                                                                          height:
                                                                              150.0)),
                                                                );
                                                              },
                                                            ),
                                                          );
                                                        } else if (!(_model
                                                            .pageLocalStoreDetail!
                                                            .storeCatalogCategories
                                                            .isNotEmpty)) {
                                                          return StreamBuilder<
                                                              List<
                                                                  StoreCatalogRecord>>(
                                                            stream:
                                                                queryStoreCatalogRecord(
                                                              parent: _model
                                                                  .dynamicLinkStore
                                                                  ?.reference,
                                                              queryBuilder:
                                                                  (storeCatalogRecord) =>
                                                                      storeCatalogRecord
                                                                          .where(
                                                                'branch_availability',
                                                                arrayContains: _model
                                                                    .selectedBranch
                                                                    ?.reference,
                                                              ),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        SpinKitRipple(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          50.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<StoreCatalogRecord>
                                                                  containerStoreCatalogRecordList =
                                                                  snapshot
                                                                      .data!;

                                                              return Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child:
                                                                    Visibility(
                                                                  visible:
                                                                      containerStoreCatalogRecordList
                                                                          .isNotEmpty,
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                    child:
                                                                        Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final containerVar =
                                                                            containerStoreCatalogRecordList.toList();

                                                                        return MasonryGridView
                                                                            .builder(
                                                                          physics:
                                                                              const NeverScrollableScrollPhysics(),
                                                                          gridDelegate:
                                                                              SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                                                            crossAxisCount: containerStoreCatalogRecordList.length == 1
                                                                                ? 1
                                                                                : 2,
                                                                          ),
                                                                          crossAxisSpacing:
                                                                              8.0,
                                                                          mainAxisSpacing:
                                                                              8.0,
                                                                          itemCount:
                                                                              containerVar.length,
                                                                          padding:
                                                                              EdgeInsets.fromLTRB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            0,
                                                                          ),
                                                                          shrinkWrap:
                                                                              true,
                                                                          itemBuilder:
                                                                              (context, containerVarIndex) {
                                                                            final containerVarItem =
                                                                                containerVar[containerVarIndex];
                                                                            return Visibility(
                                                                              visible: containerStoreCatalogRecordList.isNotEmpty,
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('STORE_DETAILS_PAGE_RedeemableItem_ON_TAP');
                                                                                  if (containerVarItem.hasItemVariation()) {
                                                                                    logFirebaseEvent('RedeemableItem_navigate_to');

                                                                                    context.pushNamed(
                                                                                      ProductSelectionPageWidget.routeName,
                                                                                      queryParameters: {
                                                                                        'currentStoreCatalog': serializeParam(
                                                                                          containerVarItem,
                                                                                          ParamType.Document,
                                                                                        ),
                                                                                        'selectedBranch': serializeParam(
                                                                                          _model.selectedBranch,
                                                                                          ParamType.Document,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                      extra: <String, dynamic>{
                                                                                        'currentStoreCatalog': containerVarItem,
                                                                                        'selectedBranch': _model.selectedBranch,
                                                                                      },
                                                                                    );
                                                                                  }
                                                                                },
                                                                                child: Material(
                                                                                  color: Colors.transparent,
                                                                                  elevation: 0.0,
                                                                                  shape: RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                  ),
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                                        border: Border.all(
                                                                                          color: FlutterFlowTheme.of(context).alternate,
                                                                                        ),
                                                                                      ),
                                                                                      alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsets.all(8.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.min,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Hero(
                                                                                                  tag: containerVarItem.itemImage,
                                                                                                  transitionOnUserGestures: true,
                                                                                                  child: ClipRRect(
                                                                                                    borderRadius: BorderRadius.circular(10.0),
                                                                                                    child: CachedNetworkImage(
                                                                                                      fadeInDuration: Duration(milliseconds: 500),
                                                                                                      fadeOutDuration: Duration(milliseconds: 500),
                                                                                                      imageUrl: containerVarItem.itemImage,
                                                                                                      width: double.infinity,
                                                                                                      height: (containerStoreCatalogRecordList.length == 1 ? 400 : 150).toDouble(),
                                                                                                      fit: BoxFit.cover,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    containerVarItem.itemName,
                                                                                                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                          font: GoogleFonts.readexPro(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                          ),
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                  child: RichText(
                                                                                                    textScaler: MediaQuery.of(context).textScaler,
                                                                                                    text: TextSpan(
                                                                                                      children: [
                                                                                                        TextSpan(
                                                                                                          text: FFLocalizations.of(context).getText(
                                                                                                            'epgomax2' /* Earn ⭐️ */,
                                                                                                          ),
                                                                                                          style: TextStyle(),
                                                                                                        ),
                                                                                                        TextSpan(
                                                                                                          text: containerVarItem.hasItemVariation() ? containerVarItem.itemVariation.firstOrNull!.variationPoints.toString() : containerVarItem.itemPoints.toString(),
                                                                                                          style: TextStyle(
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          ),
                                                                                                        )
                                                                                                      ],
                                                                                                      style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                            font: GoogleFonts.readexPro(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                            ),
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                  child: RichText(
                                                                                                    textScaler: MediaQuery.of(context).textScaler,
                                                                                                    text: TextSpan(
                                                                                                      children: [
                                                                                                        TextSpan(
                                                                                                          text: FFLocalizations.of(context).getText(
                                                                                                            'njhgvyie' /* Price:  */,
                                                                                                          ),
                                                                                                          style: TextStyle(),
                                                                                                        ),
                                                                                                        TextSpan(
                                                                                                          text: containerVarItem.hasItemVariation() ? containerVarItem.itemVariation.firstOrNull!.variationPrice.toString() : containerVarItem.itemPrice.toString(),
                                                                                                          style: TextStyle(
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          ),
                                                                                                        )
                                                                                                      ],
                                                                                                      style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                            font: GoogleFonts.readexPro(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                            ),
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                if (containerVarItem.hasItemVariation())
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                        child: RichText(
                                                                                                          textScaler: MediaQuery.of(context).textScaler,
                                                                                                          text: TextSpan(
                                                                                                            children: [
                                                                                                              TextSpan(
                                                                                                                text: FFLocalizations.of(context).getText(
                                                                                                                  'src8kvab' /* Variations:  */,
                                                                                                                ),
                                                                                                                style: TextStyle(),
                                                                                                              )
                                                                                                            ],
                                                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                  font: GoogleFonts.readexPro(
                                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                                  ),
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Flexible(
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                          child: Builder(
                                                                                                            builder: (context) {
                                                                                                              final variants = containerVarItem.itemVariation.toList();

                                                                                                              return Wrap(
                                                                                                                spacing: 2.0,
                                                                                                                runSpacing: 2.0,
                                                                                                                alignment: WrapAlignment.start,
                                                                                                                crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                                direction: Axis.horizontal,
                                                                                                                runAlignment: WrapAlignment.start,
                                                                                                                verticalDirection: VerticalDirection.down,
                                                                                                                clipBehavior: Clip.none,
                                                                                                                children: List.generate(variants.length, (variantsIndex) {
                                                                                                                  final variantsItem = variants[variantsIndex];
                                                                                                                  return Text(
                                                                                                                    '${variantsItem.variationName}, ',
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          font: GoogleFonts.readexPro(
                                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                          ),
                                                                                                                          fontSize: 10.0,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                        ),
                                                                                                                  );
                                                                                                                }),
                                                                                                              );
                                                                                                            },
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          if (containerVarItem.hasItemVariation())
                                                                                            FFButtonWidget(
                                                                                              onPressed: () async {
                                                                                                logFirebaseEvent('STORE_DETAILS_PAGE_ORDER_BTN_ON_TAP');
                                                                                                if (containerVarItem.hasItemVariation()) {
                                                                                                  logFirebaseEvent('Button_navigate_to');

                                                                                                  context.pushNamed(
                                                                                                    ProductSelectionPageWidget.routeName,
                                                                                                    queryParameters: {
                                                                                                      'currentStoreCatalog': serializeParam(
                                                                                                        containerVarItem,
                                                                                                        ParamType.Document,
                                                                                                      ),
                                                                                                      'selectedBranch': serializeParam(
                                                                                                        _model.selectedBranch,
                                                                                                        ParamType.Document,
                                                                                                      ),
                                                                                                    }.withoutNulls,
                                                                                                    extra: <String, dynamic>{
                                                                                                      'currentStoreCatalog': containerVarItem,
                                                                                                      'selectedBranch': _model.selectedBranch,
                                                                                                    },
                                                                                                  );
                                                                                                }
                                                                                              },
                                                                                              text: containerVarItem.isOutOfStock ? 'Out Of Stock' : 'Order',
                                                                                              options: FFButtonOptions(
                                                                                                width: double.infinity,
                                                                                                height: 40.0,
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                color: containerVarItem.isOutOfStock ? FlutterFlowTheme.of(context).error : FlutterFlowTheme.of(context).primary,
                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      font: GoogleFonts.readexPro(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                      ),
                                                                                                      color: Colors.white,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                    ),
                                                                                                elevation: 0.0,
                                                                                                borderSide: BorderSide(
                                                                                                  width: 0.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.only(),
                                                                                              ),
                                                                                              showLoadingIndicator: false,
                                                                                            ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        } else {
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        16.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final category = _model
                                                                        .pageLocalStoreDetail
                                                                        ?.storeCatalogCategories
                                                                        ?.toList() ??
                                                                    [];

                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: List.generate(
                                                                      category
                                                                          .length,
                                                                      (categoryIndex) {
                                                                    final categoryItem =
                                                                        category[
                                                                            categoryIndex];
                                                                    return StreamBuilder<
                                                                        List<
                                                                            StoreCatalogRecord>>(
                                                                      stream:
                                                                          queryStoreCatalogRecord(
                                                                        parent: _model
                                                                            .dynamicLinkStore
                                                                            ?.reference,
                                                                        queryBuilder: (storeCatalogRecord) => storeCatalogRecord
                                                                            .where(
                                                                              'branch_availability',
                                                                              arrayContains: _model.selectedBranch?.reference,
                                                                            )
                                                                            .where(
                                                                              'category',
                                                                              isEqualTo: categoryItem != '' ? categoryItem : null,
                                                                            ),
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 50.0,
                                                                              height: 50.0,
                                                                              child: SpinKitRipple(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                size: 50.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        List<StoreCatalogRecord>
                                                                            containerStoreCatalogRecordList =
                                                                            snapshot.data!;

                                                                        return Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              ListView(
                                                                            padding:
                                                                                EdgeInsets.zero,
                                                                            primary:
                                                                                false,
                                                                            shrinkWrap:
                                                                                true,
                                                                            scrollDirection:
                                                                                Axis.vertical,
                                                                            children: [
                                                                              if (containerStoreCatalogRecordList.isNotEmpty)
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 0.0, 8.0),
                                                                                  child: Text(
                                                                                    categoryItem,
                                                                                    style: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                          font: GoogleFonts.outfit(
                                                                                            fontWeight: FontWeight.bold,
                                                                                            fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                          ),
                                                                                          color: _model.dynamicLinkStore?.storePageTextColor != null ? _model.dynamicLinkStore?.storePageTextColor : FlutterFlowTheme.of(context).primaryText,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.bold,
                                                                                          fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              if (containerStoreCatalogRecordList.isNotEmpty)
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                  child: Builder(
                                                                                    builder: (context) {
                                                                                      final containerVar = containerStoreCatalogRecordList.toList();

                                                                                      return MasonryGridView.builder(
                                                                                        physics: const NeverScrollableScrollPhysics(),
                                                                                        gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                                                                          crossAxisCount: containerStoreCatalogRecordList.length == 1 ? 1 : 2,
                                                                                        ),
                                                                                        crossAxisSpacing: 8.0,
                                                                                        mainAxisSpacing: 8.0,
                                                                                        itemCount: containerVar.length,
                                                                                        padding: EdgeInsets.fromLTRB(
                                                                                          0,
                                                                                          0,
                                                                                          0,
                                                                                          0,
                                                                                        ),
                                                                                        shrinkWrap: true,
                                                                                        itemBuilder: (context, containerVarIndex) {
                                                                                          final containerVarItem = containerVar[containerVarIndex];
                                                                                          return Visibility(
                                                                                            visible: containerStoreCatalogRecordList.isNotEmpty,
                                                                                            child: InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                logFirebaseEvent('STORE_DETAILS_PAGE_RedeemableItem_ON_TAP');
                                                                                                if (containerVarItem.hasItemVariation()) {
                                                                                                  logFirebaseEvent('RedeemableItem_navigate_to');

                                                                                                  context.pushNamed(
                                                                                                    ProductSelectionPageWidget.routeName,
                                                                                                    queryParameters: {
                                                                                                      'currentStoreCatalog': serializeParam(
                                                                                                        containerVarItem,
                                                                                                        ParamType.Document,
                                                                                                      ),
                                                                                                      'selectedBranch': serializeParam(
                                                                                                        _model.selectedBranch,
                                                                                                        ParamType.Document,
                                                                                                      ),
                                                                                                    }.withoutNulls,
                                                                                                    extra: <String, dynamic>{
                                                                                                      'currentStoreCatalog': containerVarItem,
                                                                                                      'selectedBranch': _model.selectedBranch,
                                                                                                    },
                                                                                                  );
                                                                                                }
                                                                                              },
                                                                                              child: Material(
                                                                                                color: Colors.transparent,
                                                                                                elevation: 0.0,
                                                                                                shape: RoundedRectangleBorder(
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                child: ClipRRect(
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                  child: Container(
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                                                      border: Border.all(
                                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                                      ),
                                                                                                    ),
                                                                                                    alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsets.all(8.0),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.min,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Hero(
                                                                                                                tag: containerVarItem.itemImage,
                                                                                                                transitionOnUserGestures: true,
                                                                                                                child: ClipRRect(
                                                                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                                                                  child: CachedNetworkImage(
                                                                                                                    fadeInDuration: Duration(milliseconds: 500),
                                                                                                                    fadeOutDuration: Duration(milliseconds: 500),
                                                                                                                    imageUrl: containerVarItem.itemImage,
                                                                                                                    width: double.infinity,
                                                                                                                    height: (containerStoreCatalogRecordList.length == 1 ? 400 : 150).toDouble(),
                                                                                                                    fit: BoxFit.cover,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                                child: Text(
                                                                                                                  containerVarItem.itemName,
                                                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                                        font: GoogleFonts.readexPro(
                                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                                        ),
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                child: RichText(
                                                                                                                  textScaler: MediaQuery.of(context).textScaler,
                                                                                                                  text: TextSpan(
                                                                                                                    children: [
                                                                                                                      TextSpan(
                                                                                                                        text: FFLocalizations.of(context).getText(
                                                                                                                          'pakb65vy' /* Earn ⭐️ */,
                                                                                                                        ),
                                                                                                                        style: TextStyle(),
                                                                                                                      ),
                                                                                                                      TextSpan(
                                                                                                                        text: containerVarItem.hasItemVariation() ? containerVarItem.itemVariation.firstOrNull!.variationPoints.toString() : containerVarItem.itemPoints.toString(),
                                                                                                                        style: TextStyle(
                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                        ),
                                                                                                                      )
                                                                                                                    ],
                                                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                          font: GoogleFonts.readexPro(
                                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                                          ),
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                child: RichText(
                                                                                                                  textScaler: MediaQuery.of(context).textScaler,
                                                                                                                  text: TextSpan(
                                                                                                                    children: [
                                                                                                                      TextSpan(
                                                                                                                        text: FFLocalizations.of(context).getText(
                                                                                                                          '2le7blsc' /* Price:  */,
                                                                                                                        ),
                                                                                                                        style: TextStyle(),
                                                                                                                      ),
                                                                                                                      TextSpan(
                                                                                                                        text: containerVarItem.hasItemVariation() ? containerVarItem.itemVariation.firstOrNull!.variationPrice.toString() : containerVarItem.itemPrice.toString(),
                                                                                                                        style: TextStyle(
                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                        ),
                                                                                                                      )
                                                                                                                    ],
                                                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                          font: GoogleFonts.readexPro(
                                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                                          ),
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              if (containerVarItem.hasItemVariation())
                                                                                                                Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                  children: [
                                                                                                                    Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                      child: RichText(
                                                                                                                        textScaler: MediaQuery.of(context).textScaler,
                                                                                                                        text: TextSpan(
                                                                                                                          children: [
                                                                                                                            TextSpan(
                                                                                                                              text: FFLocalizations.of(context).getText(
                                                                                                                                '259riz09' /* Variations:  */,
                                                                                                                              ),
                                                                                                                              style: TextStyle(),
                                                                                                                            )
                                                                                                                          ],
                                                                                                                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                                font: GoogleFonts.readexPro(
                                                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                                                ),
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                                                fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Flexible(
                                                                                                                      child: Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                        child: Builder(
                                                                                                                          builder: (context) {
                                                                                                                            final variants = containerVarItem.itemVariation.toList();

                                                                                                                            return Wrap(
                                                                                                                              spacing: 2.0,
                                                                                                                              runSpacing: 2.0,
                                                                                                                              alignment: WrapAlignment.start,
                                                                                                                              crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                                              direction: Axis.horizontal,
                                                                                                                              runAlignment: WrapAlignment.start,
                                                                                                                              verticalDirection: VerticalDirection.down,
                                                                                                                              clipBehavior: Clip.none,
                                                                                                                              children: List.generate(variants.length, (variantsIndex) {
                                                                                                                                final variantsItem = variants[variantsIndex];
                                                                                                                                return Text(
                                                                                                                                  '${variantsItem.variationName}, ',
                                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                        font: GoogleFonts.readexPro(
                                                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                        ),
                                                                                                                                        fontSize: 10.0,
                                                                                                                                        letterSpacing: 0.0,
                                                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                      ),
                                                                                                                                );
                                                                                                                              }),
                                                                                                                            );
                                                                                                                          },
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                        if (containerVarItem.hasItemVariation())
                                                                                                          FFButtonWidget(
                                                                                                            onPressed: () async {
                                                                                                              logFirebaseEvent('STORE_DETAILS_PAGE_ORDER_BTN_ON_TAP');
                                                                                                              if (containerVarItem.hasItemVariation()) {
                                                                                                                logFirebaseEvent('Button_navigate_to');

                                                                                                                context.pushNamed(
                                                                                                                  ProductSelectionPageWidget.routeName,
                                                                                                                  queryParameters: {
                                                                                                                    'currentStoreCatalog': serializeParam(
                                                                                                                      containerVarItem,
                                                                                                                      ParamType.Document,
                                                                                                                    ),
                                                                                                                    'selectedBranch': serializeParam(
                                                                                                                      _model.selectedBranch,
                                                                                                                      ParamType.Document,
                                                                                                                    ),
                                                                                                                  }.withoutNulls,
                                                                                                                  extra: <String, dynamic>{
                                                                                                                    'currentStoreCatalog': containerVarItem,
                                                                                                                    'selectedBranch': _model.selectedBranch,
                                                                                                                  },
                                                                                                                );
                                                                                                              }
                                                                                                            },
                                                                                                            text: containerVarItem.isOutOfStock ? 'Out Of Stock' : 'Order',
                                                                                                            options: FFButtonOptions(
                                                                                                              width: double.infinity,
                                                                                                              height: 40.0,
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                              color: containerVarItem.isOutOfStock ? FlutterFlowTheme.of(context).error : FlutterFlowTheme.of(context).primary,
                                                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                    font: GoogleFonts.readexPro(
                                                                                                                      fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                                    ),
                                                                                                                    color: Colors.white,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                                  ),
                                                                                                              elevation: 0.0,
                                                                                                              borderSide: BorderSide(
                                                                                                                width: 0.0,
                                                                                                              ),
                                                                                                              borderRadius: BorderRadius.only(),
                                                                                                            ),
                                                                                                            showLoadingIndicator: false,
                                                                                                          ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  }).addToEnd(
                                                                      SizedBox(
                                                                          height:
                                                                              150.0)),
                                                                );
                                                              },
                                                            ),
                                                          );
                                                        }
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            KeepAliveWidgetWrapper(
                                              builder: (context) =>
                                                  SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    wrapWithModel(
                                                      model: _model
                                                          .leaderboardComponentModel,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          LeaderboardComponentWidget(
                                                        storeReferrence: _model
                                                            .dynamicLinkStore!
                                                            .reference,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            KeepAliveWidgetWrapper(
                                              builder: (context) => Stack(
                                                children: [
                                                  AuthUserStreamWidget(
                                                    builder: (context) =>
                                                        Builder(
                                                      builder: (_) {
                                                        final child = StreamBuilder<
                                                            List<
                                                                VoucherRecord>>(
                                                          stream:
                                                              queryVoucherRecord(
                                                            parent: _model
                                                                .dynamicLinkStore
                                                                ?.reference,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  child:
                                                                      EmptyComponentWidget(
                                                                    title:
                                                                        'No Vouchers Available',
                                                                    icon:
                                                                        FaIcon(
                                                                      FontAwesomeIcons
                                                                          .handPeace,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<VoucherRecord>
                                                                containerVoucherRecordList =
                                                                snapshot.data!;

                                                            return Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final containerVar = containerVoucherRecordList
                                                                      .where((e) =>
                                                                          e.isSecretVoucher ==
                                                                          false)
                                                                      .toList();
                                                                  if (containerVar
                                                                      .isEmpty) {
                                                                    return Center(
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            EmptyComponentWidget(
                                                                          title:
                                                                              'No Vouchers Available',
                                                                          icon:
                                                                              FaIcon(
                                                                            FontAwesomeIcons.handPeace,
                                                                          ),
                                                                          description:
                                                                              ' ',
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }

                                                                  return SingleChildScrollView(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: List.generate(
                                                                          containerVar
                                                                              .length,
                                                                          (containerVarIndex) {
                                                                        final containerVarItem =
                                                                            containerVar[containerVarIndex];
                                                                        return ClaimVoucherComponentWidget(
                                                                          key: Key(
                                                                              'Keyql9_${containerVarIndex}_of_${containerVar.length}'),
                                                                          currentVoucher:
                                                                              containerVarItem,
                                                                        );
                                                                      }).divide(SizedBox(height: 16.0)).addToStart(SizedBox(height: 16.0)).addToEnd(SizedBox(
                                                                          height:
                                                                              100.0)),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            );
                                                          },
                                                        );
                                                        if ((storeDetailsUserCardsRecordList
                                                                    .where((e) =>
                                                                        e.storeReferrence ==
                                                                        _model
                                                                            .pageLocalStoreDetail
                                                                            ?.reference)
                                                                    .toList()
                                                                    .length <=
                                                                0) &&
                                                            !valueOrDefault<
                                                                    bool>(
                                                                currentUserDocument
                                                                    ?.isBusinessAccount,
                                                                false)) {
                                                          return ClipRect(
                                                            child:
                                                                ImageFiltered(
                                                              imageFilter:
                                                                  ImageFilter
                                                                      .blur(
                                                                sigmaX: 6.0,
                                                                sigmaY: 6.0,
                                                              ),
                                                              child: child,
                                                            ),
                                                          );
                                                        }
                                                        return child;
                                                      },
                                                    ),
                                                  ),
                                                  if ((storeDetailsUserCardsRecordList
                                                              .where((e) =>
                                                                  e.storeReferrence ==
                                                                  _model
                                                                      .pageLocalStoreDetail
                                                                      ?.reference)
                                                              .toList()
                                                              .length <=
                                                          0) &&
                                                      !valueOrDefault<bool>(
                                                          currentUserDocument
                                                              ?.isBusinessAccount,
                                                          false))
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, -0.2),
                                                      child:
                                                          AuthUserStreamWidget(
                                                        builder: (context) =>
                                                            InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'STORE_DETAILS_PAGE_Card_pivxlf2i_ON_TAP');
                                                            if (storeDetailsUserCardsRecordList
                                                                    .where((e) =>
                                                                        e.storeReferrence ==
                                                                        _model
                                                                            .pageLocalStoreDetail
                                                                            ?.reference)
                                                                    .toList()
                                                                    .length >
                                                                0) {
                                                              logFirebaseEvent(
                                                                  'Card_show_snack_bar');
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Card Already Added',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.readexPro(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                ),
                                                              );
                                                            } else {
                                                              if (currentPhoneNumber !=
                                                                      null &&
                                                                  currentPhoneNumber !=
                                                                      '') {
                                                                logFirebaseEvent(
                                                                    'Card_firestore_query');
                                                                _model.matchedStoreCardCopyVoucher =
                                                                    await queryStoreCardsRecordOnce(
                                                                  parent: _model
                                                                      .pageLocalStoreDetail
                                                                      ?.reference,
                                                                  queryBuilder:
                                                                      (storeCardsRecord) =>
                                                                          storeCardsRecord
                                                                              .where(
                                                                    'CardOwnerPhoneNumber',
                                                                    isEqualTo:
                                                                        currentPhoneNumber,
                                                                  ),
                                                                  singleRecord:
                                                                      true,
                                                                ).then((s) => s
                                                                        .firstOrNull);
                                                                if (_model
                                                                        .matchedStoreCardCopyVoucher !=
                                                                    null) {
                                                                  logFirebaseEvent(
                                                                      'Card_backend_call');

                                                                  await UserCardsRecord
                                                                          .createDoc(
                                                                              currentUserReference!)
                                                                      .set(
                                                                          createUserCardsRecordData(
                                                                    cardOwner:
                                                                        currentUserReference,
                                                                    storeReferrence: _model
                                                                        .pageLocalStoreDetail
                                                                        ?.reference,
                                                                    currentPoints: _model
                                                                        .matchedStoreCardCopyVoucher
                                                                        ?.currentPoints,
                                                                    memberSince: _model
                                                                        .matchedStoreCardCopyVoucher
                                                                        ?.memberSince,
                                                                    cardStringID: _model
                                                                        .matchedStoreCardCopyVoucher
                                                                        ?.cardStringID,
                                                                    cardOwnerName: _model
                                                                        .matchedStoreCardCopyVoucher
                                                                        ?.cardOwnerName,
                                                                    cardOwnerPhoneNumber: _model
                                                                        .matchedStoreCardCopyVoucher
                                                                        ?.cardOwnerPhoneNumber,
                                                                    cardOwnerEmail: _model
                                                                        .matchedStoreCardCopyVoucher
                                                                        ?.cardOwnerEmail,
                                                                  ));
                                                                  logFirebaseEvent(
                                                                      'Card_backend_call');

                                                                  await _model
                                                                      .matchedStoreCardCopyVoucher!
                                                                      .reference
                                                                      .update(
                                                                          createStoreCardsRecordData(
                                                                    cardOwner:
                                                                        currentUserReference,
                                                                  ));
                                                                  logFirebaseEvent(
                                                                      'Card_navigate_to');

                                                                  context
                                                                      .goNamed(
                                                                    Auth4HomeWidget
                                                                        .routeName,
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      '__transition_info__':
                                                                          TransitionInfo(
                                                                        hasTransition:
                                                                            true,
                                                                        transitionType:
                                                                            PageTransitionType.fade,
                                                                      ),
                                                                    },
                                                                  );
                                                                } else {
                                                                  logFirebaseEvent(
                                                                      'Card_update_page_state');
                                                                  _model.generatedID = random_data
                                                                      .randomInteger(
                                                                          1,
                                                                          100000000)
                                                                      .toString();
                                                                  safeSetState(
                                                                      () {});
                                                                  logFirebaseEvent(
                                                                      'Card_backend_call');

                                                                  var userCardsRecordReference2 =
                                                                      UserCardsRecord
                                                                          .createDoc(
                                                                              currentUserReference!);
                                                                  await userCardsRecordReference2
                                                                      .set(
                                                                          createUserCardsRecordData(
                                                                    cardOwner:
                                                                        currentUserReference,
                                                                    storeReferrence: _model
                                                                        .pageLocalStoreDetail
                                                                        ?.reference,
                                                                    currentPoints:
                                                                        0,
                                                                    memberSince:
                                                                        getCurrentTimestamp,
                                                                    cardStringID:
                                                                        _model
                                                                            .generatedID,
                                                                    cardOwnerName:
                                                                        currentUserDisplayName,
                                                                    cardOwnerPhoneNumber:
                                                                        currentPhoneNumber,
                                                                    cardOwnerEmail:
                                                                        currentUserEmail,
                                                                  ));
                                                                  _model.createdUserCardCopyVoucher =
                                                                      UserCardsRecord.getDocumentFromData(
                                                                          createUserCardsRecordData(
                                                                            cardOwner:
                                                                                currentUserReference,
                                                                            storeReferrence:
                                                                                _model.pageLocalStoreDetail?.reference,
                                                                            currentPoints:
                                                                                0,
                                                                            memberSince:
                                                                                getCurrentTimestamp,
                                                                            cardStringID:
                                                                                _model.generatedID,
                                                                            cardOwnerName:
                                                                                currentUserDisplayName,
                                                                            cardOwnerPhoneNumber:
                                                                                currentPhoneNumber,
                                                                            cardOwnerEmail:
                                                                                currentUserEmail,
                                                                          ),
                                                                          userCardsRecordReference2);
                                                                  logFirebaseEvent(
                                                                      'Card_backend_call');

                                                                  await StoreCardsRecord.createDoc(_model
                                                                          .pageLocalStoreDetail!
                                                                          .reference)
                                                                      .set(
                                                                          createStoreCardsRecordData(
                                                                    cardOwner:
                                                                        currentUserReference,
                                                                    storeReferrence: _model
                                                                        .pageLocalStoreDetail
                                                                        ?.reference,
                                                                    currentPoints: _model
                                                                        .createdUserCardCopyVoucher
                                                                        ?.currentPoints,
                                                                    memberSince: _model
                                                                        .createdUserCardCopyVoucher
                                                                        ?.memberSince,
                                                                    cardStringID:
                                                                        _model
                                                                            .generatedID,
                                                                    cardOwnerName: _model
                                                                        .createdUserCardCopyVoucher
                                                                        ?.cardOwnerName,
                                                                    cardOwnerPhoneNumber:
                                                                        currentPhoneNumber,
                                                                    cardOwnerEmail:
                                                                        currentUserEmail,
                                                                  ));
                                                                  logFirebaseEvent(
                                                                      'Card_navigate_to');

                                                                  context
                                                                      .goNamed(
                                                                    Auth4HomeWidget
                                                                        .routeName,
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      '__transition_info__':
                                                                          TransitionInfo(
                                                                        hasTransition:
                                                                            true,
                                                                        transitionType:
                                                                            PageTransitionType.fade,
                                                                      ),
                                                                    },
                                                                  );
                                                                }
                                                              } else {
                                                                logFirebaseEvent(
                                                                    'Card_update_page_state');
                                                                _model.generatedID = random_data
                                                                    .randomInteger(
                                                                        1,
                                                                        100000000)
                                                                    .toString();
                                                                safeSetState(
                                                                    () {});
                                                                logFirebaseEvent(
                                                                    'Card_backend_call');

                                                                var userCardsRecordReference3 =
                                                                    UserCardsRecord
                                                                        .createDoc(
                                                                            currentUserReference!);
                                                                await userCardsRecordReference3
                                                                    .set(
                                                                        createUserCardsRecordData(
                                                                  cardOwner:
                                                                      currentUserReference,
                                                                  storeReferrence: _model
                                                                      .pageLocalStoreDetail
                                                                      ?.reference,
                                                                  currentPoints:
                                                                      0,
                                                                  memberSince:
                                                                      getCurrentTimestamp,
                                                                  cardStringID:
                                                                      _model
                                                                          .generatedID,
                                                                  cardOwnerName:
                                                                      currentUserDisplayName,
                                                                  cardOwnerPhoneNumber:
                                                                      currentPhoneNumber,
                                                                  cardOwnerEmail:
                                                                      currentUserEmail,
                                                                ));
                                                                _model.createdUserCardAlternateVoucher =
                                                                    UserCardsRecord
                                                                        .getDocumentFromData(
                                                                            createUserCardsRecordData(
                                                                              cardOwner: currentUserReference,
                                                                              storeReferrence: _model.pageLocalStoreDetail?.reference,
                                                                              currentPoints: 0,
                                                                              memberSince: getCurrentTimestamp,
                                                                              cardStringID: _model.generatedID,
                                                                              cardOwnerName: currentUserDisplayName,
                                                                              cardOwnerPhoneNumber: currentPhoneNumber,
                                                                              cardOwnerEmail: currentUserEmail,
                                                                            ),
                                                                            userCardsRecordReference3);
                                                                logFirebaseEvent(
                                                                    'Card_backend_call');

                                                                await StoreCardsRecord.createDoc(_model
                                                                        .pageLocalStoreDetail!
                                                                        .reference)
                                                                    .set(
                                                                        createStoreCardsRecordData(
                                                                  cardOwner:
                                                                      currentUserReference,
                                                                  storeReferrence: _model
                                                                      .pageLocalStoreDetail
                                                                      ?.reference,
                                                                  currentPoints: _model
                                                                      .createdUserCardAlternateVoucher
                                                                      ?.currentPoints,
                                                                  memberSince: _model
                                                                      .createdUserCardAlternateVoucher
                                                                      ?.memberSince,
                                                                  cardStringID:
                                                                      _model
                                                                          .generatedID,
                                                                  cardOwnerName: _model
                                                                      .createdUserCardAlternateVoucher
                                                                      ?.cardOwnerName,
                                                                  cardOwnerPhoneNumber:
                                                                      currentPhoneNumber,
                                                                  cardOwnerEmail:
                                                                      currentUserEmail,
                                                                ));
                                                                logFirebaseEvent(
                                                                    'Card_navigate_to');

                                                                context.goNamed(
                                                                  Auth4HomeWidget
                                                                      .routeName,
                                                                  extra: <String,
                                                                      dynamic>{
                                                                    '__transition_info__':
                                                                        TransitionInfo(
                                                                      hasTransition:
                                                                          true,
                                                                      transitionType:
                                                                          PageTransitionType
                                                                              .fade,
                                                                    ),
                                                                  },
                                                                );
                                                              }
                                                            }

                                                            safeSetState(() {});
                                                          },
                                                          child: Card(
                                                            clipBehavior: Clip
                                                                .antiAliasWithSaveLayer,
                                                            color: Color(
                                                                0xFF1E2529),
                                                            elevation: 4.0,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(8.0),
                                                              child:
                                                                  GradientText(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '3l6fkyp0' /* Join The Club!
Unlock Perks! */
                                                                  ,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLarge
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .outfit(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .headlineLarge
                                                                            .fontStyle,
                                                                      ),
                                                                      letterSpacing:
                                                                          2.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineLarge
                                                                          .fontStyle,
                                                                    ),
                                                                colors: [
                                                                  Color(
                                                                      0xFF9A8FEE),
                                                                  Color(
                                                                      0xFF8CFFF0),
                                                                  Color(
                                                                      0xFFE9AE98)
                                                                ],
                                                                gradientType:
                                                                    GradientType
                                                                        .radial,
                                                                radius: 1.0,
                                                              ),
                                                            ),
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
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        if (FFAppState()
                                .Orders
                                .where((e) =>
                                    e.storeReferrence ==
                                    _model.pageLocalStoreDetail?.reference)
                                .toList()
                                .length >
                            0)
                          Align(
                            alignment: AlignmentDirectional(-1.0, 1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 50.0),
                              child: badges.Badge(
                                badgeContent: Text(
                                  FFAppState()
                                      .Orders
                                      .where((e) =>
                                          e.storeReferrence ==
                                          _model
                                              .pageLocalStoreDetail?.reference)
                                      .toList()
                                      .length
                                      .toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        font: GoogleFonts.readexPro(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                                ),
                                showBadge: true,
                                shape: badges.BadgeShape.circle,
                                badgeColor:
                                    FlutterFlowTheme.of(context).primary,
                                elevation: 4.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 8.0, 8.0, 8.0),
                                position: badges.BadgePosition.topStart(),
                                animationType: badges.BadgeAnimationType.scale,
                                toAnimate: true,
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'STORE_DETAILS_PAGE_Card_620edtyu_ON_TAP');
                                    logFirebaseEvent('Card_navigate_to');

                                    context.pushNamed(
                                      CheckoutOrderWidget.routeName,
                                      queryParameters: {
                                        'storeReferrence': serializeParam(
                                          _model
                                              .pageLocalStoreDetail?.reference,
                                          ParamType.DocumentReference,
                                        ),
                                        'selectedBranch': serializeParam(
                                          _model.selectedBranch,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'selectedBranch': _model.selectedBranch,
                                      },
                                    );
                                  },
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    elevation: 4.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Flexible(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 8.0),
                                                    child: AutoSizeText(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'anwr6r5t' /* Cart · */,
                                                      ),
                                                      minFontSize: 5.0,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                                    .alternate,
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
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 8.0,
                                                                8.0, 8.0),
                                                    child: AutoSizeText(
                                                      '${FFAppState().Orders.where((e) => e.storeReferrence == _model.pageLocalStoreDetail?.reference).toList().length.toString()} ${FFAppState().Orders.where((e) => e.storeReferrence == _model.pageLocalStoreDetail?.reference).toList().length > 1 ? 'Items' : 'Item'}',
                                                      minFontSize: 5.0,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .outfit(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 8.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Flexible(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  8.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Total Price: ${functions.calculateTotalPrice(FFAppState().Orders.where((e) => e.storeReferrence == _model.pageLocalStoreDetail?.reference).toList()).toString()}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .readexPro(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
                                                                  8.0),
                                                      child: Text(
                                                        'Total Points Earned: ⭐️${functions.computeTotalCatalogOrderPoints(FFAppState().Orders.where((e) => e.storeReferrence == _model.pageLocalStoreDetail?.reference).toList()).toString()}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .readexPro(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
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
                                      ],
                                    ),
                                  ),
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
          ),
        );
      },
    );
  }
}
