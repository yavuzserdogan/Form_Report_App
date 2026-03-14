import 'package:sqflite/sqflite.dart';
import 'package:form_report_app/data/models/service_number_model.dart';
import 'service_number_local_data_source.dart';
import '../../../core/errors/exceptions.dart';

const String tableServiceNumbers = 'service_numbers';

class ServiceNumberLocalDataSourceImpl implements ServiceNumberLocalDataSource {
  final Database database;

  ServiceNumberLocalDataSourceImpl({required this.database});

  @override
  Future<int> insertServiceNumber(ServiceNumberModel serviceNumber) async {
    try {
      return await database.insert(
        tableServiceNumbers,
        serviceNumber.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } on DatabaseException {
      throw CacheException();
    }
  }

  @override
  Future<List<ServiceNumberModel>> getServiceNumbers() async {
    try {
      final List<Map<String, dynamic>> maps = await database.query(
        tableServiceNumbers,
      );

      return List.generate(maps.length, (i) => ServiceNumberModel.fromJson(maps[i]));
    } on DatabaseException {
      throw CacheException();
    }
  }

  @override
  Future<void> updateServiceNumber(ServiceNumberModel serviceNumber) async {
    try {
      await database.update(
        tableServiceNumbers,
        serviceNumber.toJson(),
        where: 'id = ?',
        whereArgs: [serviceNumber.id],
      );
    } on DatabaseException {
      throw CacheException();
    }
  }

  @override
  Future<void> deleteServiceNumber(int id) async {
    try {
      await database.delete(tableServiceNumbers, where: 'id = ?', whereArgs: [id]);
    } on DatabaseException {
      throw CacheException();
    }
  }
}
