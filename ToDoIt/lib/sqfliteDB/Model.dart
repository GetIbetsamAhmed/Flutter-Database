import 'package:sqflite/sqflite.dart';

class TaskModel {
  late int? _id; // ID of the object -> Primary Key
  late String _title; // this is the basic title of the task
  late String? _desciption; //
  late DateTime _startingDate;
  late DateTime _endingDate;

  // --------------------------------------
  //            Constructors
  // --------------------------------------

  TaskModel(this._title, this._startingDate, this._endingDate,
      [this._desciption]);

  TaskModel.withId(this._id, this._title, this._startingDate, this._endingDate,
      [this._desciption]);

  // --------------------------------------
  //               Getters
  // --------------------------------------

  // getting id
  int get id => _id!;

  // getting title
  String get title => _title;

  // getting description
  String get desciption => _desciption!;

  // getting starting date of the task
  DateTime get startingDate => _startingDate;

  // getting ending date of the task
  DateTime get endingDate => _endingDate;

  // ---------------------------------------
  //                Setters
  // ---------------------------------------

  // title setter
  set title(String taskTitle) {
    _title = taskTitle;
  }

  // description setter
  set description(String? taskDescription) {
    if (taskDescription != null) {
      _desciption = taskDescription;
    }
  }

  // starting-date setter
  set startingDate(DateTime taskStartingDate) {
    _startingDate = taskStartingDate;
  }

  // ending-date setter
  set endingDate(DateTime taskEndingDate) {
    _endingDate = taskEndingDate;
  }

  // A function to convert the stored data in map object

  Map<String, dynamic> toMap() {
    // The Map to be returned
    return {
      'id': _id!,
      'title': _title,
      'description': _desciption,
      'startingDate': _startingDate,
      'endingDate': _endingDate,
    };
  }

  // A function to convert the data retreived from the DB to the object
  TaskModel.fromMapObject(Map<String, dynamic> taskMap) {
    _id = taskMap['id']!;
    _title = taskMap['title'];
    _desciption = taskMap['description']!;
    _startingDate = taskMap['startingDate'];
    _endingDate = taskMap['endingDate'];
  }
}
