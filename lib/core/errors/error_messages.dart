class ErrorMessages {
  ErrorMessages._();

  static const String reportWithoutSignature =
      'Müşteri imzası olmadan rapor kaydedilemez.';

  static const String noInternetCannotSend =
      'İnternet bağlantısı yok. Rapor gönderilemedi.';

  static const String companyInsertError = 'Şirket eklenirken bir hata oluştu.';

  static const String companyFetchError =
      'Şirketler listelenirken bir hata oluştu.';

  static const String companyUpdateError =
      'Şirket güncellenirken bir hata oluştu.';

  static const String companyDeleteError = 'Şirket silinirken bir hata oluştu.';
}
