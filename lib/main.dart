import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'main-page.dart';

const String appTitle = 'Akatsuki';
const Color losiColor = Color.fromARGB(255, 255, 36, 0);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: losiColor),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const Center(
          child: PostCardList(),
        ),
        bottomNavigationBar: const BottomAppBar(
          child: Row(
            children: [ CreateIconButton(), ],
          )
        ),
      ),
    );
  }
}

class CreateIconButton extends StatelessWidget {
  const CreateIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: Ink(
          decoration: const ShapeDecoration(
            color: losiColor,
            shape: CircleBorder(),
          ),
          child: IconButton(
            icon: const Icon(Icons.create),
            color: Colors.white,
            onPressed: () {
              showDialog(context: context, builder: (context){
                return const CreateDialog();
              });
            },
          ),
        ),
      ),
    );
  }
}

class CreateDialog extends StatefulWidget {
  const CreateDialog({super.key});

  @override
  State<CreateDialog> createState() =>
      _CreateDialogState();
}

class _CreateDialogState extends State<CreateDialog> {
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
            IconButton(
              icon: const Icon(Icons.post_add),
              onPressed: () {
                showDialog(context: context, builder: (context) {
                  return AlertDialog(
                    content: Text(textController.text),
                  );
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
