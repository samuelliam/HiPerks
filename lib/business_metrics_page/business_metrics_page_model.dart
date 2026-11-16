import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'business_metrics_page_widget.dart' show BusinessMetricsPageWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BusinessMetricsPageModel
    extends FlutterFlowModel<BusinessMetricsPageWidget> {
  ///  Local state fields for this page.

  List<StoreCardsRecord> todaysNewMembers = [];
  void addToTodaysNewMembers(StoreCardsRecord item) =>
      todaysNewMembers.add(item);
  void removeFromTodaysNewMembers(StoreCardsRecord item) =>
      todaysNewMembers.remove(item);
  void removeAtIndexFromTodaysNewMembers(int index) =>
      todaysNewMembers.removeAt(index);
  void insertAtIndexInTodaysNewMembers(int index, StoreCardsRecord item) =>
      todaysNewMembers.insert(index, item);
  void updateTodaysNewMembersAtIndex(
          int index, Function(StoreCardsRecord) updateFn) =>
      todaysNewMembers[index] = updateFn(todaysNewMembers[index]);

  DateTime? currentSelectedDate;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in BusinessMetricsPage widget.
  List<StoreCardsRecord>? newMembersTodayQuery;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // Stores action output result for [Firestore Query - Query a collection] action in Calendar widget.
  List<StoreCardsRecord>? newMembersTodayQueryCalendar;
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  UserCardsRecord? currentUserCard;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {}
}
