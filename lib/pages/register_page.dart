import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String? _usernameError;
  String? _passwordError;
  String? _confirmPasswordError;
  bool _isObscureText = true;

  // 调用此方法以验证用户名
  _validateUsername(String value) {
    if (value.isEmpty) {
      setState(() {
        _usernameError = '用户名不能为空';
      });
    } else {
      _usernameError = null;
    }
  }

  // 调用此方法以验证密码
  _validatePassword(String value) {
    if (value.isEmpty) {
      setState(() {
        _passwordError = '密码不能为空';
      });
    } else if (value.length < 6) {
      setState(() {
        _passwordError = '密码长度不能少于6位';
      });
    } else {
      _passwordError = null;
    }
  }

  // 调用此方法以验证确认密码
  _validateConfirmPassword(String value) {
    if (value.isEmpty) {
      setState(() {
        _confirmPasswordError = '请确认密码';
      });
    } else if (value != _passwordController.text) {
      setState(() {
        _confirmPasswordError = '两次输入的密码不一致';
      });
    } else {
      _confirmPasswordError = null;
    }
  }

  // 注册按钮点击事件
  void _register() {
    if (!_formKey.currentState!.validate()) {
      // 如果表单验证失败，则不执行任何操作
      return;
    }
    // 如果表单验证成功
    FocusScope.of(context).unfocus(); // 解除焦点
    _validateUsername(_usernameController.text);
    _validatePassword(_passwordController.text);
    _validateConfirmPassword(_confirmPasswordController.text);

    final username = _usernameController.text;
    final password = _passwordController.text;

    if (_usernameError == null && _passwordError == null && _confirmPasswordError == null) {
      // 保存用户数据
      final prefs = SharedPreferences.getInstance();
      prefs.then((SharedPreferences prefs) {
        prefs.setBool('isRegistered', true);
        prefs.setString('username', username);
        prefs.setString('password', password);
      });

      // 跳转到登录页面
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginPage()),
        (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('注册'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: '用户名',
                ),
                validator: (value) {
                  _validateUsername(value!);
                  return _usernameError;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: '密码',
                ),
                obscureText: _isObscureText,
                validator: (value) {
                  _validatePassword(value!);
                  return _passwordError;
                },
              ),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  labelText: '确认密码',
                ),
                obscureText: _isObscureText,
                validator: (value) {
                  _validateConfirmPassword(value!);
                  return _confirmPasswordError;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    icon: Icon(_isObscureText ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _isObscureText = !_isObscureText;
                      });
                    },
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: _register,
                child: Text('注册'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}