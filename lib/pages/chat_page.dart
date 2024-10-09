import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String userId;

  const ChatPage({super.key, required this.userId});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<Map<String, String>> messages = [
    {'text': '你好，可以给我介绍一下队伍吗', 'sender': 'user1'},
    // 初始化消息时不使用widget.userId
  ];
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  String get currentUserId => widget.userId; // 用于延迟获取widget.userId

  @override
  void initState() {
    super.initState();
    // 在这里初始化依赖于widget.userId的消息
    setState(() {
      messages.add({
        'text': '当然可以，我们小组参加的是数据建模比赛，目前有两个人，我们计算机与大数据学院，我们熟练掌握python，c语言的编程，希望找一个擅长写论文的队友',
        'sender': currentUserId,
      });
      messages.add({
        'text': '谢谢你的介绍，我想加入你们！',
        'sender': 'user1',
      });
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('用户 ${widget.userId} '),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  return _buildMessageBubble(message['text']!, message['sender']!);
                },
              ),
            ),
          ),
          const Divider(height: 1.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _textController,
                    focusNode: _focusNode,
                    onSubmitted: _handleSubmitted,
                    decoration: InputDecoration(
                      hintText: '输入消息',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () => _handleSubmitted(_textController.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(String text, String sender) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: sender == currentUserId ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          if (sender != currentUserId)
            const CircleAvatar(
              backgroundImage: NetworkImage('https://via.placeholder.com/50'),  // 对方用户的头像
            ),
          const SizedBox(width: 10.0),
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              decoration: BoxDecoration(
                color: sender == currentUserId ? Colors.blue[200] : Colors.grey[300],
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Text(text),
            ),
          ),
          if (sender == currentUserId)
            const CircleAvatar(
              backgroundImage: NetworkImage('https://via.placeholder.com/50'),  // 当前用户的头像
            ),
          const SizedBox(width: 10.0),
        ],
      ),
    );
  }

  void _handleSubmitted(String? text) {
    if (text != null && text.trim().isNotEmpty) {
      setState(() {
        messages.add({'text': text.trim(), 'sender': currentUserId});
        _textController.clear();
        _focusNode.unfocus();
      });
    }
  }
}