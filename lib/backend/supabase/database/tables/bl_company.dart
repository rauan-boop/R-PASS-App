import '../database.dart';

class BlCompanyTable extends SupabaseTable<BlCompanyRow> {
  @override
  String get tableName => 'bl_company';

  @override
  BlCompanyRow createRow(Map<String, dynamic> data) => BlCompanyRow(data);
}

class BlCompanyRow extends SupabaseDataRow {
  BlCompanyRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BlCompanyTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get company => getField<String>('company');
  set company(String? value) => setField<String>('company', value);

  String? get idAdmin => getField<String>('id_admin');
  set idAdmin(String? value) => setField<String>('id_admin', value);

  bool? get active => getField<bool>('active');
  set active(bool? value) => setField<bool>('active', value);

  String? get cityId => getField<String>('city_id');
  set cityId(String? value) => setField<String>('city_id', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);

  DateTime? get expiryDate => getField<DateTime>('expiry_date');
  set expiryDate(DateTime? value) => setField<DateTime>('expiry_date', value);
}
