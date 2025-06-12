import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'note.dart';
import 'package:flutter/material.dart';


class NoteDatabase extends ChangeNotifier {
  static late Isar isar;

  //initialize databaes
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [NoteSchema],
      directory: dir.path,
    );
  }
  //notes list
  final List<Note> currentNotes = [];

  //create
  Future<void> addNote(String textFromUser) async {
    final newNote = Note()..text = textFromUser;

    await isar.writeTxn(() => isar.notes.put(newNote));


  }
  
  //read
  Future<void> fetchNotes() async {
    List<Note> fetchedNotes = await isar.notes.where().findAll();
    currentNotes.clear();
    currentNotes.addAll(fetchedNotes);

    notifyListeners();
  }
  
  //update
  Future<void> updateNote(int id, String newText) async {
    final existingNote = await isar.notes.get(id);
    if (existingNote != null) {
      existingNote.text = newText;
      await isar.writeTxn(() => isar.notes.put(existingNote));
      await fetchNotes();
    }
  }

  //delete

  }
