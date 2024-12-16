import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MeusCartoesRecord extends FirestoreRecord {
  MeusCartoesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nomelmpressoCartao" field.
  String? _nomelmpressoCartao;
  String get nomelmpressoCartao => _nomelmpressoCartao ?? '';
  bool hasNomelmpressoCartao() => _nomelmpressoCartao != null;

  // "CPF" field.
  String? _cpf;
  String get cpf => _cpf ?? '';
  bool hasCpf() => _cpf != null;

  // "NumeroDoCartao" field.
  String? _numeroDoCartao;
  String get numeroDoCartao => _numeroDoCartao ?? '';
  bool hasNumeroDoCartao() => _numeroDoCartao != null;

  // "Mes" field.
  int? _mes;
  int get mes => _mes ?? 0;
  bool hasMes() => _mes != null;

  // "ano" field.
  int? _ano;
  int get ano => _ano ?? 0;
  bool hasAno() => _ano != null;

  // "cvv" field.
  int? _cvv;
  int get cvv => _cvv ?? 0;
  bool hasCvv() => _cvv != null;

  // "QualCliente" field.
  DocumentReference? _qualCliente;
  DocumentReference? get qualCliente => _qualCliente;
  bool hasQualCliente() => _qualCliente != null;

  void _initializeFields() {
    _nomelmpressoCartao = snapshotData['nomelmpressoCartao'] as String?;
    _cpf = snapshotData['CPF'] as String?;
    _numeroDoCartao = snapshotData['NumeroDoCartao'] as String?;
    _mes = castToType<int>(snapshotData['Mes']);
    _ano = castToType<int>(snapshotData['ano']);
    _cvv = castToType<int>(snapshotData['cvv']);
    _qualCliente = snapshotData['QualCliente'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('meusCartoes');

  static Stream<MeusCartoesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MeusCartoesRecord.fromSnapshot(s));

  static Future<MeusCartoesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MeusCartoesRecord.fromSnapshot(s));

  static MeusCartoesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MeusCartoesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MeusCartoesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MeusCartoesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MeusCartoesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MeusCartoesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMeusCartoesRecordData({
  String? nomelmpressoCartao,
  String? cpf,
  String? numeroDoCartao,
  int? mes,
  int? ano,
  int? cvv,
  DocumentReference? qualCliente,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nomelmpressoCartao': nomelmpressoCartao,
      'CPF': cpf,
      'NumeroDoCartao': numeroDoCartao,
      'Mes': mes,
      'ano': ano,
      'cvv': cvv,
      'QualCliente': qualCliente,
    }.withoutNulls,
  );

  return firestoreData;
}

class MeusCartoesRecordDocumentEquality implements Equality<MeusCartoesRecord> {
  const MeusCartoesRecordDocumentEquality();

  @override
  bool equals(MeusCartoesRecord? e1, MeusCartoesRecord? e2) {
    return e1?.nomelmpressoCartao == e2?.nomelmpressoCartao &&
        e1?.cpf == e2?.cpf &&
        e1?.numeroDoCartao == e2?.numeroDoCartao &&
        e1?.mes == e2?.mes &&
        e1?.ano == e2?.ano &&
        e1?.cvv == e2?.cvv &&
        e1?.qualCliente == e2?.qualCliente;
  }

  @override
  int hash(MeusCartoesRecord? e) => const ListEquality().hash([
        e?.nomelmpressoCartao,
        e?.cpf,
        e?.numeroDoCartao,
        e?.mes,
        e?.ano,
        e?.cvv,
        e?.qualCliente
      ]);

  @override
  bool isValidKey(Object? o) => o is MeusCartoesRecord;
}
