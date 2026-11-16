import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/tools_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'dashboard_component_model.dart';
export 'dashboard_component_model.dart';

class DashboardComponentWidget extends StatefulWidget {
  const DashboardComponentWidget({
    super.key,
    this.parameter1,
  });

  final int? parameter1;

  @override
  State<DashboardComponentWidget> createState() =>
      _DashboardComponentWidgetState();
}

class _DashboardComponentWidgetState extends State<DashboardComponentWidget> {
  late DashboardComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 0.0, 0.0),
            child: Text(
              FFAppState().currentBranchName != null &&
                      FFAppState().currentBranchName != ''
                  ? '${FFAppState().currentBranchName} Dashboard'
                  : 'Dashboard',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    font: GoogleFonts.outfit(
                      fontWeight: FontWeight.w500,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).primary,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 8.0),
            child: Text(
              FFLocalizations.of(context).getText(
                'mi4h0zop' /* Summary Overview */,
              ),
              style: FlutterFlowTheme.of(context).labelMedium.override(
                    font: GoogleFonts.readexPro(
                      fontWeight:
                          FlutterFlowTheme.of(context).labelMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelMedium.fontStyle,
                    ),
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).labelMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelMedium.fontStyle,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 0.0, 8.0),
            child: Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.center,
              direction: Axis.horizontal,
              runAlignment: WrapAlignment.start,
              verticalDirection: VerticalDirection.down,
              clipBehavior: Clip.none,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'DASHBOARD_COMPONENT_Container_u53tyz4d_O');
                    logFirebaseEvent('ToolsComponent_navigate_to');

                    context.pushNamed(MemberListPageWidget.routeName);
                  },
                  child: wrapWithModel(
                    model: _model.toolsComponentModel1,
                    updateCallback: () => safeSetState(() {}),
                    child: ToolsComponentWidget(
                      toolName: 'Members',
                      toolColor: FlutterFlowTheme.of(context).secondary,
                      toolIcon: widget!.parameter1!.toString(),
                      textColor: FlutterFlowTheme.of(context).primaryText,
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
                        'DASHBOARD_COMPONENT_Container_9930zbh2_O');
                    logFirebaseEvent('ToolsComponent_navigate_to');

                    context.pushNamed(TransactionListPageWidget.routeName);
                  },
                  child: wrapWithModel(
                    model: _model.toolsComponentModel2,
                    updateCallback: () => safeSetState(() {}),
                    child: ToolsComponentWidget(
                      toolName: 'Total \nPoints Given',
                      toolColor: FlutterFlowTheme.of(context).primary,
                      toolIcon: FFAppState().totalPointsGiven.toString(),
                      textColor: FlutterFlowTheme.of(context).primaryText,
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
                        'DASHBOARD_COMPONENT_Container_sfbobdio_O');
                    logFirebaseEvent('ToolsComponent_backend_call');
                    _model.settingsHomeCurrentStore =
                        await StoresRecord.getDocumentOnce(
                            currentUserDocument!.store!);
                    if (() {
                      if (!(_model
                          .settingsHomeCurrentStore!.teamMembers.isNotEmpty)) {
                        return true;
                      } else if (FFAppState().currentTeamMember.memberRole ==
                          AccessRole.Owner) {
                        return true;
                      } else {
                        return false;
                      }
                    }()) {
                      logFirebaseEvent('ToolsComponent_navigate_to');

                      context.pushNamed(MainSettingsWidget.routeName);
                    } else {
                      logFirebaseEvent('ToolsComponent_alert_dialog');
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

                    safeSetState(() {});
                  },
                  child: wrapWithModel(
                    model: _model.toolsComponentModel3,
                    updateCallback: () => safeSetState(() {}),
                    updateOnChange: true,
                    child: ToolsComponentWidget(
                      toolName: 'Store Settings',
                      toolColor: Color(0xFF2156D0),
                      toolIcon: '⚙️',
                      textColor: FlutterFlowTheme.of(context).primaryText,
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
                        'DASHBOARD_COMPONENT_Container_mtdr7swm_O');
                    logFirebaseEvent('ToolsComponent_navigate_to');

                    context.pushNamed(WIkiPageWidget.routeName);
                  },
                  child: wrapWithModel(
                    model: _model.toolsComponentModel4,
                    updateCallback: () => safeSetState(() {}),
                    updateOnChange: true,
                    child: ToolsComponentWidget(
                      toolName: 'Tips & Guides',
                      toolColor: Color(0xFFB921D0),
                      toolIcon: '💡',
                      textColor: FlutterFlowTheme.of(context).primaryText,
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
                        'DASHBOARD_COMPONENT_Container_mnov3a8s_O');
                    logFirebaseEvent('ToolsComponent_backend_call');
                    _model.currentStoreProfileAction =
                        await StoresRecord.getDocumentOnce(
                            currentUserDocument!.store!);
                    logFirebaseEvent('ToolsComponent_navigate_to');

                    context.pushNamed(
                      StoreDetailsWidget.routeName,
                      pathParameters: {
                        'storeID': serializeParam(
                          _model.currentStoreProfileAction?.storeId,
                          ParamType.String,
                        ),
                      }.withoutNulls,
                      queryParameters: {
                        'initialIndex': serializeParam(
                          0,
                          ParamType.int,
                        ),
                      }.withoutNulls,
                    );

                    safeSetState(() {});
                  },
                  child: wrapWithModel(
                    model: _model.toolsComponentModel5,
                    updateCallback: () => safeSetState(() {}),
                    updateOnChange: true,
                    child: ToolsComponentWidget(
                      toolName: 'Store Profile',
                      toolColor: Color(0xFF21D03C),
                      toolIcon: '🏪',
                      textColor: FlutterFlowTheme.of(context).primaryText,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
