import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/add_store_catalog_component_widget.dart';
import '/components/edit_store_catalog_component_widget.dart';
import '/components/empty_store_catalog_component_widget.dart';
import '/components/empty_store_gallerys_component_widget.dart';
import '/components/paywall_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'store_catalog_page_widget.dart' show StoreCatalogPageWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class StoreCatalogPageModel extends FlutterFlowModel<StoreCatalogPageWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadDataTj0 = false;
  FFUploadedFile uploadedLocalFile_uploadDataTj0 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataTj0 = '';

  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  int? catalogItemCountCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
