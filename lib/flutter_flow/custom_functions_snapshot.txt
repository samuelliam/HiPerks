import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

int? computeTotalPoints(List<TransactionsRecord>? transactions) {
  int totalPoints = 0;
  transactions?.forEach((element) {
    if (element.isPointsAdded || element.isRemovedPoints) {
      totalPoints += element.pointsUsed;
    }
  });

  return totalPoints;
}

int calculateTotalPoints(List<CatalogOrderStruct>? orders) {
  // calculate the total price from orders
  int totalPoints = 0;
  if (orders != null) {
    for (CatalogOrderStruct order in orders) {
      totalPoints += order.catalogItemPoints * order.orderCount;
    }
  }
  return totalPoints;
}

DateTime getExpiryDate(
  DateTime pointsStartDate,
  int validityMonths,
) {
  // compute the expiry date time from pointsStartDate upto validityMonths utilize 365 days a year
  final daysInYear = 365;
  final daysToAdd = (validityMonths * daysInYear) ~/ 12;
  final expiryDate = pointsStartDate.add(Duration(days: daysToAdd));
  return expiryDate;
}

List<String> returnBranchNameList(List<BranchesRecord> branches) {
  List<String> branchNames = [];
  branches.forEach((element) {
    branchNames.add(element.branchName);
  });

  return branchNames;
}

int? getMSFromDate(
  DateTime? redeemDate,
  int? countDownMS,
) {
  // compute the remaining MS from countdonwms,  redeemdate and datetime now
  if (redeemDate == null || countDownMS == null) {
    return null;
  }

  DateTime now = DateTime.now();
  Duration remainingTime =
      redeemDate.difference(now) + Duration(milliseconds: countDownMS);
  int remainingMS = remainingTime.inMilliseconds;

  return math.max(remainingMS, 0);
}

AccessRole getAccessRole(String roleString) {
  // return the respective enum value from text
  switch (roleString) {
    case 'Owner':
      return AccessRole.Owner;
    case 'Manager':
      return AccessRole.Manager;
    case 'Staff':
      return AccessRole.Staff;
    case 'Viewer':
      return AccessRole.Viewer;
    default:
      throw ArgumentError('Invalid role string: $roleString');
  }
}

bool? computeIsPointsValidDateTime(
  DateTime pointsStartDate,
  int validityMonths,
) {
  // compute the expiry date time from pointsStartDate upto validityMonths utilize 365 days a year
  final daysInYear = 365;
  final daysToAdd = (validityMonths * daysInYear) ~/ 12;
  final expiryDate = pointsStartDate.add(Duration(days: daysToAdd));
  return DateTime.now().isBefore(expiryDate);
}

int? computeTotalCatalogOrderPoints(List<CatalogOrderStruct> orders) {
  // compute the total points on the order list
  int totalPoints = 0;
  for (CatalogOrderStruct order in orders) {
    totalPoints += order.orderCount * order.catalogItemPoints;
  }
  return totalPoints;
}

double calculateTotalPrice(List<CatalogOrderStruct>? orders) {
  // calculate the total price from orders
  double totalPrice = 0.0;
  if (orders != null) {
    for (CatalogOrderStruct order in orders) {
      totalPrice += order.catalogItemPrice * order.orderCount;
    }
  }
  return totalPrice;
}

List<DocumentReference>? getReferrenceAllMatchedBranch(
  List<BranchesRecord>? storeBranches,
  List<String>? selectedBranch,
) {
  // get all the branch referrence with the matching name in the selectedbranch list
  List<DocumentReference>? matchedBranches = [];

  if (storeBranches != null && selectedBranch != null) {
    for (var branch in storeBranches) {
      if (selectedBranch.contains(branch.branchName)) {
        matchedBranches.add(branch.reference);
      }
    }
  }

  return matchedBranches.isEmpty ? [] : matchedBranches;
}

List<CatalogOrderStruct>? removeAllOrderWithBranch(
  List<CatalogOrderStruct>? currentOrders,
  DocumentReference? currentStore,
) {
  // remove all order in currentOrders with matching currentStore referrence
  currentOrders?.removeWhere((order) => order.storeReferrence == currentStore);
  return currentOrders;
}

int getNumberOfDaysPassed(DateTime lastNotificationDate) {
  // get number of days pass from lstNotificationDate to datetime now
  final now = DateTime.now();
  final difference = now.difference(lastNotificationDate);
  return difference.inDays;
}

