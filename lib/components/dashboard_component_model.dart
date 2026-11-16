import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/tools_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'dashboard_component_widget.dart' show DashboardComponentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DashboardComponentModel
    extends FlutterFlowModel<DashboardComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ToolsComponent component.
  late ToolsComponentModel toolsComponentModel1;
  // Model for ToolsComponent component.
  late ToolsComponentModel toolsComponentModel2;
  // Model for ToolsComponent component.
  late ToolsComponentModel toolsComponentModel3;
  // Stores action output result for [Backend Call - Read Document] action in ToolsComponent widget.
  StoresRecord? settingsHomeCurrentStore;
  // Model for ToolsComponent component.
  late ToolsComponentModel toolsComponentModel4;
  // Model for ToolsComponent component.
  late ToolsComponentModel toolsComponentModel5;
  // Stores action output result for [Backend Call - Read Document] action in ToolsComponent widget.
  StoresRecord? currentStoreProfileAction;

  @override
  void initState(BuildContext context) {
    toolsComponentModel1 = createModel(context, () => ToolsComponentModel());
    toolsComponentModel2 = createModel(context, () => ToolsComponentModel());
    toolsComponentModel3 = createModel(context, () => ToolsComponentModel());
    toolsComponentModel4 = createModel(context, () => ToolsComponentModel());
    toolsComponentModel5 = createModel(context, () => ToolsComponentModel());
  }

  @override
  void dispose() {
    toolsComponentModel1.dispose();
    toolsComponentModel2.dispose();
    toolsComponentModel3.dispose();
    toolsComponentModel4.dispose();
    toolsComponentModel5.dispose();
  }
}
