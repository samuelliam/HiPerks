import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'custom_loyalty_card_editable_template_widget.dart'
    show CustomLoyaltyCardEditableTemplateWidget;
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomLoyaltyCardEditableTemplateModel
    extends FlutterFlowModel<CustomLoyaltyCardEditableTemplateWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for FlippableCard widget.
  final flippableCardController = FlipCardController();
  bool flippableCardIsFront = true;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
