import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: SpinKitRipple(
              color: FlutterFlowTheme.of(context).primary,
              size: 50.0,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'auth_4_Welcome': ParameterData.none(),
  'auth_4_OnboardingPhoneVerify': (data) async => ParameterData(
        allParams: {
          'phoneNumber': getParameter<String>(data, 'phoneNumber'),
          'isLogin': getParameter<bool>(data, 'isLogin'),
        },
      ),
  'auth_4_Home': ParameterData.none(),
  'auth_4_OnboardingUserDetails': (data) async => ParameterData(
        allParams: {
          'index': getParameter<int>(data, 'index'),
        },
      ),
  'auth_4_OnboardingCompanyDetails': (data) async => ParameterData(
        allParams: {
          'index': getParameter<int>(data, 'index'),
        },
      ),
  'StoreDiscovery': ParameterData.none(),
  'StoreDetails': (data) async {
    final allParams = {
      'initialIndex': getParameter<int>(data, 'initialIndex'),
      'storeID': getParameter<String>(data, 'storeID'),
    };
    return ParameterData(
      requiredParams: {
        'storeID': serializeParam(
          allParams['storeID'],
          ParamType.String,
        ),
      },
      allParams: allParams,
    );
  },
  'MemberListPage': ParameterData.none(),
  'FeatureSuggestion': ParameterData.none(),
  'AddRedeemablePage': ParameterData.none(),
  'RedeemablePage': ParameterData.none(),
  'EditRedeemablePage': (data) async => ParameterData(
        allParams: {
          'redeemableItem': await getDocumentParameter<RedeemablesRecord>(
              data, 'redeemableItem', RedeemablesRecord.fromSnapshot),
        },
      ),
  'UpdateCompanyDetails': (data) async => ParameterData(
        allParams: {
          'index': getParameter<int>(data, 'index'),
        },
      ),
  'UpdateUserDetails': (data) async => ParameterData(
        allParams: {
          'index': getParameter<int>(data, 'index'),
        },
      ),
  'TransactionDetailsPage': (data) async => ParameterData(
        allParams: {
          'transaction': await getDocumentParameter<TransactionsRecord>(
              data, 'transaction', TransactionsRecord.fromSnapshot),
        },
      ),
  'TransactionListPage': ParameterData.none(),
  'UnsplashSearch': ParameterData.none(),
  'paywall': ParameterData.none(),
  'UserTransactionHistory': ParameterData.none(),
  'ManageSubscription': ParameterData.none(),
  'CustomizedCard': ParameterData.none(),
  'AddMemberPage': ParameterData.none(),
  'MemberDetails': (data) async => ParameterData(
        allParams: {
          'userCard': await getDocumentParameter<UserCardsRecord>(
              data, 'userCard', UserCardsRecord.fromSnapshot),
          'storeCard': await getDocumentParameter<StoreCardsRecord>(
              data, 'storeCard', StoreCardsRecord.fromSnapshot),
        },
      ),
  'MemberDetailsManuallyAdded': (data) async => ParameterData(
        allParams: {
          'storeCard': await getDocumentParameter<StoreCardsRecord>(
              data, 'storeCard', StoreCardsRecord.fromSnapshot),
        },
      ),
  'StoreSettings': ParameterData.none(),
  'RedeemDetailPage': (data) async => ParameterData(
        allParams: {
          'currentTransaction':
              await getDocumentParameter<UserTransactionsRecord>(data,
                  'currentTransaction', UserTransactionsRecord.fromSnapshot),
        },
      ),
  'CustomerRedeemListPage': ParameterData.none(),
  'PushNotificationForm': ParameterData.none(),
  'SplashScreen': ParameterData.none(),
  'TeamMemberSelection': ParameterData.none(),
  'StoreCatalogPage': ParameterData.none(),
  'MainSettings': ParameterData.none(),
  'BranchSettings': ParameterData.none(),
  'TeamMemberSettings': ParameterData.none(),
  'ProductSelectionPage': (data) async => ParameterData(
        allParams: {
          'currentStoreCatalog': await getDocumentParameter<StoreCatalogRecord>(
              data, 'currentStoreCatalog', StoreCatalogRecord.fromSnapshot),
          'selectedBranch': await getDocumentParameter<BranchesRecord>(
              data, 'selectedBranch', BranchesRecord.fromSnapshot),
        },
      ),
  'CheckoutOrder': (data) async => ParameterData(
        allParams: {
          'storeReferrence':
              getParameter<DocumentReference>(data, 'storeReferrence'),
          'selectedBranch': await getDocumentParameter<BranchesRecord>(
              data, 'selectedBranch', BranchesRecord.fromSnapshot),
        },
      ),
  'CustomerOrdersListPage': ParameterData.none(),
  'NotificationsPage': ParameterData.none(),
  'PointsSettings': ParameterData.none(),
  'PrivacyPolicy': ParameterData.none(),
  'TermsOfUsePage': ParameterData.none(),
  'WIkiPage': ParameterData.none(),
  'PushNotificationInstructionPage': ParameterData.none(),
  'AddTeamMemberInstructionPage': ParameterData.none(),
  'EditProfileInstructionPage': ParameterData.none(),
  'ContactUsPage': ParameterData.none(),
  'AddingPointsInstructionPage': ParameterData.none(),
  'AddRedeemableInstructionPage': ParameterData.none(),
  'ManagingStoreCatalogInstructionPage': ParameterData.none(),
  'ReviewFeedbackPage': ParameterData.none(),
  'StoreQRPreview': ParameterData.none(),
  'StoreGoogleReviewPage': ParameterData.none(),
  'StorePageCustomisation': ParameterData.none(),
  'leaderboardPage': (data) async => ParameterData(
        allParams: {
          'storeRef': getParameter<DocumentReference>(data, 'storeRef'),
        },
      ),
  'Chat': (data) async => ParameterData(
        allParams: {
          'appBarColor': getParameter<Color>(data, 'appBarColor'),
          'customerUserRef':
              getParameter<DocumentReference>(data, 'customerUserRef'),
          'storeUserRef': getParameter<DocumentReference>(data, 'storeUserRef'),
        },
      ),
  'Messages': ParameterData.none(),
  'MarketingMaterials': ParameterData.none(),
  'CreateVoucherPage': ParameterData.none(),
  'StoreVoucherPage': ParameterData.none(),
  'VoucherConfirmation': (data) async => ParameterData(
        allParams: {
          'userVoucherRef':
              getParameter<DocumentReference>(data, 'userVoucherRef'),
          'storeVoucher': getParameter<DocumentReference>(data, 'storeVoucher'),
        },
      ),
  'StoreVoucherDetails': (data) async => ParameterData(
        allParams: {
          'currentStoreVoucherRef':
              getParameter<DocumentReference>(data, 'currentStoreVoucherRef'),
        },
      ),
  'UpdateVoucherPage': (data) async => ParameterData(
        allParams: {
          'storeVoucher': getParameter<DocumentReference>(data, 'storeVoucher'),
        },
      ),
  'AddMemberToVoucherPage': (data) async => ParameterData(
        allParams: {
          'storeVoucher': await getDocumentParameter<VoucherRecord>(
              data, 'storeVoucher', VoucherRecord.fromSnapshot),
        },
      ),
  'BusinessMetricsPage': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
