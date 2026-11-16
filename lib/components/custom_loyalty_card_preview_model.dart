import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'custom_loyalty_card_preview_widget.dart'
    show CustomLoyaltyCardPreviewWidget;
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomLoyaltyCardPreviewModel
    extends FlutterFlowModel<CustomLoyaltyCardPreviewWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for FlippableCard widget.
  final flippableCardController = FlipCardController();
  bool flippableCardIsFront = true;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
