class Message {
  final String sender;
  final String content;
  final String time;
  final String avatarUrl;
  final String userId; // 新增用户ID字段

  Message({
    required this.sender,
    required this.content,
    required this.time,
    required this.avatarUrl,
    required this.userId,
  });
}