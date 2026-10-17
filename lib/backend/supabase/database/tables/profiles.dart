import '../database.dart';

class ProfilesTable extends SupabaseTable<ProfilesRow> {
  @override
  String get tableName => 'profiles';

  @override
  ProfilesRow createRow(Map<String, dynamic> data) => ProfilesRow(data);
}

class ProfilesRow extends SupabaseDataRow {
  ProfilesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProfilesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get username => getField<String>('username');
  set username(String? value) => setField<String>('username', value);

  String? get surname => getField<String>('surname');
  set surname(String? value) => setField<String>('surname', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get otchestvo => getField<String>('otchestvo');
  set otchestvo(String? value) => setField<String>('otchestvo', value);

  String? get companyName => getField<String>('company_name');
  set companyName(String? value) => setField<String>('company_name', value);

  String? get cityName => getField<String>('city_name');
  set cityName(String? value) => setField<String>('city_name', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  String? get role => getField<String>('role');
  set role(String? value) => setField<String>('role', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get iin => getField<String>('IIN');
  set iin(String? value) => setField<String>('IIN', value);

  bool? get soglashenie => getField<bool>('soglashenie');
  set soglashenie(bool? value) => setField<bool>('soglashenie', value);

  bool? get soglasie => getField<bool>('soglasie');
  set soglasie(bool? value) => setField<bool>('soglasie', value);

  bool? get personalData => getField<bool>('personal_data');
  set personalData(bool? value) => setField<bool>('personal_data', value);

  String? get soglasieDoc => getField<String>('soglasie_doc');
  set soglasieDoc(String? value) => setField<String>('soglasie_doc', value);

  String? get idAvtor => getField<String>('id_avtor');
  set idAvtor(String? value) => setField<String>('id_avtor', value);

  String? get companyId => getField<String>('company_id');
  set companyId(String? value) => setField<String>('company_id', value);

  String? get pfoto => getField<String>('pfoto');
  set pfoto(String? value) => setField<String>('pfoto', value);

  String? get agreementPdfPath => getField<String>('agreement_pdf_path');
  set agreementPdfPath(String? value) =>
      setField<String>('agreement_pdf_path', value);

  String? get soglashenieDoc => getField<String>('soglashenie_doc');
  set soglashenieDoc(String? value) =>
      setField<String>('soglashenie_doc', value);

  String? get cityId => getField<String>('city_id');
  set cityId(String? value) => setField<String>('city_id', value);

  bool? get active => getField<bool>('active');
  set active(bool? value) => setField<bool>('active', value);
}
