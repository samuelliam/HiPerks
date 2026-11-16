import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'unsplash_or_upload_image_widget.dart' show UnsplashOrUploadImageWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UnsplashOrUploadImageModel
    extends FlutterFlowModel<UnsplashOrUploadImageWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading_uploadData3ek = false;
  FFUploadedFile uploadedLocalFile_uploadData3ek =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadData3ek = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
