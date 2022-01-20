import 'package:get/get.dart';
import 'package:waclone/app/data/chat_model.dart';

class ChatsPageController extends GetxController {
  List<ChatModel> chats = [
    ChatModel(
        name: "Luffy",
        icon: "asset/person.svg",
        time: "09.00",
        currentMessage: "Kntl"
    ),
    ChatModel(
        name: "Ace",
        icon: "asset/person.svg",
        time: "09.10",
        currentMessage: "Kntl"
    ),
    ChatModel(
        name: "Sabo",
        icon: "asset/person.svg",
        time: "13.00",
        currentMessage: "Kntl"
    ),
  ];
}
