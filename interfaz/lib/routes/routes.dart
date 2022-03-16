import 'package:flutter/material.dart';
import 'package:interfaz/screens/fruitapp_screen.dart';
import 'package:interfaz/screens/notes_screen.dart';
import 'package:interfaz/screens/add_note_screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/fruit': (BuildContext context) => FruitApp(),
    '/notes': (BuildContext context) => NotesScreen(),
    '/add': (BuildContext context) => AddNoteScreen(),
  };
}
