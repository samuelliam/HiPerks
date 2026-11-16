import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'add_member_to_voucher_page_model.dart';
export 'add_member_to_voucher_page_model.dart';

/// create an page for adding members to a voucher.
///
/// it will have a list of members of the store and can select which member i
/// want to add in the voucher
class AddMemberToVoucherPageWidget extends StatefulWidget {
  const AddMemberToVoucherPageWidget({
    super.key,
    required this.storeVoucher,
    this.addedUsers,
  });

  final VoucherRecord? storeVoucher;
  final List<DocumentReference>? addedUsers;

  static String routeName = 'AddMemberToVoucherPage';
  static String routePath = 'addMemberToVoucherPage';

  @override
  State<AddMemberToVoucherPageWidget> createState() =>
      _AddMemberToVoucherPageWidgetState();
}

class _AddMemberToVoucherPageWidgetState
    extends State<AddMemberToVoucherPageWidget> {
  late AddMemberToVoucherPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddMemberToVoucherPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AddMemberToVoucherPage'});
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthUserStreamWidget(
      builder: (context) => StreamBuilder<StoresRecord>(
        stream: StoresRecord.getDocument(currentUserDocument!.store!),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Scaffold(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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

          final addMemberToVoucherPageStoresRecord = snapshot.data!;

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
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent(
                        'ADD_MEMBER_TO_VOUCHER_arrow_back_rounded');
                    logFirebaseEvent('IconButton_navigate_back');
                    context.safePop();
                  },
                ),
                title: Text(
                  FFLocalizations.of(context).getText(
                    'qvlkcmew' /* Add Members to Voucher */,
                  ),
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        font: GoogleFonts.readexPro(
                          fontWeight: FontWeight.w600,
                          fontStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontStyle,
                        ),
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleMedium.fontStyle,
                      ),
                ),
                actions: [],
                centerTitle: true,
                elevation: 0.0,
              ),
              body: SafeArea(
                top: true,
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 8.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.local_offer_rounded,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 20.0,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          widget!.storeVoucher?.title,
                                          'No Title',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.readexPro(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 2.0, 0.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            widget!.storeVoucher?.description,
                                            'No Description',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                font: GoogleFonts.readexPro(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ].divide(SizedBox(width: 12.0)),
                            ),
                          ),
                        ),
                      ),
                      StreamBuilder<List<StoreCardsRecord>>(
                        stream: queryStoreCardsRecord(
                          parent: currentUserDocument?.store,
                          queryBuilder: (storeCardsRecord) => storeCardsRecord
                              .whereNotIn('CardOwner', widget!.addedUsers),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: SpinKitRipple(
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 50.0,
                                ),
                              ),
                            );
                          }
                          List<StoreCardsRecord> containerStoreCardsRecordList =
                              snapshot.data!;

                          return Container(
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 1.0, 8.0, 0.0),
                                        child: TextFormField(
                                          controller: _model.textController,
                                          focusNode: _model.textFieldFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.textController',
                                            Duration(milliseconds: 500),
                                            () async {
                                              logFirebaseEvent(
                                                  'ADD_MEMBER_TO_VOUCHER_TextField_xmysjut3');
                                              logFirebaseEvent(
                                                  'TextField_simple_search');
                                              safeSetState(() {
                                                _model.simpleSearchResults1 =
                                                    TextSearch(
                                                  containerStoreCardsRecordList
                                                      .map(
                                                        (record) =>
                                                            TextSearchItem
                                                                .fromTerms(
                                                                    record, [
                                                          record.cardStringID!,
                                                          record.cardOwnerName!,
                                                          record
                                                              .cardOwnerEmail!,
                                                          record
                                                              .cardOwnerPhoneNumber!
                                                        ]),
                                                      )
                                                      .toList(),
                                                )
                                                        .search(_model
                                                            .textController
                                                            .text)
                                                        .map((r) => r.object)
                                                        .toList();
                                                ;
                                              });
                                            },
                                          ),
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'pf4vlzxi' /* Search members... */,
                                            ),
                                            hintStyle: FlutterFlowTheme.of(
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
                                                      .secondaryText,
                                                  fontSize: 16.0,
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
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 12.0, 16.0, 12.0),
                                            prefixIcon: Icon(
                                              Icons.search_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 20.0,
                                            ),
                                            suffixIcon:
                                                _model.textController!.text
                                                        .isNotEmpty
                                                    ? InkWell(
                                                        onTap: () async {
                                                          _model.textController
                                                              ?.clear();
                                                          logFirebaseEvent(
                                                              'ADD_MEMBER_TO_VOUCHER_TextField_xmysjut3');
                                                          logFirebaseEvent(
                                                              'TextField_simple_search');
                                                          safeSetState(() {
                                                            _model.simpleSearchResults1 =
                                                                TextSearch(
                                                              containerStoreCardsRecordList
                                                                  .map(
                                                                    (record) =>
                                                                        TextSearchItem.fromTerms(
                                                                            record,
                                                                            [
                                                                          record
                                                                              .cardStringID!,
                                                                          record
                                                                              .cardOwnerName!,
                                                                          record
                                                                              .cardOwnerEmail!,
                                                                          record
                                                                              .cardOwnerPhoneNumber!
                                                                        ]),
                                                                  )
                                                                  .toList(),
                                                            )
                                                                    .search(_model
                                                                        .textController
                                                                        .text)
                                                                    .map((r) =>
                                                                        r.object)
                                                                    .toList();
                                                            ;
                                                          });
                                                          safeSetState(() {});
                                                        },
                                                        child: Icon(
                                                          Icons.clear,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 20.0,
                                                        ),
                                                      )
                                                    : null,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.readexPro(
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                          keyboardType: TextInputType.name,
                                          validator: _model
                                              .textControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 16.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderRadius: 8.0,
                                        buttonSize: 45.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primary,
                                        icon: Icon(
                                          Icons.qr_code_scanner_outlined,
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'ADD_MEMBER_TO_VOUCHER_qr_code_scanner_ou');
                                          logFirebaseEvent(
                                              'IconButton_scan_barcode_q_r_code');
                                          _model.scannedCard =
                                              await FlutterBarcodeScanner
                                                  .scanBarcode(
                                            '#C62828', // scanning line color
                                            FFLocalizations.of(context).getText(
                                              'spxtiq43' /* Cancel */,
                                            ), // cancel button text
                                            true, // whether to show the torch (camera LED) toggle icon
                                            ScanMode.QR,
                                          );

                                          logFirebaseEvent(
                                              'IconButton_set_form_field');
                                          safeSetState(() {
                                            _model.textController?.text =
                                                _model.scannedCard!;
                                          });
                                          logFirebaseEvent(
                                              'IconButton_simple_search');
                                          safeSetState(() {
                                            _model.simpleSearchResults2 =
                                                TextSearch(
                                              containerStoreCardsRecordList
                                                  .map(
                                                    (record) => TextSearchItem
                                                        .fromTerms(record, [
                                                      record.cardStringID!
                                                    ]),
                                                  )
                                                  .toList(),
                                            )
                                                    .search(_model.scannedCard!)
                                                    .map((r) => r.object)
                                                    .toList();
                                            ;
                                          });

                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 16.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'b9awf2ap' /* Store Members */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.readexPro(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                      ),
                                      if (_model.selectedUsers.isNotEmpty)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 4.0, 8.0, 4.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                '${_model.selectedUsers.length.toString()} selected',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .labelSmall
                                                    .override(
                                                      font:
                                                          GoogleFonts.readexPro(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                Container(
                                  constraints: BoxConstraints(
                                    maxHeight: 450.0,
                                  ),
                                  decoration: BoxDecoration(),
                                  child: Builder(
                                    builder: (context) {
                                      final containerVar = () {
                                        if (_model
                                            .simpleSearchResults1.isNotEmpty) {
                                          return _model.simpleSearchResults1;
                                        } else if (_model
                                            .simpleSearchResults2.isNotEmpty) {
                                          return _model.simpleSearchResults2;
                                        } else {
                                          return containerStoreCardsRecordList;
                                        }
                                      }()
                                          .toList();

                                      return SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children:
                                              List.generate(containerVar.length,
                                                  (containerVarIndex) {
                                            final containerVarItem =
                                                containerVar[containerVarIndex];
                                            return Material(
                                              color: Colors.transparent,
                                              child: Theme(
                                                data: ThemeData(
                                                  checkboxTheme:
                                                      CheckboxThemeData(
                                                    visualDensity:
                                                        VisualDensity.compact,
                                                    materialTapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                  ),
                                                  unselectedWidgetColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                ),
                                                child: CheckboxListTile(
                                                  value: _model
                                                          .checkboxListTileValueMap[
                                                      containerVarItem] ??= false,
                                                  onChanged: (newValue) async {
                                                    safeSetState(() => _model
                                                                .checkboxListTileValueMap[
                                                            containerVarItem] =
                                                        newValue!);
                                                    if (newValue!) {
                                                      logFirebaseEvent(
                                                          'ADD_MEMBER_TO_VOUCHER_CheckboxListTile_a');
                                                      logFirebaseEvent(
                                                          'CheckboxListTile_update_page_state');
                                                      _model.addToSelectedUsers(
                                                          containerVarItem
                                                              .cardOwner!);
                                                      safeSetState(() {});
                                                    } else {
                                                      logFirebaseEvent(
                                                          'ADD_MEMBER_TO_VOUCHER_CheckboxListTile_a');
                                                      logFirebaseEvent(
                                                          'CheckboxListTile_update_page_state');
                                                      _model
                                                          .removeFromSelectedUsers(
                                                              containerVarItem
                                                                  .cardOwner!);
                                                      safeSetState(() {});
                                                    }
                                                  },
                                                  title: Text(
                                                    valueOrDefault<String>(
                                                      containerVarItem
                                                          .cardOwnerName,
                                                      'No Name',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .readexPro(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: 16.0,
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
                                                  subtitle: Text(
                                                    valueOrDefault<String>(
                                                      containerVarItem
                                                          .cardStringID,
                                                      'No Card ID',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .readexPro(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                  tileColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  checkColor: Colors.white,
                                                  dense: false,
                                                  controlAffinity:
                                                      ListTileControlAffinity
                                                          .trailing,
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(16.0, 8.0,
                                                              16.0, 8.0),
                                                ),
                                              ),
                                            );
                                          }),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 24.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'ADD_MEMBER_TO_VOUCHER_ADD_SELECTED_MEMBE');
                              for (int loop1Index = 0;
                                  loop1Index < _model.selectedUsers.length;
                                  loop1Index++) {
                                final currentLoop1Item =
                                    _model.selectedUsers[loop1Index];
                                logFirebaseEvent('Button_backend_call');

                                var userVouchersRecordReference =
                                    UserVouchersRecord.createDoc(
                                        currentLoop1Item);
                                await userVouchersRecordReference
                                    .set(createUserVouchersRecordData(
                                  storeVoucherRef:
                                      widget!.storeVoucher?.reference,
                                  storeRef:
                                      widget!.storeVoucher?.storeReferrence,
                                  voucherID: widget!.storeVoucher?.voucherID,
                                  addedDate: getCurrentTimestamp,
                                  isClaimed: false,
                                ));
                                _model.newUserVoucher =
                                    UserVouchersRecord.getDocumentFromData(
                                        createUserVouchersRecordData(
                                          storeVoucherRef:
                                              widget!.storeVoucher?.reference,
                                          storeRef: widget!
                                              .storeVoucher?.storeReferrence,
                                          voucherID:
                                              widget!.storeVoucher?.voucherID,
                                          addedDate: getCurrentTimestamp,
                                          isClaimed: false,
                                        ),
                                        userVouchersRecordReference);
                                logFirebaseEvent('Button_backend_call');

                                await widget!.storeVoucher!.reference.update({
                                  ...mapToFirestore(
                                    {
                                      'userVouchers': FieldValue.arrayUnion(
                                          [_model.newUserVoucher?.reference]),
                                    },
                                  ),
                                });
                              }
                              logFirebaseEvent('Button_navigate_back');
                              context.safePop();
                              logFirebaseEvent(
                                  'Button_trigger_push_notification');
                              triggerPushNotification(
                                notificationTitle:
                                    '🎁 You’ve received an Exclusive Voucher!',
                                notificationText:
                                    'A special voucher has been assigned to your account. Check it out before it expires!',
                                notificationSound: 'default',
                                userRefs: widget!.addedUsers!.toList(),
                                initialPageName: 'auth_4_Home',
                                parameterData: {},
                              );

                              safeSetState(() {});
                            },
                            text: FFLocalizations.of(context).getText(
                              '79ea1422' /* Add Selected Members */,
                            ),
                            icon: Icon(
                              Icons.person_add_rounded,
                              size: 20.0,
                            ),
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 50.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconColor: Colors.white,
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
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
  }
}
