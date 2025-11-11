import 'package:debtrak/core/utils/constants.dart';

class NotesModel {
  final String title;
  final String note;
  final String datePosted;
  NoteStatus status;

  NoteStatus get noteStatus => status;

  NotesModel({
    required this.title,
    required this.note,
    required this.datePosted,
    required this.status,
  });
}
