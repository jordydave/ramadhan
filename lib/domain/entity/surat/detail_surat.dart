class DetailSurat {
  ItemDetailSurat data;

  DetailSurat({
    ItemDetailSurat? data,
  }) : data = data ?? ItemDetailSurat();

  factory DetailSurat.fromJson(Map<String, dynamic> json) {
    return DetailSurat(
      data: ItemDetailSurat.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class ItemDetailSurat {
  int nomor;
  String nama;
  String namaLatin;
  int jumlahAyat;
  String tempatTurun;
  String arti;
  String deskripsi;
  DetailAudioSurat audioFull;
  List<DetailAyatSurat> ayat;
  dynamic suratSelanjutnya;
  dynamic suratSebelumnya;

  ItemDetailSurat({
    this.nomor = 0,
    this.nama = '',
    this.namaLatin = '',
    this.jumlahAyat = 0,
    this.tempatTurun = '',
    this.arti = '',
    this.deskripsi = '',
    DetailAudioSurat? audioFull,
    List<DetailAyatSurat>? ayat,
    this.suratSelanjutnya,
    this.suratSebelumnya,
  })  : audioFull = audioFull ?? DetailAudioSurat(),
        ayat = ayat ?? [];

  factory ItemDetailSurat.fromJson(Map<String, dynamic> json) {
    return ItemDetailSurat(
      nomor: json['nomor'] ?? 0,
      nama: json['nama'] ?? '',
      namaLatin: json['namaLatin'] ?? '',
      jumlahAyat: json['jumlahAyat'] ?? 0,
      tempatTurun: json['tempatTurun'] ?? '',
      arti: json['arti'] ?? '',
      deskripsi: json['deskripsi'] ?? '',
      audioFull: DetailAudioSurat.fromJson(json['audioFull']),
      ayat: List<DetailAyatSurat>.from(
        json['ayat']?.map((x) => DetailAyatSurat.fromJson(x)) ?? [],
      ),
      suratSelanjutnya: json['suratSelanjutnya'] is bool
          ? json['suratSelanjutnya']
          : NextPrevSurat.fromJson(json['suratSelanjutnya']),
      suratSebelumnya: json['suratSebelumnya'] is bool
          ? json['suratSebelumnya']
          : NextPrevSurat.fromJson(json['suratSebelumnya']),
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
      'ayat': ayat.map((x) => x.toJson()).toList(),
      'suratSelanjutnya': suratSelanjutnya is NextPrevSurat
          ? (suratSelanjutnya as NextPrevSurat).toJson()
          : suratSelanjutnya,
      'suratSebelumnya': suratSebelumnya is NextPrevSurat
          ? (suratSebelumnya as NextPrevSurat).toJson()
          : suratSebelumnya,
    };
  }
}

class DetailAudioSurat {
  String first;
  String second;
  String third;
  String fourth;
  String fifth;

  DetailAudioSurat({
    this.first = '',
    this.second = '',
    this.third = '',
    this.fourth = '',
    this.fifth = '',
  });

  factory DetailAudioSurat.fromJson(Map<String, dynamic> json) {
    return DetailAudioSurat(
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

class DetailAyatSurat {
  int nomorAyat;
  String teksArab;
  String teksLatin;
  String teksIndonesia;
  DetailAudioSurat audio;

  DetailAyatSurat({
    DetailAudioSurat? audio,
    this.nomorAyat = 0,
    this.teksArab = '',
    this.teksLatin = '',
    this.teksIndonesia = '',
  }) : audio = audio ?? DetailAudioSurat();

  factory DetailAyatSurat.fromJson(Map<String, dynamic> json) {
    return DetailAyatSurat(
      nomorAyat: json['nomorAyat'] ?? 0,
      teksArab: json['teksArab'] ?? '',
      teksLatin: json['teksLatin'] ?? '',
      teksIndonesia: json['teksIndonesia'] ?? '',
      audio: DetailAudioSurat.fromJson(json['audio']),
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

class NextPrevSurat {
  int nomor;
  String nama;
  String namaLatin;
  int jumlahAyat;

  NextPrevSurat({
    this.nomor = 0,
    this.nama = '',
    this.namaLatin = '',
    this.jumlahAyat = 0,
  });

  factory NextPrevSurat.fromJson(Map<String, dynamic> json) {
    return NextPrevSurat(
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
