import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
import '/components/add_category_prompt_widget.dart';
import '/components/add_variation_component_widget.dart';
import '/components/variation_points_component_widget.dart';
import '/components/variation_price_component_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_store_catalog_component_widget.dart'
    show AddStoreCatalogComponentWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddStoreCatalogComponentModel
    extends FlutterFlowModel<AddStoreCatalogComponentWidget> {
  ///  Local state fields for this component.

  List<ProductVariationStruct> productVariation = [];
  void addToProductVariation(ProductVariationStruct item) =>
      productVariation.add(item);
  void removeFromProductVariation(ProductVariationStruct item) =>
      productVariation.remove(item);
  void removeAtIndexFromProductVariation(int index) =>
      productVariation.removeAt(index);
  void insertAtIndexInProductVariation(
          int index, ProductVariationStruct item) =>
      productVariation.insert(index, item);
  void updateProductVariationAtIndex(
          int index, Function(ProductVariationStruct) updateFn) =>
      productVariation[index] = updateFn(productVariation[index]);

  List<DocumentReference> branchAvailability = [];
  void addToBranchAvailability(DocumentReference item) =>
      branchAvailability.add(item);
  void removeFromBranchAvailability(DocumentReference item) =>
      branchAvailability.remove(item);
  void removeAtIndexFromBranchAvailability(int index) =>
      branchAvailability.removeAt(index);
  void insertAtIndexInBranchAvailability(int index, DocumentReference item) =>
      branchAvailability.insert(index, item);
  void updateBranchAvailabilityAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      branchAvailability[index] = updateFn(branchAvailability[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading_catalogUploadedImage = false;
  FFUploadedFile uploadedLocalFile_catalogUploadedImage =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_catalogUploadedImage = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'pddc1wnq' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  List<String>? get choiceChipsValues => choiceChipsValueController?.value;
  set choiceChipsValues(List<String>? val) =>
      choiceChipsValueController?.value = val;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'l1jr8yzj' /* Field is required */,
      );
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? isFormComplete;

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
    textController2Validator = _textController2Validator;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
