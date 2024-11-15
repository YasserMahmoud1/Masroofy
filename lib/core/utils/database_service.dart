import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static Database? _db;
  Future<Database> get db async{
    if(_db != null) return _db!;
    return await dbInit();
  }

  Future<Database> dbInit()async{
    return await openDatabase(
      'masroofy.db',
      version: 1,
      onCreate: (database, version) async {
        await database.execute(
          'CREATE TABLE goals (id INTEGER PRIMARY KEY, title TEXT, is_done BOOLEAN, amount REAL)',
        );
        await database.execute(
            'CREATE TABLE categories (id INTEGER PRIMARY KEY,title TEXT, color TEXT, icon INTEGER, is_income_category BOOLEAN)');
        await database.execute(
            'CREATE TABLE transactions (id INTEGER PRIMARY KEY, category_id INTEGER, date TEXT, amount NUMERIC, is_income_transaction BOOLEAN)');
        print('database created');
      },
      onOpen: (database) {
        print('database opened');
      },
    );
  }
}
