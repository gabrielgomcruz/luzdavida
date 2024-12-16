// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PlanosStruct extends FFFirebaseStruct {
  PlanosStruct({
    String? nomedoplano,
    double? preco,
    int? installments,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nomedoplano = nomedoplano,
        _preco = preco,
        _installments = installments,
        super(firestoreUtilData);

  // "Nomedoplano" field.
  String? _nomedoplano;
  String get nomedoplano => _nomedoplano ?? 'Mensal';
  set nomedoplano(String? val) => _nomedoplano = val;

  bool hasNomedoplano() => _nomedoplano != null;

  // "Preco" field.
  double? _preco;
  double get preco => _preco ?? 100.0;
  set preco(double? val) => _preco = val;

  void incrementPreco(double amount) => preco = preco + amount;

  bool hasPreco() => _preco != null;

  // "installments" field.
  int? _installments;
  int get installments => _installments ?? 1;
  set installments(int? val) => _installments = val;

  void incrementInstallments(int amount) =>
      installments = installments + amount;

  bool hasInstallments() => _installments != null;

  static PlanosStruct fromMap(Map<String, dynamic> data) => PlanosStruct(
        nomedoplano: data['Nomedoplano'] as String?,
        preco: castToType<double>(data['Preco']),
        installments: castToType<int>(data['installments']),
      );

  static PlanosStruct? maybeFromMap(dynamic data) =>
      data is Map ? PlanosStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Nomedoplano': _nomedoplano,
        'Preco': _preco,
        'installments': _installments,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Nomedoplano': serializeParam(
          _nomedoplano,
          ParamType.String,
        ),
        'Preco': serializeParam(
          _preco,
          ParamType.double,
        ),
        'installments': serializeParam(
          _installments,
          ParamType.int,
        ),
      }.withoutNulls;

  static PlanosStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlanosStruct(
        nomedoplano: deserializeParam(
          data['Nomedoplano'],
          ParamType.String,
          false,
        ),
        preco: deserializeParam(
          data['Preco'],
          ParamType.double,
          false,
        ),
        installments: deserializeParam(
          data['installments'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PlanosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PlanosStruct &&
        nomedoplano == other.nomedoplano &&
        preco == other.preco &&
        installments == other.installments;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([nomedoplano, preco, installments]);
}

PlanosStruct createPlanosStruct({
  String? nomedoplano,
  double? preco,
  int? installments,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PlanosStruct(
      nomedoplano: nomedoplano,
      preco: preco,
      installments: installments,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PlanosStruct? updatePlanosStruct(
  PlanosStruct? planos, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    planos
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPlanosStructData(
  Map<String, dynamic> firestoreData,
  PlanosStruct? planos,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (planos == null) {
    return;
  }
  if (planos.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && planos.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final planosData = getPlanosFirestoreData(planos, forFieldValue);
  final nestedData = planosData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = planos.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPlanosFirestoreData(
  PlanosStruct? planos, [
  bool forFieldValue = false,
]) {
  if (planos == null) {
    return {};
  }
  final firestoreData = mapToFirestore(planos.toMap());

  // Add any Firestore field values
  planos.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPlanosListFirestoreData(
  List<PlanosStruct>? planoss,
) =>
    planoss?.map((e) => getPlanosFirestoreData(e, true)).toList() ?? [];
