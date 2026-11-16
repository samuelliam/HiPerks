import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/paywall_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'main_settings_model.dart';
export 'main_settings_model.dart';

class MainSettingsWidget extends StatefulWidget {
  const MainSettingsWidget({super.key});

  static String routeName = 'MainSettings';
  static String routePath = 'mainSettings';

  @override
  State<MainSettingsWidget> createState() => _MainSettingsWidgetState();
}

class _MainSettingsWidgetState extends State<MainSettingsWidget> {
  late MainSettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainSettingsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'MainSettings'});
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
              logFirebaseEvent('MAIN_SETTINGS_arrow_back_rounded_ICN_ON_');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: GradientText(
            FFLocalizations.of(context).getText(
              '00cwmwvc' /* Settings */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.outfit(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).alternate,
                  fontSize: 25.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
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
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          child: GridView(
            padding: EdgeInsets.fromLTRB(
              0,
              16.0,
              0,
              16.0,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 1.0,
            ),
            scrollDirection: Axis.vertical,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('MAIN_SETTINGS_UpdateProfileStack_ON_TAP');
                  logFirebaseEvent('UpdateProfileStack_navigate_to');

                  context.pushNamed(
                    UpdateCompanyDetailsWidget.routeName,
                    queryParameters: {
                      'index': serializeParam(
                        0,
                        ParamType.int,
                      ),
                    }.withoutNulls,
                  );
                },
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF264653),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Opacity(
                        opacity: 0.1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: CachedNetworkImage(
                            fadeInDuration: Duration(milliseconds: 500),
                            fadeOutDuration: Duration(milliseconds: 500),
                            imageUrl:
                                'https://images.unsplash.com/photo-1543610892-0b1f7e6d8ac1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw2fHxwcm9maWxlfGVufDB8fHx8MTcyMzIyOTk1M3ww&ixlib=rb-4.0.3&q=80&w=1080',
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 8.0, 8.0, 16.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'htwqnwbe' /* Update 
Profile */
                            ,
                          ),
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    font: GoogleFonts.outfit(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
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
                  ],
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('MAIN_SETTINGS_DesignCardStack_ON_TAP');
                  logFirebaseEvent('DesignCardStack_navigate_to');

                  context.pushNamed(CustomizedCardWidget.routeName);
                },
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF2A9D8F),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Opacity(
                        opacity: 0.1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: CachedNetworkImage(
                            fadeInDuration: Duration(milliseconds: 500),
                            fadeOutDuration: Duration(milliseconds: 500),
                            imageUrl:
                                'https://images.unsplash.com/photo-1591030434469-3d78c7b17820?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw5fHxsb3lhbHR5JTIwY2FyZHxlbnwwfHx8fDE3MjMyODY4ODJ8MA&ixlib=rb-4.0.3&q=80&w=1080',
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 8.0, 8.0, 16.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '7debpix5' /* Design 
Store Card */
                            ,
                          ),
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    font: GoogleFonts.outfit(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
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
                  ],
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('MAIN_SETTINGS_StoreCatalogStack_ON_TAP');
                  logFirebaseEvent('StoreCatalogStack_navigate_to');

                  context.pushNamed(StoreCatalogPageWidget.routeName);
                },
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFE76F51),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Opacity(
                        opacity: 0.1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: CachedNetworkImage(
                            fadeInDuration: Duration(milliseconds: 500),
                            fadeOutDuration: Duration(milliseconds: 500),
                            imageUrl:
                                'https://images.unsplash.com/photo-1625173616412-7b403d49a41e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxNXx8bWVudXxlbnwwfHx8fDE3MjMyODY1ODR8MA&ixlib=rb-4.0.3&q=80&w=1080',
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 8.0, 8.0, 16.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '929k04yr' /* Store 
Catalog */
                            ,
                          ),
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    font: GoogleFonts.outfit(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
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
                  ],
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('MAIN_SETTINGS_RedeemableStack_ON_TAP');
                  logFirebaseEvent('RedeemableStack_navigate_to');

                  context.pushNamed(RedeemablePageWidget.routeName);
                },
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFD051E7),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Opacity(
                        opacity: 0.1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: CachedNetworkImage(
                            fadeInDuration: Duration(milliseconds: 500),
                            fadeOutDuration: Duration(milliseconds: 500),
                            imageUrl:
                                'https://images.unsplash.com/photo-1481391319762-47dff72954d9?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw3fHxnaWZ0fGVufDB8fHx8MTcyODcyMDYzOXww&ixlib=rb-4.0.3&q=80&w=1080',
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 8.0, 8.0, 16.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'aq5skfuk' /* Redeemables */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    font: GoogleFonts.outfit(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
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
                  ],
                ),
              ),
              if ((FFAppState().currentTeamMember.memberRole ==
                      AccessRole.Owner) ||
                  (FFAppState().currentTeamMember == null))
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'MAIN_SETTINGS_BranchSettingsStack_ON_TAP');
                    logFirebaseEvent('BranchSettingsStack_navigate_to');

                    context.pushNamed(BranchSettingsWidget.routeName);
                  },
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF4A261),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Opacity(
                          opacity: 0.1,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: CachedNetworkImage(
                              fadeInDuration: Duration(milliseconds: 500),
                              fadeOutDuration: Duration(milliseconds: 500),
                              imageUrl:
                                  'https://images.unsplash.com/photo-1528698827591-e19ccd7bc23d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxNXx8c3RvcmUlMjB8ZW58MHx8fHwxNzIzMjg2NjU3fDA&ixlib=rb-4.0.3&q=80&w=1080',
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 8.0, 8.0, 16.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '32zhpypj' /* Branch 
Settings */
                              ,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  font: GoogleFonts.outfit(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
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
                    ],
                  ),
                ),
              if ((FFAppState().currentTeamMember.memberRole ==
                      AccessRole.Owner) ||
                  (FFAppState().currentTeamMember == null))
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'MAIN_SETTINGS_PointsSettingsStack_ON_TAP');
                    logFirebaseEvent('PointsSettingsStack_navigate_to');

                    context.pushNamed(PointsSettingsWidget.routeName);
                  },
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF61BFF4),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Opacity(
                          opacity: 0.1,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: CachedNetworkImage(
                              fadeInDuration: Duration(milliseconds: 500),
                              fadeOutDuration: Duration(milliseconds: 500),
                              imageUrl:
                                  'https://images.unsplash.com/photo-1628625194933-ac2b3c0109e7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxMXx8Y2FyZHxlbnwwfHx8fDE3Mjc4NTI5MjR8MA&ixlib=rb-4.0.3&q=80&w=1080',
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 8.0, 8.0, 16.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'vhqy0o8z' /* Points 
Settings */
                              ,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  font: GoogleFonts.outfit(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
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
                    ],
                  ),
                ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('MAIN_SETTINGS_TeamMemberSettingsStack_ON');
                  logFirebaseEvent('TeamMemberSettingsStack_navigate_to');

                  context.pushNamed(TeamMemberSettingsWidget.routeName);
                },
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFE9C46A),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Opacity(
                        opacity: 0.1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: CachedNetworkImage(
                            fadeInDuration: Duration(milliseconds: 500),
                            fadeOutDuration: Duration(milliseconds: 500),
                            imageUrl:
                                'https://images.unsplash.com/photo-1511632765486-a01980e01a18?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxNnx8dGVhbSUyMG1lbWJlcnN8ZW58MHx8fHwxNzIzMjg2NzMwfDA&ixlib=rb-4.0.3&q=80&w=1080',
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 8.0, 8.0, 16.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'ypupwquy' /* Team 
Members */
                            ,
                          ),
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    font: GoogleFonts.outfit(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
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
                  ],
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('MAIN_SETTINGS_ManageSubscriptionStack_ON');
                  if (revenue_cat.activeEntitlementIds.length > 0) {
                    logFirebaseEvent('ManageSubscriptionStack_navigate_to');

                    context.pushNamed(ManageSubscriptionWidget.routeName);
                  } else {
                    logFirebaseEvent('ManageSubscriptionStack_bottom_sheet');
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
                              child: Container(
                                height: MediaQuery.sizeOf(context).height * 0.9,
                                child: PaywallComponentWidget(),
                              ),
                            ),
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  }
                },
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF606C38),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Opacity(
                        opacity: 0.1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: CachedNetworkImage(
                            fadeInDuration: Duration(milliseconds: 500),
                            fadeOutDuration: Duration(milliseconds: 500),
                            imageUrl:
                                'https://images.unsplash.com/photo-1542744173-05336fcc7ad4?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxM3x8dHJhbnNhY3Rpb258ZW58MHx8fHwxNzIzMjg3MTA0fDA&ixlib=rb-4.0.3&q=80&w=1080',
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 8.0, 8.0, 16.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'bfwlxyt4' /* Manage 
Subscription */
                            ,
                          ),
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    font: GoogleFonts.outfit(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
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
                  ],
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('MAIN_SETTINGS_FeatureRequestStack_ON_TAP');
                  logFirebaseEvent('FeatureRequestStack_navigate_to');

                  context.pushNamed(FeatureSuggestionWidget.routeName);
                },
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF8338EC),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Opacity(
                        opacity: 0.1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: CachedNetworkImage(
                            fadeInDuration: Duration(milliseconds: 500),
                            fadeOutDuration: Duration(milliseconds: 500),
                            imageUrl:
                                'https://images.unsplash.com/photo-1607520389310-ded119a54145?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw5fHwlMjByZXF1ZXN0fGVufDB8fHx8MTcyMzI4NzIwNHww&ixlib=rb-4.0.3&q=80&w=1080',
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                            memCacheWidth: 300,
                            memCacheHeight: 300,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 8.0, 8.0, 16.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'm88uhu2x' /* Feature
Request */
                            ,
                          ),
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    font: GoogleFonts.outfit(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
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
                  ],
                ),
              ),
              if ((FFAppState().currentTeamMember.memberRole ==
                      AccessRole.Owner) ||
                  (FFAppState().currentTeamMember.hasMemberRole() == false) ||
                  (FFAppState().currentTeamMember == null))
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('MAIN_SETTINGS_DeleteAccountStack_ON_TAP');
                    var _shouldSetState = false;
                    logFirebaseEvent(
                        'DeleteAccountStack_biometric_verificatio');
                    final _localAuth = LocalAuthentication();
                    bool _isBiometricSupported =
                        await _localAuth.isDeviceSupported();

                    if (_isBiometricSupported) {
                      try {
                        _model.isVerified = await _localAuth.authenticate(
                            localizedReason:
                                FFLocalizations.of(context).getText(
                          'cqq7f45c' /* Please authenticate to proceed... */,
                        ));
                      } on PlatformException {
                        _model.isVerified = false;
                      }
                      safeSetState(() {});
                    }

                    _shouldSetState = true;
                    if (_model.isVerified!) {
                      if (valueOrDefault<bool>(
                          currentUserDocument?.isBusinessAccount, false)) {
                        logFirebaseEvent('DeleteAccountStack_alert_dialog');
                        var confirmDialogResponse = await showDialog<bool>(
                              context: context,
                              builder: (alertDialogContext) {
                                return WebViewAware(
                                  child: AlertDialog(
                                    title: Text('Delete Account'),
                                    content: Text(
                                        'Are you sure to request delete your business account ? '),
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
                          logFirebaseEvent('DeleteAccountStack_backend_call');

                          await BusinessAccountDeleteRequestRecord.collection
                              .doc()
                              .set(createBusinessAccountDeleteRequestRecordData(
                                email: currentUserEmail,
                                businessName: currentUserDisplayName,
                                businessReferrence: currentUserDocument?.store,
                                accountReferrence: currentUserReference,
                              ));
                          logFirebaseEvent('DeleteAccountStack_alert_dialog');
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return WebViewAware(
                                child: AlertDialog(
                                  title: Text('Deletion Requested'),
                                  content: Text(
                                      'Request is submitted for deletion. We will be reviewing it and send you an notification.'),
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
                          logFirebaseEvent('DeleteAccountStack_navigate_to');

                          context.goNamed(Auth4WelcomeWidget.routeName);
                        } else {
                          logFirebaseEvent(
                              'DeleteAccountStack_close_dialog_drawer_e');
                          Navigator.pop(context);
                        }
                      } else {
                        logFirebaseEvent('DeleteAccountStack_alert_dialog');
                        var confirmDialogResponse = await showDialog<bool>(
                              context: context,
                              builder: (alertDialogContext) {
                                return WebViewAware(
                                  child: AlertDialog(
                                    title: Text('Delete Account'),
                                    content: Text(
                                        'Are you sure to delete your account ? '),
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
                          logFirebaseEvent('DeleteAccountStack_auth');
                          await authManager.deleteUser(context);
                          logFirebaseEvent('DeleteAccountStack_navigate_to');

                          context.goNamed(Auth4WelcomeWidget.routeName);
                        } else {
                          logFirebaseEvent(
                              'DeleteAccountStack_close_dialog_drawer_e');
                          Navigator.pop(context);
                        }
                      }
                    } else {
                      if (_shouldSetState) safeSetState(() {});
                      return;
                    }

                    if (_shouldSetState) safeSetState(() {});
                  },
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF9D0208),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Opacity(
                          opacity: 0.1,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: CachedNetworkImage(
                              fadeInDuration: Duration(milliseconds: 500),
                              fadeOutDuration: Duration(milliseconds: 500),
                              imageUrl:
                                  'https://images.unsplash.com/photo-1600881217197-068e1d79ffb8?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHxkZWxldGV8ZW58MHx8fHwxNzIzMjg3MjYyfDA&ixlib=rb-4.0.3&q=80&w=1080',
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 8.0, 8.0, 16.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '7dk362ec' /* Delete
Account */
                              ,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  font: GoogleFonts.outfit(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
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
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
