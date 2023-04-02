// ignore_for_file: non_constant_identifier_names, constant_identifier_names

class IconData {
  final String name;
  final String? codePoint;
  final String? type;
  final String? category;

  const IconData(this.name,
      {this.codePoint, this.type = 'material-icons', this.category});

  set type(String? type) => this.type = type;
}

class Icons {
  // Icon 10k
  static IconData k_10 =
      IconData('10k', codePoint: 59729.toRadixString(16), category: 'av');
  static IconData k_10_outlined = IconData('10k',
      codePoint: 59729.toRadixString(16),
      category: 'av',
      type: 'material-icons-outlined');
  static IconData k_10_rounded = IconData('10k',
      codePoint: 59729.toRadixString(16),
      category: 'av',
      type: 'material-icons-round');
  static IconData k_10_sharp = IconData('10k',
      codePoint: 59729.toRadixString(16),
      category: 'av',
      type: 'material-icons-sharp');
  static IconData k_10_ = IconData('10k',
      codePoint: 59729.toRadixString(16),
      category: 'av',
      type: 'material-icons-outlined');

  // Icon 10mp
  static const IconData mp_10 =
      IconData('10mp', codePoint: '59730', category: 'av');
  static IconData mp_10_outlined = mp_10..type = 'material-icons-outlined';
  static IconData mp_10_rounded = mp_10..type = 'material-icons-rounded';
  static IconData mp_10_sharp = mp_10..type = 'material-icons-sharp';

  // Icon 11mp
  static const IconData mp_11 =
      IconData('11mp', codePoint: '59731', category: 'av');
  static IconData mp_11_outlined = mp_11..type = 'material-icons-outlined';
  static IconData mp_11_rounded = mp_11..type = 'material-icons-rounded';
  static IconData mp_11_sharp = mp_11..type = 'material-icons-sharp';

  // Icon 12mp
  static const IconData mp_12 =
      IconData('12mp', codePoint: '59732', category: 'av');
  static IconData mp_12_outlined = mp_12..type = 'material-icons-outlined';
  static IconData mp_12_rounded = mp_12..type = 'material-icons-rounded';
  static IconData mp_12_sharp = mp_12..type = 'material-icons-sharp';

  // Icon 13mp
  static const IconData mp_13 =
      IconData('13mp', codePoint: '59733', category: 'av');
  static IconData mp_13_outlined = mp_13..type = 'material-icons-outlined';
  static IconData mp_13_rounded = mp_13..type = 'material-icons-rounded';
  static IconData mp_13_sharp = mp_13..type = 'material-icons-sharp';

  // Icon 14mp
  static const IconData mp_14 =
      IconData('14mp', codePoint: '59734', category: 'av');
  static IconData mp_14_outlined = mp_14..type = 'material-icons-outlined';
  static IconData mp_14_rounded = mp_14..type = 'material-icons-rounded';
  static IconData mp_14_sharp = mp_14..type = 'material-icons-sharp';

  // Icon 15mp
  static const IconData mp_15 =
      IconData('15mp', codePoint: '59735', category: 'av');
  static IconData mp_15_outlined = mp_15..type = 'material-icons-outlined';
  static IconData mp_15_rounded = mp_15..type = 'material-icons-rounded';
  static IconData mp_15_sharp = mp_15..type = 'material-icons-sharp';

  // Icon 16mp
  static const IconData mp_16 =
      IconData('16mp', codePoint: '59736', category: 'av');
  static IconData mp_16_outlined = mp_16..type = 'material-icons-outlined';
  static IconData mp_16_rounded = mp_16..type = 'material-icons-rounded';
  static IconData mp_16_sharp = mp_16..type = 'material-icons-sharp';

  // Icon 17mp
  static const IconData mp_17 =
      IconData('17mp', codePoint: '59737', category: 'av');
  static IconData mp_17_outlined = mp_17..type = 'material-icons-outlined';
  static IconData mp_17_rounded = mp_17..type = 'material-icons-rounded';
  static IconData mp_17_sharp = mp_17..type = 'material-icons-sharp';

  // Icon 18mp
  static const IconData mp_18 =
      IconData('18mp', codePoint: '59738', category: 'av');
  static IconData mp_18_outlined = mp_18..type = 'material-icons-outlined';
  static IconData mp_18_rounded = mp_18..type = 'material-icons-rounded';
  static IconData mp_18_sharp = mp_18..type = 'material-icons-sharp';

  // Icon 19mp
  static const IconData mp_19 =
      IconData('19mp', codePoint: '59739', category: 'av');
  static IconData mp_19_outlined = mp_19..type = 'material-icons-outlined';
  static IconData mp_19_rounded = mp_19..type = 'material-icons-rounded';
  static IconData mp_19_sharp = mp_19..type = 'material-icons-sharp';

  // Icon 1k
  static const IconData k_1 =
      IconData('1k', codePoint: '59740', category: 'av');
  static IconData k_1_outlined = k_1..type = 'material-icons-outlined';
  static IconData k_1_rounded = k_1..type = 'material-icons-rounded';
  static IconData k_1_sharp = k_1..type = 'material-icons-sharp';

  // Icon 1k_plus
  static const IconData k_1_plus =
      IconData('1k_plus', codePoint: '59741', category: 'av');
  static IconData k_1_plus_outlined = k_1_plus
    ..type = 'material-icons-outlined';
  static IconData k_1_plus_rounded = k_1_plus..type = 'material-icons-rounded';
  static IconData k_1_plus_sharp = k_1_plus..type = 'material-icons-sharp';

  /// ![Icon](https://th.bing.com/th/id/R.1f7006d1a0b8f527ba8e6165d40cf9fa?rik=1XKbj7unBwt6eQ&pid=ImgRaw&r=0)
  static const IconData mobiledata_1x =
      IconData('1x_mobiledata', codePoint: '59742', category: 'av');
  static IconData mobiledata_1x_outlined = mobiledata_1x
    ..type = 'material-icons-outlined';
  static IconData mobiledata_1x_rounded = mobiledata_1x
    ..type = 'material-icons-rounded';
  static IconData mobiledata_1x_sharp = mobiledata_1x
    ..type = 'material-icons-sharp';
}
