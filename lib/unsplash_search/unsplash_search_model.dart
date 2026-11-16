import '/components/unsplash_search_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'unsplash_search_widget.dart' show UnsplashSearchWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UnsplashSearchModel extends FlutterFlowModel<UnsplashSearchWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for UnsplashSearchComponent component.
  late UnsplashSearchComponentModel unsplashSearchComponentModel;

  @override
  void initState(BuildContext context) {
    unsplashSearchComponentModel =
        createModel(context, () => UnsplashSearchComponentModel());
  }

  @override
  void dispose() {
    unsplashSearchComponentModel.dispose();
  }
}
