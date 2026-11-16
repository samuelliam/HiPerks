import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/appstore_googleplay_links_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/walkthroughs/customerbusiness_walkthrough.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'auth4_welcome_model.dart';
export 'auth4_welcome_model.dart';

class Auth4WelcomeWidget extends StatefulWidget {
  const Auth4WelcomeWidget({super.key});

  static String routeName = 'auth_4_Welcome';
  static String routePath = 'welcome';

  @override
  State<Auth4WelcomeWidget> createState() => _Auth4WelcomeWidgetState();
}

class _Auth4WelcomeWidgetState extends State<Auth4WelcomeWidget>
    with TickerProviderStateMixin {
  late Auth4WelcomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Auth4WelcomeModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'auth_4_Welcome'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('AUTH_4_WELCOME_auth_4_Welcome_ON_INIT_ST');
      if (FFAppState().loginWalkthroughStarted) {
        return;
      }

      logFirebaseEvent('auth_4_Welcome_start_walkthrough');
      safeSetState(() => _model.customerbusinessWalkthroughController =
          createPageWalkthrough(context));
      _model.customerbusinessWalkthroughController?.show(context: context);
      logFirebaseEvent('auth_4_Welcome_update_app_state');
      FFAppState().loginWalkthroughStarted = true;
      safeSetState(() {});
    });

    _model.phoneNumberTextController ??= TextEditingController();
    _model.phoneNumberFocusNode ??= FocusNode();
    _model.phoneNumberFocusNode!.addListener(() => safeSetState(() {}));
    authManager.handlePhoneAuthStateChanges(context);
    authManager.handlePhoneAuthStateChanges(context);
    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 8200.0.ms,
            begin: Offset(0.0, -80.0),
            end: Offset(0.0, 0.0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 8200.0.ms,
            duration: 8200.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(0.0, -80.0),
          ),
        ],
      ),
      'imageOnPageLoadAnimation': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 1410.0.ms,
            begin: 0.05,
            end: 0.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(115.0, 0.0),
          ),
        ],
      ),
      'textFieldOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 300.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 40.0),
            end: Offset(0.0, 0.0),
          ),
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.349, 0),
            end: Offset(0, 0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.9, 0.9),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Stack(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 420.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 600.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Stack(
                                children: [
                                  MasonryGridView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                    ),
                                    crossAxisSpacing: 10.0,
                                    mainAxisSpacing: 10.0,
                                    itemCount: 11,
                                    itemBuilder: (context, index) {
                                      return [
                                        () => ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(16.0),
                                                bottomRight:
                                                    Radius.circular(16.0),
                                              ),
                                              child: Image.asset(
                                                'assets/images/nathan-dumlao-r-KfktlyBL0-unsplash_Large.jpeg',
                                                width: 120.0,
                                                height: 120.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                        () => ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              child: Image.asset(
                                                'assets/images/Holding_iPhone_Mockup_3_Large.jpeg',
                                                width: 120.0,
                                                height: 160.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                        () => ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(16.0),
                                                bottomRight:
                                                    Radius.circular(16.0),
                                              ),
                                              child: Image.network(
                                                'https://picsum.photos/seed/32/600',
                                                width: 100.0,
                                                height: 0.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                        () => ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(16.0),
                                                bottomLeft:
                                                    Radius.circular(16.0),
                                              ),
                                              child: Image.asset(
                                                'assets/images/455705943_1243367679989014_102584919366985037_n.jpg',
                                                width: 80.0,
                                                height: 180.0,
                                                fit: BoxFit.cover,
                                                alignment: Alignment(0.0, 0.0),
                                              ),
                                            ),
                                        () => ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              child: Image.network(
                                                'https://images.unsplash.com/photo-1556740758-90de374c12ad?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyNHx8Y2FzaGllcnxlbnwwfHx8fDE3MjM3OTI4MjZ8MA&ixlib=rb-4.0.3&q=80&w=1080',
                                                width: 120.0,
                                                height: 160.0,
                                                fit: BoxFit.cover,
                                                alignment: Alignment(0.0, 0.0),
                                              ),
                                            ),
                                        () => ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              child: Image.network(
                                                'https://images.unsplash.com/photo-1567880905822-56f8e06fe630?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxjYWZlfGVufDB8fHx8MTcyMDg4ODIxNHww&ixlib=rb-4.0.3&q=80&w=400',
                                                width: 120.0,
                                                height: 180.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                        () => ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(16.0),
                                                bottomLeft:
                                                    Radius.circular(16.0),
                                              ),
                                              child: Image.asset(
                                                'assets/images/customer-scanning-qr-code-2023-11-27-05-12-17-utc_Large.jpeg',
                                                width: 120.0,
                                                height: 190.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                        () => ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              child: Image.asset(
                                                'assets/images/asia-mature-adult-woman-people-wear-apron-small-ca-2023-11-27-04-50-29-utc_Large.jpeg',
                                                width: 120.0,
                                                height: 160.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                        () => ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              child: Image.network(
                                                'https://images.unsplash.com/photo-1568386453619-84c3ff4b43c5?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyNHx8c3RvcmV8ZW58MHx8fHwxNzIwODg4MTAzfDA&ixlib=rb-4.0.3&q=80&w=400',
                                                width: 120.0,
                                                height: 180.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                        () => ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(16.0),
                                                bottomLeft:
                                                    Radius.circular(16.0),
                                              ),
                                              child: Image.network(
                                                'https://images.unsplash.com/photo-1556740772-1a741367b93e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw5fHxzaG9wfGVufDB8fHx8MTcyMzc5Mjc0OHww&ixlib=rb-4.0.3&q=80&w=1080',
                                                width: 120.0,
                                                height: 190.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                        () => ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              child: Image.network(
                                                'https://picsum.photos/seed/32/600',
                                                width: 120.0,
                                                height: 160.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                      ][index]();
                                    },
                                  ),
                                ],
                              ),
                            ).animateOnPageLoad(
                                animationsMap['containerOnPageLoadAnimation']!),
                          ],
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6.0),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 2.0,
                          sigmaY: 2.0,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/ICON.png',
                            width: 130.0,
                            height: 150.0,
                            fit: BoxFit.fitHeight,
                          ),
                        ).animateOnPageLoad(
                            animationsMap['imageOnPageLoadAnimation']!),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                constraints: BoxConstraints(
                  maxWidth: 670.0,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 44.0, 0.0, 44.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: Container(
                          width: 250.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFF8F8F8),
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'AUTH_4_WELCOME_Container_jczk19d8_ON_TAP');
                                      logFirebaseEvent(
                                          'Container_update_page_state');
                                      _model.isBusiness = false;
                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      width: 115.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: _model.isBusiness
                                            ? Color(0xFFF8F8F8)
                                            : FlutterFlowTheme.of(context)
                                                .secondary,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          color: valueOrDefault<Color>(
                                            _model.isBusiness
                                                ? Color(0xFFF8F8F8)
                                                : Color(0xFFF1F4F8),
                                            Color(0xFFE0E3E7),
                                          ),
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.face,
                                            color: _model.isBusiness
                                                ? Colors.black
                                                : Colors.white,
                                            size: 16.0,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '2us9kno7' /* Customer */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.outfit(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: _model.isBusiness
                                                            ? Colors.black
                                                            : Colors.white,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
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
                                    ),
                                  ),
                                ),
                                if (!isWeb)
                                  Expanded(
                                    child: Builder(
                                      builder: (context) => InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'AUTH_4_WELCOME_Container_rz7clh50_ON_TAP');
                                          if (isWeb) {
                                            logFirebaseEvent(
                                                'Container_alert_dialog');
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: WebViewAware(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(
                                                                dialogContext)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child:
                                                          AppstoreGoogleplayLinksWidget(),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          } else {
                                            logFirebaseEvent(
                                                'Container_update_page_state');
                                            _model.isBusiness = true;
                                            safeSetState(() {});
                                          }
                                        },
                                        child: Container(
                                          width: 115.0,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: _model.isBusiness
                                                ? FlutterFlowTheme.of(context)
                                                    .secondary
                                                : Color(0xFFF8F8F8),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              color: valueOrDefault<Color>(
                                                _model.isBusiness
                                                    ? Color(0xFFE0E3E7)
                                                    : Color(0xFFF8F8F8),
                                                Color(0xFFF1F4F8),
                                              ),
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.add_business_outlined,
                                                color: _model.isBusiness
                                                    ? Colors.white
                                                    : Colors.black,
                                                size: 16.0,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'jq1lb0ey' /* Business */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.outfit(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: _model.isBusiness
                                                            ? Colors.white
                                                            : Colors.black,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
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
                                        ),
                                      ).animateOnActionTrigger(
                                        animationsMap[
                                            'containerOnActionTriggerAnimation']!,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ).addWalkthrough(
                          containerY24xvdrs,
                          _model.customerbusinessWalkthroughController,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Visibility(
                            visible: _model.isBusiness == false,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 100.0,
                                  height: 50.0,
                                  child: custom_widgets.CountryCodePickerWidget(
                                    width: 100.0,
                                    height: 50.0,
                                    countryCodeDidSelect: (countryCode) async {
                                      logFirebaseEvent(
                                          'AUTH_4_WELCOME_Container_d6f7m3zw_CALLBA');
                                      logFirebaseEvent(
                                          'CountryCodePickerWidget_update_page_stat');
                                      _model.currentCountryCode = countryCode;
                                      safeSetState(() {});
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller:
                                        _model.phoneNumberTextController,
                                    focusNode: _model.phoneNumberFocusNode,
                                    onFieldSubmitted: (_) async {
                                      logFirebaseEvent(
                                          'AUTH_4_WELCOME_phoneNumber_ON_TEXTFIELD_');
                                      logFirebaseEvent('phoneNumber_auth');
                                      final phoneNumberVal =
                                          '${_model.currentCountryCode}${_model.phoneNumberTextController.text}';
                                      if (phoneNumberVal == null ||
                                          phoneNumberVal.isEmpty ||
                                          !phoneNumberVal.startsWith('+')) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'Phone Number is required and has to start with +.'),
                                          ),
                                        );
                                        return;
                                      }
                                      await authManager.beginPhoneAuth(
                                        context: context,
                                        phoneNumber: phoneNumberVal,
                                        onCodeSent: (context) async {
                                          context.goNamedAuth(
                                            Auth4OnboardingPhoneVerifyWidget
                                                .routeName,
                                            context.mounted,
                                            queryParameters: {
                                              'phoneNumber': serializeParam(
                                                _model.phoneNumberTextController
                                                    .text,
                                                ParamType.String,
                                              ),
                                              'isLogin': serializeParam(
                                                false,
                                                ParamType.bool,
                                              ),
                                            }.withoutNulls,
                                            ignoreRedirect: true,
                                          );
                                        },
                                      );
                                    },
                                    autofocus: false,
                                    textInputAction: TextInputAction.go,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText:
                                          FFLocalizations.of(context).getText(
                                        '82suvibl' /* Phone Number */,
                                      ),
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            font: GoogleFonts.readexPro(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .fontStyle,
                                          ),
                                      errorStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            font: GoogleFonts.readexPro(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .fontStyle,
                                            lineHeight: 3.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              16.0, 16.0, 16.0, 8.0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          font: GoogleFonts.readexPro(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontStyle,
                                          lineHeight: 3.0,
                                        ),
                                    keyboardType: TextInputType.number,
                                    cursorColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    validator: _model
                                        .phoneNumberTextControllerValidator
                                        .asValidator(context),
                                  ).animateOnPageLoad(animationsMap[
                                      'textFieldOnPageLoadAnimation']!),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      if (_model.isBusiness == false)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 12.0, 20.0, 12.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'AUTH_4_WELCOME_CONTINUE_WITH_PHONE_BTN_O');
                              logFirebaseEvent('Button_auth');
                              final phoneNumberVal =
                                  '${_model.currentCountryCode}${_model.phoneNumberTextController.text}';
                              if (phoneNumberVal == null ||
                                  phoneNumberVal.isEmpty ||
                                  !phoneNumberVal.startsWith('+')) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'Phone Number is required and has to start with +.'),
                                  ),
                                );
                                return;
                              }
                              await authManager.beginPhoneAuth(
                                context: context,
                                phoneNumber: phoneNumberVal,
                                onCodeSent: (context) async {
                                  context.goNamedAuth(
                                    Auth4OnboardingPhoneVerifyWidget.routeName,
                                    context.mounted,
                                    queryParameters: {
                                      'phoneNumber': serializeParam(
                                        _model.phoneNumberTextController.text,
                                        ParamType.String,
                                      ),
                                      'isLogin': serializeParam(
                                        false,
                                        ParamType.bool,
                                      ),
                                    }.withoutNulls,
                                    ignoreRedirect: true,
                                  );
                                },
                              );
                            },
                            text: FFLocalizations.of(context).getText(
                              'i3o27m81' /* Continue with Phone */,
                            ),
                            icon: Icon(
                              Icons.phone,
                              size: 24.0,
                            ),
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 56.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              iconColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    font: GoogleFonts.outfit(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primaryText,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 12.0, 20.0, 12.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'AUTH_4_WELCOME_CONTINUE_WITH_GOOGLE_BTN_');
                            logFirebaseEvent('Button_auth');
                            GoRouter.of(context).prepareAuthEvent();
                            final user =
                                await authManager.signInWithGoogle(context);
                            if (user == null) {
                              return;
                            }
                            if (valueOrDefault(
                                        currentUserDocument?.firstTimeLoginFlag,
                                        '') !=
                                    null &&
                                valueOrDefault(
                                        currentUserDocument?.firstTimeLoginFlag,
                                        '') !=
                                    '') {
                              if (valueOrDefault<bool>(
                                  currentUserDocument?.isBusinessAccount,
                                  false)) {
                                if (isWeb) {
                                  logFirebaseEvent('Button_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                        child: AlertDialog(
                                          title: Text('Business Account'),
                                          content: Text(
                                              'Please open Hi Perks App to access business account'),
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
                                  logFirebaseEvent('Button_launch_u_r_l');
                                  await launchURL('hiperks.co');
                                } else {
                                  if (currentUserDocument?.store != null) {
                                    logFirebaseEvent('Button_navigate_to');

                                    context.goNamedAuth(
                                        SplashScreenWidget.routeName,
                                        context.mounted);
                                  } else {
                                    logFirebaseEvent('Button_navigate_to');

                                    context.goNamedAuth(
                                        SplashScreenWidget.routeName,
                                        context.mounted);
                                  }
                                }
                              } else {
                                logFirebaseEvent('Button_navigate_to');

                                context.goNamedAuth(
                                    SplashScreenWidget.routeName,
                                    context.mounted);
                              }

                              return;
                            } else {
                              if (_model.isBusiness) {
                                logFirebaseEvent('Button_navigate_to');

                                context.goNamedAuth(
                                    SplashScreenWidget.routeName,
                                    context.mounted);
                              } else {
                                logFirebaseEvent('Button_navigate_to');

                                context.goNamedAuth(
                                    SplashScreenWidget.routeName,
                                    context.mounted);
                              }

                              logFirebaseEvent('Button_backend_call');

                              await currentUserReference!
                                  .update(createUsersRecordData(
                                isBusinessAccount: _model.isBusiness,
                                email: currentUserEmail,
                              ));
                            }
                          },
                          text: FFLocalizations.of(context).getText(
                            'pujg9nsi' /* Continue with Google */,
                          ),
                          icon: FaIcon(
                            FontAwesomeIcons.google,
                            size: 24.0,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 56.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            iconColor: FlutterFlowTheme.of(context).primaryText,
                            color: FlutterFlowTheme.of(context).alternate,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  font: GoogleFonts.outfit(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .fontStyle,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      if (!_model.isBusiness)
                        isAndroid
                            ? Container()
                            : Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 12.0, 20.0, 12.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'AUTH_4_WELCOME_CONTINUE_WITH_APPLE_BTN_O');
                                    logFirebaseEvent('Button_auth');
                                    GoRouter.of(context).prepareAuthEvent();
                                    final user = await authManager
                                        .signInWithApple(context);
                                    if (user == null) {
                                      return;
                                    }
                                    if (valueOrDefault(
                                                currentUserDocument
                                                    ?.firstTimeLoginFlag,
                                                '') !=
                                            null &&
                                        valueOrDefault(
                                                currentUserDocument
                                                    ?.firstTimeLoginFlag,
                                                '') !=
                                            '') {
                                      if (valueOrDefault<bool>(
                                          currentUserDocument
                                              ?.isBusinessAccount,
                                          false)) {
                                        if (isWeb) {
                                          logFirebaseEvent(
                                              'Button_alert_dialog');
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  title:
                                                      Text('Business Account'),
                                                  content: Text(
                                                      'Please open Hi Perks App to access business account'),
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
                                          logFirebaseEvent(
                                              'Button_launch_u_r_l');
                                          await launchURL('hiperks.co');
                                        } else {
                                          if (currentUserDocument?.store !=
                                              null) {
                                            logFirebaseEvent(
                                                'Button_navigate_to');

                                            context.goNamedAuth(
                                                SplashScreenWidget.routeName,
                                                context.mounted);
                                          } else {
                                            logFirebaseEvent(
                                                'Button_navigate_to');

                                            context.goNamedAuth(
                                                SplashScreenWidget.routeName,
                                                context.mounted);
                                          }
                                        }
                                      } else {
                                        logFirebaseEvent('Button_navigate_to');

                                        context.goNamedAuth(
                                            Auth4HomeWidget.routeName,
                                            context.mounted);
                                      }

                                      return;
                                    } else {
                                      if (_model.isBusiness) {
                                        logFirebaseEvent('Button_navigate_to');

                                        context.goNamedAuth(
                                            SplashScreenWidget.routeName,
                                            context.mounted);
                                      } else {
                                        logFirebaseEvent('Button_navigate_to');

                                        context.goNamedAuth(
                                            SplashScreenWidget.routeName,
                                            context.mounted);
                                      }

                                      logFirebaseEvent('Button_backend_call');
                                      unawaited(
                                        () async {
                                          await currentUserReference!
                                              .update(createUsersRecordData(
                                            isBusinessAccount:
                                                _model.isBusiness,
                                            email: currentUserEmail,
                                          ));
                                        }(),
                                      );
                                    }
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'hpyrwzlu' /* Continue with Apple */,
                                  ),
                                  icon: Icon(
                                    Icons.apple_sharp,
                                    size: 24.0,
                                  ),
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 56.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    iconColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          font: GoogleFonts.outfit(
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge
                                                  .fontStyle,
                                        ),
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'g4o06fpa' /* By proceeding, you agree to th... */,
                              ),
                              style: FlutterFlowTheme.of(context)
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
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'AUTH_4_WELCOME_PAGE_Text_1muzsmcf_ON_TAP');
                                logFirebaseEvent('Text_navigate_to');

                                context
                                    .pushNamed(PrivacyPolicyWidget.routeName);
                              },
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'wln3s535' /* Privacy Policy */,
                                ),
                                style: FlutterFlowTheme.of(context)
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
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 10.0,
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
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'AUTH_4_WELCOME_PAGE_Text_3sy0emu5_ON_TAP');
                                logFirebaseEvent('Text_navigate_to');

                                context
                                    .pushNamed(PrivacyPolicyWidget.routeName);
                              },
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'k9eyvbhq' /*  and  */,
                                ),
                                style: FlutterFlowTheme.of(context)
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
                                      fontSize: 10.0,
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
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'AUTH_4_WELCOME_PAGE_Text_pqq7y9ro_ON_TAP');
                                logFirebaseEvent('Text_navigate_to');

                                context
                                    .pushNamed(TermsOfUsePageWidget.routeName);
                              },
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  's11poj94' /* Terms of Use. */,
                                ),
                                style: FlutterFlowTheme.of(context)
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
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 10.0,
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TutorialCoachMark createPageWalkthrough(BuildContext context) =>
      TutorialCoachMark(
        targets: createWalkthroughTargets(context),
        onFinish: () async {
          safeSetState(
              () => _model.customerbusinessWalkthroughController = null);
        },
        onSkip: () {
          return true;
        },
      );
}
