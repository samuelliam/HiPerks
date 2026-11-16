import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'splash_screen_model.dart';
export 'splash_screen_model.dart';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({super.key});

  static String routeName = 'SplashScreen';
  static String routePath = 'splashScreen';

  @override
  State<SplashScreenWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  late SplashScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashScreenModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SplashScreen'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SPLASH_SCREEN_SplashScreen_ON_INIT_STATE');
      logFirebaseEvent('SplashScreen_update_page_state');
      _model.imageNumber = random_data.randomInteger(0, 5);
      safeSetState(() {});
      logFirebaseEvent('SplashScreen_wait__delay');
      await Future.delayed(
        Duration(
          milliseconds: 2000,
        ),
      );
      if (valueOrDefault<bool>(currentUserDocument?.isBusinessAccount, false)) {
        if (currentUserDocument?.store != null) {
          logFirebaseEvent('SplashScreen_navigate_to');

          context.goNamed(Auth4HomeWidget.routeName);

          logFirebaseEvent('SplashScreen_backend_call');
          _model.currentStore =
              await StoresRecord.getDocumentOnce(currentUserDocument!.store!);
          if (_model.currentStore!.teamMembers.length > 0) {
            logFirebaseEvent('SplashScreen_navigate_to');

            context.goNamed(TeamMemberSelectionWidget.routeName);
          } else {
            logFirebaseEvent('SplashScreen_update_app_state');
            FFAppState().currentTeamMember =
                TeamMemberAccessRolesStruct.fromSerializableMap(
                    jsonDecode('{\"member_role\":\"\"}'));
            safeSetState(() {});
            logFirebaseEvent('SplashScreen_navigate_to');

            context.goNamed(Auth4HomeWidget.routeName);
          }
        } else {
          logFirebaseEvent('SplashScreen_navigate_to');

          context.goNamed(Auth4OnboardingCompanyDetailsWidget.routeName);
        }
      } else {
        if ((currentUserDisplayName != null && currentUserDisplayName != '') &&
            (valueOrDefault(currentUserDocument?.firstTimeLoginFlag, '') !=
                    null &&
                valueOrDefault(currentUserDocument?.firstTimeLoginFlag, '') !=
                    '')) {
          logFirebaseEvent('SplashScreen_navigate_to');

          context.goNamed(Auth4HomeWidget.routeName);
        } else {
          logFirebaseEvent('SplashScreen_navigate_to');

          context.goNamed(Auth4OnboardingUserDetailsWidget.routeName);
        }
      }
    });
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
      child: PopScope(
        canPop: false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFFFFF7E0),
          body: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('SPLASH_SCREEN_PAGE_Stack_db1zknes_ON_TAP');
              logFirebaseEvent('Stack_update_page_state');
              _model.imageNumber = random_data.randomInteger(0, 5);
              safeSetState(() {});
              logFirebaseEvent('Stack_wait__delay');
              await Future.delayed(
                Duration(
                  milliseconds: 2000,
                ),
              );
              if (valueOrDefault<bool>(
                  currentUserDocument?.isBusinessAccount, false)) {
                if (currentUserDocument?.store != null) {
                  logFirebaseEvent('Stack_navigate_to');

                  context.goNamed(Auth4HomeWidget.routeName);

                  logFirebaseEvent('Stack_backend_call');
                  _model.currentStoreCopy = await StoresRecord.getDocumentOnce(
                      currentUserDocument!.store!);
                  if (_model.currentStoreCopy!.teamMembers.length > 0) {
                    logFirebaseEvent('Stack_navigate_to');

                    context.goNamed(TeamMemberSelectionWidget.routeName);
                  } else {
                    logFirebaseEvent('Stack_update_app_state');
                    FFAppState().currentTeamMember =
                        TeamMemberAccessRolesStruct.fromSerializableMap(
                            jsonDecode('{\"member_role\":\"\"}'));
                    safeSetState(() {});
                    logFirebaseEvent('Stack_navigate_to');

                    context.goNamed(Auth4HomeWidget.routeName);
                  }
                } else {
                  logFirebaseEvent('Stack_navigate_to');

                  context
                      .goNamed(Auth4OnboardingCompanyDetailsWidget.routeName);
                }
              } else {
                if ((currentUserDisplayName != null &&
                        currentUserDisplayName != '') &&
                    (valueOrDefault(
                                currentUserDocument?.firstTimeLoginFlag, '') !=
                            null &&
                        valueOrDefault(
                                currentUserDocument?.firstTimeLoginFlag, '') !=
                            '')) {
                  logFirebaseEvent('Stack_navigate_to');

                  context.goNamed(Auth4HomeWidget.routeName);
                } else {
                  logFirebaseEvent('Stack_navigate_to');

                  context.goNamed(Auth4OnboardingUserDetailsWidget.routeName);
                }
              }

              safeSetState(() {});
            },
            child: Stack(
              children: [
                Builder(
                  builder: (context) {
                    if (_model.imageNumber == 0) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/2.jpeg',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                          alignment: Alignment(0.0, 0.0),
                        ),
                      );
                    } else if (_model.imageNumber == 1) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/7.jpeg',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                          alignment: Alignment(0.0, 0.0),
                        ),
                      );
                    } else if (_model.imageNumber == 2) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/6.jpeg',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                          alignment: Alignment(0.0, 0.0),
                        ),
                      );
                    } else if (_model.imageNumber == 3) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/3.jpeg',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                          alignment: Alignment(0.0, 0.0),
                        ),
                      );
                    } else if (_model.imageNumber == 4) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/5.jpeg',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                          alignment: Alignment(0.0, 0.0),
                        ),
                      );
                    } else if (_model.imageNumber == 5) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/4.jpeg',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                          alignment: Alignment(0.0, 0.0),
                        ),
                      );
                    } else {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/2.jpeg',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                          alignment: Alignment(0.0, 0.0),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
