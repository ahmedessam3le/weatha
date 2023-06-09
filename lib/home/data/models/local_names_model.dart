import 'package:weatha/home/domain/entities/local_names.dart';

class LocalNamesModel extends LocalNames {
  LocalNamesModel({
    required super.pl,
    required super.en,
    required super.zh,
    required super.it,
    required super.de,
    required super.he,
    required super.cs,
    required super.lt,
    required super.ru,
    required super.sr,
    required super.hu,
    required super.ro,
    required super.tr,
    required super.uk,
    required super.et,
    required super.ml,
    required super.hr,
    required super.ar,
    required super.ku,
    required super.eo,
    required super.nl,
    required super.fr,
    required super.la,
    required super.be,
    required super.es,
    required super.os,
    required super.ko,
  });

  factory LocalNamesModel.fromJson(Map<String, dynamic> json) {
    return LocalNamesModel(
      pl: json['pl'] ?? '',
      en: json['en'] ?? '',
      zh: json['zh'] ?? '',
      it: json['it'] ?? '',
      de: json['de'] ?? '',
      he: json['he'] ?? '',
      cs: json['cs'] ?? '',
      lt: json['lt'] ?? '',
      ru: json['ru'] ?? '',
      sr: json['sr'] ?? '',
      hu: json['hu'] ?? '',
      ro: json['ro'] ?? '',
      tr: json['tr'] ?? '',
      uk: json['uk'] ?? '',
      et: json['et'] ?? '',
      ml: json['ml'] ?? '',
      hr: json['hr'] ?? '',
      ar: json['ar'] ?? '',
      ku: json['ku'] ?? '',
      eo: json['eo'] ?? '',
      nl: json['nl'] ?? '',
      fr: json['fr'] ?? '',
      la: json['la'] ?? '',
      be: json['be'] ?? '',
      es: json['es'] ?? '',
      os: json['os'] ?? '',
      ko: json['ko'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pl'] = pl;
    data['en'] = en;
    data['zh'] = zh;
    data['it'] = it;
    data['de'] = de;
    data['he'] = he;
    data['cs'] = cs;
    data['lt'] = lt;
    data['ru'] = ru;
    data['sr'] = sr;
    data['hu'] = hu;
    data['ro'] = ro;
    data['tr'] = tr;
    data['uk'] = uk;
    data['et'] = et;
    data['ml'] = ml;
    data['hr'] = hr;
    data['ar'] = ar;
    data['ku'] = ku;
    data['eo'] = eo;
    data['nl'] = nl;
    data['fr'] = fr;
    data['la'] = la;
    data['be'] = be;
    data['es'] = es;
    data['os'] = os;
    data['ko'] = ko;
    return data;
  }
}
