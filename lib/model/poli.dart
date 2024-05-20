class Poli {// Kelas Poli yang mewakili poliklinik dengan ID opsional dan nama wajib
  String? id;// Mendeklarasikan variabel String yang tidak dapat dinullkan untuk ID
  String namaPoli;// Deklarasikan variabel String yang tidak dapat dinullkan untuk nama poliklinik

  Poli({this.id, required this.namaPoli});// Konstruktor untuk kelas Poli yang mengambil ID opsional dan nama wajib
}