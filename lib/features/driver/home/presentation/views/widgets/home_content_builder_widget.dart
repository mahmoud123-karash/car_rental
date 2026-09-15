import 'package:car_rental/core/cache/save_data.dart';
import 'package:car_rental/core/services/get_it.dart';
import 'package:car_rental/core/shared/components.dart';
import 'package:car_rental/features/driver/home/data/repo/home_repo_impl.dart';
import 'package:car_rental/features/driver/home/presentation/manager/request_cubit/request_cubit.dart';
import 'package:car_rental/features/driver/home/presentation/manager/request_cubit/request_states.dart';
import 'package:car_rental/features/driver/home/presentation/views/home_content_widget.dart';
import 'package:car_rental/features/driver/home/presentation/views/widgets/loading_widget.dart';
import 'package:car_rental/features/driver/home/presentation/views/widgets/message_home_builder_widget.dart';
import 'package:car_rental/features/driver/home/presentation/views/widgets/start_consumer_builder_widget.dart';
import 'package:car_rental/features/driver/ride/presenattion/views/ride_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeContentBuilderWidget extends StatefulWidget {
  const HomeContentBuilderWidget({super.key});

  @override
  State<HomeContentBuilderWidget> createState() =>
      _HomeContentBuilderWidgetState();
}

class _HomeContentBuilderWidgetState extends State<HomeContentBuilderWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RequestCubit(
        getIt.get<HomeRepoIml>(),
      )..getRequests(),
      child: BlocConsumer<RequestCubit, RequestStates>(
        listener: (context, state) {
          if (state is SuccessConfirmedRequestState) {
            if (mounted) {
              navigateTo(context, RideScreen(model: state.model));
              saveMission(true);
            }
          }
        },
        builder: (context, state) {
          if (state is SuccessRequestState) {
            if (state.requests.isEmpty) {
              return const HomeContentWidget(requests: []);
            }
            return HomeContentWidget(requests: state.requests);
          } else if (state is ErrorRequestState) {
            return MessageHomeBuilderWidget(message: state.message);
          } else if (state is SuccessConfirmedRequestState) {
            return const Expanded(
              child: StartConsumerBuilderWidget(),
            );
          } else {
            return const LoadingWidget();
          }
        },
      ),
    );
  }
}
