import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'splash_screen_widget.dart' show SplashScreenWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SplashScreenModel extends FlutterFlowModel<SplashScreenWidget> {
  ///  Local state fields for this page.

  int? imageNumber = 1;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in SplashScreen widget.
  StoresRecord? currentStore;
  // Stores action output result for [Backend Call - Read Document] action in Stack widget.
  StoresRecord? currentStoreCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
