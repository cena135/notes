import 'package:isar/isar.dart';

//to generate file
//run : dart run build_runner build
part 'note.g.dart';

@Collection()
class Note {
  Id id = Isar.autoIncrement;
  late String text;
}