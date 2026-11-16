import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'store_card_model.dart';
export 'store_card_model.dart';

class StoreCardWidget extends StatefulWidget {
  const StoreCardWidget({
    super.key,
    required this.storeInfo,
  });

  final StoresRecord? storeInfo;

  @override
  State<StoreCardWidget> createState() => _StoreCardWidgetState();
}

class _StoreCardWidgetState extends State<StoreCardWidget>
    with TickerProviderStateMixin {
  late StoreCardModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StoreCardModel());

    animationsMap.addAll({
      'cardOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 50.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 600.0,
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 2.0,
                color: Color(0x520E151B),
                offset: Offset(
                  0.0,
                  1.0,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Container(
            height: 300.0,
            child: Stack(
              children: [
                Builder(
                  builder: (context) {
                    if (widget!.storeInfo?.storeImages != null &&
                        (widget!.storeInfo?.storeImages)!.isNotEmpty) {
                      return Builder(
                        builder: (context) {
                          final storeImage =
                              widget!.storeInfo?.storeImages?.toList() ?? [];
                          if (storeImage.isEmpty) {
                            return Center(
                              child: Image.asset(
                                widget!.storeInfo!.storeLogo,
                              ),
                            );
                          }

                          return Container(
                            width: double.infinity,
                            height: 500.0,
                            child: Stack(
                              children: [
                                PageView.builder(
                                  controller: _model.pageViewController ??=
                                      PageController(
                                          initialPage: max(0,
                                              min(0, storeImage.length - 1))),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: storeImage.length,
                                  itemBuilder: (context, storeImageIndex) {
                                    final storeImageItem =
                                        storeImage[storeImageIndex];
                                    return CachedNetworkImage(
                                      fadeInDuration:
                                          Duration(milliseconds: 500),
                                      fadeOutDuration:
                                          Duration(milliseconds: 500),
                                      imageUrl: storeImageItem,
                                      width: 300.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    );
                                  },
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 16.0, 16.0, 16.0),
                                    child: smooth_page_indicator
                                        .SmoothPageIndicator(
                                      controller: _model.pageViewController ??=
                                          PageController(
                                              initialPage: max(
                                                  0,
                                                  min(0,
                                                      storeImage.length - 1))),
                                      count: storeImage.length,
                                      axisDirection: Axis.horizontal,
                                      onDotClicked: (i) async {
                                        await _model.pageViewController!
                                            .animateToPage(
                                          i,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.ease,
                                        );
                                        safeSetState(() {});
                                      },
                                      effect: smooth_page_indicator.SlideEffect(
                                        spacing: 8.0,
                                        radius: 16.0,
                                        dotWidth: 16.0,
                                        dotHeight: 5.0,
                                        dotColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        activeDotColor: valueOrDefault<Color>(
                                          widget!.storeInfo?.storePageTextColor,
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                        paintStyle: PaintingStyle.stroke,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      return Hero(
                        tag: widget!.storeInfo!.storeLogo,
                        transitionOnUserGestures: true,
                        child: CachedNetworkImage(
                          fadeInDuration: Duration(milliseconds: 500),
                          fadeOutDuration: Duration(milliseconds: 500),
                          imageUrl: widget!.storeInfo!.storeLogo,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      );
                    }
                  },
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 20.0,
                            sigmaY: 20.0,
                          ),
                          child: Container(
                            constraints: BoxConstraints(
                              maxHeight: 150.0,
                            ),
                            decoration: BoxDecoration(
                              color: valueOrDefault<Color>(
                                widget!.storeInfo?.storePageBackgroundColor,
                                Color(0x6D14181B),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0x33000000),
                                  offset: Offset(
                                    0.0,
                                    2.0,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.only(),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 8.0, 0.0, 8.0),
                                  child: Hero(
                                    tag: widget!.storeInfo!.storeLogo,
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: CachedNetworkImage(
                                        fadeInDuration:
                                            Duration(milliseconds: 500),
                                        fadeOutDuration:
                                            Duration(milliseconds: 500),
                                        imageUrl: widget!.storeInfo!.storeLogo,
                                        width: 60.0,
                                        height: 60.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            child: AutoSizeText(
                                              valueOrDefault<String>(
                                                widget!.storeInfo?.storeName,
                                                '-',
                                              ),
                                              maxLines: 2,
                                              minFontSize: 10.0,
                                              style: GoogleFonts.outfit(
                                                color: valueOrDefault<Color>(
                                                  widget!.storeInfo
                                                      ?.storePageTextColor,
                                                  Colors.white,
                                                ),
                                                fontWeight: FontWeight.w600,
                                                fontSize: 30.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: AutoSizeText(
                                              valueOrDefault<String>(
                                                widget!.storeInfo
                                                    ?.storeDescription,
                                                '-',
                                              ).maybeHandleOverflow(
                                                maxChars: 500,
                                                replacement: '…',
                                              ),
                                              maxLines: 3,
                                              minFontSize: 7.0,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    font: GoogleFonts.readexPro(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontStyle,
                                                    ),
                                                    color:
                                                        valueOrDefault<Color>(
                                                      widget!.storeInfo
                                                          ?.storePageSecondaryColor,
                                                      Color(0xFFF8F8F8),
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ).animateOnPageLoad(animationsMap['cardOnPageLoadAnimation']!),
    );
  }
}
