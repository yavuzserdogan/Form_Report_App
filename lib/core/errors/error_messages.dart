import '../../domain/errors/failures.dart';

class ErrorMessages {
  ErrorMessages._();

  /// Presentation: ValidationFailure.code ile mesaj almak için.
  static String forValidation(ValidationFailureCode code) {
    return switch (code) {
      ValidationFailureCode.reportWithoutSignature => reportWithoutSignature,
      ValidationFailureCode.noInternetCannotSend => noInternetCannotSend,
    };
  }

  /// Presentation: Herhangi bir [Failure] için kullanıcıya gösterilecek mesaj.
  static String messageFor(Failure failure) {
    if (failure is ValidationFailure && failure.code != null) {
      return forValidation(failure.code!);
    }
    return failure.message;
  }

  static const String reportWithoutSignature =
      'Müşteri imzası olmadan rapor kaydedilemez.';

  static const String noInternetCannotSend =
      'İnternet bağlantısı yok. Rapor gönderilemedi.';

  //User
  static const String userImplemementError =
      'Mevcut kullanıcı henüz implemente edilmedi.';
  static const String userCreateError =
      'Kullanıcı oluşturma henüz implemente edilmedi.';

  // Company
  static const String companyInsertError = 'Şirket eklenirken bir hata oluştu.';

  static const String companyFetchError =
      'Şirketler listelenirken bir hata oluştu.';

  static const String companyUpdateError =
      'Şirket güncellenirken bir hata oluştu.';

  static const String companyDeleteError = 'Şirket silinirken bir hata oluştu.';

  // Machine
  static const String machineInsertError = 'Makine eklenirken bir hata oluştu.';

  static const String machineFetchError =
      'Makineler listelenirken bir hata oluştu.';

  static const String machineUpdateError =
      'Makine güncellenirken bir hata oluştu.';

  static const String machineDeleteError = 'Makine silinirken bir hata oluştu.';

  // Service Number
  static const String serviceNumberInsertError =
      'Servis numarası eklenirken bir hata oluştu.';
  static const String serviceNumberMatchError =
      'Servis numarası eşleştirilirken bir hata oluştu.';
  static const String serviceNumberFetchError =
      'Servis numaraları listelenirken bir hata oluştu.';
  static const String serviceNumberUpdateError =
      'Servis numarası güncellenirken bir hata oluştu.';
  static const String serviceNumberDeleteError =
      'Servis numarası silinirken bir hata oluştu.';

  // Report
  static const String reportSaveError = 'Rapor kaydedilirken bir hata oluştu.';
  static const String reportFetchError =
      'Raporlar listelenirken bir hata oluştu.';
  static const String reportDeleteError = 'Rapor silinirken bir hata oluştu.';
}
