class Pegawai {
  String? id;
  String namaPegawai;
  String? nip; 

  Pegawai({this.id, required this.namaPegawai, this.nip}); // Konstruktor untuk membuat objek Pegawai

  String get idPegawai => id!; //mengambil nilai dari properti 'id'
  String get getNip => nip!; //mengambil nilai dari properti 'nip'
  String get tanggalLahir => 'tanggal lahir';//mengambil nilai dari properti 'tanggal_lahir'
  String get nomorTelepon => 'nomor telepon';//mengambil nilai dari properti 'nomor_telepon'
  String get email => 'email';//mengambil nilai dari properti 'email'
  String get password => 'password';//mengambil nilai dari properti 'password'
}