import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_store_discovery_component_model.dart';
export 'empty_store_discovery_component_model.dart';

class EmptyStoreDiscoveryComponentWidget extends StatefulWidget {
  const EmptyStoreDiscoveryComponentWidget({
    super.key,
    this.discoverDidPressed,
  });

  final Future Function()? discoverDidPressed;

  @override
  State<EmptyStoreDiscoveryComponentWidget> createState() =>
      _EmptyStoreDiscoveryComponentWidgetState();
}

class _EmptyStoreDiscoveryComponentWidgetState
    extends State<EmptyStoreDiscoveryComponentWidget> {
  late EmptyStoreDiscoveryComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyStoreDiscoveryComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.storefront_sharp,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 72.0,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'h4c4td20' /* No Stores Yet */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      font: GoogleFonts.outfit(
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
