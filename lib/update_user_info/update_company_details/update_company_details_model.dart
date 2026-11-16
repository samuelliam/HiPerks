import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
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
import '/index.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'update_company_details_widget.dart' show UpdateCompanyDetailsWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class UpdateCompanyDetailsModel
    extends FlutterFlowModel<UpdateCompanyDetailsWidget> {
  ///  Local state fields for this page.

  String userName = '-';

  String? userDescription = '';

  String? userPicture = '';

  String selectedCardBackgroundImage =
      'https://images.unsplash.com/photo-1447933601403-0c6688de566e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxjb2ZmZWV8ZW58MHx8fHwxNzEzNzU0MzQ1fDA&ixlib=rb-4.0.3&q=80&w=1080';

  Color textColor = Color(4279506971);

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

  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Read Document] action in UpdateCompanyDetails widget.
  StoresRecord? currentStore;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode1;
  TextEditingController? yourNameTextController1;
  String? Function(BuildContext, String?)? yourNameTextController1Validator;
  String? _yourNameTextController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'h7axtky0' /* Please enter your name to cont... */,
      );
    }

    return null;
  }

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode2;
  TextEditingController? yourNameTextController2;
  String? Function(BuildContext, String?)? yourNameTextController2Validator;
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
  bool isDataUploading_uploadData0cs3 = false;
  FFUploadedFile uploadedLocalFile_uploadData0cs3 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadData0cs3 = '';

  bool isDataUploading_uploadDataBlq = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadDataBlq = [];
  List<String> uploadedFileUrls_uploadDataBlq = [];

  bool isDataUploading_uploadDataMenuUpdate = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadDataMenuUpdate = [];
  List<String> uploadedFileUrls_uploadDataMenuUpdate = [];

  @override
  void initState(BuildContext context) {
    yourNameTextController1Validator = _yourNameTextController1Validator;
  }

  @override
  void dispose() {
    yourNameFocusNode1?.dispose();
    yourNameTextController1?.dispose();

    yourNameFocusNode2?.dispose();
    yourNameTextController2?.dispose();

    instagramlinkFocusNode?.dispose();
    instagramlinkTextController?.dispose();

    fblinkFocusNode?.dispose();
    fblinkTextController?.dispose();

    weblinkFocusNode?.dispose();
    weblinkTextController?.dispose();
  }
}
