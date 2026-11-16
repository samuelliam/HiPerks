import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'store_preview_component_model.dart';
export 'store_preview_component_model.dart';

class StorePreviewComponentWidget extends StatefulWidget {
  const StorePreviewComponentWidget({
    super.key,
    required this.store,
  });

  final StoresRecord? store;

  @override
  State<StorePreviewComponentWidget> createState() =>
      _StorePreviewComponentWidgetState();
}

class _StorePreviewComponentWidgetState
    extends State<StorePreviewComponentWidget> {
  late StorePreviewComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StorePreviewComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).primaryText,
          width: 2.0,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: CachedNetworkImage(
                  fadeInDuration: Duration(milliseconds: 500),
                  fadeOutDuration: Duration(milliseconds: 500),
                  imageUrl: widget!.store!.storeLogo,
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.contain,
                  alignment: Alignment(0.0, 0.0),
                  memCacheWidth: 200,
                  memCacheHeight: 200,
                ),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
              child: AutoSizeText(
                valueOrDefault<String>(
                  widget!.store?.storeName,
                  'Store Name',
                ),
                textAlign: TextAlign.center,
                minFontSize: 9.0,
                style: FlutterFlowTheme.of(context).headlineLarge.override(
                      font: GoogleFonts.outfit(
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineLarge
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineLarge
                            .fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).headlineLarge.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                    ),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 8.0),
              child: AutoSizeText(
                valueOrDefault<String>(
                  widget!.store?.storeDescription,
                  'Description',
                ),
                textAlign: TextAlign.center,
                minFontSize: 8.0,
                style: FlutterFlowTheme.of(context).labelMedium.override(
                      font: GoogleFonts.readexPro(
                        fontWeight:
                            FlutterFlowTheme.of(context).labelMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelMedium.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).labelMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelMedium.fontStyle,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
