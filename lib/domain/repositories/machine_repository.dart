import '../entities/machine.dart';
import '../../core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class MachineRepository {
  Future<Either<Failure, List<Machine>>> getMachines(String query);

  Future<Either<Failure, int>> createMachine(Machine machine);

  Future<Either<Failure, Unit>> updateMachine(Machine machine);

  Future<Either<Failure, Unit>> deleteMachine(int machineId);
}
