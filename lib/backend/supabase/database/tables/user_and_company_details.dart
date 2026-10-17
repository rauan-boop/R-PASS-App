import '../database.dart';

class UserAndCompanyDetailsTable
    extends SupabaseTable<UserAndCompanyDetailsRow> {
  @override
  String get tableName => 'user_and_company_details';

  @override
  UserAndCompanyDetailsRow createRow(Map<String, dynamic> data) =>
      UserAndCompanyDetailsRow(data);
}

class UserAndCompanyDetailsRow extends SupabaseDataRow {
  UserAndCompanyDetailsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserAndCompanyDetailsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get username => getField<String>('username');
  set username(String? value) => setField<String>('username', value);

  String? get role => getField<String>('role');
  set role(String? value) => setField<String>('role', value);

  String? get surname => getField<String>('surname');
  set surname(String? value) => setField<String>('surname', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  String? get iin => getField<String>('IIN');
  set iin(String? value) => setField<String>('IIN', value);

  String? get idAvtor => getField<String>('id_avtor');
  set idAvtor(String? value) => setField<String>('id_avtor', value);

  String? get companyId => getField<String>('company_id');
  set companyId(String? value) => setField<String>('company_id', value);

  String? get companyName => getField<String>('company_name');
  set companyName(String? value) => setField<String>('company_name', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);

  int? get daysLeft => getField<int>('days_left');
  set daysLeft(int? value) => setField<int>('days_left', value);

  int? get recordsCount => getField<int>('records_count');
  set recordsCount(int? value) => setField<int>('records_count', value);
}
