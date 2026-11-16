import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_points_catalog_item_component_model.dart';
export 'add_points_catalog_item_component_model.dart';

class AddPointsCatalogItemComponentWidget extends StatefulWidget {
  const AddPointsCatalogItemComponentWidget({
    super.key,
    required this.didAddCounter,
    required this.currentCatalogItem,
    required this.didDeductCounter,
  });

  final Future Function(
      int? orderCount, ProductVariationStruct? currentVariant)? didAddCounter;
  final StoreCatalogRecord? currentCatalogItem;
  final Future Function(
          int? orderCount, ProductVariationStruct? currentVarriant)?
      didDeductCounter;

  @override
  State<AddPointsCatalogItemComponentWidget> createState() =>
      _AddPointsCatalogItemComponentWidgetState();
}

class _AddPointsCatalogItemComponentWidgetState
    extends State<AddPointsCatalogItemComponentWidget> {
  late AddPointsCatalogItemComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddPointsCatalogItemComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ADD_POINTS_CATALOG_ITEM_COMPONENT_AddPoi');
      logFirebaseEvent('AddPointsCatalogItemComponent_update_com');
      _model.currentVariantChoice =
          widget!.currentCatalogItem?.itemVariation?.firstOrNull?.variationName;
      safeSetState(() {});
    });

    _model.textController ??=
        TextEditingController(text: _model.currentCount.toString());
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(() => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
      child: Container(
        width: 200.0,
        height: 338.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).alternate,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: CachedNetworkImage(
                      fadeInDuration: Duration(milliseconds: 500),
                      fadeOutDuration: Duration(milliseconds: 500),
                      imageUrl: widget!.currentCatalogItem!.itemImage,
                      width: double.infinity,
                      height: 150.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: Text(
                      valueOrDefault<String>(
                        widget!.currentCatalogItem?.itemName,
                        '-',
                      ),
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            font: GoogleFonts.readexPro(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontStyle,
                          ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  'pbrjj7bf' /* Earn ⭐️ */,
                                ),
                                style: TextStyle(),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                      Text(
                        valueOrDefault<String>(
                          widget!.currentCatalogItem!.itemVariation.isNotEmpty
                              ? valueOrDefault<String>(
                                  widget!.currentCatalogItem?.itemVariation
                                      ?.where((e) =>
                                          e.variationName ==
                                          _model.currentVariantChoice)
                                      .toList()
                                      ?.firstOrNull
                                      ?.variationPoints
                                      ?.toString(),
                                  '-',
                                )
                              : widget!.currentCatalogItem?.itemPoints
                                  ?.toString(),
                          '-',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.readexPro(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                    child: RichText(
                      textScaler: MediaQuery.of(context).textScaler,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: FFLocalizations.of(context).getText(
                              'gemsfz4i' /* Price:  */,
                            ),
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: valueOrDefault<String>(
                              widget!.currentCatalogItem!.itemVariation
                                      .isNotEmpty
                                  ? valueOrDefault<String>(
                                      widget!.currentCatalogItem?.itemVariation
                                          ?.where((e) =>
                                              e.variationName ==
                                              _model.currentVariantChoice)
                                          .toList()
                                          ?.firstOrNull
                                          ?.variationPrice
                                          ?.toString(),
                                      '-',
                                    )
                                  : widget!.currentCatalogItem?.itemPrice
                                      ?.toString(),
                              '-',
                            ),
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              font: GoogleFonts.readexPro(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ),
                  if (widget!.currentCatalogItem?.itemVariation != null &&
                      (widget!.currentCatalogItem?.itemVariation)!.isNotEmpty)
                    ClipRRect(
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 8.0),
                          child: FlutterFlowChoiceChips(
                            options: widget!.currentCatalogItem!.itemVariation
                                .map((e) => e.variationName)
                                .toList()
                                .map((label) => ChipData(label))
                                .toList(),
                            onChanged: (val) async {
                              safeSetState(() =>
                                  _model.choiceChipsValue = val?.firstOrNull);
                              logFirebaseEvent(
                                  'ADD_POINTS_CATALOG_ITEM_COMPONENT_Choice');
                              logFirebaseEvent(
                                  'ChoiceChips_update_component_state');
                              _model.currentVariantChoice =
                                  _model.choiceChipsValue;
                              safeSetState(() {});
                              logFirebaseEvent('ChoiceChips_execute_callback');
                              await widget.didAddCounter?.call(
                                _model.currentCount,
                                widget!.currentCatalogItem?.itemVariation
                                    ?.where((e) =>
                                        e.variationName ==
                                        _model.currentVariantChoice)
                                    .toList()
                                    ?.firstOrNull,
                              );
                            },
                            selectedChipStyle: ChipStyle(
                              backgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
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
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                              iconColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              iconSize: 18.0,
                              elevation: 4.0,
                              borderWidth: 0.0,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            unselectedChipStyle: ChipStyle(
                              backgroundColor:
                                  FlutterFlowTheme.of(context).alternate,
                              textStyle: FlutterFlowTheme.of(context)
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
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                              iconColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              iconSize: 18.0,
                              elevation: 0.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).secondary,
                              borderWidth: 1.0,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            chipSpacing: 12.0,
                            rowSpacing: 12.0,
                            multiselect: false,
                            initialized: _model.choiceChipsValue != null,
                            alignment: WrapAlignment.start,
                            controller: _model.choiceChipsValueController ??=
                                FormFieldController<List<String>>(
                              [
                                widget!.currentCatalogItem!.itemVariation
                                    .firstOrNull!.variationName
                              ],
                            ),
                            wrapped: false,
                          ),
                        ),
                      ),
                    ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: 50.0,
                      constraints: BoxConstraints(
                        minWidth: 90.0,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
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
                          if (_model.textController.text != '0')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 4.0, 8.0, 4.0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 46.0,
                                icon: FaIcon(
                                  FontAwesomeIcons.minus,
                                  color: FlutterFlowTheme.of(context).error,
                                  size: 16.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'ADD_POINTS_CATALOG_ITEM_COMPONENT_minus_');
                                  logFirebaseEvent(
                                      'IconButton_update_component_state');
                                  _model.currentCount =
                                      _model.currentCount + -1;
                                  safeSetState(() {});
                                  logFirebaseEvent('IconButton_set_form_field');
                                  safeSetState(() {
                                    _model.textController?.text =
                                        _model.currentCount.toString();
                                  });
                                  logFirebaseEvent(
                                      'IconButton_execute_callback');
                                  await widget.didDeductCounter?.call(
                                    valueOrDefault<int>(
                                      _model.currentCount,
                                      0,
                                    ),
                                    widget!.currentCatalogItem?.itemVariation
                                        ?.where((e) =>
                                            e.variationName ==
                                            _model.currentVariantChoice)
                                        .toList()
                                        ?.firstOrNull,
                                  );
                                },
                              ),
                            ),
                          Flexible(
                            child: TextFormField(
                              controller: _model.textController,
                              focusNode: _model.textFieldFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.textController',
                                Duration(milliseconds: 2000),
                                () => safeSetState(() {}),
                              ),
                              autofocus: false,
                              textInputAction: TextInputAction.done,
                              readOnly: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
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
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).primary,
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
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[0-9]'))
                              ],
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 4.0, 8.0, 4.0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 46.0,
                                icon: Icon(
                                  Icons.add_outlined,
                                  color: FlutterFlowTheme.of(context).success,
                                  size: 20.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'ADD_POINTS_CATALOG_ITEM_COMPONENT_add_ou');
                                  logFirebaseEvent(
                                      'IconButton_update_component_state');
                                  _model.currentCount = _model.currentCount + 1;
                                  safeSetState(() {});
                                  logFirebaseEvent('IconButton_set_form_field');
                                  safeSetState(() {
                                    _model.textController?.text =
                                        _model.currentCount.toString();
                                  });
                                  logFirebaseEvent(
                                      'IconButton_execute_callback');
                                  await widget.didAddCounter?.call(
                                    _model.currentCount,
                                    widget!.currentCatalogItem?.itemVariation
                                        ?.where((e) =>
                                            e.variationName ==
                                            _model.currentVariantChoice)
                                        .toList()
                                        ?.firstOrNull,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