List<PushNotificationRecordStruct>? getUserNotifications(
    DocumentReference currentUser) {
  // query from firebase ff_user_push_notifications and filter with user_refs matching currentUser
  List<PushNotificationRecordStruct>? notifications = [];
  // Query from firebase ff_user_push_notifications
  FirebaseFirestore.instance
      .collection('ff_user_push_notifications')
      // Filter with user_refs matching currentUser
      .where('user_refs', arrayContains: currentUser)
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      notifications.add(PushNotificationRecordStruct(
          notificationTitle: doc['notification_title'],
          notificationText: doc['notification_text'],
          timestamp: doc['timestamp'],
          receiverUserReferrence: doc['user_ref'],
          senderReferrence: doc['sender']));
    });
  });
  return notifications;
}

double? getAverageStoreRatings(List<TransactionsRecord>? transactions) {
  // get total ratings of all transactions and get average
  if (transactions == null || transactions.isEmpty) {
    return null;
  }

  int totalRatings = 0;
  int totalTransactions = 0;

  for (var transaction in transactions) {
    if (transaction.rating != null) {
      totalRatings += transaction.rating!;
      totalTransactions++;
    }
  }

  if (totalTransactions == 0) {
    return null;
  }

  double averageRating = totalRatings / totalTransactions;
  return averageRating;
}

LatLng generateLocation(
  String lat,
  String long,
) {
  // generate location datatype from lat long string
  double latitude = double.parse(lat);
  double longitude = double.parse(long);
  return LatLng(latitude, longitude);
}

String colorToText(Color color) {
  return color.toString();
}

List<DocumentReference> getUserRefs(
  DocumentReference storeUser,
  DocumentReference customerUser,
) {
  return [storeUser, customerUser];
}

List<TransactionsRecord>? filterTransactions(
  bool? isPreOrder,
  bool? isAddPoints,
  bool? isRemovePoints,
  bool? isConfirmed,
  DocumentReference? branchRef,
  List<TransactionsRecord>? transactions,
) {
  if (transactions == null) return null;

  return transactions.where((transaction) {
    final matchesPreOrder =
        isPreOrder == null || transaction.isPreOrder == isPreOrder;
    final matchesAddPoints =
        isAddPoints == null || transaction.isPointsAdded == isAddPoints;
    final matchesRemovePoints = isRemovePoints == null ||
        transaction.isRemovedPoints == isRemovePoints &&
            transaction.isPointsAdded == isAddPoints;
    final matchesConfirmed =
        isConfirmed == null || transaction.isConfirmed == isConfirmed;
    final matchesBranchRef =
        branchRef == null || transaction.branchReferrence == branchRef;

    return matchesPreOrder &&
        matchesAddPoints &&
        matchesRemovePoints &&
        matchesConfirmed &&
        matchesBranchRef;
  }).toList();
}

List<DocumentReference>? getUserRefsBaseOnUserVoucher(
    List<DocumentReference>? userVouchers) {
  if (userVouchers == null) return null;

  return userVouchers.map((voucher) {
    // voucher.parent -> UserVouchers collection
    // voucher.parent.parent -> users/{uid} document (nullable)
    final parentDoc = voucher.parent.parent;
    if (parentDoc == null) {
      throw Exception(
          "Invalid path: expected users/{uid}/UserVouchers/{voucherId}");
    }
    return parentDoc;
  }).toList();
}

DateTime getCurrentStartDay(DateTime selectedDate) {
  // get current day date with 1am time
  DateTime now = selectedDate;
  return DateTime(now.year, now.month, now.day, 1, 0);
}

DateTime getCurrentYesterday() {
  // get current day date with 1am time
  DateTime now = DateTime.now();
  final startDateToday = DateTime(now.year, now.month, now.day, 1, 0);
  final yesterDate = startDateToday.subtract(const Duration(days: 1));
  return yesterDate;
}

double calculateGrowth(
  int todayValue,
  int yesterdayValue,
) {
  return ((todayValue - yesterdayValue) / yesterdayValue) * 100;
}

DateTime getEndDateTime(DateTime selectedDate) {
  DateTime now = selectedDate;
  return DateTime(now.year, now.month, now.day, 11, 59);
}
