import 'package:flutter/material.dart';
import 'profile.dart';
import 'package:projectpartner/models/message.dart';
import 'package:projectpartner/widget/message_list.dart';
import 'chat_page.dart'; // 导入 ChatPage
import 'notification_page.dart'; // 导入 NotificationPage

class HomePage extends StatefulWidget {
  final String userName;

  const HomePage({super.key, required this.userName});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // 默认选第一个

  // 定义一个方法来处理消息点击事件
  void _handleMessageTap(BuildContext context, String userId) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChatPage(userId: userId)),
    );
  }

  // 选中事件
  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      NotificationPage(), // 广场页面
      MessageList(
        messages: [
          Message(
            sender: '用户16895',
            content: '谢谢你的介绍，我想加入你们！',
            time: '10:00',
            avatarUrl: 'https://via.placeholder.com/50', // 使用占位图作为默认头像
            userId: '16895', // 假设这是用户ID
          ),
        ],
        onMessageTap: (String userId) =>
            _handleMessageTap(context, userId), // 使用方法引用
      ), // 消息页面
      const ProfilePage(), // 配置页面子组件
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('欢迎, ${widget.userName}'),
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '广场',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: '消息',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '个人',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: onItemTapped,
      ),
    );
  }
}
