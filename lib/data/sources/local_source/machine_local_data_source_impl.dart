import 'package:sqflite/sqflite.dart';
import 'package:form_report_app/data/models/machine_model.dart';
import 'machine_local_data_source.dart';
import '../../../core/errors/exceptions.dart';

const String tableMachines = 'machines';

class MachineLocalDataSourceImpl implements MachineLocalDataSource {
  final Database database;

  MachineLocalDataSourceImpl({required this.database});

  @override
  Future<void> insertMachine(MachineModel machine) async {
    try {
      await database.insert(
        tableMachines,
        machine.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } on DatabaseException {
      throw CacheException();
    }
  }

  @override
  Future<List<MachineModel>> getMachines() async {
    try {
      final List<Map<String, dynamic>> maps = await database.query(
        tableMachines,
      );

      return List.generate(maps.length, (i) => MachineModel.fromJson(maps[i]));
    } on DatabaseException {
      throw CacheException();
    }
  }

  @override
  Future<void> updateMachine(MachineModel machine) async {
    try {
      await database.update(
        tableMachines,
        machine.toJson(),
        where: 'id = ?',
        whereArgs: [machine.id],
      );
    } on DatabaseException {
      throw CacheException();
    }
  }

  @override
  Future<void> deleteMachine(int id) async {
    try {
      await database.delete(tableMachines, where: 'id = ?', whereArgs: [id]);
    } on DatabaseException {
      throw CacheException();
    }
  }
}
