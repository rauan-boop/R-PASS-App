import '../database.dart';

class BlUpdateTable extends SupabaseTable<BlUpdateRow> {
  @override
  String get tableName => 'bl_update';

  @override
  BlUpdateRow createRow(Map<String, dynamic> data) => BlUpdateRow(data);
}

class BlUpdateRow extends SupabaseDataRow {
  BlUpdateRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BlUpdateTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get url => getField<String>('url');
  set url(String? value) => setField<String>('url', value);

  bool? get acteve => getField<bool>('acteve');
  set acteve(bool? value) => setField<bool>('acteve', value);
}
