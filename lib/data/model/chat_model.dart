class Chat {
  final String id;
  final String ask;
  final String answer;
  final String createDate;

  Chat({
    required this.id,
    required this.ask,
    required this.answer,
    required this.createDate,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        id: json["id"],
        ask: json["ask"],
        answer: json["answer"],
        createDate: json["create_date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ask": ask,
        "answer": answer,
        "create_date": createDate,
      };
}
