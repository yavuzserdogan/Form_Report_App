import '../entities/machine.dart';

abstract class MachineRepository {
  Future<List<Machine>> getMachines(String query);

  Future<int> createMachine(Machine machine);

  Future<void> updateMachine(Machine machine);

  Future<void> deleteMachine(int machineId);
}