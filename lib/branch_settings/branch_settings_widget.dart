import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/add_branch_component_widget.dart';
import '/components/paywall_component_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'branch_settings_model.dart';
export 'branch_settings_model.dart';

class BranchSettingsWidget extends StatefulWidget {
  const BranchSettingsWidget({super.key});

  static String routeName = 'BranchSettings';
  static String routePath = 'branchSettings';

  @override
  State<BranchSettingsWidget> createState() => _BranchSettingsWidgetState();
}

class _BranchSettingsWidgetState extends State<BranchSettingsWidget> {
  late BranchSettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BranchSettingsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'BranchSettings'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          buttonSize: 46.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 25.0,
          ),
          onPressed: () async {
            logFirebaseEvent('BRANCH_SETTINGS_arrow_back_rounded_ICN_O');
            logFirebaseEvent('IconButton_navigate_back');
            context.pop();
          },
        ),
        title: GradientText(
          FFLocalizations.of(context).getText(
            'ukoh0gyq' /* Branch Settings */,
          ),
          style: FlutterFlowTheme.of(context).headlineSmall.override(
                font: GoogleFonts.outfit(
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                ),
                letterSpacing: 0.0,
                fontWeight:
                    FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
              ),
          colors: [
            FlutterFlowTheme.of(context).primary,
            FlutterFlowTheme.of(context).secondary
          ],
          gradientDirection: GradientDirection.ltr,
          gradientType: GradientType.linear,
        ),
        actions: [],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: AuthUserStreamWidget(
        builder: (context) => StreamBuilder<StoresRecord>(
          stream: StoresRecord.getDocument(currentUserDocument!.store!),
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

            final columnStoresRecord = snapshot.data!;

            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 16.0, 8.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'kw1re9t3' /* Branch Settings */,
                        ),
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              font: GoogleFonts.outfit(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: StreamBuilder<List<BranchesRecord>>(
                            stream: queryBranchesRecord(
                              parent: currentUserDocument?.store,
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
                                          FlutterFlowTheme.of(context).primary,
                                      size: 50.0,
                                    ),
                                  ),
                                );
                              }
                              List<BranchesRecord> containerBranchesRecordList =
                                  snapshot.data!;

                              return Container(
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller:
                                        _model.dropDownValueController ??=
                                            FormFieldController<String>(
                                      _model.dropDownValue ??=
                                          FFAppState().currentBranchName,
                                    ),
                                    options: containerBranchesRecordList
                                        .map((e) => e.branchName)
                                        .toList(),
                                    onChanged: (val) async {
                                      safeSetState(
                                          () => _model.dropDownValue = val);
                                      logFirebaseEvent(
                                          'BRANCH_SETTINGS_DropDown_0on3ccc7_ON_FOR');
                                      logFirebaseEvent(
                                          'DropDown_update_app_state');
                                      FFAppState().currentBranch =
                                          containerBranchesRecordList
                                              .where((e) =>
                                                  _model.dropDownValue ==
                                                  e.branchName)
                                              .toList()
                                              .firstOrNull
                                              ?.reference;
                                      FFAppState().currentBranchName =
                                          containerBranchesRecordList
                                              .where((e) =>
                                                  _model.dropDownValue ==
                                                  e.branchName)
                                              .toList()
                                              .firstOrNull!
                                              .branchName;
                                      safeSetState(() {});
                                    },
                                    width: double.infinity,
                                    height: 60.0,
                                    textStyle: FlutterFlowTheme.of(context)
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
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'b2suhne4' /* Select Branch */,
                                    ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    borderWidth: 2.0,
                                    borderRadius: 8.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 16.0, 4.0),
                                    hidesUnderline: true,
                                    isOverButton: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 8.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderRadius: 8.0,
                            buttonSize: 40.0,
                            fillColor: FlutterFlowTheme.of(context).error,
                            icon: Icon(
                              Icons.delete_sharp,
                              color: Colors.white,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'BRANCH_SETTINGS_delete_sharp_ICN_ON_TAP');
                              logFirebaseEvent('IconButton_alert_dialog');
                              var confirmDialogResponse = await showDialog<
                                      bool>(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                        child: AlertDialog(
                                          title:
                                              Text('Deleting Current Branch'),
                                          content: Text(
                                              'Are you sure to delete this branch?'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext, false),
                                              child: Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext, true),
                                              child: Text('Confirm'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ) ??
                                  false;
                              if (confirmDialogResponse) {
                                logFirebaseEvent(
                                    'IconButton_biometric_verification');
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
                                      'rmsu3crv' /* Please authenticate to proceed... */,
                                    ));
                                  } on PlatformException {
                                    _model.isVerified = false;
                                  }
                                  safeSetState(() {});
                                }

                                if (_model.isVerified!) {
                                  logFirebaseEvent(
                                      'IconButton_update_app_state');
                                  FFAppState().currentBranch = null;
                                  FFAppState().currentBranchName = '';
                                  safeSetState(() {});
                                  logFirebaseEvent('IconButton_backend_call');
                                  await FFAppState().currentBranch!.delete();
                                }
                              }

                              safeSetState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'jf2cp2ai' /* Adding branches helps you orga... */,
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
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 24.0, 8.0, 8.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'BRANCH_SETTINGS_PAGE_AddBranch_ON_TAP');
                              if (() {
                                if (columnStoresRecord.teamMembers.length ==
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
                                logFirebaseEvent('AddBranch_revenue_cat');
                                final isEntitled = await revenue_cat.isEntitled(
                                        FFAppConstants
                                            .BusinessPlusEntitlement) ??
                                    false;
                                if (!isEntitled) {
                                  await revenue_cat.loadOfferings();
                                }

                                if (isEntitled) {
                                  logFirebaseEvent('AddBranch_firestore_query');
                                  _model.currentStoreBranch1 =
                                      await queryBranchesRecordCount(
                                    parent: currentUserDocument?.store,
                                  );
                                  if (_model.currentStoreBranch1 == 0) {
                                    logFirebaseEvent('AddBranch_bottom_sheet');
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return WebViewAware(
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: Container(
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.8,
                                              child: AddBranchComponentWidget(),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  } else {
                                    logFirebaseEvent('AddBranch_bottom_sheet');
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return WebViewAware(
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: Container(
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.9,
                                              child: PaywallComponentWidget(
                                                initialTabIndex: 1,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  }
                                } else {
                                  logFirebaseEvent('AddBranch_revenue_cat');
                                  final isEntitled = await revenue_cat
                                          .isEntitled(FFAppConstants
                                              .BusinessEliteEntitlement) ??
                                      false;
                                  if (!isEntitled) {
                                    await revenue_cat.loadOfferings();
                                  }

                                  if (isEntitled) {
                                    logFirebaseEvent('AddBranch_bottom_sheet');
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return WebViewAware(
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: Container(
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.8,
                                              child: AddBranchComponentWidget(),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  } else {
                                    logFirebaseEvent('AddBranch_bottom_sheet');
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return WebViewAware(
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: Container(
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.9,
                                              child: PaywallComponentWidget(
                                                initialTabIndex: 1,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  }
                                }
                              } else {
                                logFirebaseEvent('AddBranch_alert_dialog');
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        title: Text('Access Denied'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
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
                            text: FFLocalizations.of(context).getText(
                              'mwqiig73' /* Add Branch */,
                            ),
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 50.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primaryText,
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
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
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
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'BRANCH_SETTINGS_PAGE_Button-Login_ON_TAP');
                        if (() {
                          if (columnStoresRecord.teamMembers.length == null) {
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
                          logFirebaseEvent('Button-Login_update_app_state');
                          FFAppState().currentBranch = null;
                          FFAppState().currentBranchName = '';
                          safeSetState(() {});
                          logFirebaseEvent('Button-Login_navigate_back');
                          context.safePop();
                        } else {
                          logFirebaseEvent('Button-Login_alert_dialog');
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return WebViewAware(
                                child: AlertDialog(
                                  title: Text('Access Denied'),
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
                      text: FFLocalizations.of(context).getText(
                        'uxw96kwz' /* See All Branch Transaction */,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primaryText,
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
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
