import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EsteiraDePixRecord extends FirestoreRecord {
  EsteiraDePixRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "idPix" field.
  String? _idPix;
  String get idPix => _idPix ?? '';
  bool hasIdPix() => _idPix != null;

  // "order" field.
  String? _order;
  String get order => _order ?? '';
  bool hasOrder() => _order != null;

  // "proxValidacao" field.
  DateTime? _proxValidacao;
  DateTime? get proxValidacao => _proxValidacao;
  bool hasProxValidacao() => _proxValidacao != null;

  void _initializeFields() {
    _idPix = snapshotData['idPix'] as String?;
    _order = snapshotData['order'] as String?;
    _proxValidacao = snapshotData['proxValidacao'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('EsteiraDePix');

  static Stream<EsteiraDePixRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EsteiraDePixRecord.fromSnapshot(s));

  static Future<EsteiraDePixRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EsteiraDePixRecord.fromSnapshot(s));

  static EsteiraDePixRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EsteiraDePixRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EsteiraDePixRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EsteiraDePixRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EsteiraDePixRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EsteiraDePixRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEsteiraDePixRecordData({
  String? idPix,
  String? order,
  DateTime? proxValidacao,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'idPix': idPix,
      'order': order,
      'proxValidacao': proxValidacao,
    }.withoutNulls,
  );

  return firestoreData;
}

class EsteiraDePixRecordDocumentEquality
    implements Equality<EsteiraDePixRecord> {
  const EsteiraDePixRecordDocumentEquality();

  @override
  bool equals(EsteiraDePixRecord? e1, EsteiraDePixRecord? e2) {
    return e1?.idPix == e2?.idPix &&
        e1?.order == e2?.order &&
        e1?.proxValidacao == e2?.proxValidacao;
  }

  @override
  int hash(EsteiraDePixRecord? e) =>
      const ListEquality().hash([e?.idPix, e?.order, e?.proxValidacao]);

  @override
  bool isValidKey(Object? o) => o is EsteiraDePixRecord;
}
