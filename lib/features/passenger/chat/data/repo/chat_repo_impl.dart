import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/features/passenger/chat/data/data_sources/remote_data_source/chat_remote_data_source.dart';
import 'package:car_rental/features/passenger/chat/data/models/message_model.dart';
import 'package:car_rental/features/passenger/chat/domain/repo/chat_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';

class ChatRepoImpl extends ChatRepo {
  final ChatRemoteDataSource chatRemoteDataSource;

  ChatRepoImpl(this.chatRemoteDataSource);
  @override
  Future<Either<String, String>> sendMessage({
    required String uid,
    required String messageText,
    required String recieverUid,
  }) async {
    try {
      var messageuid = const Uuid().v4();
      String senderUid = CacheHelper.getData(key: 'uid');
      MessageModel message = MessageModel(
        message: messageText,
        senderUid: senderUid,
        recieverUid: recieverUid,
        time: Timestamp.now(),
        uid: messageuid,
      );
      await FirebaseFirestore.instance
          .collection('Chats')
          .doc(uid)
          .collection('Messages')
          .doc(messageuid)
          .set(message.toJson());

      return right('Sended');
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<MessageModel>>> getMessages(
      {required String uid}) async {
    try {
      List<MessageModel> messages = await chatRemoteDataSource.get(uid: uid);
      return right(messages);
    } catch (e) {
      return left(e.toString());
    }
  }
}
