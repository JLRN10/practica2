import 'package:flutter/material.dart';
import 'package:interfaz/database/database_notas.dart';
import 'package:interfaz/models/notes_model.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  var txtTitleController = TextEditingController();
  var txtDscController = TextEditingController();
  late DatabaseNotes dbNotes;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbNotes = DatabaseNotes(); //Inicializa la conexion a la base de datos
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
      ),
      body: ListView(children: [
        _createTextFieldTitle(),
        SizedBox(height: 5),
        _createTextFieldDesc(),
        SizedBox(height: 5),
        _createButtonSave()
      ]),
    );
  }

  Widget _createTextFieldTitle() {
    return TextField(
        keyboardType: TextInputType.text,
        controller: txtTitleController,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))));
  }

  Widget _createTextFieldDesc() {
    return TextField(
        keyboardType: TextInputType.text,
        controller: txtDscController,
        maxLines: 8,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))));
  }

  Widget _createButtonSave() {
    return ElevatedButton(
      child: Text('Save Note'),
      onPressed: () {
        NotesDAO objNote = NotesDAO(
            titulo: txtTitleController.text, dscNota: txtDscController.text);
        dbNotes.insertar(objNote.toMap()).then((value) {
          if (value > 0) {
            Navigator.pop(context);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Error al insertar "))
            );
          }
        });
      },
    );
  }
}
