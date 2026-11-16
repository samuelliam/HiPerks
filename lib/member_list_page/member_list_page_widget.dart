import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/empty_store_members_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:text_search/text_search.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'member_list_page_model.dart';
export 'member_list_page_model.dart';

class MemberListPageWidget extends StatefulWidget {
  const MemberListPageWidget({super.key});

  static String routeName = 'MemberListPage';
  static String routePath = 'memberListPage';

  @override
  State<MemberListPageWidget> createState() => _MemberListPageWidgetState();
}

class _MemberListPageWidgetState extends State<MemberListPageWidget> {
  late MemberListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MemberListPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'MemberListPage'});
    _model.textFieldSearchTextController ??=
        TextEditingController(text: _model.search?.toString());
    _model.textFieldSearchFocusNode ??= FocusNode();
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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('MEMBER_LIST_arrow_back_rounded_ICN_ON_TA');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: GradientText(
              FFLocalizations.of(context).getText(
                '70y29a13' /* Members */,
              ),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).titleLarge.override(
                    font: GoogleFonts.outfit(
                      fontWeight:
                          FlutterFlowTheme.of(context).titleLarge.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleLarge.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).alternate,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).titleLarge.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleLarge.fontStyle,
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
              child: FlutterFlowIconButton(
                borderRadius: 20.0,
                borderWidth: 0.0,
                buttonSize: 45.0,
                icon: Icon(
                  Icons.add,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('MEMBER_LIST_PAGE_PAGE_add_ICN_ON_TAP');
                  if ((FFAppState().currentTeamMember.memberRole !=
                          AccessRole.Viewer) ||
                      !FFAppState().currentTeamMember.hasMemberRole()) {
                    logFirebaseEvent('IconButton_navigate_to');

                    context.pushNamed(AddMemberPageWidget.routeName);
                  } else {
                    logFirebaseEvent('IconButton_alert_dialog');
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return WebViewAware(
                          child: AlertDialog(
                            title: Text('Access Denied'),
                            content: Text('Viewer members cannot add members'),
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
                },
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: AuthUserStreamWidget(
            builder: (context) => StreamBuilder<List<StoreCardsRecord>>(
              stream: queryStoreCardsRecord(
                queryBuilder: (storeCardsRecord) => storeCardsRecord
                    .where(
                      'StoreReferrence',
                      isEqualTo: currentUserDocument?.store,
                      isNull: (currentUserDocument?.store) == null,
                    )
                    .orderBy('CardOwnerName'),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: EmptyStoreMembersComponentWidget(
                      discoverDidPressed: () async {},
                    ),
                  );
                }
                List<StoreCardsRecord> containerStoreCardsRecordList =
                    snapshot.data!;

                return Container(
                  decoration: BoxDecoration(),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Form(
                                  key: _model.formKey,
                                  autovalidateMode: AutovalidateMode.disabled,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 8.0),
                                    child: TextFormField(
                                      controller:
                                          _model.textFieldSearchTextController,
                                      focusNode:
                                          _model.textFieldSearchFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.textFieldSearchTextController',
                                        Duration(milliseconds: 2000),
                                        () async {
                                          logFirebaseEvent(
                                              'MEMBER_LIST_TextField_Search_ON_TEXTFIEL');
                                          logFirebaseEvent(
                                              'TextField_Search_update_page_state');
                                          _model.search = int.tryParse(_model
                                              .textFieldSearchTextController
                                              .text);
                                          safeSetState(() {});
                                          logFirebaseEvent(
                                              'TextField_Search_simple_search');
                                          safeSetState(() {
                                            _model.simpleSearchResults =
                                                TextSearch(
                                              containerStoreCardsRecordList
                                                  .map(
                                                    (record) => TextSearchItem
                                                        .fromTerms(record, [
                                                      record.cardStringID!,
                                                      record.cardOwnerName!,
                                                      record
                                                          .cardOwnerPhoneNumber!,
                                                      record.cardOwnerEmail!
                                                    ]),
                                                  )
                                                  .toList(),
                                            )
                                                    .search(_model
                                                        .textFieldSearchTextController
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
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          'omwnt45j' /* Member Search */,
                                        ),
                                        labelStyle: FlutterFlowTheme.of(context)
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
                                        hintStyle: FlutterFlowTheme.of(context)
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
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
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
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      validator: _model
                                          .textFieldSearchTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    4.0, 0.0, 8.0, 8.0),
                                child: FlutterFlowIconButton(
                                  borderRadius: 20.0,
                                  borderWidth: 0.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.qr_code_scanner_sharp,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'MEMBER_LIST_qr_code_scanner_sharp_ICN_ON');
                                    logFirebaseEvent(
                                        'IconButton_request_permissions');
                                    await requestPermission(cameraPermission);
                                    logFirebaseEvent(
                                        'IconButton_scan_barcode_q_r_code');
                                    _model.scannedQR =
                                        await FlutterBarcodeScanner.scanBarcode(
                                      '#C62828', // scanning line color
                                      FFLocalizations.of(context).getText(
                                        'hsjywgkp' /* Cancel */,
                                      ), // cancel button text
                                      true, // whether to show the torch (camera LED) toggle icon
                                      ScanMode.QR,
                                    );

                                    logFirebaseEvent(
                                        'IconButton_firestore_query');
                                    _model.scannedusercard =
                                        await queryUserCardsRecordOnce(
                                      parent: containerStoreCardsRecordList
                                          .where((e) =>
                                              e.cardStringID ==
                                              _model.scannedQR)
                                          .toList()
                                          .firstOrNull
                                          ?.cardOwner,
                                      queryBuilder: (userCardsRecord) =>
                                          userCardsRecord.where(
                                        'StoreReferrence',
                                        isEqualTo: currentUserDocument?.store,
                                      ),
                                    );
                                    if (_model.scannedusercard!.length > 0) {
                                      logFirebaseEvent(
                                          'IconButton_navigate_to');

                                      context.pushNamed(
                                        MemberDetailsWidget.routeName,
                                        queryParameters: {
                                          'userCard': serializeParam(
                                            _model.scannedusercard?.firstOrNull,
                                            ParamType.Document,
                                          ),
                                          'storeCard': serializeParam(
                                            containerStoreCardsRecordList
                                                .where((e) =>
                                                    e.cardStringID ==
                                                    _model.scannedQR)
                                                .toList()
                                                .firstOrNull,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'userCard': _model
                                              .scannedusercard?.firstOrNull,
                                          'storeCard':
                                              containerStoreCardsRecordList
                                                  .where((e) =>
                                                      e.cardStringID ==
                                                      _model.scannedQR)
                                                  .toList()
                                                  .firstOrNull,
                                        },
                                      );
                                    } else {
                                      logFirebaseEvent(
                                          'IconButton_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: Text('QR Code Scanned'),
                                              content: Text(
                                                  'Member not found 🤔 Please check if the card shown is correct and try again. 🙏'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok 👍'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    }

                                    safeSetState(() {});
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Builder(
                          builder: (context) {
                            if (_model.textFieldSearchTextController.text !=
                                    null &&
                                _model.textFieldSearchTextController.text !=
                                    '') {
                              return Builder(
                                builder: (context) {
                                  final searchResult =
                                      _model.simpleSearchResults.toList();
                                  if (searchResult.isEmpty) {
                                    return EmptyStoreMembersComponentWidget(
                                      discoverDidPressed: () async {},
                                    );
                                  }

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: searchResult.length,
                                    itemBuilder: (context, searchResultIndex) {
                                      final searchResultItem =
                                          searchResult[searchResultIndex];
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 16.0, 16.0, 16.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'MEMBER_LIST_Row_ux3w1ul4_ON_TAP');
                                                if (searchResultItem
                                                        .cardOwner !=
                                                    null) {
                                                  logFirebaseEvent(
                                                      'Row_firestore_query');
                                                  _model.usercard =
                                                      await queryUserCardsRecordOnce(
                                                    parent: searchResultItem
                                                        .cardOwner,
                                                    queryBuilder:
                                                        (userCardsRecord) =>
                                                            userCardsRecord
                                                                .where(
                                                      'StoreReferrence',
                                                      isEqualTo:
                                                          searchResultItem
                                                              .storeReferrence,
                                                    ),
                                                    singleRecord: true,
                                                  ).then((s) => s.firstOrNull);
                                                  if (_model.usercard != null) {
                                                    logFirebaseEvent(
                                                        'Row_navigate_to');

                                                    context.pushNamed(
                                                      MemberDetailsWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'userCard':
                                                            serializeParam(
                                                          _model.usercard,
                                                          ParamType.Document,
                                                        ),
                                                        'storeCard':
                                                            serializeParam(
                                                          searchResultItem,
                                                          ParamType.Document,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'userCard':
                                                            _model.usercard,
                                                        'storeCard':
                                                            searchResultItem,
                                                      },
                                                    );
                                                  }
                                                } else {
                                                  logFirebaseEvent(
                                                      'Row_navigate_to');

                                                  context.pushNamed(
                                                    MemberDetailsManuallyAddedWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'storeCard':
                                                          serializeParam(
                                                        searchResultItem,
                                                        ParamType.Document,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'storeCard':
                                                          searchResultItem,
                                                    },
                                                  );
                                                }

                                                safeSetState(() {});
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        searchResultItem
                                                            .cardOwnerName,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .outfit(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                      StreamBuilder<
                                                          List<
                                                              UserCardsRecord>>(
                                                        stream:
                                                            queryUserCardsRecord(
                                                          parent:
                                                              searchResultItem
                                                                  .cardOwner,
                                                          queryBuilder:
                                                              (userCardsRecord) =>
                                                                  userCardsRecord
                                                                      .where(
                                                            'CardStringID',
                                                            isEqualTo:
                                                                searchResultItem
                                                                    .cardStringID,
                                                          ),
                                                          singleRecord: true,
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
                                                          List<UserCardsRecord>
                                                              textUserCardsRecordList =
                                                              snapshot.data!;
                                                          // Return an empty Container when the item does not exist.
                                                          if (snapshot
                                                              .data!.isEmpty) {
                                                            return Container();
                                                          }
                                                          final textUserCardsRecord =
                                                              textUserCardsRecordList
                                                                      .isNotEmpty
                                                                  ? textUserCardsRecordList
                                                                      .first
                                                                  : null;

                                                          return Text(
                                                            '⭐️ ${textUserCardsRecord?.currentPoints?.toString()}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .readexPro(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontStyle,
                                                                ),
                                                          );
                                                        },
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 8.0)),
                                                  ),
                                                  Icon(
                                                    Icons.chevron_right,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    size: 30.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              );
                            } else {
                              return Builder(
                                builder: (context) {
                                  final businessHomeVar =
                                      containerStoreCardsRecordList.toList();

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: businessHomeVar.length,
                                    itemBuilder:
                                        (context, businessHomeVarIndex) {
                                      final businessHomeVarItem =
                                          businessHomeVar[businessHomeVarIndex];
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 16.0, 16.0, 16.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'MEMBER_LIST_Row_yk5ao3r1_ON_TAP');
                                                if (businessHomeVarItem
                                                        .cardOwner !=
                                                    null) {
                                                  logFirebaseEvent(
                                                      'Row_firestore_query');
                                                  _model.usercardCopy =
                                                      await queryUserCardsRecordOnce(
                                                    parent: businessHomeVarItem
                                                        .cardOwner,
                                                    queryBuilder:
                                                        (userCardsRecord) =>
                                                            userCardsRecord
                                                                .where(
                                                      'StoreReferrence',
                                                      isEqualTo:
                                                          currentUserDocument
                                                              ?.store,
                                                    ),
                                                    singleRecord: true,
                                                  ).then((s) => s.firstOrNull);
                                                  if (_model.usercardCopy !=
                                                      null) {
                                                    logFirebaseEvent(
                                                        'Row_navigate_to');

                                                    context.pushNamed(
                                                      MemberDetailsWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'userCard':
                                                            serializeParam(
                                                          _model.usercardCopy,
                                                          ParamType.Document,
                                                        ),
                                                        'storeCard':
                                                            serializeParam(
                                                          businessHomeVarItem,
                                                          ParamType.Document,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'userCard':
                                                            _model.usercardCopy,
                                                        'storeCard':
                                                            businessHomeVarItem,
                                                      },
                                                    );
                                                  }
                                                } else {
                                                  logFirebaseEvent(
                                                      'Row_navigate_to');

                                                  context.pushNamed(
                                                    MemberDetailsManuallyAddedWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'storeCard':
                                                          serializeParam(
                                                        businessHomeVarItem,
                                                        ParamType.Document,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'storeCard':
                                                          businessHomeVarItem,
                                                    },
                                                  );
                                                }

                                                safeSetState(() {});
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        businessHomeVarItem
                                                            .cardOwnerName,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .outfit(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                      StreamBuilder<
                                                          List<
                                                              UserCardsRecord>>(
                                                        stream:
                                                            queryUserCardsRecord(
                                                          parent:
                                                              businessHomeVarItem
                                                                  .cardOwner,
                                                          queryBuilder:
                                                              (userCardsRecord) =>
                                                                  userCardsRecord
                                                                      .where(
                                                            'CardStringID',
                                                            isEqualTo:
                                                                businessHomeVarItem
                                                                    .cardStringID,
                                                          ),
                                                          singleRecord: true,
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
                                                          List<UserCardsRecord>
                                                              textUserCardsRecordList =
                                                              snapshot.data!;
                                                          // Return an empty Container when the item does not exist.
                                                          if (snapshot
                                                              .data!.isEmpty) {
                                                            return Container();
                                                          }
                                                          final textUserCardsRecord =
                                                              textUserCardsRecordList
                                                                      .isNotEmpty
                                                                  ? textUserCardsRecordList
                                                                      .first
                                                                  : null;

                                                          return Text(
                                                            '⭐️ ${valueOrDefault<String>(
                                                              textUserCardsRecord
                                                                  ?.currentPoints
                                                                  ?.toString(),
                                                              'Not Available',
                                                            )}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .readexPro(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontStyle,
                                                                ),
                                                          );
                                                        },
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 8.0)),
                                                  ),
                                                  Icon(
                                                    Icons.chevron_right,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    size: 30.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
