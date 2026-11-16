import '/components/add_redeemable_widget_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'add_redeemable_page_widget.dart' show AddRedeemablePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class AddRedeemablePageModel extends FlutterFlowModel<AddRedeemablePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for AddRedeemableWidget component.
  late AddRedeemableWidgetModel addRedeemableWidgetModel;

  @override
  void initState(BuildContext context) {
    addRedeemableWidgetModel =
        createModel(context, () => AddRedeemableWidgetModel());
  }

  @override
  void dispose() {
    addRedeemableWidgetModel.dispose();
  }
}
