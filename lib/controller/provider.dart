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

    notifyListeners();
  }

  deletenotes({required id}) async {
    await ApiService().delete(id: id);
    loadnotes();
    notifyListeners();
  }

  updatenotes({required id}) async {
    var titleEdit = titleController.text;
    var descriptionEdit = descriptionController.text;

    await ApiService().editnotes(
      id: id,
      value: Model(title: titleEdit, description: descriptionEdit, id: id),
    );

    // After updating the note, fetch the updated list of notes
    await loadnotes();

    notifyListeners();
  }
}
