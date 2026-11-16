import '/components/leaderboard_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'leaderboard_page_widget.dart' show LeaderboardPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class LeaderboardPageModel extends FlutterFlowModel<LeaderboardPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for LeaderboardComponent component.
  late LeaderboardComponentModel leaderboardComponentModel;

  @override
  void initState(BuildContext context) {
    leaderboardComponentModel =
        createModel(context, () => LeaderboardComponentModel());
  }

  @override
  void dispose() {
    leaderboardComponentModel.dispose();
  }
}
