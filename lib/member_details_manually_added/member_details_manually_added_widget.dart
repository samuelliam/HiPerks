import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/card_detail_and_add_points_copy_widget.dart';
import '/components/transaction_item_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'member_details_manually_added_model.dart';
export 'member_details_manually_added_model.dart';

class MemberDetailsManuallyAddedWidget extends StatefulWidget {
  const MemberDetailsManuallyAddedWidget({
    super.key,
    required this.storeCard,
  });

  final StoreCardsRecord? storeCard;

  static String routeName = 'MemberDetailsManuallyAdded';
  static String routePath = 'memberDetailsManuallyAdded';

  @override
  State<MemberDetailsManuallyAddedWidget> createState() =>
      _MemberDetailsManuallyAddedWidgetState();
}

class _MemberDetailsManuallyAddedWidgetState
    extends State<MemberDetailsManuallyAddedWidget> {
  late MemberDetailsManuallyAddedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MemberDetailsManuallyAddedModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'MemberDetailsManuallyAdded'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryText,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).alternate,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('MEMBER_DETAILS_MANUALLY_ADDED_arrow_back');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: GradientText(
            FFLocalizations.of(context).getText(
              'hb5xykdh' /* Member Details */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.outfit(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).alternate,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
            colors: [
              FlutterFlowTheme.of(context).primary,
              FlutterFlowTheme.of(context).secondary
            ],
            gradientDirection: GradientDirection.ltr,
            gradientType: GradientType.linear,
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                wrapWithModel(
                  model: _model.cardDetailAndAddPointsCopyModel,
                  updateCallback: () => safeSetState(() {}),
                  updateOnChange: true,
                  child: CardDetailAndAddPointsCopyWidget(
                    totalPointsGiven: FFAppState().totalPointsGiven,
                    currentCard: widget!.storeCard!,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'qjbnk5wp' /* All Time Points:  */,
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
                    AuthUserStreamWidget(
                      builder: (context) =>
                          StreamBuilder<List<TransactionsRecord>>(
                        stream: queryTransactionsRecord(
                          parent: currentUserDocument?.store,
                          queryBuilder: (transactionsRecord) =>
                              transactionsRecord
                                  .where(
                                    'card_id',
                                    isEqualTo: widget!.storeCard?.cardStringID,
                                  )
                                  .orderBy('datetime', descending: true),
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
                          List<TransactionsRecord> textTransactionsRecordList =
                              snapshot.data!;

                          return Text(
                            formatNumber(
                              functions.computeTotalPoints(
                                  textTransactionsRecordList.toList()),
                              formatType: FormatType.custom,
                              format: '# ⭐️',
                              locale: '',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                StyledDivider(
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  lineStyle: DividerLineStyle.dashed,
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '3jmcehyw' /* Latest Transactions */,
                      ),
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            font: GoogleFonts.outfit(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                    ),
                  ),
                ),
                AuthUserStreamWidget(
                  builder: (context) => StreamBuilder<List<TransactionsRecord>>(
                    stream: queryTransactionsRecord(
                      parent: currentUserDocument?.store,
                      queryBuilder: (transactionsRecord) => transactionsRecord
                          .where(
                            'card_id',
                            isEqualTo: widget!.storeCard?.cardStringID,
                          )
                          .orderBy('datetime', descending: true),
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
                      List<TransactionsRecord> columnTransactionsRecordList =
                          snapshot.data!;

                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(
                            columnTransactionsRecordList.length, (columnIndex) {
                          final columnTransactionsRecord =
                              columnTransactionsRecordList[columnIndex];
                          return TransactionItemWidget(
                            key: Key(
                                'Keya2w_${columnIndex}_of_${columnTransactionsRecordList.length}'),
                            name: columnTransactionsRecord.cardOwner,
                            cardID: columnTransactionsRecord.cardId,
                            isPointsAdded:
                                columnTransactionsRecord.isPointsAdded,
                            pointsUsed: columnTransactionsRecord.pointsUsed,
                            dateTime: columnTransactionsRecord.datetime!,
                            transactionItem: columnTransactionsRecord,
                          );
                        }),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
