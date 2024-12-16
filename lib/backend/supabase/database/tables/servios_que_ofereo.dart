import '../database.dart';

class ServiosQueOfereoTable extends SupabaseTable<ServiosQueOfereoRow> {
  @override
  String get tableName => 'Serviços que ofereço';

  @override
  ServiosQueOfereoRow createRow(Map<String, dynamic> data) =>
      ServiosQueOfereoRow(data);
}

class ServiosQueOfereoRow extends SupabaseDataRow {
  ServiosQueOfereoRow(super.data);

  @override
  SupabaseTable get table => ServiosQueOfereoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get titulo => getField<String>('Título');
  set titulo(String? value) => setField<String>('Título', value);
}
