import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/services/get_it.dart';
import 'package:car_rental/core/shared/bloc_observer.dart';
import 'package:car_rental/features/driver/car/data/repo/car_repo_impl.dart';
import 'package:car_rental/features/driver/car/presentation/manager/car_cubit.dart';
import 'package:car_rental/features/driver/home/domain/use_cases/location_use_case.dart';
import 'package:car_rental/features/driver/home/presentation/manager/location_cubit/location_cubit.dart';
import 'package:car_rental/features/driver/settings/data/models/driver_model/car_model.dart';
import 'package:car_rental/features/driver/settings/domain/entities/driver_entity.dart';
import 'package:car_rental/features/passenger/favorite/data/repo/favorite_repo_impl.dart';
import 'package:car_rental/features/passenger/favorite/domain/use_cases/add_favorite_use_case.dart';
import 'package:car_rental/features/passenger/favorite/domain/use_cases/delete_favorite_use_case.dart';
import 'package:car_rental/features/passenger/favorite/presentation/manager/favorite_cubit.dart';
import 'package:car_rental/features/passenger/find_driver/data/repo/travel_repo_impl.dart';
import 'package:car_rental/features/passenger/home/doamin/use_cases/draw_line_use_case.dart';
import 'package:car_rental/features/passenger/home/doamin/use_cases/location_use_caser.dart';
import 'package:car_rental/features/passenger/home/presentation/manager/location_cubit/location_cubit.dart';
import 'package:car_rental/features/passenger/home/presentation/manager/map_cubit/map_cubit.dart';
import 'package:car_rental/features/passenger/settings/data/models/passanger_model.dart';
import 'package:car_rental/features/passenger/ride/domain/repo/payment_repo.dart';
import 'package:car_rental/features/passenger/ride/presentation/manager/payment_cubit/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/adapters.dart';
import 'core/cache/shared_preference.dart';
import 'features/driver/home/data/repo/home_repo_impl.dart';
import 'features/driver/home/presentation/manager/complete_cubit/complete_cubit.dart';
import 'features/driver/navbar/presentation/views/navbar_driver_screen.dart';
import 'features/driver/settings/data/repo/settings_repo_impl.dart';
import 'features/driver/settings/presentation/manager/settings_cubit/settings_cubit.dart';
import 'features/onboarding/presentation/views/onboarding_screen.dart';
import 'features/passenger/find_driver/presentation/manager/travel_cubit/travel_cubit.dart';
import 'features/passenger/navbar/presentation/views/navbar_screen.dart';
import 'generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  await Hive.initFlutter();
  Hive.registerAdapter(DriverEntityAdapter());
  Hive.registerAdapter(CarModelAdapter());
  await Hive.openBox<DriverEntity>(driverBox);
  Hive.registerAdapter(PassangerModelAdapter());
  await Hive.openBox<PassangerModel>(passengerBox);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setLocator();

  Widget? widget;
  String uid = CacheHelper.getData(key: 'uid') ?? '';
  String userType = CacheHelper.getData(key: 'usertype') ?? '';

  if (uid == '') {
    widget = const OnboradingScreen();
  } else {
    if (userType == 'driver') {
      widget = const NavBarDriverScreen();
    } else {
      widget = const NavBarScreen();
    }
  }
  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.startWidget});
  final Widget startWidget;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PaymentCubit(
            PaymentRepo(),
          ),
        ),
        BlocProvider(
          create: (context) => TravelCubit(
            getIt.get<TravelRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => FavoriteCubit(
            getIt.get<AddFavoriteUseCase>(),
            getIt.get<FavoriteRepoImpl>(),
            getIt.get<DeleteFavoriteUseCase>(),
          )..getFavorites(),
        ),
        BlocProvider(
          create: (context) => LoctionCubit(
            getIt.get<DriverLocationUseCase>(),
          )..getLocation(),
        ),
        BlocProvider(
          create: (context) => CompleteCubit(
            getIt.get<HomeRepoIml>(),
          ),
        ),
        BlocProvider(
          create: (context) => CarCubit(
            CarRepoImpl(),
          ),
        ),
        BlocProvider(
          create: (context) => SettingsCubit(
            getIt.get<SettingsRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => MapCubit(
            getIt.get<DrawLineUseCase>(),
          ),
        ),
        BlocProvider(
          create: (context) => LocationCubit(
            LocationUseCase(),
          )..getMylocation(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: const Locale('en'),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            titleTextStyle: GoogleFonts.philosopher(
              color: appColor,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          textTheme: TextTheme(
            bodyMedium: GoogleFonts.yeonSung(
              fontWeight: FontWeight.w600,
            ),
            bodyLarge: GoogleFonts.yeonSung(
              fontWeight: FontWeight.w500,
            ),
          ),
          primaryColor: appColor,
          colorScheme: ColorScheme.fromSeed(
            seedColor: appColor,
          ),
          useMaterial3: true,
        ),
        home: startWidget,
      ),
    );
  }
}
