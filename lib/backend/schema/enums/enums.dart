import 'package:collection/collection.dart';

enum EuSou {
  Vendedor,
  Cliente,
}

enum Status {
  Novo,
  Preparando,
  Entregando,
  Finalizado,
  Rejeitado,
}

enum TipoDeEmpreendimento {
  Fixo,
  Itinerante,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (EuSou):
      return EuSou.values.deserialize(value) as T?;
    case (Status):
      return Status.values.deserialize(value) as T?;
    case (TipoDeEmpreendimento):
      return TipoDeEmpreendimento.values.deserialize(value) as T?;
    default:
      return null;
  }
}
