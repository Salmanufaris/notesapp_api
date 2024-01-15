import 'package:flutter/material.dart';
import 'package:flutter_application_todo/controller/provider.dart';
import 'package:flutter_application_todo/views/add.dart';
import 'package:flutter_application_todo/views/edit.dart';
import 'package:provider/provider.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          "Notes App",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AddScreen()),
          );
        },
        label: const Text("Go to add page"),
      ),
      body: Consumer<Homeprovider>(
        builder: (context, pro, child) {
          if (pro.noteList.isEmpty) {
            pro.loadnotes();
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: pro.noteList.length,
              itemBuilder: (context, index) {
                final data = pro.noteList[index];
                return Column(
                  children: [
                    Card(
                      child: ListTile(
                        title: Text(data.title ?? ""),
                        subtitle: Text(data.description ?? ""),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => Editpage(
                                      title: data.title,
                                      description: data.description,
                                      id: data.id,
                                    ),
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.green,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                showDeleteDialog(context, data.id.toString());
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }

  showDeleteDialog(BuildContext context, String id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Delete "),
          content: const Text("Are you sure you want to delete?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "No",
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                Provider.of<Homeprovider>(context, listen: false)
                    .deletenotes(id: id);
                Navigator.of(context).pop();
              },
              child: const Text(
                "Yes",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
