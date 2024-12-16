import '../database.dart';

class MeusCartoesTable extends SupabaseTable<MeusCartoesRow> {
  @override
  String get tableName => 'meusCartoes';

  @override
  MeusCartoesRow createRow(Map<String, dynamic> data) => MeusCartoesRow(data);
}

class MeusCartoesRow extends SupabaseDataRow {
  MeusCartoesRow(super.data);

  @override
  SupabaseTable get table => MeusCartoesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nomeImpressoCartao => getField<String>('nomeImpressoCartao`');
  set nomeImpressoCartao(String? value) =>
      setField<String>('nomeImpressoCartao`', value);

  String? get cpf => getField<String>('CPF');
  set cpf(String? value) => setField<String>('CPF', value);

  String? get numeroCartao => getField<String>('numeroCartao');
  set numeroCartao(String? value) => setField<String>('numeroCartao', value);

  int? get mes => getField<int>('mes');
  set mes(int? value) => setField<int>('mes', value);

  int? get ano => getField<int>('ano');
  set ano(int? value) => setField<int>('ano', value);

  int? get cvv => getField<int>('cvv');
  set cvv(int? value) => setField<int>('cvv', value);

  String? get qualClienteUUID => getField<String>('qualClienteUUID');
  set qualClienteUUID(String? value) =>
      setField<String>('qualClienteUUID', value);
}
