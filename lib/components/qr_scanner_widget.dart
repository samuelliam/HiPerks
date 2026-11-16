import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'qr_scanner_model.dart';
export 'qr_scanner_model.dart';

class QrScannerWidget extends StatefulWidget {
  const QrScannerWidget({
    super.key,
    required this.onDetected,
  });

  final Future Function(String? scannedCardID)? onDetected;

  @override
  State<QrScannerWidget> createState() => _QrScannerWidgetState();
}

class _QrScannerWidgetState extends State<QrScannerWidget> {
  late QrScannerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QrScannerModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: custom_widgets.MobileScanner(
              width: double.infinity,
              height: double.infinity,
              scanned: (scannedQR) async {
                logFirebaseEvent('QR_SCANNER_Container_ptmuubwh_CALLBACK');
                logFirebaseEvent('MobileScanner_execute_callback');
                await widget.onDetected?.call(
                  scannedQR,
                );
              },
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0.0, 1.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 32.0),
            child: Text(
              FFLocalizations.of(context).getText(
                '03vh4cnd' /* Scan the card QR Code. */,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.readexPro(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(1.0, -1.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 32.0, 16.0, 8.0),
            child: FlutterFlowIconButton(
              borderRadius: 20.0,
              borderWidth: 0.0,
              buttonSize: 40.0,
              icon: Icon(
                Icons.close_sharp,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async {
                logFirebaseEvent('QR_SCANNER_COMP_close_sharp_ICN_ON_TAP');
                logFirebaseEvent('IconButton_close_dialog_drawer_etc');
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ],
    );
  }
}
