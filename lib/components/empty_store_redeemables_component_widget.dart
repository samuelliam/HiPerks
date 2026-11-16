import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_store_redeemables_component_model.dart';
export 'empty_store_redeemables_component_model.dart';

class EmptyStoreRedeemablesComponentWidget extends StatefulWidget {
  const EmptyStoreRedeemablesComponentWidget({
    super.key,
    this.discoverDidPressed,
  });

  final Future Function()? discoverDidPressed;

  @override
  State<EmptyStoreRedeemablesComponentWidget> createState() =>
      _EmptyStoreRedeemablesComponentWidgetState();
}

class _EmptyStoreRedeemablesComponentWidgetState
    extends State<EmptyStoreRedeemablesComponentWidget> {
  late EmptyStoreRedeemablesComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyStoreRedeemablesComponentModel());
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
              Icons.redeem,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 72.0,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'hginmyrm' /* No Redeemables Yet */,
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
