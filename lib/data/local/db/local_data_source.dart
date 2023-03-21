import 'package:drift/drift.dart';
import 'package:twse_info_flutter/data/local/db/app_database.dart';

part 'local_data_source.g.dart';

@DataClassName('CompanyEntity')
class CompanyEntities extends Table {
  TextColumn get id => text().nullable()(); // 公司代號
  TextColumn get name => text().nullable()(); // 公司名稱
  TextColumn get abbr => text().nullable()(); // 公司簡稱
  TextColumn get industry => text().nullable()(); // 產業別
  TextColumn get establishmentDate => text().nullable()(); // 成立日期
  TextColumn get listedDate => text().nullable()(); // 上市日期
  TextColumn get chairman => text().nullable()(); // 董事長
  TextColumn get generalManager => text().nullable()(); // 總經理
  TextColumn get switchboardPhone => text().nullable()(); // 總機電話
  TextColumn get address => text().nullable()(); // 地址
  TextColumn get unifiedNumber => text().nullable()(); // 營利事業統一編號
  TextColumn get paidInCapital => text().nullable()(); // 實收資本額
  TextColumn get specialStock => text().nullable()(); // 特別股
  TextColumn get parValue => text().nullable()(); // 普通股每股面額
  TextColumn get url => text().nullable()(); // 網址

  @override
  Set<Column> get primaryKey => {id};
}

abstract class FavouriteLocalDataSource {
  Future<CompanyEntity?> getById(String id);
  Future<List<CompanyEntity>> getAllCompany();
  Stream<List<CompanyEntity>> watchAllCompany();
  Future<int> insertCompany(CompanyEntity company);
  Future<int> deleteCompany(String id);

  factory FavouriteLocalDataSource(AppDatabase db) {
    return FavouriteEntityDao(db);
  }
}

@DriftAccessor(tables: [CompanyEntities])
class FavouriteEntityDao extends DatabaseAccessor<AppDatabase>
    with _$CompanyEntityDaoMixin
    implements FavouriteLocalDataSource {
  final AppDatabase db;

  FavouriteEntityDao(this.db) : super(db);

  @override
  Future<int> deleteCompany(String id) {
    return (delete(companyEntities)..where((t) => t.id.isSmallerThanValue(id))).go();
  }

  @override
  Future<List<CompanyEntity>> getAllCompany() {
    return select(companyEntities).get();
  }

  @override
  Future<int> insertCompany(CompanyEntity entity) {
    return into(companyEntities).insert(entity);
  }

  @override
  Stream<List<CompanyEntity>> watchAllCompany() {
    return select(companyEntities).watch();
  }

  @override
  Future<CompanyEntity?> getById(String id) {
    return (select(companyEntities)..where((tbl) => tbl.id.equals(id))).getSingle();
  }
}
