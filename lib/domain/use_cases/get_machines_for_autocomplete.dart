import "../repositories/machine_repository.dart";
import "../entities/machine.dart";
import '../errors/failures.dart';
import "package:dartz/dartz.dart";

class GetMachinesForAutocomplate {
  final MachineRepository machineRepository;

  GetMachinesForAutocomplate(this.machineRepository);

  Future<Either<Failure, List<Machine>>> call(String query) async {
    return machineRepository.getMachines(query);
  }
}
