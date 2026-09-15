import 'package:car_rental/core/api/dio_helper.dart';
import 'package:car_rental/features/auth/data/data_sources/remote_data_source/login_remote_data_source.dart';
import 'package:car_rental/features/auth/data/repo/login_repo_impl.dart';
import 'package:car_rental/features/auth/domain/repo/register_repo.dart';
import 'package:car_rental/features/auth/domain/use_cases/driver_register_use_case.dart';
import 'package:car_rental/features/auth/domain/use_cases/passenger_register_use_case.dart';
import 'package:car_rental/features/driver/home/data/data_sources/remote_data_source/request_remote_data_source.dart';
import 'package:car_rental/features/driver/home/domain/use_cases/location_use_case.dart';
import 'package:car_rental/features/passenger/chat/data/data_sources/remote_data_source/chat_remote_data_source.dart';
import 'package:car_rental/features/passenger/find_driver/data/data_sources/remote_data_source/online_driver_remote_data_source.dart';
import 'package:car_rental/features/passenger/find_driver/data/data_sources/remote_data_source/ride_remote_data_source.dart';
import 'package:car_rental/features/passenger/find_driver/data/data_sources/remote_data_source/travel_info_remote_data_source.dart';
import 'package:car_rental/features/passenger/find_driver/data/repo/ride_repo_impl.dart';
import 'package:car_rental/features/passenger/ride/data/data_sources/remote_data_source/location_remote_data_source.dart';
import 'package:car_rental/features/passenger/ride/data/repo/location_repo_impl.dart';
import 'package:car_rental/features/passenger/ride/data/repo/rating_repo_impl.dart';
import 'package:car_rental/features/passenger/ride/domain/use_cases/time_use_case.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/driver/edit_profile/data/repo/profile_repo_impl.dart';
import '../../features/driver/edit_profile/domain/use_cases/update_use_case.dart';
import '../../features/driver/home/data/data_sources/remote_data_source/complete_remote_data_source.dart';
import '../../features/driver/home/data/repo/home_repo_impl.dart';
import '../../features/driver/settings/data/data_sources/local_data_source/settings_local_data_source.dart';
import '../../features/driver/settings/data/data_sources/remote_data_source/settings_remote_data_source.dart';
import '../../features/driver/settings/data/repo/settings_repo_impl.dart';
import '../../features/passenger/chat/data/repo/chat_repo_impl.dart';
import '../../features/passenger/favorite/data/data_sources/remote_data_source/favorite_remote_data_source.dart';
import '../../features/passenger/favorite/data/repo/favorite_repo_impl.dart';
import '../../features/passenger/favorite/domain/use_cases/add_favorite_use_case.dart';
import '../../features/passenger/favorite/domain/use_cases/delete_favorite_use_case.dart';
import '../../features/passenger/find_driver/data/repo/driver_repo_impl.dart';
import '../../features/passenger/find_driver/data/repo/travel_repo_impl.dart';
import '../../features/passenger/find_driver/domain/use_cases/request_ride_use_case.dart';
import '../../features/passenger/home/doamin/repo/home_repo.dart';
import '../../features/passenger/home/doamin/use_cases/draw_line_use_case.dart';
import '../../features/passenger/ride/data/data_sources/remote_data_source/rating_remote_data_source.dart';
import '../../features/passenger/ride/domain/use_cases/rating_use_case.dart';

GetIt getIt = GetIt.instance;

void setLocator() {
  getIt.registerSingleton<DrawLineUseCase>(
    DrawLineUseCase(
      HomeRepo(),
    ),
  );

  getIt.registerSingleton<DriverRegisterUseCase>(
    DriverRegisterUseCase(
      RegisterRepo(),
    ),
  );

  getIt.registerSingleton<PassengerRegisterUseCase>(
    PassengerRegisterUseCase(
      RegisterRepo(),
    ),
  );

  getIt.registerSingleton<LoginRepoImpl>(
    LoginRepoImpl(
      LoginRemoteDataSourceImpl(),
    ),
  );

  getIt.registerSingleton<SettingsRepoImpl>(
    SettingsRepoImpl(
      SettingsRemoteDataSourceImpl(),
      SettingsLocalDataSourceImpl(),
    ),
  );

  getIt.registerSingleton<UpdateUseCase>(
    UpdateUseCase(
      ProfileRepoImpl(),
    ),
  );

  getIt.registerSingleton<HomeRepoIml>(
    HomeRepoIml(
      CompleteRemoteDataSourceImpl(),
      RequestRemoteDataSourceImpl(),
    ),
  );

  getIt.registerSingleton<DriverLocationUseCase>(
    DriverLocationUseCase(
      getIt.get<HomeRepoIml>(),
    ),
  );

  getIt.registerSingleton<FavoriteRepoImpl>(
    FavoriteRepoImpl(
      FavoriteRemoteDataSourceImpl(),
    ),
  );
  getIt.registerSingleton<AddFavoriteUseCase>(
    AddFavoriteUseCase(
      getIt.get<FavoriteRepoImpl>(),
    ),
  );

  getIt.registerSingleton<DeleteFavoriteUseCase>(
    DeleteFavoriteUseCase(
      getIt.get<FavoriteRepoImpl>(),
    ),
  );
  getIt.registerSingleton<DriverRepoImpl>(
    DriverRepoImpl(
      OnlineDriverRemoteDataSourceIMpl(),
    ),
  );
  getIt.registerSingleton<DioHelper>(
    DioHelper(
      Dio(),
    ),
  );
  getIt.registerSingleton<TravelRepoImpl>(
    TravelRepoImpl(
      TravelInfoRemoteDataSourceImpl(
        getIt.get<DioHelper>(),
      ),
    ),
  );
  getIt.registerSingleton<RequestRideUseCase>(
    RequestRideUseCase(
      RideRepoImpl(
        RideRemoteDataSourceImpl(),
      ),
    ),
  );

  getIt.registerSingleton<LocationRepoImpl>(
    LocationRepoImpl(
      LocationRemoteDataSourceImpl(
        getIt.get<DioHelper>(),
      ),
    ),
  );
  getIt.registerSingleton<TimeUseCase>(
    TimeUseCase(
      getIt.get<LocationRepoImpl>(),
    ),
  );

  getIt.registerSingleton<RatingUseCase>(
    RatingUseCase(
      RatingRepoImpl(
        RatingRemoteDataSourceImpl(),
      ),
    ),
  );

  getIt.registerSingleton<ChatRepoImpl>(
    ChatRepoImpl(
      ChatRemoteDataSourceImpl(),
    ),
  );
}
