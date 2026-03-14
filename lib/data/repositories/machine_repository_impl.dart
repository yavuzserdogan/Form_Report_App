import 'package:dartz/dartz.dart';
import '../../core/errors/exceptions.dart';
import '../../domain/errors/failures.dart';
import '../../core/errors/error_messages.dart';
import '../../data/models/machine_model.dart';
import '../../data/sources/local_source/machine_local_data_source.dart';
import '../../domain/entities/machine.dart';
import '../../domain/repositories/machine_repository.dart';

class MachineRepositoryImpl implements MachineRepository {
  final MachineLocalDataSource _localDataSource;

  MachineRepositoryImpl(this._localDataSource);

  @override
  Future<Either<Failure, List<Machine>>> getMachines(String query) async {
    try {
      final models = await _localDataSource.getMachines();
      final filtered = query.trim().isEmpty
          ? models
          : models
                .where(
                  (m) =>
                      m.name.toLowerCase().contains(query.trim().toLowerCase()),
                )
                .toList();
      return Right(filtered);
    } on CacheException {
      return const Left(CacheFailure(ErrorMessages.machineFetchError));
    }
  }

  @override
  Future<Either<Failure, int>> createMachine(Machine machine) async {
    try {
      final model = MachineModel.fromEntity(machine);
      final id = await _localDataSource.insertMachine(model);
      return Right(id);
    } on CacheException {
      return const Left(CacheFailure(ErrorMessages.machineInsertError));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateMachine(Machine machine) async {
    try {
      final model = MachineModel.fromEntity(machine);
      if (model.id == null) {
        return const Left(ValidationFailure.withMessage(ErrorMessages.machineUpdateError));
      }
      await _localDataSource.updateMachine(model);
      return const Right(unit);
    } on CacheException {
      return const Left(CacheFailure(ErrorMessages.machineUpdateError));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteMachine(int machineId) async {
    try {
      await _localDataSource.deleteMachine(machineId);
      return const Right(unit);
    } on CacheException {
      return const Left(CacheFailure(ErrorMessages.machineDeleteError));
    }
  }
}
