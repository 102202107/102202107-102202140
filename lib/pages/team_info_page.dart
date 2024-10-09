// team_info_page.dart 文件内容
import 'package:flutter/material.dart';
import 'chat_page.dart';

class TeamInfoPage extends StatelessWidget {
  final String teamName;
  final String leaderName;
  final String experience;
  final String projectDesc;
  final String requirements;

  const TeamInfoPage({
    Key? key,
    required this.teamName,
    required this.leaderName,
    required this.experience,
    required this.projectDesc,
    required this.requirements,
  }) : super(key: key);

  void _startChat(BuildContext context, String leaderId) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChatPage(userId: leaderId)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(teamName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              '领队: $leaderName',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('相关经验: $experience'),
            const Divider(),
            Text(
              '项目描述: $projectDesc',
              style: TextStyle(fontSize: 16),
            ),
            const Divider(),
            Text(
              '队友要求: $requirements',
              style: TextStyle(fontSize: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () => _startChat(context, leaderName), // leaderId 需要根据实际情况替换
                  child: Text('开始私聊'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}