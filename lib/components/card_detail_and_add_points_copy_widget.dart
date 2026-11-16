import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/add_point_confirm_component_widget.dart';
import '/components/add_points_catalog_item_component_widget.dart';
import '/components/add_quick_points_prompt_widget.dart';
import '/components/custom_loyalty_card_preview_copy_widget.dart';
import '/components/paywall_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'card_detail_and_add_points_copy_model.dart';
export 'card_detail_and_add_points_copy_model.dart';

class CardDetailAndAddPointsCopyWidget extends StatefulWidget {
  const CardDetailAndAddPointsCopyWidget({
    super.key,
    required this.currentCard,
    required this.totalPointsGiven,
  });

  final StoreCardsRecord? currentCard;
  final int? totalPointsGiven;

  @override
  State<CardDetailAndAddPointsCopyWidget> createState() =>
      _CardDetailAndAddPointsCopyWidgetState();
}

class _CardDetailAndAddPointsCopyWidgetState
    extends State<CardDetailAndAddPointsCopyWidget> {
  late CardDetailAndAddPointsCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardDetailAndAddPointsCopyModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CARD_DETAIL_AND_ADD_POINTS_COPY_CardDeta');
      logFirebaseEvent('CardDetailAndAddPointsCopy_firestore_que');
      _model.manualQueriedCatalogList = await queryStoreCatalogRecordOnce(
        parent: currentUserDocument?.store,
        queryBuilder: (storeCatalogRecord) =>
            storeCatalogRecord.orderBy('item_name'),
      );
      logFirebaseEvent('CardDetailAndAddPointsCopy_update_compon');
      _model.catalogList =
          _model.manualQueriedCatalogList!.toList().cast<StoreCatalogRecord>();
      safeSetState(() {});
      logFirebaseEvent('CardDetailAndAddPointsCopy_update_compon');
      _model.currentTransactionID = random_data.randomString(
        4,
        15,
        false,
        true,
        true,
      );
      safeSetState(() {});
    });

    _model.textController1 ??=
        TextEditingController(text: _model.currentAddPoints.toString());
    _model.textFieldFocusNode1 ??= FocusNode();
    _model.textFieldFocusNode1!.addListener(
      () async {
        logFirebaseEvent('CARD_DETAIL_AND_ADD_POINTS_COPY_TextFiel');
        if (_model.textController1.text != null &&
            _model.textController1.text != '') {
          logFirebaseEvent('TextField_update_component_state');
          _model.currentAddPoints = valueOrDefault<int>(
            int.tryParse(_model.textController1.text),
            1,
          );
          safeSetState(() {});
        } else {
          logFirebaseEvent('TextField_update_component_state');
          _model.currentAddPoints = 1;
          safeSetState(() {});
        }

        logFirebaseEvent('TextField_set_form_field');
        safeSetState(() {
          _model.textController1?.text = _model.currentAddPoints.toString();
        });
      },
    );
    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();
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
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            wrapWithModel(
              model: _model.customLoyaltyCardPreviewCopyModel,
              updateCallback: () => safeSetState(() {}),
              updateOnChange: true,
              child: CustomLoyaltyCardPreviewCopyWidget(
                currentCard: widget!.currentCard!,
              ),
            ),
            if (_model.catalogList.isNotEmpty)
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 24.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'ckdde7g8' /* Select Customer Order */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.readexPro(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
              ),
            Builder(
              builder: (context) {
                final catalog = _model.catalogList.toList();

                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(catalog.length, (catalogIndex) {
                      final catalogItem = catalog[catalogIndex];
                      return AddPointsCatalogItemComponentWidget(
                        key: Key('Keytty_${catalogIndex}_of_${catalog.length}'),
                        currentCatalogItem: catalogItem,
                        didAddCounter: (orderCount, currentVariant) async {
                          logFirebaseEvent(
                              'CARD_DETAIL_AND_ADD_POINTS_COPY_Containe');
                          if (orderCount! > 0) {
                            if (_model.orderList
                                    .where((e) =>
                                        e.catalogItemReferrence ==
                                        catalogItem.reference)
                                    .toList()
                                    .length >
                                0) {
                              logFirebaseEvent(
                                  'AddPointsCatalogItemComponent_update_com');
                              _model.removeFromOrderList(_model.orderList
                                  .where((e) =>
                                      e.catalogItemReferrence ==
                                      catalogItem.reference)
                                  .toList()
                                  .firstOrNull!);
                              safeSetState(() {});
                              logFirebaseEvent(
                                  'AddPointsCatalogItemComponent_update_com');
                              _model.addToOrderList(CatalogOrderStruct(
                                catalogItemName: catalogItem.itemName,
                                catalogItemPoints:
                                    currentVariant?.variationPoints,
                                catalogItemPrice:
                                    currentVariant?.variationPrice,
                                catalogItemReferrence: catalogItem.reference,
                                orderCount: orderCount,
                                variant: currentVariant,
                              ));
                              safeSetState(() {});
                            } else {
                              logFirebaseEvent(
                                  'AddPointsCatalogItemComponent_update_com');
                              _model.addToOrderList(CatalogOrderStruct(
                                catalogItemName: catalogItem.itemName,
                                catalogItemPoints:
                                    currentVariant?.variationPoints,
                                catalogItemPrice:
                                    currentVariant?.variationPrice,
                                catalogItemReferrence: catalogItem.reference,
                                orderCount: orderCount,
                                variant: currentVariant,
                              ));
                              safeSetState(() {});
                            }

                            logFirebaseEvent(
                                'AddPointsCatalogItemComponent_set_form_f');
                            safeSetState(() {
                              _model.textController1?.text = functions
                                  .computeTotalCatalogOrderPoints(
                                      _model.orderList.toList())!
                                  .toString();
                            });
                            logFirebaseEvent(
                                'AddPointsCatalogItemComponent_update_com');
                            _model.currentAddPoints =
                                functions.computeTotalCatalogOrderPoints(
                                    _model.orderList.toList())!;
                            safeSetState(() {});
                          }
                        },
                        didDeductCounter: (orderCount, currentVarriant) async {
                          logFirebaseEvent(
                              'CARD_DETAIL_AND_ADD_POINTS_COPY_Containe');
                          if (orderCount! > 0) {
                            if (_model.orderList
                                    .where((e) =>
                                        e.catalogItemReferrence ==
                                        catalogItem.reference)
                                    .toList()
                                    .length >
                                0) {
                              logFirebaseEvent(
                                  'AddPointsCatalogItemComponent_update_com');
                              _model.removeFromOrderList(_model.orderList
                                  .where((e) =>
                                      e.catalogItemReferrence ==
                                      catalogItem.reference)
                                  .toList()
                                  .firstOrNull!);
                              safeSetState(() {});
                              logFirebaseEvent(
                                  'AddPointsCatalogItemComponent_update_com');
                              _model.addToOrderList(CatalogOrderStruct(
                                catalogItemName: catalogItem.itemName,
                                catalogItemPoints: catalogItem.itemPoints,
                                catalogItemPrice: catalogItem.itemPrice,
                                catalogItemReferrence: catalogItem.reference,
                                orderCount: orderCount,
                              ));
                              safeSetState(() {});
                            } else {
                              logFirebaseEvent(
                                  'AddPointsCatalogItemComponent_update_com');
                              _model.addToOrderList(CatalogOrderStruct(
                                catalogItemName: catalogItem.itemName,
                                catalogItemPoints: catalogItem.itemPoints,
                                catalogItemPrice: catalogItem.itemPrice,
                                catalogItemReferrence: catalogItem.reference,
                                orderCount: orderCount,
                              ));
                              safeSetState(() {});
                            }
                          } else {
                            logFirebaseEvent(
                                'AddPointsCatalogItemComponent_update_com');
                            _model.removeFromOrderList(_model.orderList
                                .where((e) =>
                                    e.catalogItemReferrence ==
                                    catalogItem.reference)
                                .toList()
                                .firstOrNull!);
                            safeSetState(() {});
                          }

                          logFirebaseEvent(
                              'AddPointsCatalogItemComponent_set_form_f');
                          safeSetState(() {
                            _model.textController1?.text = functions
                                .computeTotalCatalogOrderPoints(
                                    _model.orderList.toList())!
                                .toString();
                          });
                          logFirebaseEvent(
                              'AddPointsCatalogItemComponent_update_com');
                          _model.currentAddPoints =
                              functions.computeTotalCatalogOrderPoints(
                                  _model.orderList.toList())!;
                          safeSetState(() {});
                        },
                      );
                    })
                        .divide(SizedBox(width: 8.0))
                        .addToStart(SizedBox(width: 24.0))
                        .addToEnd(SizedBox(width: 24.0)),
                  ),
                );
              },
            ),
            if (!(_model.catalogList.isNotEmpty))
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).primaryText,
                      width: 2.0,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '3zwoxs8q' /* Quick Points */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: AuthUserStreamWidget(
                                builder: (context) =>
                                    StreamBuilder<StoresRecord>(
                                  stream: StoresRecord.getDocument(
                                      currentUserDocument!.store!),
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

                                    final rowStoresRecord = snapshot.data!;

                                    return Builder(
                                      builder: (context) {
                                        final quickPoints = rowStoresRecord
                                            .storeQuickPointsAdd
                                            .toList();

                                        return SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                quickPoints.length,
                                                (quickPointsIndex) {
                                              final quickPointsItem =
                                                  quickPoints[quickPointsIndex];
                                              return Flexible(
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onLongPress: () async {
                                                    logFirebaseEvent(
                                                        'CARD_DETAIL_AND_ADD_POINTS_COPY_BUTTON_B');
                                                    logFirebaseEvent(
                                                        'Button_alert_dialog');
                                                    var confirmDialogResponse =
                                                        await showDialog<bool>(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return WebViewAware(
                                                                  child:
                                                                      AlertDialog(
                                                                    title: Text(
                                                                        'Quickpoints Delete Confirmation'),
                                                                    content: Text(
                                                                        'Are you sure to delete this quick points?'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                        child: Text(
                                                                            'Cancel'),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                        child: Text(
                                                                            'Confirm'),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            ) ??
                                                            false;
                                                    if (confirmDialogResponse) {
                                                      logFirebaseEvent(
                                                          'Button_backend_call');

                                                      await rowStoresRecord
                                                          .reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'storeQuickPointsAdd':
                                                                FieldValue
                                                                    .arrayRemove([
                                                              quickPointsItem
                                                            ]),
                                                          },
                                                        ),
                                                      });
                                                    }
                                                  },
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'CARD_DETAIL_AND_ADD_POINTS_COPY_BUTTON_B');
                                                      logFirebaseEvent(
                                                          'Button_update_component_state');
                                                      _model.currentAddPoints =
                                                          _model.currentAddPoints +
                                                              quickPointsItem;
                                                      safeSetState(() {});
                                                      logFirebaseEvent(
                                                          'Button_set_form_field');
                                                      safeSetState(() {
                                                        _model.textController1
                                                                ?.text =
                                                            _model
                                                                .currentAddPoints
                                                                .toString();
                                                      });
                                                    },
                                                    text: quickPointsItem
                                                        .toString(),
                                                    icon: Icon(
                                                      Icons.add_sharp,
                                                      size: 15.0,
                                                    ),
                                                    options: FFButtonOptions(
                                                      height: 30.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      textStyle:
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
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }).divide(SizedBox(width: 8.0)),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                            if ((FFAppState().currentTeamMember.memberRole ==
                                    AccessRole.Owner) ||
                                (FFAppState().currentTeamMember.memberRole ==
                                    AccessRole.Manager) ||
                                (FFAppState()
                                        .currentTeamMember
                                        .hasMemberRole() ==
                                    false))
                              Builder(
                                builder: (context) => Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'CARD_DETAIL_AND_ADD_POINTS_COPY__BTN_ON_');
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
                                              child:
                                                  AddQuickPointsPromptWidget(),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    text: '',
                                    icon: Icon(
                                      Icons.add_sharp,
                                      size: 15.0,
                                    ),
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 8.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
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
                                            fontSize: 10.0,
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            Flexible(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Container(
                        height: 50.0,
                        constraints: BoxConstraints(
                          minWidth: 100.0,
                        ),
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primaryText,
                            width: 2.5,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if ((_model.currentAddPoints <= 1) &&
                                !(_model.catalogList.isNotEmpty))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 4.0, 8.0, 4.0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  icon: FaIcon(
                                    FontAwesomeIcons.minus,
                                    color: FlutterFlowTheme.of(context).error,
                                    size: 16.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'CARD_DETAIL_AND_ADD_POINTS_COPY_minus_IC');
                                    logFirebaseEvent(
                                        'IconButton_update_component_state');
                                    _model.currentAddPoints =
                                        _model.currentAddPoints + -1;
                                    safeSetState(() {});
                                    logFirebaseEvent(
                                        'IconButton_set_form_field');
                                    safeSetState(() {
                                      _model.textController1?.text =
                                          _model.currentAddPoints.toString();
                                    });
                                  },
                                ),
                              ),
                            Flexible(
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: TextFormField(
                                  controller: _model.textController1,
                                  focusNode: _model.textFieldFocusNode1,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.textController1',
                                    Duration(milliseconds: 2000),
                                    () async {
                                      logFirebaseEvent(
                                          'CARD_DETAIL_AND_ADD_POINTS_COPY_TextFiel');
                                      if (_model.textController1.text != null &&
                                          _model.textController1.text != '') {
                                        logFirebaseEvent(
                                            'TextField_update_component_state');
                                        _model.currentAddPoints =
                                            valueOrDefault<int>(
                                          int.tryParse(
                                              _model.textController1.text),
                                          1,
                                        );
                                        safeSetState(() {});
                                      } else {
                                        logFirebaseEvent(
                                            'TextField_update_component_state');
                                        _model.currentAddPoints = 1;
                                        safeSetState(() {});
                                      }

                                      logFirebaseEvent(
                                          'TextField_set_form_field');
                                      safeSetState(() {
                                        _model.textController1?.text =
                                            _model.currentAddPoints.toString();
                                      });
                                    },
                                  ),
                                  onFieldSubmitted: (_) async {
                                    logFirebaseEvent(
                                        'CARD_DETAIL_AND_ADD_POINTS_COPY_TextFiel');
                                    if (_model.textController1.text != null &&
                                        _model.textController1.text != '') {
                                      logFirebaseEvent(
                                          'TextField_update_component_state');
                                      _model.currentAddPoints =
                                          valueOrDefault<int>(
                                        int.tryParse(
                                            _model.textController1.text),
                                        1,
                                      );
                                      safeSetState(() {});
                                    } else {
                                      logFirebaseEvent(
                                          'TextField_update_component_state');
                                      _model.currentAddPoints = 1;
                                      safeSetState(() {});
                                    }

                                    logFirebaseEvent(
                                        'TextField_set_form_field');
                                    safeSetState(() {
                                      _model.textController1?.text =
                                          _model.currentAddPoints.toString();
                                    });
                                  },
                                  autofocus: false,
                                  textInputAction: TextInputAction.done,
                                  readOnly: () {
                                    if (FFAppState()
                                            .currentTeamMember
                                            .memberRole ==
                                        AccessRole.Owner) {
                                      return false;
                                    } else if (_model.catalogList.isNotEmpty) {
                                      return true;
                                    } else {
                                      return true;
                                    }
                                  }(),
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: false,
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'vlhznim7' /* Points */,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 0.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        width: 0.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 0.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 0.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            8.0, 8.0, 8.0, 8.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.readexPro(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model.textController1Validator
                                      .asValidator(context),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp('[0-9]'))
                                  ],
                                ),
                              ),
                            ),
                            if (!(_model.catalogList.isNotEmpty))
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 4.0, 8.0, 4.0),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      Icons.add_outlined,
                                      color:
                                          FlutterFlowTheme.of(context).success,
                                      size: 20.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'CARD_DETAIL_AND_ADD_POINTS_COPY_add_outl');
                                      logFirebaseEvent(
                                          'IconButton_update_component_state');
                                      _model.currentAddPoints =
                                          _model.currentAddPoints + 1;
                                      safeSetState(() {});
                                      logFirebaseEvent(
                                          'IconButton_set_form_field');
                                      safeSetState(() {
                                        _model.textController1?.text =
                                            _model.currentAddPoints.toString();
                                      });
                                    },
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Flexible(
                              child: Builder(
                                builder: (context) => FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'CARD_DETAIL_AND_ADD_POINTS_COPY_ADD_POIN');
                                    if ((_model.currentAddPoints != null) &&
                                        (_model.currentAddPoints >= 1)) {
                                      if ((FFAppState()
                                                  .currentTeamMember
                                                  .memberRole ==
                                              AccessRole.Owner) ||
                                          (FFAppState()
                                                  .currentTeamMember
                                                  .memberRole ==
                                              AccessRole.Manager) ||
                                          (FFAppState()
                                                  .currentTeamMember
                                                  .memberRole ==
                                              AccessRole.Staff) ||
                                          (FFAppState()
                                                  .currentTeamMember
                                                  .hasMemberRole() ==
                                              false)) {
                                        logFirebaseEvent('Button_alert_dialog');
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: WebViewAware(
                                                child:
                                                    AddPointConfirmComponentWidget(
                                                  pointsAdding:
                                                      _model.currentAddPoints,
                                                  isAdded: true,
                                                  didConfirm:
                                                      (didConfirm) async {
                                                    if (didConfirm) {
                                                      logFirebaseEvent(
                                                          '_update_component_state');
                                                      _model.currentTransactionID =
                                                          random_data
                                                              .randomString(
                                                        4,
                                                        15,
                                                        false,
                                                        true,
                                                        true,
                                                      );
                                                      safeSetState(() {});
                                                      logFirebaseEvent(
                                                          '_dismiss_dialog');
                                                      Navigator.pop(context);
                                                      logFirebaseEvent(
                                                          '_revenue_cat');
                                                      final isEntitled =
                                                          await revenue_cat
                                                                  .isEntitled(
                                                                      'BrewPerksBusiness') ??
                                                              false;
                                                      if (!isEntitled) {
                                                        await revenue_cat
                                                            .loadOfferings();
                                                      }

                                                      if (isEntitled) {
                                                        logFirebaseEvent(
                                                            '_backend_call');
                                                        unawaited(
                                                          () async {
                                                            await widget!
                                                                .currentCard!
                                                                .reference
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'CurrentPoints':
                                                                      FieldValue.increment(
                                                                          _model
                                                                              .currentAddPoints),
                                                                },
                                                              ),
                                                            });
                                                          }(),
                                                        );
                                                        await Future.wait([
                                                          Future(() async {
                                                            logFirebaseEvent(
                                                                '_backend_call');
                                                            unawaited(
                                                              () async {
                                                                await TransactionsRecord.createDoc(widget!
                                                                        .currentCard!
                                                                        .storeReferrence!)
                                                                    .set({
                                                                  ...createTransactionsRecordData(
                                                                    cardReferrence: widget!
                                                                        .currentCard
                                                                        ?.reference,
                                                                    cardOwner: widget!
                                                                        .currentCard
                                                                        ?.cardOwnerName,
                                                                    pointsUsed:
                                                                        _model
                                                                            .currentAddPoints,
                                                                    datetime:
                                                                        getCurrentTimestamp,
                                                                    isPointsAdded:
                                                                        true,
                                                                    cardId: widget!
                                                                        .currentCard
                                                                        ?.cardStringID,
                                                                    teamMember:
                                                                        updateTeamMemberAccessRolesStruct(
                                                                      FFAppState()
                                                                          .currentTeamMember,
                                                                      clearUnsetFields:
                                                                          false,
                                                                      create:
                                                                          true,
                                                                    ),
                                                                    isRemovedPoints:
                                                                        false,
                                                                    branchName:
                                                                        FFAppState()
                                                                            .currentBranchName,
                                                                    branchReferrence:
                                                                        FFAppState()
                                                                            .currentBranch,
                                                                    transactionNotes:
                                                                        _model
                                                                            .textController2
                                                                            .text,
                                                                    transactionID:
                                                                        _model
                                                                            .currentTransactionID,
                                                                  ),
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'catalogItemOrders':
                                                                          getCatalogOrderListFirestoreData(
                                                                        _model
                                                                            .orderList,
                                                                      ),
                                                                    },
                                                                  ),
                                                                });
                                                              }(),
                                                            );
                                                          }),
                                                        ]);
                                                        logFirebaseEvent(
                                                            '_trigger_push_notification');
                                                        triggerPushNotification(
                                                          notificationTitle:
                                                              'Congratulations! You\'ve Earned Points 🎉',
                                                          notificationText:
                                                              'Great news! You\'ve just earned ${_model.currentAddPoints.toString()} points for your recent purchase. Keep sipping and earning with ${currentUserDisplayName}!',
                                                          notificationSound:
                                                              'default',
                                                          userRefs: [
                                                            widget!.currentCard!
                                                                .cardOwner!
                                                          ],
                                                          initialPageName:
                                                              'auth_4_Home',
                                                          parameterData: {},
                                                        );
                                                        logFirebaseEvent(
                                                            '_backend_call');
                                                        unawaited(
                                                          () async {
                                                            await PushNotificationHistoryRecord
                                                                .collection
                                                                .doc()
                                                                .set({
                                                              ...createPushNotificationHistoryRecordData(
                                                                notificationTitle:
                                                                    'Congratulations! You\'ve Earned Points 🎉',
                                                                notificationText:
                                                                    'Great news! You\'ve just earned ${_model.currentAddPoints.toString()} points for your recent purchase. Keep sipping and earning with ${currentUserDisplayName}!',
                                                                sender:
                                                                    currentUserReference,
                                                                timestamp:
                                                                    getCurrentTimestamp,
                                                              ),
                                                              ...mapToFirestore(
                                                                {
                                                                  'receiver_user_refs':
                                                                      [
                                                                    widget!
                                                                        .currentCard
                                                                        ?.cardOwner
                                                                  ],
                                                                },
                                                              ),
                                                            });
                                                          }(),
                                                        );
                                                        logFirebaseEvent(
                                                            '_dismiss_dialog');
                                                        unawaited(
                                                          () async {
                                                            Navigator.pop(
                                                                context);
                                                          }(),
                                                        );
                                                        logFirebaseEvent(
                                                            '_clear_text_fields_pin_codes');
                                                        safeSetState(() {
                                                          _model.textController1
                                                              ?.clear();
                                                          _model.textController2
                                                              ?.clear();
                                                        });
                                                      } else {
                                                        logFirebaseEvent(
                                                            '_revenue_cat');
                                                        final isEntitled =
                                                            await revenue_cat
                                                                    .isEntitled(
                                                                        'BrewPerksBusinessElite') ??
                                                                false;
                                                        if (!isEntitled) {
                                                          await revenue_cat
                                                              .loadOfferings();
                                                        }

                                                        if (isEntitled) {
                                                          logFirebaseEvent(
                                                              '_backend_call');
                                                          unawaited(
                                                            () async {
                                                              await widget!
                                                                  .currentCard!
                                                                  .reference
                                                                  .update({
                                                                ...mapToFirestore(
                                                                  {
                                                                    'CurrentPoints':
                                                                        FieldValue.increment(
                                                                            _model.currentAddPoints),
                                                                  },
                                                                ),
                                                              });
                                                            }(),
                                                          );
                                                          await Future.wait([
                                                            Future(() async {
                                                              logFirebaseEvent(
                                                                  '_backend_call');
                                                              unawaited(
                                                                () async {
                                                                  await TransactionsRecord.createDoc(widget!
                                                                          .currentCard!
                                                                          .storeReferrence!)
                                                                      .set({
                                                                    ...createTransactionsRecordData(
                                                                      cardReferrence: widget!
                                                                          .currentCard
                                                                          ?.reference,
                                                                      cardOwner: widget!
                                                                          .currentCard
                                                                          ?.cardOwnerName,
                                                                      pointsUsed:
                                                                          _model
                                                                              .currentAddPoints,
                                                                      datetime:
                                                                          getCurrentTimestamp,
                                                                      isPointsAdded:
                                                                          true,
                                                                      cardId: widget!
                                                                          .currentCard
                                                                          ?.cardStringID,
                                                                      teamMember:
                                                                          updateTeamMemberAccessRolesStruct(
                                                                        FFAppState()
                                                                            .currentTeamMember,
                                                                        clearUnsetFields:
                                                                            false,
                                                                        create:
                                                                            true,
                                                                      ),
                                                                      isRemovedPoints:
                                                                          false,
                                                                      branchReferrence:
                                                                          FFAppState()
                                                                              .currentBranch,
                                                                      branchName:
                                                                          FFAppState()
                                                                              .currentBranchName,
                                                                      transactionNotes: _model
                                                                          .textController2
                                                                          .text,
                                                                      transactionID:
                                                                          _model
                                                                              .currentTransactionID,
                                                                    ),
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'catalogItemOrders':
                                                                            getCatalogOrderListFirestoreData(
                                                                          _model
                                                                              .orderList,
                                                                        ),
                                                                      },
                                                                    ),
                                                                  });
                                                                }(),
                                                              );
                                                            }),
                                                          ]);
                                                          logFirebaseEvent(
                                                              '_trigger_push_notification');
                                                          triggerPushNotification(
                                                            notificationTitle:
                                                                'Congratulations! You\'ve Earned Points 🎉',
                                                            notificationText:
                                                                'Great news! You\'ve just earned ${_model.currentAddPoints.toString()} points for your recent purchase. Keep sipping and earning with ${currentUserDisplayName}!',
                                                            notificationSound:
                                                                'default',
                                                            userRefs: [
                                                              widget!
                                                                  .currentCard!
                                                                  .cardOwner!
                                                            ],
                                                            initialPageName:
                                                                'auth_4_Home',
                                                            parameterData: {},
                                                          );
                                                          logFirebaseEvent(
                                                              '_backend_call');
                                                          unawaited(
                                                            () async {
                                                              await PushNotificationHistoryRecord
                                                                  .collection
                                                                  .doc()
                                                                  .set({
                                                                ...createPushNotificationHistoryRecordData(
                                                                  notificationTitle:
                                                                      'Congratulations! You\'ve Earned Points 🎉',
                                                                  notificationText:
                                                                      'Great news! You\'ve just earned ${_model.currentAddPoints.toString()} points for your recent purchase. Keep sipping and earning with ${currentUserDisplayName}!',
                                                                  sender:
                                                                      currentUserReference,
                                                                  timestamp:
                                                                      getCurrentTimestamp,
                                                                ),
                                                                ...mapToFirestore(
                                                                  {
                                                                    'receiver_user_refs':
                                                                        [
                                                                      widget!
                                                                          .currentCard
                                                                          ?.cardOwner
                                                                    ],
                                                                  },
                                                                ),
                                                              });
                                                            }(),
                                                          );
                                                          logFirebaseEvent(
                                                              '_dismiss_dialog');
                                                          unawaited(
                                                            () async {
                                                              Navigator.pop(
                                                                  context);
                                                            }(),
                                                          );
                                                          logFirebaseEvent(
                                                              '_clear_text_fields_pin_codes');
                                                          safeSetState(() {
                                                            _model
                                                                .textController1
                                                                ?.clear();
                                                            _model
                                                                .textController2
                                                                ?.clear();
                                                          });
                                                        } else {
                                                          if (widget!
                                                                  .totalPointsGiven! <
                                                              1000) {
                                                            logFirebaseEvent(
                                                                '_backend_call');

                                                            await widget!
                                                                .currentCard!
                                                                .reference
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'CurrentPoints':
                                                                      FieldValue.increment(
                                                                          _model
                                                                              .currentAddPoints),
                                                                },
                                                              ),
                                                            });
                                                            await Future.wait([
                                                              Future(() async {
                                                                logFirebaseEvent(
                                                                    '_backend_call');
                                                                unawaited(
                                                                  () async {
                                                                    await TransactionsRecord.createDoc(widget!
                                                                            .currentCard!
                                                                            .storeReferrence!)
                                                                        .set({
                                                                      ...createTransactionsRecordData(
                                                                        cardReferrence: widget!
                                                                            .currentCard
                                                                            ?.reference,
                                                                        cardOwner: widget!
                                                                            .currentCard
                                                                            ?.cardOwnerName,
                                                                        pointsUsed:
                                                                            _model.currentAddPoints,
                                                                        datetime:
                                                                            getCurrentTimestamp,
                                                                        isPointsAdded:
                                                                            true,
                                                                        cardId: widget!
                                                                            .currentCard
                                                                            ?.cardStringID,
                                                                        teamMember:
                                                                            updateTeamMemberAccessRolesStruct(
                                                                          FFAppState()
                                                                              .currentTeamMember,
                                                                          clearUnsetFields:
                                                                              false,
                                                                          create:
                                                                              true,
                                                                        ),
                                                                        isRemovedPoints:
                                                                            false,
                                                                        branchName:
                                                                            FFAppState().currentBranchName,
                                                                        branchReferrence:
                                                                            FFAppState().currentBranch,
                                                                        transactionNotes: _model
                                                                            .textController2
                                                                            .text,
                                                                        transactionID:
                                                                            _model.currentTransactionID,
                                                                      ),
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'catalogItemOrders':
                                                                              getCatalogOrderListFirestoreData(
                                                                            _model.orderList,
                                                                          ),
                                                                        },
                                                                      ),
                                                                    });
                                                                  }(),
                                                                );
                                                              }),
                                                            ]);
                                                            logFirebaseEvent(
                                                                '_trigger_push_notification');
                                                            triggerPushNotification(
                                                              notificationTitle:
                                                                  'Congratulations! You\'ve Earned Points 🎉',
                                                              notificationText:
                                                                  'Great news! You\'ve just earned ${_model.currentAddPoints.toString()} points for your recent purchase. Keep sipping and earning with ${currentUserDisplayName}!',
                                                              notificationSound:
                                                                  'default',
                                                              userRefs: [
                                                                widget!
                                                                    .currentCard!
                                                                    .cardOwner!
                                                              ],
                                                              initialPageName:
                                                                  'auth_4_Home',
                                                              parameterData: {},
                                                            );
                                                            logFirebaseEvent(
                                                                '_backend_call');
                                                            unawaited(
                                                              () async {
                                                                await PushNotificationHistoryRecord
                                                                    .collection
                                                                    .doc()
                                                                    .set({
                                                                  ...createPushNotificationHistoryRecordData(
                                                                    notificationTitle:
                                                                        'Congratulations! You\'ve Earned Points 🎉',
                                                                    notificationText:
                                                                        'Great news! You\'ve just earned ${_model.currentAddPoints.toString()} points for your recent purchase. Keep sipping and earning with ${currentUserDisplayName}!',
                                                                    sender:
                                                                        currentUserReference,
                                                                    timestamp:
                                                                        getCurrentTimestamp,
                                                                  ),
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'receiver_user_refs':
                                                                          [
                                                                        widget!
                                                                            .currentCard
                                                                            ?.cardOwner
                                                                      ],
                                                                    },
                                                                  ),
                                                                });
                                                              }(),
                                                            );
                                                            logFirebaseEvent(
                                                                '_dismiss_dialog');
                                                            unawaited(
                                                              () async {
                                                                Navigator.pop(
                                                                    context);
                                                              }(),
                                                            );
                                                            logFirebaseEvent(
                                                                '_clear_text_fields_pin_codes');
                                                            safeSetState(() {
                                                              _model
                                                                  .textController1
                                                                  ?.clear();
                                                              _model
                                                                  .textController2
                                                                  ?.clear();
                                                            });
                                                          } else {
                                                            logFirebaseEvent(
                                                                '_dismiss_dialog');
                                                            Navigator.pop(
                                                                context);
                                                            logFirebaseEvent(
                                                                '_bottom_sheet');
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              useSafeArea: true,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return WebViewAware(
                                                                  child:
                                                                      Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          MediaQuery.sizeOf(context).height *
                                                                              0.9,
                                                                      child:
                                                                          PaywallComponentWidget(),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));
                                                          }

                                                          return;
                                                        }
                                                      }
                                                    }
                                                  },
                                                ),
                                              ),
                                            );
                                          },
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
                                                    'Viewers cannot add points'),
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
                                      return;
                                    }
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    '1olqhapg' /* Add Points */,
                                  ),
                                  options: FFButtonOptions(
                                    height: 50.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).success,
                                    textStyle: FlutterFlowTheme.of(context)
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
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
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
                            Flexible(
                              child: Builder(
                                builder: (context) => FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'CARD_DETAIL_AND_ADD_POINTS_COPY__BTN_ON_');
                                    if ((_model.currentAddPoints != null) &&
                                        (_model.currentAddPoints >= 1)) {
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
                                              child:
                                                  AddPointConfirmComponentWidget(
                                                pointsAdding:
                                                    _model.currentAddPoints,
                                                isAdded: false,
                                                didConfirm: (didConfirm) async {
                                                  if (didConfirm) {
                                                    logFirebaseEvent(
                                                        '_dismiss_dialog');
                                                    Navigator.pop(context);
                                                    logFirebaseEvent(
                                                        '_revenue_cat');
                                                    final isEntitled =
                                                        await revenue_cat
                                                                .isEntitled(
                                                                    'BrewPerksBusiness') ??
                                                            false;
                                                    if (!isEntitled) {
                                                      await revenue_cat
                                                          .loadOfferings();
                                                    }

                                                    if (isEntitled) {
                                                      await Future.wait([
                                                        Future(() async {
                                                          logFirebaseEvent(
                                                              '_backend_call');
                                                          unawaited(
                                                            () async {
                                                              await TransactionsRecord
                                                                      .createDoc(widget!
                                                                          .currentCard!
                                                                          .storeReferrence!)
                                                                  .set(
                                                                      createTransactionsRecordData(
                                                                cardReferrence: widget!
                                                                    .currentCard
                                                                    ?.reference,
                                                                cardOwner: widget!
                                                                    .currentCard
                                                                    ?.cardOwnerName,
                                                                pointsUsed: -(_model
                                                                    .currentAddPoints),
                                                                datetime:
                                                                    getCurrentTimestamp,
                                                                isPointsAdded:
                                                                    false,
                                                                cardId: widget!
                                                                    .currentCard
                                                                    ?.cardStringID,
                                                                teamMember:
                                                                    updateTeamMemberAccessRolesStruct(
                                                                  FFAppState()
                                                                      .currentTeamMember,
                                                                  clearUnsetFields:
                                                                      false,
                                                                  create: true,
                                                                ),
                                                                isRemovedPoints:
                                                                    true,
                                                                branchReferrence:
                                                                    FFAppState()
                                                                        .currentBranch,
                                                                branchName:
                                                                    FFAppState()
                                                                        .currentBranchName,
                                                                isConfirmed:
                                                                    false,
                                                              ));
                                                            }(),
                                                          );
                                                        }),
                                                      ]);
                                                      logFirebaseEvent(
                                                          '_dismiss_dialog');
                                                      Navigator.pop(context);
                                                      logFirebaseEvent(
                                                          '_clear_text_fields_pin_codes');
                                                      safeSetState(() {
                                                        _model.textController1
                                                            ?.clear();
                                                        _model.textController2
                                                            ?.clear();
                                                      });
                                                    } else {
                                                      logFirebaseEvent(
                                                          '_revenue_cat');
                                                      final isEntitled =
                                                          await revenue_cat
                                                                  .isEntitled(
                                                                      'BrewPerksBusinessElite') ??
                                                              false;
                                                      if (!isEntitled) {
                                                        await revenue_cat
                                                            .loadOfferings();
                                                      }

                                                      if (isEntitled) {
                                                        await Future.wait([
                                                          Future(() async {
                                                            logFirebaseEvent(
                                                                '_backend_call');
                                                            unawaited(
                                                              () async {
                                                                await TransactionsRecord.createDoc(widget!
                                                                        .currentCard!
                                                                        .storeReferrence!)
                                                                    .set(
                                                                        createTransactionsRecordData(
                                                                  cardReferrence: widget!
                                                                      .currentCard
                                                                      ?.reference,
                                                                  cardOwner: widget!
                                                                      .currentCard
                                                                      ?.cardOwnerName,
                                                                  pointsUsed:
                                                                      -(_model
                                                                          .currentAddPoints),
                                                                  datetime:
                                                                      getCurrentTimestamp,
                                                                  isPointsAdded:
                                                                      false,
                                                                  cardId: widget!
                                                                      .currentCard
                                                                      ?.cardStringID,
                                                                  teamMember:
                                                                      updateTeamMemberAccessRolesStruct(
                                                                    FFAppState()
                                                                        .currentTeamMember,
                                                                    clearUnsetFields:
                                                                        false,
                                                                    create:
                                                                        true,
                                                                  ),
                                                                  isRemovedPoints:
                                                                      true,
                                                                  branchName:
                                                                      FFAppState()
                                                                          .currentBranchName,
                                                                  branchReferrence:
                                                                      FFAppState()
                                                                          .currentBranch,
                                                                  isConfirmed:
                                                                      false,
                                                                ));
                                                              }(),
                                                            );
                                                          }),
                                                        ]);
                                                        logFirebaseEvent(
                                                            '_dismiss_dialog');
                                                        Navigator.pop(context);
                                                        logFirebaseEvent(
                                                            '_clear_text_fields_pin_codes');
                                                        safeSetState(() {
                                                          _model.textController1
                                                              ?.clear();
                                                          _model.textController2
                                                              ?.clear();
                                                        });
                                                      } else {
                                                        if (widget!
                                                                .totalPointsGiven! <
                                                            1000) {
                                                          await Future.wait([
                                                            Future(() async {
                                                              logFirebaseEvent(
                                                                  '_backend_call');
                                                              unawaited(
                                                                () async {
                                                                  await TransactionsRecord.createDoc(widget!
                                                                          .currentCard!
                                                                          .storeReferrence!)
                                                                      .set(
                                                                          createTransactionsRecordData(
                                                                    cardReferrence: widget!
                                                                        .currentCard
                                                                        ?.reference,
                                                                    cardOwner: widget!
                                                                        .currentCard
                                                                        ?.cardOwnerName,
                                                                    pointsUsed:
                                                                        -(_model
                                                                            .currentAddPoints),
                                                                    datetime:
                                                                        getCurrentTimestamp,
                                                                    isPointsAdded:
                                                                        false,
                                                                    cardId: widget!
                                                                        .currentCard
                                                                        ?.cardStringID,
                                                                    teamMember:
                                                                        updateTeamMemberAccessRolesStruct(
                                                                      FFAppState()
                                                                          .currentTeamMember,
                                                                      clearUnsetFields:
                                                                          false,
                                                                      create:
                                                                          true,
                                                                    ),
                                                                    isRemovedPoints:
                                                                        true,
                                                                    branchName:
                                                                        FFAppState()
                                                                            .currentBranchName,
                                                                    branchReferrence:
                                                                        FFAppState()
                                                                            .currentBranch,
                                                                    isConfirmed:
                                                                        false,
                                                                  ));
                                                                }(),
                                                              );
                                                            }),
                                                          ]);
                                                          logFirebaseEvent(
                                                              '_dismiss_dialog');
                                                          Navigator.pop(
                                                              context);
                                                          logFirebaseEvent(
                                                              '_clear_text_fields_pin_codes');
                                                          safeSetState(() {
                                                            _model
                                                                .textController1
                                                                ?.clear();
                                                            _model
                                                                .textController2
                                                                ?.clear();
                                                          });
                                                        } else {
                                                          logFirebaseEvent(
                                                              '_dismiss_dialog');
                                                          Navigator.pop(
                                                              context);
                                                          logFirebaseEvent(
                                                              '_bottom_sheet');
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            useSafeArea: true,
                                                            context: context,
                                                            builder: (context) {
                                                              return WebViewAware(
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        MediaQuery.sizeOf(context).height *
                                                                            0.9,
                                                                    child:
                                                                        PaywallComponentWidget(),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        }

                                                        return;
                                                      }
                                                    }
                                                  }
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      return;
                                    }
                                  },
                                  text: '',
                                  icon: Icon(
                                    Icons.remove_circle,
                                    size: 15.0,
                                  ),
                                  options: FFButtonOptions(
                                    height: 50.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).error,
                                    textStyle: FlutterFlowTheme.of(context)
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
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
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
                          ].divide(SizedBox(width: 8.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 16.0),
              child: TextFormField(
                controller: _model.textController2,
                focusNode: _model.textFieldFocusNode2,
                autofocus: false,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: FFLocalizations.of(context).getText(
                    'k4ue5tp6' /* Transaction Notes */,
                  ),
                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        font: GoogleFonts.readexPro(
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).labelMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelMedium.fontStyle,
                      ),
                  hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        font: GoogleFonts.readexPro(
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).labelMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelMedium.fontStyle,
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primaryText,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primary,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.readexPro(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                maxLines: null,
                validator: _model.textController2Validator.asValidator(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
