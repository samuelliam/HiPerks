import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_minimized_view_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'custom_loyalty_card_model.dart';
export 'custom_loyalty_card_model.dart';

class CustomLoyaltyCardWidget extends StatefulWidget {
  const CustomLoyaltyCardWidget({
    super.key,
    required this.currentCard,
  });

  final UserCardsRecord? currentCard;

  @override
  State<CustomLoyaltyCardWidget> createState() =>
      _CustomLoyaltyCardWidgetState();
}

class _CustomLoyaltyCardWidgetState extends State<CustomLoyaltyCardWidget>
    with TickerProviderStateMixin {
  late CustomLoyaltyCardModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomLoyaltyCardModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CUSTOM_LOYALTY_CARD_CustomLoyaltyCard_ON');
      logFirebaseEvent('CustomLoyaltyCard_backend_call');
      _model.checkCurrentStore = await StoresRecord.getDocumentOnce(
          widget!.currentCard!.storeReferrence!);
      if (!((_model.checkCurrentStore?.pointsExpiry == 0) ||
          (_model.checkCurrentStore?.pointsExpiry == null))) {
        if (!functions.computeIsPointsValidDateTime(
            widget!.currentCard!.hasPointsStartDate()
                ? widget!.currentCard!.pointsStartDate!
                : widget!.currentCard!.memberSince!,
            _model.checkCurrentStore!.pointsExpiry)!) {
          logFirebaseEvent('CustomLoyaltyCard_backend_call');
          unawaited(
            () async {
              await widget!.currentCard!.reference
                  .update(createUserCardsRecordData(
                currentPoints: 0,
                pointsStartDate: getCurrentTimestamp,
              ));
            }(),
          );
          logFirebaseEvent('CustomLoyaltyCard_firestore_query');
          _model.userStoreCard = await queryStoreCardsRecordOnce(
            parent: widget!.currentCard?.storeReferrence,
            queryBuilder: (storeCardsRecord) => storeCardsRecord.where(
              'CardStringID',
              isEqualTo: widget!.currentCard?.cardStringID,
            ),
            singleRecord: true,
          ).then((s) => s.firstOrNull);
          logFirebaseEvent('CustomLoyaltyCard_backend_call');
          unawaited(
            () async {
              await _model.userStoreCard!.reference
                  .update(createStoreCardsRecordData(
                currentPoints: 0,
                pointsStartDate: getCurrentTimestamp,
              ));
            }(),
          );
        }
      }
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
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
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<StoresRecord>(
      stream: StoresRecord.getDocument(widget!.currentCard!.storeReferrence!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return EmptyMinimizedViewWidget();
        }

        final containerStoresRecord = snapshot.data!;

        return Container(
          width: double.infinity,
          constraints: BoxConstraints(
            minHeight: 250.0,
            maxWidth: 500.0,
          ),
          decoration: BoxDecoration(),
          child: Visibility(
            visible: containerStoresRecord != null,
            child: FlipCard(
              fill: Fill.fillBack,
              controller: _model.flippableCardController,
              onFlip: () =>
                  _model.flippableCardIsFront = !_model.flippableCardIsFront,
              direction: FlipDirection.HORIZONTAL,
              speed: 400,
              front: Padding(
                padding: EdgeInsets.all(4.0),
                child: Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    minHeight: 250.0,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).alternate,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                        containerStoresRecord.storeCardImage,
                      ),
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 6.0,
                        color: Color(0x4B1A1F24),
                        offset: Offset(
                          0.0,
                          2.0,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 8.0, 16.0, 8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (containerStoresRecord.storeLogo != null &&
                                      containerStoresRecord.storeLogo != '')
                                    Flexible(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 8.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'CUSTOM_LOYALTY_CARD_Image_q8v2ljg9_ON_TA');
                                            logFirebaseEvent(
                                                'Image_navigate_to');

                                            context.pushNamed(
                                              StoreDetailsWidget.routeName,
                                              pathParameters: {
                                                'storeID': serializeParam(
                                                  containerStoresRecord.storeId,
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: CachedNetworkImage(
                                              fadeInDuration:
                                                  Duration(milliseconds: 500),
                                              fadeOutDuration:
                                                  Duration(milliseconds: 500),
                                              imageUrl: containerStoresRecord
                                                  .storeLogo,
                                              width: 100.0,
                                              height: 100.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 4.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'CUSTOM_LOYALTY_CARD_Text_76ohswzb_ON_TAP');
                                      logFirebaseEvent('Text_navigate_to');

                                      context.pushNamed(
                                        StoreDetailsWidget.routeName,
                                        pathParameters: {
                                          'storeID': serializeParam(
                                            containerStoresRecord.storeId,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Text(
                                      containerStoresRecord.storeName,
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
                                            color: valueOrDefault<Color>(
                                              containerStoresRecord
                                                  .storeCardTextColor,
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: AutoSizeText(
                                        FFLocalizations.of(context).getText(
                                          'muqoerjs' /* ⭐️ */,
                                        ),
                                        minFontSize: 10.0,
                                        style: FlutterFlowTheme.of(context)
                                            .displaySmall
                                            .override(
                                              font: GoogleFonts.outfit(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall
                                                        .fontStyle,
                                              ),
                                              color: Colors.white,
                                              fontSize: 32.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .displaySmall
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: StreamBuilder<UserCardsRecord>(
                                          stream: UserCardsRecord.getDocument(
                                              widget!.currentCard!.reference),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child: SpinKitRipple(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 50.0,
                                                  ),
                                                ),
                                              );
                                            }

                                            final textUserCardsRecord =
                                                snapshot.data!;

                                            return AutoSizeText(
                                              textUserCardsRecord.currentPoints
                                                  .toString(),
                                              minFontSize: 10.0,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .displaySmall
                                                  .override(
                                                    font: GoogleFonts.outfit(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .displaySmall
                                                              .fontStyle,
                                                    ),
                                                    color:
                                                        valueOrDefault<Color>(
                                                      containerStoresRecord
                                                          .storeCardTextColor,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                    ),
                                                    fontSize: 32.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .displaySmall
                                                            .fontStyle,
                                                  ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'CUSTOM_LOYALTY_CARD_Text_s5l4tthr_ON_TAP');
                                          logFirebaseEvent(
                                              'Text_copy_to_clipboard');
                                          await Clipboard.setData(ClipboardData(
                                              text: widget!
                                                  .currentCard!.cardStringID));
                                          logFirebaseEvent(
                                              'Text_show_snack_bar');
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Card ID Copied',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                        },
                                        child: AutoSizeText(
                                          valueOrDefault<String>(
                                            widget!.currentCard?.cardStringID,
                                            '-',
                                          ),
                                          minFontSize: 8.0,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.robotoMono(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: valueOrDefault<Color>(
                                                  containerStoresRecord
                                                      .storeCardTextColor,
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                                ),
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 8.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderRadius: 20.0,
                                        borderWidth: 1.0,
                                        buttonSize: 30.0,
                                        icon: Icon(
                                          Icons.content_copy_rounded,
                                          color: valueOrDefault<Color>(
                                            containerStoresRecord
                                                .storeCardTextColor,
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                          size: 15.0,
                                        ),
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'CUSTOM_LOYALTY_CARD_content_copy_rounded');
                                          logFirebaseEvent(
                                              'IconButton_copy_to_clipboard');
                                          await Clipboard.setData(ClipboardData(
                                              text: widget!
                                                  .currentCard!.cardStringID));
                                          logFirebaseEvent(
                                              'IconButton_show_snack_bar');
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Card ID Copied',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 8.0, 0.0),
                                              child: AutoSizeText(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'alh19uxw' /* Member Since: */,
                                                ),
                                                minFontSize: 8.0,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts
                                                          .robotoMono(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          valueOrDefault<Color>(
                                                        containerStoresRecord
                                                            .storeCardTextColor,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                      ),
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 8.0, 0.0),
                                              child: AutoSizeText(
                                                dateTimeFormat(
                                                  "yMd",
                                                  widget!.currentCard!
                                                      .memberSince!,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ),
                                                minFontSize: 8.0,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts
                                                          .robotoMono(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          valueOrDefault<Color>(
                                                        containerStoresRecord
                                                            .storeCardTextColor,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                      ),
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                        if ((containerStoresRecord
                                                    .hasPointsExpiry() ==
                                                true) &&
                                            (containerStoresRecord
                                                    .pointsExpiry >
                                                0))
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 8.0, 0.0),
                                                child: AutoSizeText(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'x4ijnzz7' /* Points Expiry: */,
                                                  ),
                                                  minFontSize: 8.0,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .robotoMono(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: valueOrDefault<
                                                            Color>(
                                                          containerStoresRecord
                                                              .storeCardTextColor,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                        ),
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 8.0, 0.0),
                                                child: AutoSizeText(
                                                  dateTimeFormat(
                                                    "yMd",
                                                    functions.getExpiryDate(
                                                        widget!.currentCard
                                                                    ?.hasPointsStartDate() ==
                                                                true
                                                            ? widget!
                                                                .currentCard!
                                                                .pointsStartDate!
                                                            : widget!
                                                                .currentCard!
                                                                .memberSince!,
                                                        containerStoresRecord
                                                            .pointsExpiry),
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ),
                                                  minFontSize: 8.0,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .robotoMono(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: valueOrDefault<
                                                            Color>(
                                                          containerStoresRecord
                                                              .storeCardTextColor,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                        ),
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                      ].divide(SizedBox(height: 4.0)),
                                    ),
                                    Flexible(
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'CUSTOM_LOYALTY_CARD_REDEEM_BTN_ON_TAP');
                                          logFirebaseEvent(
                                              'Button_navigate_to');

                                          context.pushNamed(
                                            StoreDetailsWidget.routeName,
                                            pathParameters: {
                                              'storeID': serializeParam(
                                                containerStoresRecord.storeId,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                            queryParameters: {
                                              'initialIndex': serializeParam(
                                                1,
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'awa5474x' /* Redeem */,
                                        ),
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0x0014181B),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.readexPro(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                color: valueOrDefault<Color>(
                                                  containerStoresRecord
                                                      .storeCardTextColor,
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: valueOrDefault<Color>(
                                              containerStoresRecord
                                                  .storeCardTextColor,
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
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
                      Align(
                        alignment: AlignmentDirectional(1.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 8.0, 0.0),
                          child: Icon(
                            Icons.loop_rounded,
                            color: valueOrDefault<Color>(
                              containerStoresRecord.storeCardTextColor,
                              FlutterFlowTheme.of(context).primaryText,
                            ),
                            size: 30.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              back: Align(
                alignment: AlignmentDirectional(-1.0, 1.0),
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Container(
                      width: double.infinity,
                      constraints: BoxConstraints(
                        minHeight: 250.0,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(
                            containerStoresRecord.storeCardImage,
                          ),
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 6.0,
                            color: Color(0x4B1A1F24),
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Stack(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 15.0,
                                      sigmaY: 10.0,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Container(
                                        width: 150.0,
                                        height: 150.0,
                                        child: custom_widgets.QRWithPhoto(
                                          width: 150.0,
                                          height: 150.0,
                                          cardID:
                                              widget!.currentCard!.cardStringID,
                                          qrColor: valueOrDefault<Color>(
                                            containerStoresRecord
                                                .storeCardTextColor,
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 4.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'CUSTOM_LOYALTY_CARD_Text_twqdix0m_ON_TAP');
                                            logFirebaseEvent(
                                                'Text_copy_to_clipboard');
                                            await Clipboard.setData(
                                                ClipboardData(
                                                    text: widget!.currentCard!
                                                        .cardStringID));
                                          },
                                          child: Text(
                                            valueOrDefault<String>(
                                              widget!.currentCard?.cardStringID,
                                              '-',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.robotoMono(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: valueOrDefault<Color>(
                                                    containerStoresRecord
                                                        .storeCardTextColor,
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                  ),
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 8.0, 0.0),
                                          child: FlutterFlowIconButton(
                                            borderRadius: 20.0,
                                            borderWidth: 1.0,
                                            buttonSize: 30.0,
                                            icon: Icon(
                                              Icons.content_copy_rounded,
                                              color: valueOrDefault<Color>(
                                                containerStoresRecord
                                                    .storeCardTextColor,
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                              ),
                                              size: 15.0,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'CUSTOM_LOYALTY_CARD_content_copy_rounded');
                                              logFirebaseEvent(
                                                  'IconButton_copy_to_clipboard');
                                              await Clipboard.setData(
                                                  ClipboardData(
                                                      text: widget!.currentCard!
                                                          .cardStringID));
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: AlignmentDirectional(1.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 8.0, 0.0),
                              child: Icon(
                                Icons.loop_rounded,
                                color: valueOrDefault<Color>(
                                  containerStoresRecord.storeCardTextColor,
                                  FlutterFlowTheme.of(context).primaryText,
                                ),
                                size: 30.0,
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
          ),
        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
      },
    );
  }
}
