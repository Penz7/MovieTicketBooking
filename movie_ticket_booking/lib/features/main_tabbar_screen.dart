import 'dart:async';

// import 'package:app_core/app_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_ticket_booking/common/extension/router_extension.dart';
import 'package:movie_ticket_booking/common/more_widgets/button.dart';
import 'package:movie_ticket_booking/generated/colors.gen.dart';
// import 'package:local_storage/local_storage/local_storage_manager.dart';
// import 'package:thh/common/global_bloc/app/app.dart';
// import 'package:thh/features/nutrition_scan_widget.dart';
// import 'package:thh/generated/generated.dart';
// import 'package:thh/temp_data/lazy_streaming.dart';

class MainTabBarScreen extends StatefulWidget {
  const MainTabBarScreen({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  State<MainTabBarScreen> createState() => _MainTabBarState();
}

class _MainTabBarState extends State<MainTabBarScreen> {
  // with FCMNotificationListener {
  // int _scanIndex = 0;
  // Timer? _timer;

  // List<Widget> scanWidgets = [
  //   const NutritionScanWidget(
  //     fill: false,
  //     textColor: UIColors.color595959,
  //   ),
  //   const NutritionScanWidget(),
  //   const NutritionScanWidget(
  //     title: 'Quét dinh dưỡng',
  //     box: true,
  //   ),
  // ];

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     LiveData.mainContext = context;
  //   });
  //   NotificationHelper.instance.setup(this);
  //   LazyStreaming.instance.registerConfigChange(configChanged);
  //   LazyStreaming.instance.registerCartChange(cartChanged);
  //   ForceUpdating.instance.checkAndUpdateVersion();
  //   _timer = Timer.periodic(1.seconds, (timer) {
  //     setState(() {
  //       _scanIndex = (_scanIndex + 1) % 3;
  //     });
  //   });
  // }

  // Future<void> cartChanged() async {
  //   OverlayManager.instance.showGmvOverlay();
  // }

  // Future<void> configChanged(dynamic data) async {
  //   //receive config changed.
  //   // LiveData.mainContext.pushWithPath('/maintaining');
  //   final configData = data['data']['data'] as List<dynamic>;
  //   final maintaining = configData.firstWhere((element) {
  //     return element['key'] == 'MAINTAINING_STATUS';
  //   });
  //   if (maintaining['value'] == 'true') {
  //     LiveData.mainContext.pushWithPath('/maintaining');
  //   }
  // }

  // @override
  // void dispose() {
  //   LazyStreaming.instance.removeCartChange(cartChanged);
  //   _timer?.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: widget.navigationShell,
      bottomNavigationBar: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: 60,
            height: 60,
            margin: const EdgeInsets.only(
              top: 2,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: UIColors.black.withOpacity(0.2),
                  offset: const Offset(0, 2),
                  blurRadius: 10,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 24,
            ),
            padding: const EdgeInsets.only(
              bottom: 45,
            ),
            // height: 108 - 24,
            decoration: BoxDecoration(
              color: UIColors.white,
              boxShadow: [
                BoxShadow(
                  color: UIColors.black.withOpacity(0.15),
                  offset: const Offset(0, 2),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  rowItem(
                    image: 'ic_home',
                    text: 'menu_supermarket',
                    index: 0,
                  ),
                  rowItem(
                    image: 'ic_explore',
                    text: 'menu_discover',
                    index: 1,
                  ),
                  // const SizedBox(
                  //   width: 90,
                  // ),
                  rowItem(
                    image: 'ic_practice',
                    text: 'menu_practice',
                    index: 2,
                  ),
                  rowItem(
                    image: 'ic_account',
                    text: 'menu_account',
                    index: 3,
                  ),
                ],
              ),
            ),
          ),
          // Assets.icons.navigation.nutritionScanCurve.svg(),
          // scanWidgets[_scanIndex],
        ],
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
    );
  }

  Widget rowItem({
    required String image,
    required String text,
    required int index,
    int? badge,
  }) {
    final selected = widget.navigationShell.currentIndex == index;
    return AppButton.widget(
      onPressed: () {
        _onTap(index);
      },
      child: SizedBox(
        width: 64,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                SvgPicture.asset(
                  selected
                      ? 'assets/icons/navigation/${image}_active.svg'
                      : 'assets/icons/navigation/$image.svg',
                  width: 24,
                  height: 24,
                ),
                if (badge != null) _buildBadge(badge),
              ],
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 10,
                color: selected ? UIColors.mainButton : UIColors.black,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBadge(int badge) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: UIColors.unSelectorTabBar,
        borderRadius: BorderRadius.circular(6),
      ),
      child: const Center(
        child: Text(
          '1',
          style: TextStyle(
            color: UIColors.black,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Future<void> _onTap(int index) async {
    switch (index) {
      case 2:
        // showToast(message: 'Coming soon');
        break;
      case 3:
        // Use authStateChanges stream for login state management
         StreamSubscription<User?>? loginSubscription;
      // Use authStateChanges stream for login state management
      loginSubscription  =
            FirebaseAuth.instance.authStateChanges().listen((User? user) {
          if (user == null && context.mounted) {
            // TempData.prePath = '/profile';
            context.pushWithPath('/login');
            // Unsubscribe from the stream after navigation
            loginSubscription?.cancel();
          } else {
            widget.navigationShell.goBranch(index);
          }
        });
        break;
      default:
        widget.navigationShell.goBranch(index);
    }
  }

  // @override
  // void didUpdateFCMToken(String token) {
  //   context.read<AppCubit>().pushFCM();
  // }

  // @override
  // void newNotificationOnForeground() {}

  // @override
  // void onClickNotification(Map payload) {}
}
