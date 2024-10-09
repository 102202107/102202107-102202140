import 'package:flutter/material.dart';

import 'pages/login_page.dart'; // 登录页面

void main() {
  runApp(const MyApp());
}

// StatelessWidget 用于那些状态不变的Widget
// StatefulWidget 用于那些状态可能会改变的Widget，并且需要管理其状态。
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue, // 主题颜色
      ),
      home: const LoginPage(), // 直接打开登录页
    );
  }
}
