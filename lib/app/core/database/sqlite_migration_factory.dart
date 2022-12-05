import 'package:jogadores_da_copa/app/core/database/migrations/migration.dart';
import 'package:jogadores_da_copa/app/core/database/migrations/migration_v1.dart';

class SqliteMigrationFactory {
  List<Migration> getCreateMigrations() => [
        MigrationV1(),
      ];

  List<Migration> getUpdateMigrations(int version) => [];
}
