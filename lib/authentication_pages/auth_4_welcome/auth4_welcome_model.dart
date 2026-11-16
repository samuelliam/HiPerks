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
import 'auth4_welcome_widget.dart' show Auth4WelcomeWidget;
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

class Auth4WelcomeModel extends FlutterFlowModel<Auth4WelcomeWidget> {
  ///  Local state fields for this page.

  String? currentCountryCode = '+63';

  bool isBusiness = false;

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? customerbusinessWalkthroughController;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    customerbusinessWalkthroughController?.finish();
    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();
  }
}
