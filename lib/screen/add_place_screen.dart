import 'package:flutter/material.dart';
import 'package:note_the_place/providers/note_places.dart';
import 'dart:io';
import 'package:provider/provider.dart';

import '../widgets/image_input.dart';

class AddPlaceScree extends StatefulWidget {
  const AddPlaceScree({Key? key}) : super(key: key);
  static const routeName = '/add-place';
  @override
  _AddPlaceScreeState createState() => _AddPlaceScreeState();
}

class _AddPlaceScreeState extends State<AddPlaceScree> {
  final _titleController = TextEditingController();

  File? _imagePicked;

  void _selectImage(File imagePicker) {
    _imagePicked = imagePicker;
  }

  void _savePlace() {
    if (_titleController.text.isEmpty || _imagePicked == null) {
      return;
    }
    Provider.of<NotePlaces>(context, listen: false)
        .addPlace(_titleController.text, _imagePicked!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new place'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    // const Text("User Input..."),
                    TextField(
                      decoration: const InputDecoration(labelText: 'Title'),
                      controller: _titleController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ImageInput(_selectImage),

                    // TextField(),
                    // TextField(),
                    // TextField(),
                  ],
                ),
              ),
            )),
            ElevatedButton.icon(
                onPressed: _savePlace,
                icon: const Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                label: const Text(
                  "Add place",
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }
}
