import 'package:flutter/material.dart';
import 'team_info_page.dart'; // 导入 TeamInfoPage
import 'create_team_page.dart'; // 导入 CreateTeamPage

class AcademicPage extends StatelessWidget {
  const AcademicPage({Key? key}) : super(key: key);

  // 跳转到组队创建页面
  void _onCreateTeamTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateTeamPage(
          competitionName: '学术项目',
          onTeamCreated: () {
            // 处理组队创建后的逻辑，比如返回学术页面
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  // 跳转到队伍信息页面
  void _onProjectTap(BuildContext context, String projectName, String leaderName, String experience, String projectDesc, String requirements) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TeamInfoPage(
          teamName: projectName,
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
        title: Text('学术'),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text('智能教育平台'),
              subtitle: Text('2024-01-15'),
              onTap: () => _onProjectTap(
                context,
                '智能教育平台',
                '张教授',
                '20年教育技术经验',
                '利用人工智能技术，为学生提供个性化学习路径。',
                '专业要求: 教育学、计算机科学\n技能要求: 熟悉机器学习和数据分析...',
              ),
            ),
          ),
          Card(
              child: ListTile(
                title: Text('文化遗产数字化保护'),
                subtitle: Text('2024-03-10'),
                onTap: () => _onProjectTap(
                  context,
                  '文化遗产数字化保护',
                  '陈老师',
                  '数字文化保护专家',
                  '通过数字化技术，对文化遗产进行3D扫描和虚拟现实再现。',
                  '专业要求: 历史学、艺术设计\n技能要求: 3D建模、VR/AR技术...',
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('智能交通监控系统'),
                subtitle: Text('2024-04-20'),
                onTap: () => _onProjectTap(
                  context,
                  '智能交通监控系统',
                  '王研究员',
                  '城市规划与交通专家',
                  '利用大数据分析和机器学习算法，优化交通流量管理。',
                  '专业要求: 交通工程、城市规划\n技能要求: 大数据处理、模式识别...',
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('健康医疗物联网'),
                subtitle: Text('2024-05-15'),
                onTap: () => _onProjectTap(
                  context,
                  '健康医疗物联网',
                  '赵主任',
                  '医疗设备管理经验',
                  '利用物联网技术提升医疗设备管理和患者监护水平。',
                  '专业要求: 生物医学工程、电子工程\n技能要求: 物联网协议、嵌入式系统...',
                ),
              ),
            ),
          Card(
            child: ListTile(
              title: Text('绿色能源管理系统'),
              subtitle: Text('2024-01-15'),
              onTap: () => _onProjectTap(
                context,
                '绿色能源管理系统',
                '李教授',
                '15年能源管理经验',
                '开发智能能源管理系统，优化能源消耗。',
                '专业要求: 环境科学、能源工程\n技能要求: 熟悉能源管理系统...',
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
          // 添加更多学术项目...
        ],
      ),
    );
  }
}