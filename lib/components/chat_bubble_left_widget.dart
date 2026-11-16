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
import 'chat_bubble_left_model.dart';
export 'chat_bubble_left_model.dart';

class ChatBubbleLeftWidget extends StatefulWidget {
  const ChatBubbleLeftWidget({
    super.key,
    required this.message,
    this.userImage,
    this.bubbleColor,
    this.textColor,
    this.imageAttachments,
    required this.timestamp,
  });

  final String? message;
  final String? userImage;
  final Color? bubbleColor;
  final Color? textColor;
  final List<String>? imageAttachments;
  final DateTime? timestamp;

  @override
  State<ChatBubbleLeftWidget> createState() => _ChatBubbleLeftWidgetState();
}

class _ChatBubbleLeftWidgetState extends State<ChatBubbleLeftWidget> {
  late ChatBubbleLeftModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatBubbleLeftModel());
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
        color: Colors.transparent,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget!.imageAttachments != null &&
              (widget!.imageAttachments)!.isNotEmpty)
            Builder(
              builder: (context) {
                final image = widget!.imageAttachments?.toList() ?? [];

                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(image.length, (imageIndex) {
                      final imageItem = image[imageIndex];
                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'CHAT_BUBBLE_LEFT_Image_nyoz3dnx_ON_TAP');
                          logFirebaseEvent('Image_expand_image');
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              child: FlutterFlowExpandedImageView(
                                image: CachedNetworkImage(
                                  fadeInDuration: Duration(milliseconds: 500),
                                  fadeOutDuration: Duration(milliseconds: 500),
                                  imageUrl: imageItem,
                                  fit: BoxFit.contain,
                                ),
                                allowRotation: false,
                                tag: imageItem,
                                useHeroAnimation: true,
                              ),
                            ),
                          );
                        },
                        child: Hero(
                          tag: imageItem,
                          transitionOnUserGestures: true,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: CachedNetworkImage(
                              fadeInDuration: Duration(milliseconds: 500),
                              fadeOutDuration: Duration(milliseconds: 500),
                              imageUrl: imageItem,
                              height: 150.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    })
                        .divide(SizedBox(width: 8.0))
                        .addToStart(SizedBox(width: 16.0))
                        .addToEnd(SizedBox(width: 16.0)),
                  ),
                );
              },
            ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: CachedNetworkImage(
                    fadeInDuration: Duration(milliseconds: 0),
                    fadeOutDuration: Duration(milliseconds: 0),
                    imageUrl: widget!.userImage!,
                    width: 40.0,
                    height: 40.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: valueOrDefault<Color>(
                          widget!.bubbleColor,
                          FlutterFlowTheme.of(context).alternate,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          widget!.message!,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: valueOrDefault<Color>(
                                      widget!.textColor,
                                      FlutterFlowTheme.of(context).primaryText,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ),
              ].divide(SizedBox(width: 8.0)),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Text(
              dateTimeFormat(
                "relative",
                widget!.timestamp,
                locale: FFLocalizations.of(context).languageCode,
              ),
              style: FlutterFlowTheme.of(context).labelSmall.override(
                    font: GoogleFonts.readexPro(
                      fontWeight:
                          FlutterFlowTheme.of(context).labelSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelSmall.fontStyle,
                    ),
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).labelSmall.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelSmall.fontStyle,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
