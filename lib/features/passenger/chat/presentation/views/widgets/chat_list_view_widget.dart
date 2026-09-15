import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/features/passenger/chat/data/models/message_model.dart';
import 'package:car_rental/features/passenger/chat/presentation/views/widgets/message_item_widget.dart';
import 'package:flutter/material.dart';

class ChatListViewWidget extends StatelessWidget {
  const ChatListViewWidget(
      {super.key, required this.messages, required this.scrollController});
  final List<MessageModel> messages;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          reverse: true,
          controller: scrollController,
          itemBuilder: (context, index) => MessageItemWidget(
            isSender:
                CacheHelper.getData(key: 'uid') == messages[index].senderUid,
            message: messages[index].message,
          ),
          separatorBuilder: (context, index) => const SizedBox(
            height: 15,
          ),
          itemCount: messages.length,
        ),
      ),
    );
  }
}
