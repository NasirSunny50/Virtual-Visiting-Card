import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as Path;
import 'package:virtual_visiting_card/model/contact_model.dart';

class DBHelper{
  static const _createTableContact = '''create table $tblContact(
  $tblContactColId integer primary key autoincrement,
  $tblContactColName text,
  $tblContactColCompanyName text,
  $tblContactColDesignation text,
  $tblContactColAddress text,
  $tblContactColMobile text,
  $tblContactColEmail text,
  $tblContactColWebsite text,
  $tblContactColFavourite integer)''';

  static Future<Database> open() async{
    final root = await getDatabasesPath();
    final dbPath = Path.join(root, 'contact.db');
    return openDatabase(dbPath, version: 1, onCreate: (db, version){
      db.execute(_createTableContact);
    });
  }

  static Future<int> insertContact(ContactModel contactModel) async{
    final db = await open();
    return db.insert(tblContact, contactModel.toMap());
  }
}