import 'package:flutter_storage/models/contact_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static late Database _database;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();
  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  final String _tableName = "contacts";

  Future<Database> _initializeDb() async {
    var db = openDatabase(
      join(await getDatabasesPath(), "contact_db.db"),
      onCreate: (db, version) async {
        await db.execute(
          ''' CREATE TABLE $_tableName (id INTEGER PRIMARY KEY, name TEXT, phone TEXT) ''',
        );
      },
      version: 1,
    );
    return db;
  }

  Future<void> insertContact(ContactModel contact) async {
    final Database db = await database;
    await db.insert(_tableName, contact.toMap());
  }

  Future<List<ContactModel>> getContacts() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(_tableName);
    return results.map((e) => ContactModel.fromMap(e)).toList();
  }

  Future<ContactModel> getContactById(int id) async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    return results.map((e) => ContactModel.fromMap(e)).first;
  }

  Future<void> updateContact(ContactModel contact) async {
    final Database db = await database;
    await db.update(
      _tableName,
      contact.toMap(),
      where: 'id = ?',
      whereArgs: [contact.id],
    );
  }

  Future<void> deleteContact(int id) async {
    final Database db = await database;
    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
