enum PilihanTangan { batu, gunting, kertas, netral }

class LeaderBoardModel {
  int? waktu;
  PilihanTangan? pilihanTanganPlayer;
  PilihanTangan? pilihanTanganComputer;
  String? hasil;

  LeaderBoardModel({
    this.waktu,
    this.pilihanTanganPlayer,
    this.pilihanTanganComputer,
    this.hasil,
  });
}
