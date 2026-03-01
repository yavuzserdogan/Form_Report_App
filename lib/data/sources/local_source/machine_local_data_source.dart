import 'package:form_report_app/data/models/machine_model.dart';

abstract class MachineLocalDataSource {
  Future<void> insertMachine(MachineModel machine);

  Future<void> getMachines();

  Future<void> updateMachine(MachineModel machine);

  Future<void> deleteMachine(int id);
}
