import '/components/marketing_materials_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'marketing_materials_widget.dart' show MarketingMaterialsWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class MarketingMaterialsModel
    extends FlutterFlowModel<MarketingMaterialsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MarketingMaterialsComponent component.
  late MarketingMaterialsComponentModel marketingMaterialsComponentModel;

  @override
  void initState(BuildContext context) {
    marketingMaterialsComponentModel =
        createModel(context, () => MarketingMaterialsComponentModel());
  }

  @override
  void dispose() {
    marketingMaterialsComponentModel.dispose();
  }
}
