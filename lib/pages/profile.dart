import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';
import 'course.dart';
import 'personal_information.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final String? _profilePictureUrl = null; // 头像
  String _userName = ''; // 用户名
  final String _userId = '15448894'; // 用户ID

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  // 获取用户信息
  _loadUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('userName') ?? '未知';
    });
  }

  // 退出登录
  void _logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }

  // 跳转到课程页面
  void _goToCoursePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CoursePage(),
      ),
    );
  }

  // 跳转到个人信息页面
  void _goToPersonalInformationPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PersonalInformationPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 头像和文本信息
            Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[200], // 设置头像背景色
                  child: _profilePictureUrl != null && _profilePictureUrl.isNotEmpty
                      ? ClipOval(
                          child: Image.network(
                            _profilePictureUrl,
                            fit: BoxFit.cover,
                            width: 100,
                            height: 100,
                          ),
                        )
                      : Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.grey[700], // 设置图标颜色
                        ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 用户姓名
                      Text(
                        _userName,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // 用户ID
                      Text(
                        '用户ID: $_userId',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // 我的课表按钮
            _buildBubbleButton(
              context,
              '我的课表',
              () => _goToCoursePage(context),
            ),

            // 个人信息按钮
            _buildBubbleButton(
              context,
              '个人信息',
              () => _goToPersonalInformationPage(context),
            ),

            const Spacer(), // 占据剩余的空间

            // 退出登录按钮
            ElevatedButton(
              onPressed: () => _logout(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // 修改按钮背景色
                foregroundColor: Colors.white, // 文本的颜色
                minimumSize: const Size(double.infinity, 50), // 修改按钮大小
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // 修改按钮圆角
                ),
              ),
              child: const Text('退出登录'),
            ),
          ],
        ),
      ),
    );
  }

// 创建带有灰色阴影的按钮文本样式
TextStyle getShadowedTextStyle() {
  return TextStyle(
    color: Colors.white,
    fontSize: 18,
    shadows: [
      Shadow(
        color: Colors.black.withOpacity(0.1), // 淡淡的灰色阴影
        blurRadius: 1.0, // 模糊半径
        offset: const Offset(0.0, 1.0), // 阴影偏移
      ),
    ],
  );
}

// 创建淡蓝色气泡按钮
Widget _buildBubbleButton(BuildContext context, String text, VoidCallback onPressed) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0), // 设置外边距
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[100], // 设置按钮背景颜色为淡蓝色
        foregroundColor: Colors.white, // 设置文本颜色为白色
        minimumSize: const Size(double.infinity, 50), // 修改按钮大小
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.0), // 修改按钮圆角
        ),
      ),
      child: Text(
        text,
        style: getShadowedTextStyle(), // 使用带有阴影的文本样式
      ),
    ),
  );
}
}