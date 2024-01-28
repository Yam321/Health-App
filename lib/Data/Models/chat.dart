class ChatModel {
  String? message;
  bool? myMessage;
  ChatModel({this.message, this.myMessage});
}

List<ChatModel> chatModelList = [
    ChatModel(message: "Can i ask you somthing", myMessage: true),
  ChatModel(message: "Ask me anything", myMessage: false),
  
];
