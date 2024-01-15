// ignore_for_file: sized_box_for_whitespace, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_application_todo/controller/provider.dart';
import 'package:provider/provider.dart';

class Editpage extends StatefulWidget {
  final title;
  final description;
  final id;
  const Editpage(
      {super.key,
      required this.title,
      required this.description,
      required this.id});

  @override
  State<Editpage> createState() => _EditpageState();
}

class _EditpageState extends State<Editpage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    titleController = TextEditingController(text: widget.title);
    descriptionController = TextEditingController(text: widget.description);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YourAlertDialog(),
    );
  }

  AlertDialog YourAlertDialog() {
    final pro = Provider.of<Homeprovider>(context);
    return AlertDialog(
      titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 27, color: Colors.black),
      title: const Text(
        'Add Notes',
        textAlign: TextAlign.center,
      ),
      content: Container(
        height: 230,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: "Title",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                minLines: 5,
                maxLines: 7,
                keyboardType: TextInputType.multiline,
                controller: descriptionController,
                decoration: const InputDecoration(
                  hintText: "Description",
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            pro.edit(
                id: widget.id,
                title: titleController.text,
                description: descriptionController.text);
            Navigator.of(context).pop();
          },
          child: const Text(
            'Save',
            style: TextStyle(color: Colors.black),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
      elevation: 24.0,
      backgroundColor: Colors.grey[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
