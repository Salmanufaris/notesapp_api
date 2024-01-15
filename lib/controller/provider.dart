// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_todo/model/model.dart';
import 'package:flutter_application_todo/service/service.dart';

class Homeprovider extends ChangeNotifier {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  List<Model> noteList = [];

  Future<void> loadnotes() async {
    try {
      List<Model> notes = await ApiService().fetchApi();
      noteList = notes;
    } catch (error) {
      print("Error loading notes: $error");
    }
    notifyListeners();
  }

  void addnotes() async {
    final name = titleController.text;
    final description = descriptionController.text;
    await ApiService()
        .createnotes(Model(title: name, description: description, id: ""));
    loadnotes();
    titleController.text = "";
    descriptionController.text = "";

    notifyListeners();
  }

  deletenotes({required id}) async {
    await ApiService().delete(id: id);
    loadnotes();
    notifyListeners();
  }

  edit(
      {required id, required String title, required String description}) async {
    final toModel = Model(title: title, description: description, id: id);
    await ApiService().editNotes(value: toModel, id: id);
    notifyListeners();
  }
}
