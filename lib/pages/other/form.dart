import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  final Map? arguments;
  const FormPage({Key? key, this.arguments}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  var userName = TextEditingController();
  var checkBoxFlag = true;
  var sex = 1;
  var switchFlag = true;

  List hobbies = [
    {"checked": true, "title": "吃饭"},
    {"checked": false, "title": "睡觉"},
    {"checked": true, "title": "写代码"},
  ];

  List<Widget> _getHobbies() {
    List<Widget> tempList = [];
    for (var hobby in hobbies) {
      tempList.add(
        Row(
          children: [
            Text(
              hobby["title"],
              style: TextStyle(
                color: hobby["checked"] ? Colors.red : Colors.black,
              ),
            ),
            Checkbox(
                value: hobby["checked"],
                onChanged: (value) {
                  setState(() {
                    hobby["checked"] = value!;
                  });
                })
          ],
        ),
      );
    }
    return tempList;
  }

  void _checkBoxChanged(value) {
    setState(() {
      checkBoxFlag = value;
    });
  }

  void _sexChanged(value) {
    setState(() {
      sex = value;
    });
  }

  @override
  void initState() {
    super.initState();
    userName.text = "初始用户名";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("表单页"),
      ),
      body: SingleChildScrollView(
        // child: TextFieldDemo(arguments: widget.arguments),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            TextField(
              controller: userName,
              decoration: const InputDecoration(
                labelText: "用户名",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {});
                    // print("当前输入框的内容为：${userName.text}");
                  },
                  child: const Text("获取输入框内容")),
            ),
            const SizedBox(height: 20),
            Text("当前输入框的内容为：${userName.text}"),
            const SizedBox(height: 20),
            Checkbox(
              value: checkBoxFlag,
              onChanged: _checkBoxChanged,
              // activeColor: Colors.blue,
            ),
            CheckboxListTile(
              value: checkBoxFlag,
              onChanged: _checkBoxChanged,
              title: const Text("标题"),
              // subtitle: const Text("二级标题"),
              secondary: const Icon(Icons.help),
              selected: checkBoxFlag,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "男",
                  style: TextStyle(color: sex == 1 ? Colors.red : Colors.black),
                ),
                Radio(
                  value: 1,
                  groupValue: sex,
                  onChanged: _sexChanged,
                ),
                const SizedBox(width: 20),
                Text(
                  "女",
                  style: TextStyle(color: sex == 2 ? Colors.red : Colors.black),
                ),
                Radio(
                  value: 2,
                  groupValue: sex,
                  onChanged: _sexChanged,
                ),
              ],
            ),
            const SizedBox(height: 20),
            RadioListTile(
              value: 3,
              groupValue: sex,
              onChanged: _sexChanged,
              title: const Text("标题"),
              // subtitle: const Text("二级标题"),
              secondary: const Icon(Icons.help),
              selected: sex == 3,
            ),
            const SizedBox(height: 20),
            Switch(
              value: switchFlag,
              onChanged: (value) {
                setState(() {
                  switchFlag = value;
                });
              },
            ),
            const SizedBox(height: 20),
            Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: _getHobbies()),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text("返回"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

class TextFieldDemo extends StatelessWidget {
  final Map? arguments;
  const TextFieldDemo({Key? key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const TextField(),
          const SizedBox(height: 20),
          const TextField(
            decoration: InputDecoration(
              hintText: "请输入内容",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          const TextField(
            maxLines: 4,
            decoration: InputDecoration(
              hintText: "多行文本框",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "密码框",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          const TextField(
            decoration: InputDecoration(
              labelText: "用户名",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          const TextField(
            decoration: InputDecoration(
              icon: Icon(Icons.people),
              hintText: "用户名",
            ),
          ),
          const SizedBox(height: 20),
          Text("id为${arguments != null ? arguments!["id"] : "0"}"),
        ],
      ),
    );
  }
}
