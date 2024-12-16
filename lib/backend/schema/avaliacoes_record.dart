import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AvaliacoesRecord extends FirestoreRecord {
  AvaliacoesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "comentario" field.
  String? _comentario;
  String get comentario => _comentario ?? '';
  bool hasComentario() => _comentario != null;

  // "nota" field.
  int? _nota;
  int get nota => _nota ?? 0;
  bool hasNota() => _nota != null;

  // "quemAvaliou" field.
  DocumentReference? _quemAvaliou;
  DocumentReference? get quemAvaliou => _quemAvaliou;
  bool hasQuemAvaliou() => _quemAvaliou != null;

  // "qualVendedor" field.
  DocumentReference? _qualVendedor;
  DocumentReference? get qualVendedor => _qualVendedor;
  bool hasQualVendedor() => _qualVendedor != null;

  void _initializeFields() {
    _comentario = snapshotData['comentario'] as String?;
    _nota = castToType<int>(snapshotData['nota']);
    _quemAvaliou = snapshotData['quemAvaliou'] as DocumentReference?;
    _qualVendedor = snapshotData['qualVendedor'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('avaliacoes');

  static Stream<AvaliacoesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AvaliacoesRecord.fromSnapshot(s));

  static Future<AvaliacoesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AvaliacoesRecord.fromSnapshot(s));

  static AvaliacoesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AvaliacoesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AvaliacoesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AvaliacoesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AvaliacoesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AvaliacoesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAvaliacoesRecordData({
  String? comentario,
  int? nota,
  DocumentReference? quemAvaliou,
  DocumentReference? qualVendedor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'comentario': comentario,
      'nota': nota,
      'quemAvaliou': quemAvaliou,
      'qualVendedor': qualVendedor,
    }.withoutNulls,
  );

  return firestoreData;
}

class AvaliacoesRecordDocumentEquality implements Equality<AvaliacoesRecord> {
  const AvaliacoesRecordDocumentEquality();

  @override
  bool equals(AvaliacoesRecord? e1, AvaliacoesRecord? e2) {
    return e1?.comentario == e2?.comentario &&
        e1?.nota == e2?.nota &&
        e1?.quemAvaliou == e2?.quemAvaliou &&
        e1?.qualVendedor == e2?.qualVendedor;
  }

  @override
  int hash(AvaliacoesRecord? e) => const ListEquality()
      .hash([e?.comentario, e?.nota, e?.quemAvaliou, e?.qualVendedor]);

  @override
  bool isValidKey(Object? o) => o is AvaliacoesRecord;
}
