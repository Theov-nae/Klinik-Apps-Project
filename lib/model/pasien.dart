class Pasien {
  String? id;
  String namaPasien;

  Pasien({this.id, required this.namaPasien});// Konstruktor untuk membuat objek Pasien

  get idPasien => 'id';// mengambil nilai dari properti 'id'
  get nomor_rm => 'nomor rm';//mengambil nilai dari properti 'nomor\_rm'
  get tanggal_lahir => 'tanggal lahir';//mengambil nilai dari properti 'tanggal\_lahir'
  get nomor_telepon => 'nomor telepon';//mengambil nilai dari properti 'nomor\_telepon'
  get alamat => 'alamat';//mengambil nilai dari properti 'alamat'
}