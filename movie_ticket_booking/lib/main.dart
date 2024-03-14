import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_ticket_booking/generated/colors.gen.dart';
import 'package:movie_ticket_booking/router/app_router.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  // Initialize Firebase before running the app
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
  runApp(const App());
}

class App extends StatefulWidget {
  const App({
    super.key,
  });

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  double calculateWindowSize() {
    final devicePixel = View.of(context).devicePixelRatio;
    final size = View.of(context).physicalSize.height;
    return (size / devicePixel) * 3 / 4;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: MultiBlocProvider(
        providers: [
          // BlocProvider(
          //   create: (_) => AppCubit(),
          // ),
          // BlocProvider(
          //   create: (_) => NotificationCubit(),
          // ),
          // BlocProvider(
          //   create: (_) => CartNumberCubit(),
          // ),
          // BlocProvider(
          //   create: (_) => CartCubit(),
          //   lazy: false,
          // ),
          // BlocProvider(
          //   create: (_) => VoucherCubit(),
          // ),
          // BlocProvider(
          //   create: (_) => GMVGiftCubit(),
          // ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: const TextScaler.linear(
                    1.0), // Remove this line if you want text scaling
              ),
              child: child!,
            );
          },
          theme: ThemeData(
            scaffoldBackgroundColor: UIColors.white,
            useMaterial3: true,
            appBarTheme: const AppBarTheme(
              surfaceTintColor: Colors.white,
            ),
            textTheme: GoogleFonts.quicksandTextTheme(),
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: UIColors.black,
            ),
            primaryColor: UIColors.black,
          ),
          // routeInformationParser: _rootRouter.defaultRouteParser(),
          routeInformationProvider:
              AppRouter.shareInstance.router.routeInformationProvider,
          routerDelegate: AppRouter.shareInstance.router.routerDelegate,
          routeInformationParser:
              AppRouter.shareInstance.router.routeInformationParser,
        ),
      ),
      onTap: () {
        if (FocusManager.instance.primaryFocus?.hasFocus == true) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
    );
  }
}
