

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final cardList = [];

class PostCardList extends StatefulWidget {
  const PostCardList({super.key});

  @override State<PostCardList> createState() =>
      _PostCardListState();
}

class _PostCardListState extends State<PostCardList> {
  final TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textController.addListener(() {
      final String text = textController.text;
      textController.value = textController.value.copyWith(
        text: text,
        selection:
        TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return cardList[index];
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: cardList.length,
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openDialog,
        child: const Icon(Icons.add),
      ),
    );
  }

  void openDialog() {
    showDialog(context: context, builder: (context) {
      return Dialog(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: textController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                minLines: 10,
                maxLines: 20,
                keyboardType: TextInputType.multiline,
              ),
              IconButton(onPressed: () {
                setState(() {
                  cardList.add(PostCard(
                      title: 'title',
                      message: textController.text
                  ));
                });
                textController.clear();
                Navigator.pop(context);
              }, icon: const Icon(Icons.post_add),
              ),
            ],
          )
        ),
      );
    });
  }
}

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.title,
    required this.message,
  });

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(title),
          ),
          Center(
            child: Text(message),
          ),
        ],
      )
    );
  }
}