import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => appStateNotifier.loggedIn
          ? SplashScreenWidget()
          : Auth4WelcomeWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? SplashScreenWidget()
              : Auth4WelcomeWidget(),
          routes: [
            FFRoute(
              name: Auth4WelcomeWidget.routeName,
              path: Auth4WelcomeWidget.routePath,
              builder: (context, params) => Auth4WelcomeWidget(),
            ),
            FFRoute(
              name: Auth4OnboardingPhoneVerifyWidget.routeName,
              path: Auth4OnboardingPhoneVerifyWidget.routePath,
              builder: (context, params) => Auth4OnboardingPhoneVerifyWidget(
                phoneNumber: params.getParam(
                  'phoneNumber',
                  ParamType.String,
                ),
                isLogin: params.getParam(
                  'isLogin',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: Auth4HomeWidget.routeName,
              path: Auth4HomeWidget.routePath,
              requireAuth: true,
              builder: (context, params) => Auth4HomeWidget(),
            ),
            FFRoute(
              name: Auth4OnboardingUserDetailsWidget.routeName,
              path: Auth4OnboardingUserDetailsWidget.routePath,
              requireAuth: true,
              builder: (context, params) => Auth4OnboardingUserDetailsWidget(
                index: params.getParam(
                  'index',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: Auth4OnboardingCompanyDetailsWidget.routeName,
              path: Auth4OnboardingCompanyDetailsWidget.routePath,
              requireAuth: true,
              builder: (context, params) => Auth4OnboardingCompanyDetailsWidget(
                index: params.getParam(
                  'index',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: StoreDiscoveryWidget.routeName,
              path: StoreDiscoveryWidget.routePath,
              builder: (context, params) => StoreDiscoveryWidget(),
            ),
            FFRoute(
              name: StoreDetailsWidget.routeName,
              path: StoreDetailsWidget.routePath,
              builder: (context, params) => StoreDetailsWidget(
                initialIndex: params.getParam(
                  'initialIndex',
                  ParamType.int,
                ),
                storeID: params.getParam(
                  'storeID',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: MemberListPageWidget.routeName,
              path: MemberListPageWidget.routePath,
              builder: (context, params) => MemberListPageWidget(),
            ),
            FFRoute(
              name: FeatureSuggestionWidget.routeName,
              path: FeatureSuggestionWidget.routePath,
              builder: (context, params) => FeatureSuggestionWidget(),
            ),
            FFRoute(
              name: AddRedeemablePageWidget.routeName,
              path: AddRedeemablePageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => AddRedeemablePageWidget(),
            ),
            FFRoute(
              name: RedeemablePageWidget.routeName,
              path: RedeemablePageWidget.routePath,
              builder: (context, params) => RedeemablePageWidget(),
            ),
            FFRoute(
              name: EditRedeemablePageWidget.routeName,
              path: EditRedeemablePageWidget.routePath,
              asyncParams: {
                'redeemableItem': getDoc(
                    ['Stores', 'Redeemables'], RedeemablesRecord.fromSnapshot),
              },
              builder: (context, params) => EditRedeemablePageWidget(
                redeemableItem: params.getParam(
                  'redeemableItem',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: UpdateCompanyDetailsWidget.routeName,
              path: UpdateCompanyDetailsWidget.routePath,
              builder: (context, params) => UpdateCompanyDetailsWidget(
                index: params.getParam(
                  'index',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: UpdateUserDetailsWidget.routeName,
              path: UpdateUserDetailsWidget.routePath,
              builder: (context, params) => UpdateUserDetailsWidget(
                index: params.getParam(
                  'index',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: TransactionDetailsPageWidget.routeName,
              path: TransactionDetailsPageWidget.routePath,
              asyncParams: {
                'transaction': getDoc(['Stores', 'Transactions'],
                    TransactionsRecord.fromSnapshot),
              },
              builder: (context, params) => TransactionDetailsPageWidget(
                transaction: params.getParam(
                  'transaction',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: TransactionListPageWidget.routeName,
              path: TransactionListPageWidget.routePath,
              builder: (context, params) => TransactionListPageWidget(),
            ),
            FFRoute(
              name: UnsplashSearchWidget.routeName,
              path: UnsplashSearchWidget.routePath,
              builder: (context, params) => UnsplashSearchWidget(),
            ),
            FFRoute(
              name: PaywallWidget.routeName,
              path: PaywallWidget.routePath,
              builder: (context, params) => PaywallWidget(),
            ),
            FFRoute(
              name: UserTransactionHistoryWidget.routeName,
              path: UserTransactionHistoryWidget.routePath,
              builder: (context, params) => UserTransactionHistoryWidget(),
            ),
            FFRoute(
              name: ManageSubscriptionWidget.routeName,
              path: ManageSubscriptionWidget.routePath,
              builder: (context, params) => ManageSubscriptionWidget(),
            ),
            FFRoute(
              name: CustomizedCardWidget.routeName,
              path: CustomizedCardWidget.routePath,
              builder: (context, params) => CustomizedCardWidget(),
            ),
            FFRoute(
              name: AddMemberPageWidget.routeName,
              path: AddMemberPageWidget.routePath,
              builder: (context, params) => AddMemberPageWidget(),
            ),
            FFRoute(
              name: MemberDetailsWidget.routeName,
              path: MemberDetailsWidget.routePath,
              asyncParams: {
                'userCard': getDoc(
                    ['users', 'UserCards'], UserCardsRecord.fromSnapshot),
                'storeCard': getDoc(
                    ['Stores', 'StoreCards'], StoreCardsRecord.fromSnapshot),
              },
              builder: (context, params) => MemberDetailsWidget(
                userCard: params.getParam(
                  'userCard',
                  ParamType.Document,
                ),
                storeCard: params.getParam(
                  'storeCard',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: MemberDetailsManuallyAddedWidget.routeName,
              path: MemberDetailsManuallyAddedWidget.routePath,
              asyncParams: {
                'storeCard': getDoc(
                    ['Stores', 'StoreCards'], StoreCardsRecord.fromSnapshot),
              },
              builder: (context, params) => MemberDetailsManuallyAddedWidget(
                storeCard: params.getParam(
                  'storeCard',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: StoreSettingsWidget.routeName,
              path: StoreSettingsWidget.routePath,
              builder: (context, params) => StoreSettingsWidget(),
            ),
            FFRoute(
              name: RedeemDetailPageWidget.routeName,
              path: RedeemDetailPageWidget.routePath,
              asyncParams: {
                'currentTransaction': getDoc(['users', 'UserTransactions'],
                    UserTransactionsRecord.fromSnapshot),
              },
              builder: (context, params) => RedeemDetailPageWidget(
                currentTransaction: params.getParam(
                  'currentTransaction',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: CustomerRedeemListPageWidget.routeName,
              path: CustomerRedeemListPageWidget.routePath,
              builder: (context, params) => CustomerRedeemListPageWidget(),
            ),
            FFRoute(
              name: PushNotificationFormWidget.routeName,
              path: PushNotificationFormWidget.routePath,
              builder: (context, params) => PushNotificationFormWidget(),
            ),
            FFRoute(
              name: SplashScreenWidget.routeName,
              path: SplashScreenWidget.routePath,
              builder: (context, params) => SplashScreenWidget(),
            ),
            FFRoute(
              name: TeamMemberSelectionWidget.routeName,
              path: TeamMemberSelectionWidget.routePath,
              builder: (context, params) => TeamMemberSelectionWidget(),
            ),
            FFRoute(
              name: StoreCatalogPageWidget.routeName,
              path: StoreCatalogPageWidget.routePath,
              builder: (context, params) => StoreCatalogPageWidget(),
            ),
            FFRoute(
              name: MainSettingsWidget.routeName,
              path: MainSettingsWidget.routePath,
              builder: (context, params) => MainSettingsWidget(),
            ),
            FFRoute(
              name: BranchSettingsWidget.routeName,
              path: BranchSettingsWidget.routePath,
              builder: (context, params) => BranchSettingsWidget(),
            ),
            FFRoute(
              name: TeamMemberSettingsWidget.routeName,
              path: TeamMemberSettingsWidget.routePath,
              builder: (context, params) => TeamMemberSettingsWidget(),
            ),
            FFRoute(
              name: ProductSelectionPageWidget.routeName,
              path: ProductSelectionPageWidget.routePath,
              asyncParams: {
                'currentStoreCatalog': getDoc(['Stores', 'StoreCatalog'],
                    StoreCatalogRecord.fromSnapshot),
                'selectedBranch':
                    getDoc(['Stores', 'Branches'], BranchesRecord.fromSnapshot),
              },
              builder: (context, params) => ProductSelectionPageWidget(
                currentStoreCatalog: params.getParam(
                  'currentStoreCatalog',
                  ParamType.Document,
                ),
                selectedBranch: params.getParam(
                  'selectedBranch',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: CheckoutOrderWidget.routeName,
              path: CheckoutOrderWidget.routePath,
              asyncParams: {
                'selectedBranch':
                    getDoc(['Stores', 'Branches'], BranchesRecord.fromSnapshot),
              },
              builder: (context, params) => CheckoutOrderWidget(
                storeReferrence: params.getParam(
                  'storeReferrence',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['Stores'],
                ),
                selectedBranch: params.getParam(
                  'selectedBranch',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: CustomerOrdersListPageWidget.routeName,
              path: CustomerOrdersListPageWidget.routePath,
              builder: (context, params) => CustomerOrdersListPageWidget(),
            ),
            FFRoute(
              name: NotificationsPageWidget.routeName,
              path: NotificationsPageWidget.routePath,
              builder: (context, params) => NotificationsPageWidget(),
            ),
            FFRoute(
              name: PointsSettingsWidget.routeName,
              path: PointsSettingsWidget.routePath,
              builder: (context, params) => PointsSettingsWidget(),
            ),
            FFRoute(
              name: PrivacyPolicyWidget.routeName,
              path: PrivacyPolicyWidget.routePath,
              builder: (context, params) => PrivacyPolicyWidget(),
            ),
            FFRoute(
              name: TermsOfUsePageWidget.routeName,
              path: TermsOfUsePageWidget.routePath,
              builder: (context, params) => TermsOfUsePageWidget(),
            ),
            FFRoute(
              name: WIkiPageWidget.routeName,
              path: WIkiPageWidget.routePath,
              builder: (context, params) => WIkiPageWidget(),
            ),
            FFRoute(
              name: PushNotificationInstructionPageWidget.routeName,
              path: PushNotificationInstructionPageWidget.routePath,
              builder: (context, params) =>
                  PushNotificationInstructionPageWidget(),
            ),
            FFRoute(
              name: AddTeamMemberInstructionPageWidget.routeName,
              path: AddTeamMemberInstructionPageWidget.routePath,
              builder: (context, params) =>
                  AddTeamMemberInstructionPageWidget(),
            ),
            FFRoute(
              name: EditProfileInstructionPageWidget.routeName,
              path: EditProfileInstructionPageWidget.routePath,
              builder: (context, params) => EditProfileInstructionPageWidget(),
            ),
            FFRoute(
              name: ContactUsPageWidget.routeName,
              path: ContactUsPageWidget.routePath,
              builder: (context, params) => ContactUsPageWidget(),
            ),
            FFRoute(
              name: AddingPointsInstructionPageWidget.routeName,
              path: AddingPointsInstructionPageWidget.routePath,
              builder: (context, params) => AddingPointsInstructionPageWidget(),
            ),
            FFRoute(
              name: AddRedeemableInstructionPageWidget.routeName,
              path: AddRedeemableInstructionPageWidget.routePath,
              builder: (context, params) =>
                  AddRedeemableInstructionPageWidget(),
            ),
            FFRoute(
              name: ManagingStoreCatalogInstructionPageWidget.routeName,
              path: ManagingStoreCatalogInstructionPageWidget.routePath,
              builder: (context, params) =>
                  ManagingStoreCatalogInstructionPageWidget(),
            ),
            FFRoute(
              name: ReviewFeedbackPageWidget.routeName,
              path: ReviewFeedbackPageWidget.routePath,
              builder: (context, params) => ReviewFeedbackPageWidget(),
            ),
            FFRoute(
              name: StoreQRPreviewWidget.routeName,
              path: StoreQRPreviewWidget.routePath,
              builder: (context, params) => StoreQRPreviewWidget(),
            ),
            FFRoute(
              name: StoreGoogleReviewPageWidget.routeName,
              path: StoreGoogleReviewPageWidget.routePath,
              builder: (context, params) => StoreGoogleReviewPageWidget(),
            ),
            FFRoute(
              name: StorePageCustomisationWidget.routeName,
              path: StorePageCustomisationWidget.routePath,
              builder: (context, params) => StorePageCustomisationWidget(),
            ),
            FFRoute(
              name: LeaderboardPageWidget.routeName,
              path: LeaderboardPageWidget.routePath,
              builder: (context, params) => LeaderboardPageWidget(
                storeRef: params.getParam(
                  'storeRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['Stores'],
                ),
              ),
            ),
            FFRoute(
              name: ChatWidget.routeName,
              path: ChatWidget.routePath,
              builder: (context, params) => ChatWidget(
                appBarColor: params.getParam(
                  'appBarColor',
                  ParamType.Color,
                ),
                customerUserRef: params.getParam(
                  'customerUserRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
                storeUserRef: params.getParam(
                  'storeUserRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
              ),
            ),
            FFRoute(
              name: MessagesWidget.routeName,
              path: MessagesWidget.routePath,
              builder: (context, params) => MessagesWidget(),
            ),
            FFRoute(
              name: MarketingMaterialsWidget.routeName,
              path: MarketingMaterialsWidget.routePath,
              builder: (context, params) => MarketingMaterialsWidget(),
            ),
            FFRoute(
              name: CreateVoucherPageWidget.routeName,
              path: CreateVoucherPageWidget.routePath,
              builder: (context, params) => CreateVoucherPageWidget(),
            ),
            FFRoute(
              name: StoreVoucherPageWidget.routeName,
              path: StoreVoucherPageWidget.routePath,
              builder: (context, params) => StoreVoucherPageWidget(),
            ),
            FFRoute(
              name: VoucherConfirmationWidget.routeName,
              path: VoucherConfirmationWidget.routePath,
              builder: (context, params) => VoucherConfirmationWidget(
                userVoucherRef: params.getParam(
                  'userVoucherRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users', 'UserVouchers'],
                ),
                storeVoucher: params.getParam(
                  'storeVoucher',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['Stores', 'Voucher'],
                ),
              ),
            ),
            FFRoute(
              name: StoreVoucherDetailsWidget.routeName,
              path: StoreVoucherDetailsWidget.routePath,
              builder: (context, params) => StoreVoucherDetailsWidget(
                currentStoreVoucherRef: params.getParam(
                  'currentStoreVoucherRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['Stores', 'Voucher'],
                ),
              ),
            ),
            FFRoute(
              name: UpdateVoucherPageWidget.routeName,
              path: UpdateVoucherPageWidget.routePath,
              builder: (context, params) => UpdateVoucherPageWidget(
                storeVoucher: params.getParam(
                  'storeVoucher',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['Stores', 'Voucher'],
                ),
              ),
            ),
            FFRoute(
              name: AddMemberToVoucherPageWidget.routeName,
              path: AddMemberToVoucherPageWidget.routePath,
              asyncParams: {
                'storeVoucher':
                    getDoc(['Stores', 'Voucher'], VoucherRecord.fromSnapshot),
              },
              builder: (context, params) => AddMemberToVoucherPageWidget(
                storeVoucher: params.getParam(
                  'storeVoucher',
                  ParamType.Document,
                ),
                addedUsers: params.getParam<DocumentReference>(
                  'addedUsers',
                  ParamType.DocumentReference,
                  isList: true,
                  collectionNamePath: ['users'],
                ),
              ),
            ),
            FFRoute(
              name: BusinessMetricsPageWidget.routeName,
              path: BusinessMetricsPageWidget.routePath,
              builder: (context, params) => BusinessMetricsPageWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/welcome';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
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
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  name: state.name,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(
                  key: state.pageKey, name: state.name, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
