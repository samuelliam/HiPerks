import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
import '/components/custom_loyalty_card_editable_template_widget.dart';
import '/components/marketing_materials_component_widget.dart';
import '/components/unsplash_search_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:io';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'auth4_onboarding_company_details_widget.dart'
    show Auth4OnboardingCompanyDetailsWidget;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutterflow_colorpicker/flutterflow_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class Auth4OnboardingCompanyDetailsModel
    extends FlutterFlowModel<Auth4OnboardingCompanyDetailsWidget> {
  ///  Local state fields for this page.

  String userName = '-';

  String? userDescription = '';

  String? userPicture = '';

  String cardBackgroundImage =
      'https://images.unsplash.com/photo-1447933601403-0c6688de566e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxjb2ZmZWV8ZW58MHx8fHwxNzEzNzU0MzQ1fDA&ixlib=rb-4.0.3&q=80&w=1080';

  List<String> storeGallery = [];
  void addToStoreGallery(String item) => storeGallery.add(item);
  void removeFromStoreGallery(String item) => storeGallery.remove(item);
  void removeAtIndexFromStoreGallery(int index) => storeGallery.removeAt(index);
  void insertAtIndexInStoreGallery(int index, String item) =>
      storeGallery.insert(index, item);
  void updateStoreGalleryAtIndex(int index, Function(String) updateFn) =>
      storeGallery[index] = updateFn(storeGallery[index]);

  int imageCount = 0;

  List<String> storeMenu = [];
  void addToStoreMenu(String item) => storeMenu.add(item);
  void removeFromStoreMenu(String item) => storeMenu.remove(item);
  void removeAtIndexFromStoreMenu(int index) => storeMenu.removeAt(index);
  void insertAtIndexInStoreMenu(int index, String item) =>
      storeMenu.insert(index, item);
  void updateStoreMenuAtIndex(int index, Function(String) updateFn) =>
      storeMenu[index] = updateFn(storeMenu[index]);

  List<RedeemableLocalStruct> redeemables = [];
  void addToRedeemables(RedeemableLocalStruct item) => redeemables.add(item);
  void removeFromRedeemables(RedeemableLocalStruct item) =>
      redeemables.remove(item);
  void removeAtIndexFromRedeemables(int index) => redeemables.removeAt(index);
  void insertAtIndexInRedeemables(int index, RedeemableLocalStruct item) =>
      redeemables.insert(index, item);
  void updateRedeemablesAtIndex(
          int index, Function(RedeemableLocalStruct) updateFn) =>
      redeemables[index] = updateFn(redeemables[index]);

  int redeemablesIndex = 0;

  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameTextController;
  String? Function(BuildContext, String?)? yourNameTextControllerValidator;
  String? _yourNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'krqf67i1' /* Please enter your name to cont... */,
      );
    }

    return null;
  }

  // State field(s) for initialiBranchName widget.
  FocusNode? initialiBranchNameFocusNode;
  TextEditingController? initialiBranchNameTextController;
  String? Function(BuildContext, String?)?
      initialiBranchNameTextControllerValidator;
  String? _initialiBranchNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'lszf2wk3' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for businessDescription widget.
  FocusNode? businessDescriptionFocusNode;
  TextEditingController? businessDescriptionTextController;
  String? Function(BuildContext, String?)?
      businessDescriptionTextControllerValidator;
  String? _businessDescriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'yn2glcf6' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for instagramlink widget.
  FocusNode? instagramlinkFocusNode;
  TextEditingController? instagramlinkTextController;
  String? Function(BuildContext, String?)? instagramlinkTextControllerValidator;
  // State field(s) for fblink widget.
  FocusNode? fblinkFocusNode;
  TextEditingController? fblinkTextController;
  String? Function(BuildContext, String?)? fblinkTextControllerValidator;
  // State field(s) for weblink widget.
  FocusNode? weblinkFocusNode;
  TextEditingController? weblinkTextController;
  String? Function(BuildContext, String?)? weblinkTextControllerValidator;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();
  bool isDataUploading_uploadData0cs3j = false;
  FFUploadedFile uploadedLocalFile_uploadData0cs3j =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadData0cs3j = '';

  bool isDataUploading_uploadDataBlqn = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadDataBlqn = [];
  List<String> uploadedFileUrls_uploadDataBlqn = [];

  bool isDataUploading_uploadDataMenuSignup = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadDataMenuSignup = [];
  List<String> uploadedFileUrls_uploadDataMenuSignup = [];

  // Model for CustomLoyaltyCardEditableTemplate component.
  late CustomLoyaltyCardEditableTemplateModel
      customLoyaltyCardEditableTemplateModel;
  Color? colorPicked;
  bool isDataUploading_uploadDataTer = false;
  FFUploadedFile uploadedLocalFile_uploadDataTer =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataTer = '';

  // Model for MarketingMaterialsComponent component.
  late MarketingMaterialsComponentModel marketingMaterialsComponentModel;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  StoresRecord? newStore;

  @override
  void initState(BuildContext context) {
    yourNameTextControllerValidator = _yourNameTextControllerValidator;
    initialiBranchNameTextControllerValidator =
        _initialiBranchNameTextControllerValidator;
    businessDescriptionTextControllerValidator =
        _businessDescriptionTextControllerValidator;
    customLoyaltyCardEditableTemplateModel =
        createModel(context, () => CustomLoyaltyCardEditableTemplateModel());
    marketingMaterialsComponentModel =
        createModel(context, () => MarketingMaterialsComponentModel());
  }

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameTextController?.dispose();

    initialiBranchNameFocusNode?.dispose();
    initialiBranchNameTextController?.dispose();

    businessDescriptionFocusNode?.dispose();
    businessDescriptionTextController?.dispose();

    instagramlinkFocusNode?.dispose();
    instagramlinkTextController?.dispose();

    fblinkFocusNode?.dispose();
    fblinkTextController?.dispose();

    weblinkFocusNode?.dispose();
    weblinkTextController?.dispose();

    customLoyaltyCardEditableTemplateModel.dispose();
    marketingMaterialsComponentModel.dispose();
  }
}
