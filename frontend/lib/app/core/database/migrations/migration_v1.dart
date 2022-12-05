import 'package:jogadores_da_copa/app/core/database/migrations/migration.dart';
import 'package:sqflite/sqflite.dart';

class MigrationV1 extends Migration {
  @override
  void create(Batch batch) {
    batch.execute('''
      CREATE TABLE player (
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        name TEXT NOT NULL, 
        age INTEGER NOT NULL, 
        dateOfBirth TEXT, 
        placeOfBirth TEXT, 
        nationality TEXT NOT NULL, 
        height TEXT, 
        weight TEXT, 
        photoUrl TEXT
      )
    ''');
  }

  @override
  void update(Batch batch) {}
}
