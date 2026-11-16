import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
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
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'points_settings_model.dart';
export 'points_settings_model.dart';

class PointsSettingsWidget extends StatefulWidget {
  const PointsSettingsWidget({super.key});

  static String routeName = 'PointsSettings';
  static String routePath = 'pointsSettings';

  @override
  State<PointsSettingsWidget> createState() => _PointsSettingsWidgetState();
}

class _PointsSettingsWidgetState extends State<PointsSettingsWidget> {
  late PointsSettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PointsSettingsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'PointsSettings'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return AuthUserStreamWidget(
      builder: (context) => StreamBuilder<StoresRecord>(
        stream: StoresRecord.getDocument(currentUserDocument!.store!),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Scaffold(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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

          final pointsSettingsStoresRecord = snapshot.data!;

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
                  logFirebaseEvent('POINTS_SETTINGS_arrow_back_rounded_ICN_O');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.pop();
                },
              ),
              title: GradientText(
                FFLocalizations.of(context).getText(
                  'chnkv3f4' /* Points Settings */,
                ),
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      font: GoogleFonts.outfit(
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineSmall
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineSmall
                            .fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineSmall.fontStyle,
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
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(8.0, 16.0, 8.0, 8.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'f5x8siyl' /* Points Settings */,
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
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: FlutterFlowDropDown<int>(
                    controller: _model.dropDownValueController ??=
                        FormFieldController<int>(
                      _model.dropDownValue ??=
                          pointsSettingsStoresRecord.pointsExpiry,
                    ),
                    options: List<int>.from([1, 3, 6, 12, 24, 36, 0]),
                    optionLabels: [
                      FFLocalizations.of(context).getText(
                        'gbv0zrq0' /* 1  Month */,
                      ),
                      FFLocalizations.of(context).getText(
                        'dox6kei4' /* 3 Months */,
                      ),
                      FFLocalizations.of(context).getText(
                        'i96vgjv6' /* 6 Months */,
                      ),
                      FFLocalizations.of(context).getText(
                        'hluvcfib' /* 1 Year */,
                      ),
                      FFLocalizations.of(context).getText(
                        'p6elefjp' /* 2 Years */,
                      ),
                      FFLocalizations.of(context).getText(
                        'w7b4sul7' /* 3 Years */,
                      ),
                      FFLocalizations.of(context).getText(
                        'c9srlmbx' /* No Expiry */,
                      )
                    ],
                    onChanged: (val) async {
                      safeSetState(() => _model.dropDownValue = val);
                      logFirebaseEvent(
                          'POINTS_SETTINGS_DropDown_k8thzatn_ON_FOR');
                      logFirebaseEvent('DropDown_revenue_cat');
                      final isEntitled = await revenue_cat.isEntitled(
                              FFAppConstants.BusinessEliteEntitlement) ??
                          false;
                      if (!isEntitled) {
                        await revenue_cat.loadOfferings();
                      }

                      if (isEntitled) {
                        if ((FFAppState().currentTeamMember.memberRole ==
                                AccessRole.Owner) ||
                            (FFAppState().currentTeamMember == null)) {
                          logFirebaseEvent('DropDown_biometric_verification');
                          final _localAuth = LocalAuthentication();
                          bool _isBiometricSupported =
                              await _localAuth.isDeviceSupported();

                          if (_isBiometricSupported) {
                            try {
                              _model.isAuthenticated =
                                  await _localAuth.authenticate(
                                      localizedReason:
                                          FFLocalizations.of(context).getText(
                                'y7qnl2k0' /* Please authenticate to continu... */,
                              ));
                            } on PlatformException {
                              _model.isAuthenticated = false;
                            }
                            safeSetState(() {});
                          }

                          if (_model.isAuthenticated!) {
                            logFirebaseEvent('DropDown_alert_dialog');
                            var confirmDialogResponse = await showDialog<bool>(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        title: Text('Changes Confirmation'),
                                        content: Text(
                                            'Do you confirm to change the points expiry?'),
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
                              logFirebaseEvent('DropDown_backend_call');

                              await currentUserDocument!.store!
                                  .update(createStoresRecordData(
                                pointsExpiry: valueOrDefault<int>(
                                  _model.dropDownValue,
                                  0,
                                ),
                              ));
                            } else {
                              logFirebaseEvent('DropDown_set_form_field');
                              safeSetState(() {
                                _model.dropDownValueController?.value =
                                    pointsSettingsStoresRecord.pointsExpiry;
                                _model.dropDownValue =
                                    pointsSettingsStoresRecord.pointsExpiry;
                              });
                            }

                            logFirebaseEvent('DropDown_alert_dialog');
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return WebViewAware(
                                  child: AlertDialog(
                                    title: Text(
                                        'Points Expiry Successfully Changed.'),
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
                          } else {
                            logFirebaseEvent('DropDown_set_form_field');
                            safeSetState(() {
                              _model.dropDownValueController?.value =
                                  pointsSettingsStoresRecord.pointsExpiry;
                              _model.dropDownValue =
                                  pointsSettingsStoresRecord.pointsExpiry;
                            });
                          }
                        } else {
                          logFirebaseEvent('DropDown_alert_dialog');
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return WebViewAware(
                                child: AlertDialog(
                                  title: Text('Access Denied'),
                                  content: Text(
                                      'You don\'t have access to this feature.'),
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
                        logFirebaseEvent('DropDown_bottom_sheet');
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return WebViewAware(
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: Container(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.9,
                                  child: PaywallComponentWidget(
                                    initialTabIndex: 1,
                                  ),
                                ),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      }

                      safeSetState(() {});
                    },
                    width: double.infinity,
                    height: 56.0,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.readexPro(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                    hintText: FFLocalizations.of(context).getText(
                      'icfkvnhb' /* Please select expiry */,
                    ),
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: FlutterFlowTheme.of(context).primaryText,
                    borderWidth: 2.0,
                    borderRadius: 8.0,
                    margin:
                        EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                    hidesUnderline: true,
                    isOverButton: true,
                    isSearchable: false,
                    isMultiSelect: false,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
