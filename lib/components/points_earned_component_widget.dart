import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/rating_feedback_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'points_earned_component_model.dart';
export 'points_earned_component_model.dart';

class PointsEarnedComponentWidget extends StatefulWidget {
  const PointsEarnedComponentWidget({super.key});

  @override
  State<PointsEarnedComponentWidget> createState() =>
      _PointsEarnedComponentWidgetState();
}

class _PointsEarnedComponentWidgetState
    extends State<PointsEarnedComponentWidget> {
  late PointsEarnedComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PointsEarnedComponentModel());
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
      child: StreamBuilder<List<PushNotificationHistoryRecord>>(
        stream: queryPushNotificationHistoryRecord(
          queryBuilder: (pushNotificationHistoryRecord) =>
              pushNotificationHistoryRecord
                  .where(
                    'receiver_user_refs',
                    arrayContains: currentUserReference,
                  )
                  .orderBy('timestamp', descending: true),
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitRipple(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            );
          }
          List<PushNotificationHistoryRecord>
              containerPushNotificationHistoryRecordList = snapshot.data!;

          return ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.8,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'stalgl47' /* Yay, You Did It! 👋 */,
                      ),
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            font: GoogleFonts.outfit(
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .displaySmall
                                .fontStyle,
                          ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                      child: Stack(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: FutureBuilder<UsersRecord>(
                              future: UsersRecord.getDocumentOnce(
                                  containerPushNotificationHistoryRecordList
                                      .firstOrNull!.sender!),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: SpinKitRipple(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }

                                final imageUsersRecord = snapshot.data!;

                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: CachedNetworkImage(
                                    fadeInDuration: Duration(milliseconds: 500),
                                    fadeOutDuration:
                                        Duration(milliseconds: 500),
                                    imageUrl: imageUsersRecord.photoUrl,
                                    width: 150.0,
                                    height: 150.0,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                            ),
                          ),
                          Lottie.asset(
                            'assets/jsons/Animation_-_1738134412153.json',
                            width: 150.0,
                            height: 150.0,
                            fit: BoxFit.contain,
                            frameRate: FrameRate(120.0),
                            animate: true,
                          ),
                        ],
                      ),
                    ),
                    GradientText(
                      valueOrDefault<String>(
                        containerPushNotificationHistoryRecordList
                            .firstOrNull?.notificationText,
                        'You\'ve just earned points! Keep earning and enjoying amazing rewards! ',
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            font: GoogleFonts.readexPro(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                      colors: [
                        FlutterFlowTheme.of(context).primary,
                        FlutterFlowTheme.of(context).secondary
                      ],
                      gradientDirection: GradientDirection.ltr,
                      gradientType: GradientType.linear,
                    ),
                    Builder(
                      builder: (context) => Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'POINTS_EARNED_COMPONENT_HIT_US_WITH_YOUR');
                            logFirebaseEvent('Button_share');
                            await Share.share(
                              valueOrDefault<String>(
                                containerPushNotificationHistoryRecordList
                                    .firstOrNull?.notificationText,
                                'You\'ve just earned points! Keep earning and enjoying amazing rewards! ',
                              ),
                              sharePositionOrigin:
                                  getWidgetBoundingBox(context),
                            );
                            logFirebaseEvent('Button_alert_dialog');
                            await showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: WebViewAware(
                                    child: RatingFeedbackComponentWidget(
                                      storeTransaction:
                                          containerPushNotificationHistoryRecordList
                                              .firstOrNull!.transactionRef!,
                                      userTransaction:
                                          containerPushNotificationHistoryRecordList
                                              .firstOrNull!.usertransactionRef!,
                                      storeReference:
                                          containerPushNotificationHistoryRecordList
                                              .firstOrNull!.storeRef!,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          text: FFLocalizations.of(context).getText(
                            'ym2mmrre' /* Hit us with your feedback! */,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'POINTS_EARNED_COMPONENT_MAYBE_NEXT_TIME_');
                          logFirebaseEvent('Button_dismiss_dialog');
                          Navigator.pop(context);
                        },
                        text: FFLocalizations.of(context).getText(
                          'q6wekus8' /* Maybe, Next Time  */,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).success,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ]
                      .addToStart(SizedBox(height: 16.0))
                      .addToEnd(SizedBox(height: 16.0)),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
