import '../database.dart';

class BlBlacklistTable extends SupabaseTable<BlBlacklistRow> {
  @override
  String get tableName => 'bl_blacklist';

  @override
  BlBlacklistRow createRow(Map<String, dynamic> data) => BlBlacklistRow(data);
}

class BlBlacklistRow extends SupabaseDataRow {
  BlBlacklistRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BlBlacklistTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get surname => getField<String>('surname');
  set surname(String? value) => setField<String>('surname', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get otchestvo => getField<String>('otchestvo');
  set otchestvo(String? value) => setField<String>('otchestvo', value);

  String? get iin => getField<String>('iin');
  set iin(String? value) => setField<String>('iin', value);

  String? get pfone => getField<String>('pfone');
  set pfone(String? value) => setField<String>('pfone', value);

  String? get opisanie => getField<String>('opisanie');
  set opisanie(String? value) => setField<String>('opisanie', value);

  String? get summa => getField<String>('summa');
  set summa(String? value) => setField<String>('summa', value);

  String? get company => getField<String>('company');
  set company(String? value) => setField<String>('company', value);

  String? get companyName => getField<String>('company_name');
  set companyName(String? value) => setField<String>('company_name', value);

  String? get companySurname => getField<String>('company_surname');
  set companySurname(String? value) =>
      setField<String>('company_surname', value);

  String? get pasport => getField<String>('pasport');
  set pasport(String? value) => setField<String>('pasport', value);

  DateTime? get datevidachi => getField<DateTime>('datevidachi');
  set datevidachi(DateTime? value) => setField<DateTime>('datevidachi', value);

  String? get contry => getField<String>('contry');
  set contry(String? value) => setField<String>('contry', value);

  bool? get grazhdaninRk => getField<bool>('grazhdanin_rk');
  set grazhdaninRk(bool? value) => setField<bool>('grazhdanin_rk', value);

  bool? get zapis => getField<bool>('zapis');
  set zapis(bool? value) => setField<bool>('zapis', value);

  dynamic? get photo => getField<dynamic>('photo');
  set photo(dynamic? value) => setField<dynamic>('photo', value);

  bool? get inArhive => getField<bool>('in_arhive');
  set inArhive(bool? value) => setField<bool>('in_arhive', value);

  String? get idCompany => getField<String>('id_company');
  set idCompany(String? value) => setField<String>('id_company', value);

  String? get idAvtor => getField<String>('id_avtor');
  set idAvtor(String? value) => setField<String>('id_avtor', value);

  String? get searchField => getField<String>('search_field');
  set searchField(String? value) => setField<String>('search_field', value);
}
