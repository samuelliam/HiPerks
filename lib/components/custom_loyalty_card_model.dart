import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_minimized_view_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'custom_loyalty_card_widget.dart' show CustomLoyaltyCardWidget;
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomLoyaltyCardModel extends FlutterFlowModel<CustomLoyaltyCardWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in CustomLoyaltyCard widget.
  StoresRecord? checkCurrentStore;
  // Stores action output result for [Firestore Query - Query a collection] action in CustomLoyaltyCard widget.
  StoreCardsRecord? userStoreCard;
  // State field(s) for FlippableCard widget.
  final flippableCardController = FlipCardController();
  bool flippableCardIsFront = true;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
