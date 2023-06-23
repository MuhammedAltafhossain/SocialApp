import 'package:social_app/src/models/pojo_classes/message_model.dart';

Future<List<MessageModel>> createDummyMessage() async {
  List<MessageModel> messages = [];
  messages.add(MessageModel(
    userId: "1",
    messageTime: DateTime.now(),
    message: "Hey! How are you? It’s been a while. How is your travel to UK?",
  ));
  messages.add(MessageModel(
    userId: "2",
    messageTime: DateTime.now().add(const Duration(minutes: 5)),
    message: "Hey too!",
  ));

  // Add dummy messages for person 2
  messages.add(MessageModel(
    userId: "2",
    messageTime: DateTime.now().add(const Duration(minutes: 10)),
    message: "Its great, UK is awesome, espesially London. New job is good so far! How about you?",
  ));
  messages.add(MessageModel(
    userId: "1",
    messageTime: DateTime.now().add(const Duration(minutes: 15)),
    message: "I’m fine, i’m thinking about new project. I want to open an online store",
  ));
  messages.add(MessageModel(
    userId: "1",
    messageTime: DateTime.now().add(const Duration(minutes: 15)),
    message: "But  I don’t know what to sell. Maybe I will sell stones and water",
  ));
  messages.add(MessageModel(
    userId: "2",
    messageTime: DateTime.now().add(const Duration(minutes: 15)),
    message: "Yeah it’s great idea, you know - everyone needs water, I dont know about stones xD",
  ));

  messages.add(MessageModel(
    userId: "1",
    messageTime: DateTime.now(),
    message: "Hey! How are you? It’s been a while. How is your travel to UK?",
  ));
  messages.add(MessageModel(
    userId: "2",
    messageTime: DateTime.now().add(const Duration(minutes: 5)),
    message: "Hey too!",
  ));

  // Add dummy messages for person 2
  messages.add(MessageModel(
    userId: "2",
    messageTime: DateTime.now().add(const Duration(minutes: 10)),
    message: "Its great, UK is awesome, espesially London. New job is good so far! How about you?",
  ));
  messages.add(MessageModel(
    userId: "1",
    messageTime: DateTime.now().add(const Duration(minutes: 15)),
    message: "I’m fine, i’m thinking about new project. I want to open an online store",
  ));
  messages.add(MessageModel(
    userId: "1",
    messageTime: DateTime.now().add(const Duration(minutes: 15)),
    message: "But  I don’t know what to sell. Maybe I will sell stones and water",
  ));
  messages.add(MessageModel(
    userId: "2",
    messageTime: DateTime.now().add(const Duration(minutes: 15)),
    message: "Yeah it’s great idea, you know - everyone needs water, I dont know about stones xD",
  ));

  return messages;
}