import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'marketing_materials_component_model.dart';
export 'marketing_materials_component_model.dart';

class MarketingMaterialsComponentWidget extends StatefulWidget {
  const MarketingMaterialsComponentWidget({super.key});

  @override
  State<MarketingMaterialsComponentWidget> createState() =>
      _MarketingMaterialsComponentWidgetState();
}

class _MarketingMaterialsComponentWidgetState
    extends State<MarketingMaterialsComponentWidget> {
  late MarketingMaterialsComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MarketingMaterialsComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('MARKETING_MATERIALS_COMPONENT_Image_ncul');
              logFirebaseEvent('Image_expand_image');
              await Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: FlutterFlowExpandedImageView(
                    image: CachedNetworkImage(
                      fadeInDuration: Duration(milliseconds: 500),
                      fadeOutDuration: Duration(milliseconds: 500),
                      imageUrl:
                          'https://firebasestorage.googleapis.com/v0/b/brew-perks-9dvs9l.appspot.com/o/HiPerksAssets%2FHi%20Perks%20QR%20Poster%20Image.jpg?alt=media&token=8f37967c-c0df-426e-9f85-82301820b187',
                      fit: BoxFit.contain,
                    ),
                    allowRotation: false,
                    tag: 'imageTag',
                    useHeroAnimation: true,
                  ),
                ),
              );
            },
            child: Hero(
              tag: 'imageTag',
              transitionOnUserGestures: true,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: CachedNetworkImage(
                  fadeInDuration: Duration(milliseconds: 500),
                  fadeOutDuration: Duration(milliseconds: 500),
                  imageUrl:
                      'https://firebasestorage.googleapis.com/v0/b/brew-perks-9dvs9l.appspot.com/o/HiPerksAssets%2FHi%20Perks%20QR%20Poster%20Image.jpg?alt=media&token=8f37967c-c0df-426e-9f85-82301820b187',
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0.0, 1.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
            child: FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('MARKETING_MATERIALS_COMPONENT_DOWNLOAD_H');
                logFirebaseEvent('Button_download_file');
                await downloadFile(
                  filename: 'Hi Perks Poster',
                  url:
                      'https://firebasestorage.googleapis.com/v0/b/brew-perks-9dvs9l.appspot.com/o/HiPerksAssets%2FHi%20Perks%20QR%20Poster.pdf?alt=media&token=e97ea406-71ab-4667-a3fb-08f1b1cbbdd9',
                );
              },
              text: FFLocalizations.of(context).getText(
                't7lr3060' /* Download Hi Perks Poster */,
              ),
              options: FFButtonOptions(
                width: 250.0,
                height: 50.0,
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      font: GoogleFonts.readexPro(
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                      color: Colors.white,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).titleSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleSmall.fontStyle,
                    ),
                elevation: 0.0,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0.0, 1.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
            child: FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('MARKETING_MATERIALS_COMPONENT_SAVE_Q_R_O');
                logFirebaseEvent('Button_download_file');
                await downloadFile(
                  filename: 'Hi Perks Poster',
                  url:
                      'https://firebasestorage.googleapis.com/v0/b/brew-perks-9dvs9l.appspot.com/o/HiPerksAssets%2FHi%20Perks%20QR.png?alt=media&token=5e7ead93-391d-423d-a6f4-013e5abeffe1',
                );
              },
              text: FFLocalizations.of(context).getText(
                'lxuqav5g' /* Save QR Only */,
              ),
              options: FFButtonOptions(
                width: 250.0,
                height: 50.0,
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      font: GoogleFonts.readexPro(
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                      color: Colors.white,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).titleSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleSmall.fontStyle,
                    ),
                elevation: 0.0,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
          child: Text(
            FFLocalizations.of(context).getText(
              'durdghqu' /* With this printable poster, yo... */,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.readexPro(
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).secondaryText,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
        ),
      ],
    );
  }
}
