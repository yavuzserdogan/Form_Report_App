import '../entities/company.dart';
import '../entities/machine.dart';
import '../entities/service_number.dart';
import '../repositories/company_repository.dart';
import '../repositories/machine_repository.dart';
import '../repositories/service_number_repository.dart';
import '../../core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class CreateInventory {
  final CompanyRepository companyRepository;
  final MachineRepository machineRepository;
  final ServiceNumberRepository serviceNumberRepository;

  CreateInventory({
    required this.companyRepository,
    required this.machineRepository,
    required this.serviceNumberRepository,
  });

  Future<Either<Failure, Unit>> call({
    required String companyName,
    required String machineName,
    required String serviceNumber,
  }) async {
    final companyResult = await companyRepository.createCompany(
      Company(name: companyName),
    );

    return companyResult.fold((failure) => Left(failure), (companyId) async {
      final machineResult = await machineRepository.createMachine(
        Machine(name: machineName, companyId: companyId),
      );

      return machineResult.fold((failure) => Left(failure), (machineId) async {
        final serviceResult = await serviceNumberRepository.createServiceNumber(
          ServiceNumber(machineId: machineId, serialCode: serviceNumber),
        );

        return serviceResult.fold(
          (failure) => Left(failure),
          (_) => const Right(unit),
        );
      });
    });
  }
}
