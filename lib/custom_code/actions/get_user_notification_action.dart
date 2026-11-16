// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<PushNotificationRecordStruct>?> getUserNotificationAction(
    DocumentReference currentUser) async {
  // query from firebase ff_user_push_notifications and filter with user_refs matching currentUser and return PushNotificationRecord List

  List<PushNotificationRecordStruct> notificationList = [];

  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('ff_user_push_notifications')
      .where('user_refs', arrayContains: currentUser)
      .get();

  if (querySnapshot.docs.isNotEmpty) {
    querySnapshot.docs.forEach((doc) {
      PushNotificationRecordStruct notification = PushNotificationRecordStruct(
        notificationText: doc['notification_text'],
        notificationTitle: doc['notification_title'],
        timestamp: doc['timestamp'],
        senderReferrence: doc['sender'],
        receiverUserReferrence: doc['user_ref'],
      );
      notificationList.add(notification);
    });
    return notificationList;
  } else {
    return null;
  }
}
