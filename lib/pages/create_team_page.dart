import 'package:flutter/material.dart';

class CreateTeamPage extends StatefulWidget {
  final String competitionName;
  final VoidCallback onTeamCreated;

  const CreateTeamPage({
    Key? key,
    required this.competitionName,
    required this.onTeamCreated,
  }) : super(key: key);

  @override
  _CreateTeamPageState createState() => _CreateTeamPageState();
}

class _CreateTeamPageState extends State<CreateTeamPage> {
  final _formKey = GlobalKey<FormState>();
  final _projectIntroController = TextEditingController();
  final _teammateRequirementsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('发起组队 - ${widget.competitionName}'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: '专业'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '专业不能为空';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: '年级'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '年级不能为空';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: '联系方式'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '联系方式不能为空';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: '相关经验'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '相关经验不能为空';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _projectIntroController,
              decoration: const InputDecoration(labelText: '项目介绍'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '项目介绍不能为空';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _teammateRequirementsController,
              decoration: const InputDecoration(labelText: '队友要求'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '队友要求不能为空';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // 触发提交逻辑
                  widget.onTeamCreated();
                }
              },
              child: Text('发起组队'),
            ),
          ],
        ),
      ),
    );
  }
}