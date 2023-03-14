class Data {
  String _nama = "";
  String _skor = "";
  String _jenis = "";
  double _imbalHasil = 0.00;
  String _hargaUnit = "";
  String _danaKelolaan = "";

  Data(String nama, String skor, String jenis, double imbalHasil,
      String hargaUnit, String danaKelolaan) {
    _nama = nama;
    _skor = skor;
    _jenis = jenis;
    _imbalHasil = imbalHasil;
    _hargaUnit = hargaUnit;
    _danaKelolaan = danaKelolaan;
  }

  void setNama(String nama) {
    _nama = nama;
  }

  void setSkor(String skor) {
    _skor = skor;
  }

  void setJenis(String jenis) {
    _jenis = jenis;
  }

  void setImbalHasil(double imbalHasil) {
    _imbalHasil = imbalHasil;
  }

  void setHargaUnit(String hargaUnit) {
    _hargaUnit = hargaUnit;
  }

  void setDanaKelolaan(String danaKelolaan) {
    _danaKelolaan = danaKelolaan;
  }

  String getNama() {
    return _nama;
  }

  String getSkor() {
    return _skor;
  }

  String getjenis() {
    return _jenis;
  }

  double getImbalHasil() {
    return _imbalHasil;
  }

  String getHarrgaUnit() {
    return _hargaUnit;
  }

  String getDanaKelolaan() {
    return _danaKelolaan;
  }
}
