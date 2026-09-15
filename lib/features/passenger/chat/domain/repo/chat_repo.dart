import 'package:car_rental/features/passenger/chat/data/models/message_model.dart';
import 'package:dartz/dartz.dart';

abstract class ChatRepo {
  Future<Either<String, List<MessageModel>>> getMessages({required String uid});
  Future<Either<String, String>> sendMessage({
    required String uid,
    required String messageText,
    required String recieverUid,
  });
}
