import 'package:car_rental/features/driver/notification/data/models/notification_model.dart';
import 'package:car_rental/features/driver/notification/presentation/views/widgets/notification_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class NotificationListViewWidget extends StatelessWidget {
  const NotificationListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 500),
              child: SlideAnimation(
                verticalOffset: 70.0,
                child: FadeInAnimation(
                  child: NotificationItemWidget(
                    model: NotificationModel(
                      type: 'Promotion',
                      uid: 'fkhosghsogjsdkogv',
                      text: 'Your booking#236556pkb has been completed',
                    ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            height: 10,
          ),
          itemCount: 25,
        ),
      ),
    );
  }
}
