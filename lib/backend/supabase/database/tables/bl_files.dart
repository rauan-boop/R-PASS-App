import '../database.dart';

class BlFilesTable extends SupabaseTable<BlFilesRow> {
  @override
  String get tableName => 'bl_files';

  @override
  BlFilesRow createRow(Map<String, dynamic> data) => BlFilesRow(data);
}

class BlFilesRow extends SupabaseDataRow {
  BlFilesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BlFilesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get fileType => getField<String>('file_type');
  set fileType(String? value) => setField<String>('file_type', value);

  String? get fileUrl => getField<String>('file_url');
  set fileUrl(String? value) => setField<String>('file_url', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get klientId => getField<String>('klient_id');
  set klientId(String? value) => setField<String>('klient_id', value);

  String? get userSurname => getField<String>('user_surname');
  set userSurname(String? value) => setField<String>('user_surname', value);

  String? get userName => getField<String>('user_name');
  set userName(String? value) => setField<String>('user_name', value);

  String? get companyId => getField<String>('company_id');
  set companyId(String? value) => setField<String>('company_id', value);
}
