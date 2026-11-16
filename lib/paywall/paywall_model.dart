import '/components/paywall_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'paywall_widget.dart' show PaywallWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaywallModel extends FlutterFlowModel<PaywallWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for paywallComponent component.
  late PaywallComponentModel paywallComponentModel;

  @override
  void initState(BuildContext context) {
    paywallComponentModel = createModel(context, () => PaywallComponentModel());
  }

  @override
  void dispose() {
    paywallComponentModel.dispose();
  }
}
