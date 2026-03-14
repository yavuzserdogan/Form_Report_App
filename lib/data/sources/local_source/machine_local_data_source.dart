import 'package:form_report_app/data/models/machine_model.dart';

abstract class MachineLocalDataSource {
  Future<int> insertMachine(MachineModel machine);

  Future<List<MachineModel>> getMachines();

  Future<void> updateMachine(MachineModel machine);

  Future<void> deleteMachine(int id);
}
