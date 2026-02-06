import '../entities/machine.dart';

abstract class MachineRepository {
  Future<List<Machine>> getMachines(int companyId);

  Future<void> createMachine(Machine machine);

  Future<void> updateMachine(Machine machine);

  Future<void> deleteMachine(int machineId);
}