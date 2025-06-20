import 'package:flutter/material.dart';
import '/pages/notes_page.dart';
import 'package:notes/models/note_database.dart';
import 'package:provider/provider.dart';

void main() async {

WidgetsFlutterBinding.ensureInitialized();
await NoteDatabase.initialize();

  runApp(
    ChangeNotifierProvider(
      create: (context) => NoteDatabase(),
      child: const MyApp(),
    ),
  );
}

//initialize note isar database



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotesPage(),
    );
  }
}