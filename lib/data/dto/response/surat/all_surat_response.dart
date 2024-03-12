import 'package:ramadhan_app/data/dto/response/generic.dart';

class ListSuratResponse extends Generic {
  final List<AllSuratResponse> dataSurat;

  ListSuratResponse({
    this.dataSurat = const [],
  });

  factory ListSuratResponse.fromJson(Map<String, dynamic> json) {
    return ListSuratResponse(
      dataSurat: (json['data'] as List)
          .map((e) => AllSuratResponse.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': dataSurat.map((e) => e.toJson()).toList(),
    };
  }
}

class AllSuratResponse {
  final int nomor;
  final String nama;
  final String namaLatin;
  final int jumlahAyat;
  final String tempatTurun;
  final String arti;
  final String deskripsi;
  final AudioSuratResponse audioFull;

  AllSuratResponse({
    this.nomor = 0,
    this.nama = '',
    this.namaLatin = '',
    this.jumlahAyat = 0,
    this.tempatTurun = '',
    this.arti = '',
    this.deskripsi = '',
    AudioSuratResponse? audioFull,
  }) : audioFull = audioFull ?? AudioSuratResponse();

  factory AllSuratResponse.fromJson(Map<String, dynamic> json) {
    return AllSuratResponse(
      nomor: json['nomor'] ?? 0,
      nama: json['nama'] ?? '',
      namaLatin: json['namaLatin'] ?? '',
      jumlahAyat: json['jumlahAyat'] ?? 0,
      tempatTurun: json['tempatTurun'] ?? '',
      arti: json['arti'] ?? '',
      deskripsi: json['deskripsi'] ?? '',
      audioFull: AudioSuratResponse.fromJson(json['audioFull']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nomor': nomor,
      'nama': nama,
      'namaLatin': namaLatin,
      'jumlahAyat': jumlahAyat,
      'tempatTurun': tempatTurun,
      'arti': arti,
      'deskripsi': deskripsi,
      'audioFull': audioFull.toJson(),
    };
  }
}

class AudioSuratResponse {
  final String first;
  final String second;
  final String third;
  final String fourth;
  final String fifth;

  AudioSuratResponse({
    this.first = '',
    this.second = '',
    this.third = '',
    this.fourth = '',
    this.fifth = '',
  });

  factory AudioSuratResponse.fromJson(Map<String, dynamic> json) {
    return AudioSuratResponse(
      first: json['01'],
      second: json['02'],
      third: json['03'],
      fourth: json['04'],
      fifth: json['05'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '01': first,
      '02': second,
      '03': third,
      '04': fourth,
      '05': fifth,
    };
  }
}
