import 'package:flutter/material.dart';
import 'package:flutter_application_todo/controller/provider.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<Homeprovider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Todo App",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                controller: pro.titleController,
                decoration: const InputDecoration(hintText: "Title"),
              ),
              TextFormField(
                controller: pro.descriptionController,
                decoration: const InputDecoration(hintText: "Description"),
                maxLength: 5,
                maxLines: 5,
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    pro.addnotes();
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(color: Colors.black),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
