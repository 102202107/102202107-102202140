import 'package:flutter/material.dart';

class PersonalInformationPage extends StatefulWidget {
  const PersonalInformationPage({Key? key}) : super(key: key);

  @override
  _PersonalInformationPageState createState() => _PersonalInformationPageState();
}

class _PersonalInformationPageState extends State<PersonalInformationPage> {
  // 个人信息内容
  String personalInfoText = '''
  大家好，我是张伟，一名来自计算机科学与技术学院的大三学生。我对编程充满热情，并且对新技术和挑战总是保持好奇和探索的心态。
  我的技能和经验：
  编程语言：熟练掌握 C++，Python，Java，并且对 JavaScript 和 HTML/CSS 有一定的了解。
  项目经验：曾参与开发过几个校内项目，包括一个基于 Web 的图书管理系统和一个移动应用。
  竞赛经历：参加过 ACM 编程竞赛和校内的算法竞赛，对算法和数据结构有深入的理解。
  团队合作：我重视团队合作，相信通过沟通和协作可以解决任何问题。
  我为什么寻求组队：
  我正在寻找志同道合的队友参加即将到来的“互联网+”大学生创新创业大赛。
  我希望与有创新思维和强烈求知欲的队友一起工作，共同实现我们的项目目标。
  我期望的队友：
  拥有良好的编程基础和逻辑思维能力。
  对软件开发、人工智能、数据科学等领域有浓厚兴趣。
  能够承担压力，有责任心，并且愿意为团队的成功付出努力。
  联系方式：
  邮箱：zhangwei@university.edu
  QQ：123456789
  期待与你们的合作，让我们一起在竞赛中取得优异的成绩！
  ''';

  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _controller.text = personalInfoText;
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _saveText() {
    setState(() {
      personalInfoText = _controller.text;
      _isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('个人信息'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _isEditing ? EditableText(
              controller: _controller,
              focusNode: _focusNode,
              style: const TextStyle(fontSize: 16.0, color: Colors.black),
              backgroundCursorColor: Colors.blue,
              cursorColor: Colors.blue,
              onChanged: (value) {
                // 这里可以处理文本变化，如果需要的话
              },
            ) : Text(
              personalInfoText,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isEditing = !_isEditing;
                  if (_isEditing) {
                    _controller.text = personalInfoText;
                  } else {
                    _saveText();
                  }
                });
              },
              child: _isEditing ? const Text('保存') : const Text('编辑'),
            ),
          ],
        ),
      ),
    );
  }
}