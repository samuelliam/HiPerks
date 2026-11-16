import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/custom_loyalty_card_editable_template_widget.dart';
import '/components/paywall_component_widget.dart';
import '/components/unsplash_search_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'customized_card_widget.dart' show CustomizedCardWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterflow_colorpicker/flutterflow_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CustomizedCardModel extends FlutterFlowModel<CustomizedCardWidget> {
  ///  Local state fields for this page.

  Color? cardColor;

  String? cardImage;

  ///  State fields for stateful widgets in this page.

  // Model for CustomLoyaltyCardEditableTemplate component.
  late CustomLoyaltyCardEditableTemplateModel
      customLoyaltyCardEditableTemplateModel;
  Color? colorPicked;
  bool isDataUploading_uploadDataZtc = false;
  FFUploadedFile uploadedLocalFile_uploadDataZtc =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataZtc = '';

  @override
  void initState(BuildContext context) {
    customLoyaltyCardEditableTemplateModel =
        createModel(context, () => CustomLoyaltyCardEditableTemplateModel());
  }

  @override
  void dispose() {
    customLoyaltyCardEditableTemplateModel.dispose();
  }
}
