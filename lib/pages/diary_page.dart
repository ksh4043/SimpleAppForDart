import 'package:flutter/material.dart';
import '/widgets/drawer_widget.dart';
import 'package:provider/provider.dart';
import '/pages/home_page.dart';

class DiaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Diary")),
      drawer: MainDrawer(),
      body: DiaryList(),
    );
  }
}

class DiaryList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final diaryState = Provider.of<DiaryState>(context);

    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: diaryState.diaryContents.length,
      itemBuilder: (context, index) {
        final content = diaryState.diaryContents[index];
        return Card(
          child: ListTile(title: Text(content)),
        );
      },
    );
  }
}