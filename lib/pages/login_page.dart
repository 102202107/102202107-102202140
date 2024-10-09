import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';
import 'register_page.dart'; // 确保导入注册页面

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  String? _usernameError;
  String? _passwordError;
  bool _isObscure = true;
  final _borderRadius = 10.0;

  @override
  void initState() {
    super.initState();
    _usernameFocusNode.addListener(() {
      if (!_usernameFocusNode.hasFocus) {
        _validateUsername();
      }
    });
    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus) {
        _validatePassword();
      }
    });
  }

  void _validateUsername() {
    setState(() {
      if (_usernameController.text.isEmpty) {
        _usernameError = "用户名不能为空";
      } else {
        _usernameError = null;
      }
    });
  }

  void _validatePassword() {
    setState(() {
      if (_passwordController.text.isEmpty) {
        _passwordError = "密码不能为空";
      } else {
        _passwordError = null;
      }
    });
  }

  void _login() async {
    if (_formKey.currentState?.validate() ?? false) {
      _validateUsername();
      _validatePassword();

      final userName = _usernameController.text;
      final password = _passwordController.text;

      final prefs = await SharedPreferences.getInstance();
      final savedUserName = prefs.getString('username');
      final savedPassword = prefs.getString('password');

      if (userName == savedUserName && password == savedPassword) {
        // 底部消息弹框
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$userName 已登录')),
        );

        // 登录数据存储
        prefs.setString('userName', userName);

        // 跳转到下一个页面
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(userName: userName),
          ),
          (route) => false, // 移除前置路由
        );
      } else {
        setState(() {
          _usernameError = "账号或密码不正确";
          _passwordError = "账号或密码不正确";
        });
      }
    }
  }

  Color _hexToColor(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 7 || hexString.length == 9) buffer.write('FF');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  void _goToRegisterPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("登录",
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14)),
        backgroundColor: _hexToColor('#037cfd'),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      backgroundColor: _hexToColor('#037cfd'),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            const Text(
              "ProjectPartner",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _usernameController,
                      focusNode: _usernameFocusNode,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '用户名不能为空';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "用户名",
                        errorText: _usernameError,
                        prefixIcon:
                            Icon(Icons.person, color: _hexToColor('#7ba8c0')),
                        fillColor: Colors.grey[80],
                        filled: true,
                        isCollapsed: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(_borderRadius),
                            borderSide: const BorderSide(
                                color: Colors.white, width: 0)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(_borderRadius)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(_borderRadius),
                            borderSide: BorderSide(
                                color: _hexToColor('#7ba8c0'), width: 2.0)),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _passwordController,
                      focusNode: _passwordFocusNode,
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        labelText: "密码",
                        errorText: _passwordError,
                        prefixIcon:
                            Icon(Icons.lock, color: _hexToColor('#7ba8c0')),
                        fillColor: Colors.grey[80],
                        filled: true,
                        isCollapsed: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(_borderRadius),
                            borderSide: const BorderSide(
                                color: Colors.white, width: 0)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(_borderRadius),
                            borderSide: const BorderSide(
                                color: Colors.white, width: 0)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(_borderRadius),
                            borderSide: BorderSide(
                                color: _hexToColor('#7ba8c0'), width: 2.0)),
                        suffixIcon: IconButton(
                          icon: Icon(!_isObscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _hexToColor('#037cfd'),
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(_borderRadius)),
                      ),
                      child: const Text("登录"),
                    ),
                    ElevatedButton(
                      onPressed: _goToRegisterPage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: _hexToColor('#037cfd'),
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(_borderRadius)),
                      ),
                      child: const Text("注册新账户"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
