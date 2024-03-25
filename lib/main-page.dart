

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final cardList = [];

class PostCardList extends StatefulWidget {
  const PostCardList({super.key});

  @override State<PostCardList> createState() =>
      _PostCardListState();
}

class _PostCardListState extends State<PostCardList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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
        onPressed: addItem,
        child: const Icon(Icons.add),
      ),
    );
  }

  void addItem() {
    setState(() {
      cardList.add(const PostCard(
        title: 'title',
        message: 'message',
      ));
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