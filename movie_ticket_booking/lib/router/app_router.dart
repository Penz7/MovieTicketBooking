import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_ticket_booking/features/error_page/page_not_found.dart';
import 'package:movie_ticket_booking/features/main_tabbar_screen.dart';

// import '../features/account/account/account_screen.dart';
// import '../features/account/account_order/order_page/order_page_screen.dart';
// import '../features/authentication/create_password/create_password_screen.dart';
// import '../features/authentication/otp/otp_screen.dart';
// import '../features/authentication/password/password_screen.dart';
// import '../features/collection/nutrition/nutrition_screen.dart';
// import '../features/common_page/common_page.dart';
// import '../features/main_tabbar_screen.dart';
// import '../features/notification/notification_screen.dart';
// import '../features/nutrition_detail/nutrition_detail_screen.dart';
// import '../features/product_detail/product_detail_screen.dart';
// import '../features/product_searching/product_searching_screen.dart';
// import '../features/web_view/web_view_screen.dart';
import 'router_key_manager.dart';

class AppRouter {
  AppRouter._();

  static AppRouter? _instance;

  static AppRouter get shareInstance {
    _instance ??= AppRouter._();
    return _instance!;
  }

  late final router = GoRouter(
    initialLocation: initRouter(),
    navigatorKey: RouterKeyManager.instance.rootNavigatorKey,
    routes: <RouteBase>[
      // GoRoute(
      //   path: '/intro',
      //   parentNavigatorKey: RouterKeyManager.instance.rootNavigatorKey,
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const IntroScreen();
      //   },
      // ),
      StatefulShellRoute.indexedStack(
        restorationScopeId: 'shell',
        pageBuilder: (
          BuildContext context,
          GoRouterState state,
          StatefulNavigationShell navigationShell,
        ) {
          return MaterialPage<void>(
            restorationId: 'shellWidget',
            child: MainTabBarScreen(navigationShell: navigationShell),
          );
        },
        branches: const <StatefulShellBranch>[
          //     StatefulShellBranch(
          //       restorationScopeId: 'bHome',
          //       navigatorKey: RouterKeyManager.instance.homeNavigatorKey,
          //       routes: <RouteBase>[
          //         GoRoute(
          //           // The screen to display as the root in the first tab of the
          //           // bottom navigation bar.
          //           path: '/home',
          //           pageBuilder: (BuildContext context, GoRouterState state) =>
          //               const MaterialPage<void>(
          //             restorationId: 'home',
          //             child: HomeScreen(),
          //           ),
          //           routes: <RouteBase>[
          //             GoRoute(
          //               path: 'product_detail/:id',
          //               parentNavigatorKey:
          //                   RouterKeyManager.instance.rootNavigatorKey,
          //               builder: (context, state) {
          //                 final params = state.pathParameters;
          //                 return ProductDetailScreen(
          //                   productId: int.tryParse(params['id'] ?? '0') ?? 0,
          //                 );
          //               },
          //             ),
          //             GoRoute(
          //               path: 'collection/:id',
          //               parentNavigatorKey:
          //                   RouterKeyManager.instance.rootNavigatorKey,
          //               builder: (context, state) {
          //                 final params = state.pathParameters;
          //                 return CollectionScreen(
          //                   categoryId: int.tryParse(params['id'] ?? '0') ?? 0,
          //                 );
          //               },
          //             ),
          //             GoRoute(
          //               path: 'collection-nutrition/:id',
          //               parentNavigatorKey:
          //                   RouterKeyManager.instance.rootNavigatorKey,
          //               builder: (context, state) {
          //                 final params = state.pathParameters;
          //                 return CollectionNutritionScreen(
          //                   params: params['id'] ?? '',
          //                 );
          //               },
          //             ),
          //             GoRoute(
          //               path: 'collection-builder/:id',
          //               parentNavigatorKey:
          //                   RouterKeyManager.instance.rootNavigatorKey,
          //               builder: (context, state) {
          //                 final params = state.pathParameters;
          //                 return CollectionBuilderScreen(
          //                   builderId: int.tryParse(params['id'] ?? '0') ?? 0,
          //                 );
          //               },
          //             ),
          //             GoRoute(
          //               path: 'notification',
          //               parentNavigatorKey:
          //                   RouterKeyManager.instance.rootNavigatorKey,
          //               builder: (context, state) {
          //                 return const NotificationScreen();
          //               },
          //             ),
          //             GoRoute(
          //               path: 'thank',
          //               parentNavigatorKey:
          //                   RouterKeyManager.instance.rootNavigatorKey,
          //               builder: (context, state) {
          //                 final extra = state.extra as Map<dynamic, dynamic>;
          //                 return ThankScreen(
          //                   orderId: extra['order_id'],
          //                 );
          //               },
          //             ),
          //             GoRoute(
          //               path: 'common-questions',
          //               parentNavigatorKey:
          //                   RouterKeyManager.instance.rootNavigatorKey,
          //               builder: (context, state) {
          //                 return const CommonQuestionScreen();
          //               },
          //               routes: [
          //                 GoRoute(
          //                   path: 'answer',
          //                   parentNavigatorKey:
          //                       RouterKeyManager.instance.rootNavigatorKey,
          //                   builder: (context, state) {
          //                     final params = state.extra as Map;
          //                     return PolicyAnswerScreen(
          //                       content: params['content'] as String? ?? '',
          //                       isNutrition:
          //                           params['is_nutrition'] as bool? ?? false,
          //                     );
          //                   },
          //                 ),
          //               ],
          //             ),
          //             GoRoute(
          //               path: 'security',
          //               parentNavigatorKey:
          //                   RouterKeyManager.instance.rootNavigatorKey,
          //               builder: (context, state) {
          //                 return const SecurityScreen();
          //               },
          //             ),
          //             GoRoute(
          //               path: 'customer-policy',
          //               parentNavigatorKey:
          //                   RouterKeyManager.instance.rootNavigatorKey,
          //               builder: (context, state) {
          //                 return const CustomerPolicyScreen();
          //               },
          //               routes: [
          //                 GoRoute(
          //                   path: 'policy',
          //                   parentNavigatorKey:
          //                       RouterKeyManager.instance.rootNavigatorKey,
          //                   builder: (context, state) {
          //                     final params = state.extra as Map;
          //                     return CustomerDetailScreen(
          //                       content: params['content'] as String? ?? '',
          //                     );
          //                   },
          //                 ),
          //               ],
          //             ),
          //             GoRoute(
          //               path: 'apply-code-introduce',
          //               parentNavigatorKey:
          //               RouterKeyManager.instance.rootNavigatorKey,
          //               builder: (context, state) {
          //                 return const ApplyCodeIntroduceScreen();
          //               },
          //             ),
          //             GoRoute(
          //               path: 'vnpay-introduce',
          //               parentNavigatorKey:
          //                   RouterKeyManager.instance.rootNavigatorKey,
          //               builder: (context, state) {
          //                 return const VNPayIntroduceScreen();
          //               },
          //             ),
          //           ],
          //         ),
          //       ],
          //     ),
          //     StatefulShellBranch(
          //       restorationScopeId: 'bCalories',
          //       navigatorKey: RouterKeyManager.instance.nutritionNavigatorKey,
          //       routes: <RouteBase>[
          //         GoRoute(
          //           // The screen to display as the root in the first tab of the
          //           // bottom navigation bar.
          //           path: '/calories',
          //           pageBuilder: (BuildContext context, GoRouterState state) {
          //             return const MaterialPage<void>(
          //               restorationId: 'calories',
          //               child: CaloriesScreen(),
          //             );
          //           },
          //           routes: const <RouteBase>[],
          //         ),
          //       ],
          //     ),
          //     StatefulShellBranch(
          //       restorationScopeId: 'bCategory',
          //       navigatorKey: RouterKeyManager.instance.categoryNavigatorKey,
          //       routes: <RouteBase>[
          //         GoRoute(
          //           // The screen to display as the root in the first tab of the
          //           // bottom navigation bar.
          //           path: '/category',
          //           pageBuilder: (BuildContext context, GoRouterState state) {
          //             return const MaterialPage<void>(
          //               restorationId: 'category',
          //               child: NutritionScreen(),
          //             );
          //           },
          //           routes: const <RouteBase>[],
          //         ),
          //       ],
          //     ),
          //     StatefulShellBranch(
          //       restorationScopeId: 'bProfile',
          //       navigatorKey: RouterKeyManager.instance.profileNavigatorKey,
          //       routes: <RouteBase>[
          //         GoRoute(
          //           // The screen to display as the root in the second tab of the
          //           // bottom navigation bar.
          //           path: '/profile',
          //           pageBuilder: (BuildContext context, GoRouterState state) =>
          //               const MaterialPage<void>(
          //             restorationId: 'profile',
          //             child: AccountScreen(),
          //           ),
          //           routes: <RouteBase>[
          //             GoRoute(
          //               path: 'account-detail',
          //               parentNavigatorKey:
          //                   RouterKeyManager.instance.rootNavigatorKey,
          //               builder: (context, state) {
          //                 return const AccountDetailScreen();
          //               },
          //             ),
          //             GoRoute(
          //                 path: 'address',
          //                 parentNavigatorKey:
          //                     RouterKeyManager.instance.rootNavigatorKey,
          //                 builder: (context, state) {
          //                   return const AddressScreen();
          //                 },
          //                 routes: [
          //                   GoRoute(
          //                     path: 'add-address',
          //                     parentNavigatorKey:
          //                         RouterKeyManager.instance.rootNavigatorKey,
          //                     builder: (context, state) {
          //                       return const AddAddressScreen();
          //                     },
          //                   ),
          //                 ]),
          //             GoRoute(
          //               path: 'notification',
          //               parentNavigatorKey:
          //                   RouterKeyManager.instance.rootNavigatorKey,
          //               builder: (context, state) {
          //                 return const NotificationScreen();
          //               },
          //             ),
          //             GoRoute(
          //               path: 'shopping-quizzes',
          //               parentNavigatorKey:
          //                   RouterKeyManager.instance.rootNavigatorKey,
          //               builder: (context, state) {
          //                 return const ShoppingQuizScreen();
          //               },
          //             ),
          //             GoRoute(
          //               path: 'order/:orderStatusId',
          //               parentNavigatorKey:
          //                   RouterKeyManager.instance.rootNavigatorKey,
          //               builder: (context, state) {
          //                 final params = state.pathParameters;
          //                 return OrderPageScreen(
          //                   orderStatusId:
          //                       int.tryParse(params['orderStatusId'] ?? '0') ?? 0,
          //                 );
          //               },
          //               routes: [
          //                 GoRoute(
          //                   path: 'search',
          //                   parentNavigatorKey:
          //                       RouterKeyManager.instance.rootNavigatorKey,
          //                   pageBuilder: (
          //                     BuildContext context,
          //                     GoRouterState state,
          //                   ) {
          //                     return buildFadeTransition(
          //                       context: context,
          //                       state: state,
          //                       child: const OrderSearchScreen(),
          //                     );
          //                   },
          //                 ),
          //               ],
          //             ),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
          // GoRoute(
          //   path: '/login',
          //   parentNavigatorKey: RouterKeyManager.instance.rootNavigatorKey,
          //   builder: (BuildContext context, GoRouterState state) {
          //     return const LoginScreen();
          //   },
          //   routes: [
          //     GoRoute(
          //       path: 'password',
          //       parentNavigatorKey: RouterKeyManager.instance.rootNavigatorKey,
          //       builder: (BuildContext context, GoRouterState state) {
          //         final extra = state.extra as Map;
          //         return PasswordScreen(
          //           phone: extra['phone'],
          //         );
          //       },
          //     ),
          //     GoRoute(
          //       path: 'otp',
          //       parentNavigatorKey: RouterKeyManager.instance.rootNavigatorKey,
          //       builder: (BuildContext context, GoRouterState state) {
          //         final extra = state.extra as Map;
          //         return OTPScreen(
          //           phone: extra['phone'],
          //           fromForgot: extra['fromForgot'] as bool? ?? false,
          //         );
          //       },
          //     ),
          //     GoRoute(
          //       path: 'create_password',
          //       parentNavigatorKey: RouterKeyManager.instance.rootNavigatorKey,
          //       builder: (BuildContext context, GoRouterState state) {
          //         final extra = state.extra as Map;
          //         return CreatePasswordScreen(
          //           phone: extra['phone'],
          //           accessToken: extra['access_token'],
          //         );
          //       },
          //     ),
          //   ],
          // ),
          // GoRoute(
          //   path: '/nutrition_scan',
          //   parentNavigatorKey: RouterKeyManager.instance.rootNavigatorKey,
          //   builder: (BuildContext context, GoRouterState state) {
          //     return const NutritionScanScreen();
          //   },
          //   routes: <RouteBase>[
          //     GoRoute(
          //       path: 'detail',
          //       parentNavigatorKey: RouterKeyManager.instance.rootNavigatorKey,
          //       builder: (BuildContext context, GoRouterState state) {
          //         return const NutritionDetailScreen();
          //       },
          //     ),
          //   ],
          // ),
          // GoRoute(
          //   path: '/about-us',
          //   parentNavigatorKey: RouterKeyManager.instance.rootNavigatorKey,
          //   builder: (BuildContext context, GoRouterState state) {
          //     return const AboutUsScreen();
          //   },
          //   routes: const <RouteBase>[],
          // ),
          // GoRoute(
          //   path: '/trade-certification',
          //   parentNavigatorKey: RouterKeyManager.instance.rootNavigatorKey,
          //   builder: (BuildContext context, GoRouterState state) {
          //     return const TradeCertificationScreen();
          //   },
          //   routes: const <RouteBase>[],
          // ),
          // GoRoute(
          //   path: '/cart',
          //   parentNavigatorKey: RouterKeyManager.instance.rootNavigatorKey,
          //   builder: (context, state) {
          //     return const CartScreen();
          //   },
          //   routes: [
          //     GoRoute(
          //       path: 'voucher',
          //       parentNavigatorKey: RouterKeyManager.instance.rootNavigatorKey,
          //       builder: (context, state) {
          //         return const VoucherScreen();
          //       },
          //     ),
          //     GoRoute(
          //       path: 'payment',
          //       parentNavigatorKey: RouterKeyManager.instance.rootNavigatorKey,
          //       builder: (context, state) {
          //         return const PaymentScreen();
          //       },
          //       routes: [
          //         GoRoute(
          //           path: 'voucher',
          //           parentNavigatorKey: RouterKeyManager.instance.rootNavigatorKey,
          //           builder: (context, state) {
          //             return const VoucherScreen();
          //           },
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
          // GoRoute(
          //   path: '/product-search',
          //   parentNavigatorKey: RouterKeyManager.instance.rootNavigatorKey,
          //   pageBuilder: (
          //     BuildContext context,
          //     GoRouterState state,
          //   ) {
          //     return buildFadeTransition(
          //       context: context,
          //       state: state,
          //       child: const ProductSearchingScreen(),
          //     );
          //   },
          // ),
          // GoRoute(
          //   path: '/web-view/:url',
          //   parentNavigatorKey: RouterKeyManager.instance.rootNavigatorKey,
          //   builder: (context, state) {
          //     final params = state.pathParameters;
          //     return WebViewScreen(
          //       url: (params['url'] ?? '').decodeUrl,
          //     );
          //   },
          // ),
          // GoRoute(
          //     path: '/maintaining',
          //     parentNavigatorKey: RouterKeyManager.instance.rootNavigatorKey,
          //     builder: (context, state) {
          //       return const MaintainingScreen();
          //     }),
        ],
      )
    ],
    redirect: _guard,
    errorBuilder: (context, state) {
      return const PageNotFoundScreen();
    },
  );

  String? initRouter() {
    //check maintaining
    // if (ConfigHelper.instance.isMaintaining) {
    //   return '/maintaining';
    // }
    // if (!LiveData.hasSeenIntro) {
    //   return '/intro';
    // }
    return '/home';
  }

  Future<String?> _guard(
    BuildContext context,
    GoRouterState state,
  ) async {
    if (state.fullPath?.contains('/profile') == true) {
      final auth = FirebaseAuth.instance;
      // Check if a user is already logged in
      if (auth.currentUser != null) {
        return null; // User is logged in, proceed
      }

      // // Redirect to login if not logged in
      // TempData.prePath = state.fullPath ?? '';
      return '/login';
    }

    return null;
  }
}
