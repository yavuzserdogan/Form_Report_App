import '../entities/company.dart';
import '../entities/machine.dart';
import '../entities/service_number.dart';

import '../repositories/company_repository.dart';
import '../repositories/machine_repository.dart';
import '../repositories/service_number_repository.dart';

class CreateInventory {
  final CompanyRepository companyRepository;
  final MachineRepository machineRepository;
  final ServiceNumberRepository serviceNumberRepository;

  CreateInventory({
    
    required this.companyRepository,
    required this.machineRepository,
    required this.serviceNumberRepository,
  });

  Future<void> call({
    required String companyName,
    required String machineName,
    required String serviceNumber,
  }) async {
    final companyId = await companyRepository.createCompany(Company(name: companyName));  
    final machineId = await machineRepository.createMachine(Machine(name: machineName, companyId: companyId));
    final serviceId = await serviceNumberRepository.createServiceNumber(ServiceNumber(machineId: machineId, serialCode: serviceNumber));
  }
}
