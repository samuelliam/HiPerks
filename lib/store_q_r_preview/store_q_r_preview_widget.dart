import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'store_q_r_preview_model.dart';
export 'store_q_r_preview_model.dart';

class StoreQRPreviewWidget extends StatefulWidget {
  const StoreQRPreviewWidget({super.key});

  static String routeName = 'StoreQRPreview';
  static String routePath = 'storeQRPreview';

  @override
  State<StoreQRPreviewWidget> createState() => _StoreQRPreviewWidgetState();
}

class _StoreQRPreviewWidgetState extends State<StoreQRPreviewWidget> {
  late StoreQRPreviewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StoreQRPreviewModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'StoreQRPreview'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [],
          ),
        ),
      ),
    );
  }
}
