class ListSurat {
  List<ItemSurat> dataSurat;

  ListSurat({
    this.dataSurat = const [],
  });

  factory ListSurat.fromJson(Map<String, dynamic> json) {
    return ListSurat(
      dataSurat:
          (json['data'] as List).map((e) => ItemSurat.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': dataSurat.map((e) => e.toJson()).toList(),
    };
  }
}

class ItemSurat {
  int nomor;
  String nama;
  String namaLatin;
  int jumlahAyat;
  String tempatTurun;
  String arti;
  String deskripsi;
  AudioSurat audioFull;

  ItemSurat({
    AudioSurat? audioFull,
    this.nomor = 0,
    this.nama = '',
    this.namaLatin = '',
    this.jumlahAyat = 0,
    this.tempatTurun = '',
    this.arti = '',
    this.deskripsi = '',
  }) : audioFull = audioFull ?? AudioSurat();

  factory ItemSurat.fromJson(Map<String, dynamic> json) {
    return ItemSurat(
      nomor: json['nomor'] ?? 0,
      nama: json['nama'] ?? '',
      namaLatin: json['namaLatin'] ?? '',
      jumlahAyat: json['jumlahAyat'] ?? 0,
      tempatTurun: json['tempatTurun'] ?? '',
      arti: json['arti'] ?? '',
      deskripsi: json['deskripsi'] ?? '',
      audioFull: AudioSurat.fromJson(json['audioFull']),
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

class AudioSurat {
  String first;
  String second;
  String third;
  String fourth;
  String fifth;

  AudioSurat({
    this.first = '',
    this.second = '',
    this.third = '',
    this.fourth = '',
    this.fifth = '',
  });

  factory AudioSurat.fromJson(Map<String, dynamic> json) {
    return AudioSurat(
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
