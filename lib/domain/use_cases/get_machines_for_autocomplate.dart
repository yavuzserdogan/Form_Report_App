import "../repositories/machine_repository.dart";
import "../entities/machine.dart";

class GetMachinesForAutocomplate {
  final MachineRepository machineRepository;

  GetMachinesForAutocomplate(this.machineRepository);

  Future<List<Machine>> call(String query) async {
    return machineRepository.getMachines(query);
  }
}
