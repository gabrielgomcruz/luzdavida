import '../database.dart';

class EsteiraDePixTable extends SupabaseTable<EsteiraDePixRow> {
  @override
  String get tableName => 'EsteiraDePix';

  @override
  EsteiraDePixRow createRow(Map<String, dynamic> data) => EsteiraDePixRow(data);
}

class EsteiraDePixRow extends SupabaseDataRow {
  EsteiraDePixRow(super.data);

  @override
  SupabaseTable get table => EsteiraDePixTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get idPix => getField<String>('idPix');
  set idPix(String? value) => setField<String>('idPix', value);

  String? get order => getField<String>('order');
  set order(String? value) => setField<String>('order', value);

  String? get proxValidacao => getField<String>('proxValidacao');
  set proxValidacao(String? value) => setField<String>('proxValidacao', value);
}
