import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';

class DBHelper {
  DBHelper._privateConsructor();
  static final DBHelper instance = DBHelper._privateConsructor();

  static Database? _database;

  Future<Database> get database async => _database??= await _initDatabase();
  Future<Database> _initDatabase() async {
    print("creating database");
    final dbPath = await getDatabasesPath();
    print(dbPath);
    String path = join(dbPath, 'user_places.db');
    print(path);
    return await openDatabase(path, version: 1, onCreate: (db, n) {
      db.execute(
          '''CREATE TABLE user_places( id TEXT PRIMARY KEY, title TEXT, image TEXT)''');
    });
  }

  // Future _oncreate(Database db, int version) async {
  //   await db.execute(
  //       '''CREATE TABLE user_places( id TEXT PRIMARY KEY, title TEXT, image TEXT)''');
  // }

  static Future<int> insertData(String table, Map<String, Object> data) async {
    Database db = await instance.database;
    print("inserting in database$db");

    return await db.insert(table, data);
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    Database db = await instance.database;
    print("fatching in database$db");

    return await db.query(table);
  }
}
