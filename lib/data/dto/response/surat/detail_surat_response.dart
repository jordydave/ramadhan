import 'package:ramadhan_app/data/dto/response/generic.dart';

class DetailSuratResponse extends Generic {
  final ItemDetailSuratResponse dataSurat;

  DetailSuratResponse({
    ItemDetailSuratResponse? dataSurat,
  }) : dataSurat = dataSurat ?? ItemDetailSuratResponse();

  factory DetailSuratResponse.fromJson(Map<String, dynamic> json) {
    return DetailSuratResponse(
      dataSurat: ItemDetailSuratResponse.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': dataSurat.toJson(),
    };
  }
}

class ItemDetailSuratResponse {
  final int nomor;
  final String nama;
  final String namaLatin;
  final int jumlahAyat;
  final String tempatTurun;
  final String arti;
  final String deskripsi;
  final DetailAudioSuratResponse audioFull;
  final List<DetailAyatSuratResponse> ayat;
  final dynamic suratSelanjutnya;
  final dynamic suratSebelumnya;

  ItemDetailSuratResponse({
    this.nomor = 0,
    this.nama = '',
    this.namaLatin = '',
    this.jumlahAyat = 0,
    this.tempatTurun = '',
    this.arti = '',
    this.deskripsi = '',
    DetailAudioSuratResponse? audioFull,
    List<DetailAyatSuratResponse>? ayat,
    this.suratSelanjutnya,
    this.suratSebelumnya,
  })  : audioFull = audioFull ?? DetailAudioSuratResponse(),
        ayat = ayat ?? [];

  factory ItemDetailSuratResponse.fromJson(Map<String, dynamic> json) {
    return ItemDetailSuratResponse(
      nomor: json['nomor'] ?? 0,
      nama: json['nama'] ?? '',
      namaLatin: json['namaLatin'] ?? '',
      jumlahAyat: json['jumlahAyat'] ?? 0,
      tempatTurun: json['tempatTurun'] ?? '',
      arti: json['arti'] ?? '',
      deskripsi: json['deskripsi'] ?? '',
      audioFull: DetailAudioSuratResponse.fromJson(json['audioFull']),
      ayat: (json['ayat'] as List)
          .map((e) => DetailAyatSuratResponse.fromJson(e))
          .toList(),
      suratSelanjutnya: json['suratSelanjutnya'] is bool
          ? json['suratSelanjutnya']
          : NextPrevSuratResponse.fromJson(json['suratSelanjutnya']),
      suratSebelumnya: json['suratSebelumnya'] is bool
          ? json['suratSebelumnya']
          : NextPrevSuratResponse.fromJson(json['suratSebelumnya']),
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
      'ayat': ayat.map((e) => e.toJson()).toList(),
      'suratSelanjutnya': suratSelanjutnya is NextPrevSuratResponse
          ? (suratSelanjutnya as NextPrevSuratResponse).toJson()
          : suratSelanjutnya,
      'suratSebelumnya': suratSebelumnya is NextPrevSuratResponse
          ? (suratSebelumnya as NextPrevSuratResponse).toJson()
          : suratSebelumnya,
    };
  }
}

class DetailAudioSuratResponse {
  final String first;
  final String second;
  final String third;
  final String fourth;
  final String fifth;

  DetailAudioSuratResponse({
    this.first = '',
    this.second = '',
    this.third = '',
    this.fourth = '',
    this.fifth = '',
  });

  factory DetailAudioSuratResponse.fromJson(Map<String, dynamic> json) {
    return DetailAudioSuratResponse(
      first: json['01'] ?? '',
      second: json['02'] ?? '',
      third: json['03'] ?? '',
      fourth: json['04'] ?? '',
      fifth: json['05'] ?? '',
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

class DetailAyatSuratResponse {
  final int nomorAyat;
  final String teksArab;
  final String teksLatin;
  final String teksIndonesia;
  final DetailAudioSuratResponse audio;

  DetailAyatSuratResponse({
    this.nomorAyat = 0,
    this.teksArab = '',
    this.teksLatin = '',
    this.teksIndonesia = '',
    audio,
  }) : audio = audio ?? DetailAudioSuratResponse();

  factory DetailAyatSuratResponse.fromJson(Map<String, dynamic> json) {
    return DetailAyatSuratResponse(
      nomorAyat: json['nomorAyat'] ?? 0,
      teksArab: json['teksArab'] ?? '',
      teksLatin: json['teksLatin'] ?? '',
      teksIndonesia: json['teksIndonesia'] ?? '',
      audio: DetailAudioSuratResponse.fromJson(json['audio']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nomorAyat': nomorAyat,
      'teksArab': teksArab,
      'teksLatin': teksLatin,
      'teksIndonesia': teksIndonesia,
      'audio': audio.toJson(),
    };
  }
}

class NextPrevSuratResponse {
  final int nomor;
  final String nama;
  final String namaLatin;
  final int jumlahAyat;

  NextPrevSuratResponse({
    this.nomor = 0,
    this.nama = '',
    this.namaLatin = '',
    this.jumlahAyat = 0,
  });

  factory NextPrevSuratResponse.fromJson(Map<String, dynamic> json) {
    return NextPrevSuratResponse(
      nomor: json['nomor'] ?? 0,
      nama: json['nama'] ?? '',
      namaLatin: json['namaLatin'] ?? '',
      jumlahAyat: json['jumlahAyat'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nomor': nomor,
      'nama': nama,
      'namaLatin': namaLatin,
      'jumlahAyat': jumlahAyat,
    };
  }
}
