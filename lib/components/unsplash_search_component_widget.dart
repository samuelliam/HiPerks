import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'unsplash_search_component_model.dart';
export 'unsplash_search_component_model.dart';

class UnsplashSearchComponentWidget extends StatefulWidget {
  const UnsplashSearchComponentWidget({
    super.key,
    required this.imageDidSelect,
  });

  final Future Function(String? image)? imageDidSelect;

  @override
  State<UnsplashSearchComponentWidget> createState() =>
      _UnsplashSearchComponentWidgetState();
}

class _UnsplashSearchComponentWidgetState
    extends State<UnsplashSearchComponentWidget> {
  late UnsplashSearchComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UnsplashSearchComponentModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
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
                    logFirebaseEvent(
                        'UNSPLASH_SEARCH_COMPONENT_close_sharp_IC');
                    logFirebaseEvent('IconButton_close_dialog_drawer_etc');
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 16.0),
                child: Container(
                  width: double.infinity,
                  child: TextFormField(
                    controller: _model.textController,
                    focusNode: _model.textFieldFocusNode,
                    onFieldSubmitted: (_) async {
                      logFirebaseEvent(
                          'UNSPLASH_SEARCH_COMPONENT_TextField_i5t7');
                      logFirebaseEvent('TextField_refresh_database_request');
                      safeSetState(() =>
                          _model.staggeredViewPagingController?.refresh());
                      await _model.waitForOnePageForStaggeredView();
                    },
                    autofocus: false,
                    textInputAction: TextInputAction.search,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: FFLocalizations.of(context).getText(
                        'uml94kj7' /* Search Image */,
                      ),
                      labelStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.readexPro(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primaryText,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.readexPro(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                    validator:
                        _model.textControllerValidator.asValidator(context),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                    child: RefreshIndicator(
                      color: FlutterFlowTheme.of(context).alternate,
                      backgroundColor: FlutterFlowTheme.of(context).primaryText,
                      onRefresh: () async {
                        logFirebaseEvent(
                            'UNSPLASH_SEARCH_COMPONENT_StaggeredView_');
                        logFirebaseEvent(
                            'StaggeredView_refresh_database_request');
                        safeSetState(() =>
                            _model.staggeredViewPagingController?.refresh());
                        await _model.waitForOnePageForStaggeredView();
                      },
                      child:
                          PagedMasonryGridView<ApiPagingParams, dynamic>.count(
                        pagingController: _model.setStaggeredViewController(
                          (nextPageMarker) => SearchImageUnsplashCall.call(
                            query: valueOrDefault<String>(
                              _model.textController.text,
                              'pattern',
                            ),
                            page: nextPageMarker.nextPageNumber,
                          ),
                        ),
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        builderDelegate: PagedChildBuilderDelegate<dynamic>(
                          // Customize what your widget looks like when it's loading the first page.
                          firstPageProgressIndicatorBuilder: (_) => Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: SpinKitRipple(
                                color: FlutterFlowTheme.of(context).primary,
                                size: 50.0,
                              ),
                            ),
                          ),
                          // Customize what your widget looks like when it's loading another page.
                          newPageProgressIndicatorBuilder: (_) => Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: SpinKitRipple(
                                color: FlutterFlowTheme.of(context).primary,
                                size: 50.0,
                              ),
                            ),
                          ),

                          itemBuilder: (context, _, resultIndex) {
                            final resultItem = _model
                                .staggeredViewPagingController!
                                .itemList![resultIndex];
                            return Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Stack(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'UNSPLASH_SEARCH_COMPONENT_Image_z63rpgbe');
                                      logFirebaseEvent(
                                          'Image_execute_callback');
                                      await widget.imageDidSelect?.call(
                                        getJsonField(
                                          resultItem,
                                          r'''$.urls.full''',
                                        ).toString(),
                                      );
                                      logFirebaseEvent(
                                          'Image_close_dialog_drawer_etc');
                                      Navigator.pop(context);
                                    },
                                    onLongPress: () async {
                                      logFirebaseEvent(
                                          'UNSPLASH_SEARCH_COMPONENT_Image_z63rpgbe');
                                      logFirebaseEvent('Image_expand_image');
                                      await Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.fade,
                                          child: FlutterFlowExpandedImageView(
                                            image: CachedNetworkImage(
                                              fadeInDuration:
                                                  Duration(milliseconds: 500),
                                              fadeOutDuration:
                                                  Duration(milliseconds: 500),
                                              imageUrl: getJsonField(
                                                resultItem,
                                                r'''$.urls.regular''',
                                              ).toString(),
                                              fit: BoxFit.contain,
                                            ),
                                            allowRotation: true,
                                            tag: getJsonField(
                                              resultItem,
                                              r'''$.urls.regular''',
                                            ).toString(),
                                            useHeroAnimation: true,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag: getJsonField(
                                        resultItem,
                                        r'''$.urls.regular''',
                                      ).toString(),
                                      transitionOnUserGestures: true,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: CachedNetworkImage(
                                          fadeInDuration:
                                              Duration(milliseconds: 500),
                                          fadeOutDuration:
                                              Duration(milliseconds: 500),
                                          imageUrl: getJsonField(
                                            resultItem,
                                            r'''$.urls.regular''',
                                          ).toString(),
                                          width: 300.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 8.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                            sigmaX: 2.0,
                                            sigmaY: 2.0,
                                          ),
                                          child: Text(
                                            'By${getJsonField(
                                              resultItem,
                                              r'''$.user.name''',
                                            ).toString()} on Unsplash',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.readexPro(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Colors.white,
                                                  fontSize: 8.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
