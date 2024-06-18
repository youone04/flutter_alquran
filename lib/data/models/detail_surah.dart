
import 'dart:convert';

DetailSurah detailSurahFromJson(String str) => DetailSurah.fromJson(json.decode(str));

String detailSurahToJson(DetailSurah data) => json.encode(data.toJson());

class DetailSurah {
    int? number;
    int? sequence;
    int? numberOfVerses;
    Name? name;
    Revelation? revelation;
    DetailSurahTafsir? tafsir;
    PreBismillah? preBismillah;
    List<Verse> verses;

    DetailSurah({
        required this.number,
        required this.sequence,
        required this.numberOfVerses,
        required this.name,
        required this.revelation,
        required this.tafsir,
        required this.preBismillah,
        required this.verses,
    });

    factory DetailSurah.fromJson(Map<String, dynamic> json) => DetailSurah(
        number: json["number"],
        sequence: json["sequence"],
        numberOfVerses: json["numberOfVerses"],
        name: Name.fromJson(json["name"]),
        revelation: Revelation.fromJson(json["revelation"]),
        tafsir: DetailSurahTafsir.fromJson(json["tafsir"]),
        preBismillah: PreBismillah.fromJson(json["preBismillah"]),
        verses: json?["verses"] == null? []: List<Verse>.from(json["verses"].map((x) => Verse.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "number": number,
        "sequence": sequence,
        "numberOfVerses": numberOfVerses,
        "name": name?.toJson(),
        "revelation": revelation?.toJson(),
        "tafsir": tafsir?.toJson(),
        "preBismillah": preBismillah?.toJson(),
        "verses": verses == null? []: List<dynamic>.from(verses.map((x) => x.toJson())),
    };
}

class Name {
    String? short;
    String? long;
    Translation? transliteration;
    Translation? translation;

    Name({
        required this.short,
        required this.long,
        required this.transliteration,
        required this.translation,
    });

    factory Name.fromJson(Map<String, dynamic>? json) => Name(
        short: json?["short"],
        long: json?["long"],
        transliteration: Translation.fromJson(json?["transliteration"]),
        translation: Translation.fromJson(json?["translation"]),
    );

    Map<String, dynamic> toJson() => {
        "short": short,
        "long": long,
        "transliteration": transliteration?.toJson(),
        "translation": translation?.toJson(),
    };
}

class Translation {
    String? en;
    String? id;

    Translation({
        required this.en,
        required this.id,
    });

    factory Translation.fromJson(Map<String, dynamic>? json) => Translation(
        en: json?["en"],
        id: json?["id"],
    );

    Map<String, dynamic> toJson() => {
        "en": en,
        "id": id,
    };
}

class PreBismillah {
    TextData? text;
    Translation? translation;
    Audio? audio;

    PreBismillah({
        required this.text,
        required this.translation,
        required this.audio,
    });

    factory PreBismillah.fromJson(Map<String, dynamic>? json) => PreBismillah(
        text: TextData.fromJson(json?["text"]),
        translation: Translation.fromJson(json?["translation"]),
        audio: Audio.fromJson(json?["audio"]),
    );

    Map<String, dynamic> toJson() => {
        "text": text?.toJson(),
        "translation": translation?.toJson(),
        "audio": audio?.toJson(),
    };
}

class Audio {
    String? primary;
    List<String>? secondary;

    Audio({
        required this.primary,
        required this.secondary,
    });

    factory Audio.fromJson(Map<String, dynamic>? json) => Audio(
        primary: json?["primary"],
        secondary:json!["secondary"] == null? [] :List<String>.from(json!["secondary"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "primary": primary,
        "secondary": secondary== null? [] : List<dynamic>.from(secondary!.map((x) => x)),
    };
}

class TextData {
    String? arab;
    Transliteration? transliteration;

    TextData({
        required this.arab,
        required this.transliteration,
    });

    factory TextData.fromJson(Map<String, dynamic>? json) => TextData(
        arab: json?["arab"],
        transliteration: Transliteration.fromJson(json?["transliteration"]),
    );

    Map<String, dynamic> toJson() => {
        "arab": arab,
        "transliteration": transliteration?.toJson(),
    };
}

class Transliteration {
    String? en;

    Transliteration({
        required this.en,
    });

    factory Transliteration.fromJson(Map<String, dynamic>? json) => Transliteration(
        en: json?["en"],
    );

    Map<String, dynamic> toJson() => {
        "en": en,
    };
}

class Revelation {
    String? arab;
    String? en;
    String? id;

    Revelation({
        required this.arab,
        required this.en,
        required this.id,
    });

    factory Revelation.fromJson(Map<String, dynamic>? json) => Revelation(
        arab: json?["arab"],
        en: json?["en"],
        id: json?["id"],
    );

    Map<String, dynamic> toJson() => {
        "arab": arab,
        "en": en,
        "id": id,
    };
}

class DetailSurahTafsir {
    String? id;

    DetailSurahTafsir({
        required this.id,
    });

    factory DetailSurahTafsir.fromJson(Map<String, dynamic>? json) => DetailSurahTafsir(
        id: json?["id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
    };
}

class Verse {
    Number? number;
    Meta? meta;
    TextData? text;
    Translation? translation;
    Audio? audio;
    VerseTafsir? tafsir;

    Verse({
        required this.number,
        required this.meta,
        required this.text,
        required this.translation,
        required this.audio,
        required this.tafsir,
    });

    factory Verse.fromJson(Map<String, dynamic>? json) => Verse(
        number: Number.fromJson(json?["number"]),
        meta: Meta.fromJson(json?["meta"]),
        text: TextData.fromJson(json?["text"]),
        translation: Translation.fromJson(json?["translation"]),
        audio: Audio.fromJson(json?["audio"]),
        tafsir: VerseTafsir.fromJson(json?["tafsir"]),
    );

    Map<String, dynamic> toJson() => {
        "number": number?.toJson(),
        "meta": meta?.toJson(),
        "text": text?.toJson(),
        "translation": translation?.toJson(),
        "audio": audio?.toJson(),
        "tafsir": tafsir?.toJson(),
    };
}

class Meta {
    int? juz;
    int? page;
    int? manzil;
    int? ruku;
    int? hizbQuarter;
    Sajda? sajda;

    Meta({
        required this.juz,
        required this.page,
        required this.manzil,
        required this.ruku,
        required this.hizbQuarter,
        required this.sajda,
    });

    factory Meta.fromJson(Map<String, dynamic>? json) => Meta(
        juz: json?["juz"],
        page: json?["page"],
        manzil: json?["manzil"],
        ruku: json?["ruku"],
        hizbQuarter: json?["hizbQuarter"],
        sajda: Sajda.fromJson(json?["sajda"]),
    );

    Map<String, dynamic> toJson() => {
        "juz": juz,
        "page": page,
        "manzil": manzil,
        "ruku": ruku,
        "hizbQuarter": hizbQuarter,
        "sajda": sajda?.toJson(),
    };
}

class Sajda {
    bool? recommended;
    bool? obligatory;

    Sajda({
        required this.recommended,
        required this.obligatory,
    });

    factory Sajda.fromJson(Map<String, dynamic>? json) => Sajda(
        recommended: json?["recommended"],
        obligatory: json?["obligatory"],
    );

    Map<String, dynamic> toJson() => {
        "recommended": recommended,
        "obligatory": obligatory,
    };
}

class Number {
    int? inQuran;
    int? inSurah;

    Number({
        required this.inQuran,
        required this.inSurah,
    });

    factory Number.fromJson(Map<String, dynamic>? json) => Number(
        inQuran: json?["inQuran"],
        inSurah: json?["inSurah"],
    );

    Map<String, dynamic> toJson() => {
        "inQuran": inQuran,
        "inSurah": inSurah,
    };
}

class VerseTafsir {
    Id? id;

    VerseTafsir({
        required this.id,
    });

    factory VerseTafsir.fromJson(Map<String, dynamic>? json) => VerseTafsir(
        id: Id.fromJson(json?["id"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id?.toJson(),
    };
}

class Id {
    String? short;
    String? long;

    Id({
        required this.short,
        required this.long,
    });

    factory Id.fromJson(Map<String, dynamic>? json) => Id(
        short: json?["short"],
        long: json?["long"],
    );

    Map<String, dynamic> toJson() => {
        "short": short,
        "long": long,
    };
}
