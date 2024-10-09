import 'package:flutter/material.dart';
import 'package:projectpartner/models/message.dart'; // 导入Message类

typedef OnMessageTap = void Function(String userId);

class MessageList extends StatelessWidget {
  final List<Message> messages;
  final OnMessageTap onMessageTap;

  const MessageList({super.key, 
    required this.messages,
    required this.onMessageTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(messages[index].avatarUrl),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(messages[index].sender, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(messages[index].time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
          subtitle: Text(messages[index].content),
          onTap: () {
            onMessageTap(messages[index].userId);
          },
        );
      },
    );
  }
}