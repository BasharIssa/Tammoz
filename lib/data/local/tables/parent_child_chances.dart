import 'package:drift/drift.dart';
import 'package:local_tammoz_chat/data/local/tables/chances.dart';

class ParentChildChancesTable extends Table {
  @ReferenceName('parentChance')
  IntColumn get parentId => integer().references(ChancesTable, #id)();

  @ReferenceName('childChance')
  IntColumn get childId => integer().references(ChancesTable, #id)();

  @override
  Set<Column> get primaryKey => {parentId, childId};
}
