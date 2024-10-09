// competition_page.dart 文件内容
import 'package:flutter/material.dart';
import 'team_info_page.dart'; // 导入 TeamInfoPage
import 'create_team_page.dart'; // 导入 CreateTeamPage

class CompetitionPage extends StatelessWidget {
  const CompetitionPage({Key? key}) : super(key: key);

  // 跳转到组队创建页面
  void _onCreateTeamTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateTeamPage(
          competitionName: '请选择竞赛',
          onTeamCreated: () {
            // 处理组队创建后的逻辑，比如返回竞赛页面
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  // 跳转到队伍信息页面
  void _onProjectTap(BuildContext context, String teamName, String leaderName, String experience, String projectDesc, String requirements) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TeamInfoPage(
          teamName: teamName,
          leaderName: leaderName,
          experience: experience,
          projectDesc: projectDesc,
          requirements: requirements,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('比赛'),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text('AI竞赛'),
              subtitle: Text('2024-01-15'),
              onTap: () => _onProjectTap(
                context,
                'AI竞赛',
                '张三',
                '领队的相关经验...',
                '项目描述...',
                '专业要求: 计算机科学、教育学、心理学\n技能要求: 熟悉机器学习和数据分析...',
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('物联网创新挑战赛'),
              subtitle: Text('2024-01-15'),
              onTap: () => _onProjectTap(
                context,
                '物联网创新挑战赛',
                '李四',
                '领队的相关经验...',
                '项目描述...',
                '专业要求: 计算机科学、电子工程\n技能要求: 熟悉物联网设备和传感器...',
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('区块链应用大赛'),
              subtitle: Text('2024-01-15'),
              onTap: () => _onProjectTap(
                context,
                '区块链应用大赛',
                '王五',
                '领队的相关经验...',
                '项目描述...',
                '专业要求: 计算机科学、金融\n技能要求: 熟悉区块链技术...',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => _onCreateTeamTap(context),
            child: Text('发起组队'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
          ),
          // 添加更多列表项
        ],
      ),
    );
  }
}