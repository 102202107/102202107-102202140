import 'package:flutter/material.dart';
import 'competition_page.dart'; // 导入 CompetitionPage
import 'academic_page.dart'; // 导入 AcademicPage
import 'chat_page.dart'; // 导入 ChatPage

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  int _selectedIndex = 0; // 默认选中第一个选项卡：通知

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // 跳转到查看比赛详情页面
  void _viewDetails(BuildContext context, String title, String details) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(details),
          actions: <Widget>[
            TextButton(
              child: Text('关闭'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('广场'),
        // 添加选项卡
        actions: <Widget>[
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(
                  _selectedIndex == 0 ? Colors.white : Colors.grey),
            ),
            child: Text('通知'),
            onPressed: () => _onItemTapped(0),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(
                  _selectedIndex == 1 ? Colors.white : Colors.grey),
            ),
            child: Text('学术'),
            onPressed: () => _onItemTapped(1),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(
                  _selectedIndex == 2 ? Colors.white : Colors.grey),
            ),
            child: Text('比赛'),
            onPressed: () => _onItemTapped(2),
          ),
        ],
      ),
      body: _selectedIndex == 0
        ? ListView(
          children: [
            ListTile(
              title: Text('智能教育平台挑战赛'),
              subtitle: Text('5m ago'),
              trailing: TextButton(
                child: Text('查看详情'),
                onPressed: () => _viewDetails(context, '智能教育平台挑战赛', '利用AI技术,为学生提供个性化学习路径。\nhttp://www.hi.edu.cn'),
              ),
            ),
            ListTile(
              title: Text('绿色能源管理系统竞赛'),
              subtitle: Text('5m ago'),
              trailing: TextButton(
                child: Text('查看详情'),
                onPressed: () => _viewDetails(context, '绿色能源管理系统竞赛', '开发智能能源管理系统,优化能源消耗。\nhttp://www.hello.edu.cn'),
              ),
            ),
            ListTile(
              title: Text('文化遗产数字化保护竞赛'),
              subtitle: Text('5m ago'),
              trailing: TextButton(
                child: Text('查看详情'),
                onPressed: () => _viewDetails(context, '文化遗产数字化保护竞赛', '通过数字化技术,对文化遗产进行3D扫描和虚拟现实再现。\nhttp://www.hello.edu.cn'),
              ),
            ),
            ListTile(
              title: Text('智能交通监控系统比赛'),
              subtitle: Text('5m ago'),
              trailing: TextButton(
                child: Text('查看详情'),
                onPressed: () => _viewDetails(context, '智能交通监控系统比赛', '利用大数据分析和机器学习算法,优化交通流量管理。\nhttp://www.hello.edu.cn'),
              ),
            ),
            // 更多通知...
          ],
        )
        : _selectedIndex == 1
          ? AcademicPage() // 学术页面
          : CompetitionPage(), // 比赛页面
    );
  }
}