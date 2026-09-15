import 'package:car_rental/core/services/get_it.dart';
import 'package:car_rental/features/passenger/chat/data/repo/chat_repo_impl.dart';
import 'package:car_rental/features/passenger/chat/presentation/manager/chat_cubit.dart';
import 'package:car_rental/features/passenger/chat/presentation/views/widgets/chat_list_view_builder_widget.dart';
import 'package:car_rental/features/passenger/chat/presentation/views/widgets/driver_image_circlar_avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/send_message_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    super.key,
    required this.name,
    required this.image,
    required this.recieverUid,
    required this.uid,
  });
  final String name, image, recieverUid, uid;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ScrollController scrollController = ScrollController();
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(
        getIt.get<ChatRepoImpl>(),
      )..getMessages(uid: widget.uid),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.name,
            maxLines: 1,
          ),
          actions: [
            DriverImageCirclarAvatarWidget(image: widget.image),
          ],
        ),
        body: Column(
          children: [
            ChatListViewBuilderWidget(scrollController: scrollController),
            SendMessageWidget(
              uid: widget.uid,
              recieverUid: widget.recieverUid,
              scrollController: scrollController,
            ),
          ],
        ),
      ),
    );
  }
}
