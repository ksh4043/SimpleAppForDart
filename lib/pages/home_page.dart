import 'package:flutter/material.dart';
import '/widgets/drawer_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      drawer: MainDrawer(),
      body: Center(
          child: InsertDiary()
      ),
    );
  }
}

class DiaryState extends ChangeNotifier {
  final TextEditingController _controller = TextEditingController();
  TextEditingController get controller => _controller; // getter
  var diaryContents = <String>[];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void insertContent(String content) {
    if (diaryContents.contains(content)){
      return;
    }
    diaryContents.add(content);
    notifyListeners();
  }

  void writeDiary() {
    String content = _controller.text;
    insertContent(content);
    _controller.clear();
  }
}

class InsertDiary extends StatefulWidget {
  @override
  State<InsertDiary> createState() => InsertDiaryState();
}

class InsertDiaryState extends State<InsertDiary> {
  @override
  Widget build(BuildContext context) {
    final diaryState = Provider.of<DiaryState>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 500,
          child: Container(
            child: TextField(
              controller: diaryState.controller,
              decoration: InputDecoration(
                label: Center(
                  child: Text(
                    '간단한 한 줄 일기',
                    textAlign: TextAlign.center,
                  )
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.horizontal())
              )
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        ElevatedButton(
              onPressed: () {
                diaryState.writeDiary();
              },
              child: Text('작성')
          )
      ],
    );
  }
}

