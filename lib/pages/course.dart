import 'package:flutter/material.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  // 定义课表数据，这里使用一个二维List来模拟
  Map<String, List<String>> courseTable = {
    '周一': ['高等数学', '英语', '体育', '计算机科学', '自习'],
    '周二': ['线性代数', '物理', '体育', '数据结构', '实验'],
    '周三': ['概率论', '历史', '美术', '数据库原理', '音乐'],
    '周四': ['操作系统', '生物', '化学', '网络技术', '讨论'],
    '周五': ['编译原理', '地理', '政治', '软件工程', '实践'],
    '周六': ['自由活动', '体育', '图书馆', '兴趣小组', '自习'],
    '周日': ['休息', '整理内务', '自由时间', '预习', '复习'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('我的课表'),
      ),
      body: SingleChildScrollView(
        child: Table(
          border: TableBorder.all(),
          children: <TableRow>[
            // 表头
            TableRow(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    '时间',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                // ...
                for (var i = 0; i < courseTable.values.first.length; i++)
                  TableCell(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        '第${i + 1}节',
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
              ],
            ),
            // 课程数据行
            for (var entry in courseTable.entries)
              TableRow(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      entry.key,
                      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  // ...
                  for (var course in entry.value)
                    TableCell(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          course,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}