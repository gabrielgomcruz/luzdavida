import '../database.dart';

class CidadesDisponveisTable extends SupabaseTable<CidadesDisponveisRow> {
  @override
  String get tableName => 'Cidades Disponíveis';

  @override
  CidadesDisponveisRow createRow(Map<String, dynamic> data) =>
      CidadesDisponveisRow(data);
}

class CidadesDisponveisRow extends SupabaseDataRow {
  CidadesDisponveisRow(super.data);

  @override
  SupabaseTable get table => CidadesDisponveisTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get titulo => getField<String>('Título');
  set titulo(String? value) => setField<String>('Título', value);
}
