import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificacoesRecord extends FirestoreRecord {
  NotificacoesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "sender" field.
  DocumentReference? _sender;
  DocumentReference? get sender => _sender;
  bool hasSender() => _sender != null;

  // "receiver" field.
  DocumentReference? _receiver;
  DocumentReference? get receiver => _receiver;
  bool hasReceiver() => _receiver != null;

  void _initializeFields() {
    _type = snapshotData['type'] as String?;
    _text = snapshotData['text'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _sender = snapshotData['sender'] as DocumentReference?;
    _receiver = snapshotData['receiver'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notificacoes');

  static Stream<NotificacoesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificacoesRecord.fromSnapshot(s));

  static Future<NotificacoesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificacoesRecord.fromSnapshot(s));

  static NotificacoesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificacoesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificacoesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificacoesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificacoesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificacoesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificacoesRecordData({
  String? type,
  String? text,
  DateTime? time,
  DocumentReference? sender,
  DocumentReference? receiver,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'type': type,
      'text': text,
      'time': time,
      'sender': sender,
      'receiver': receiver,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificacoesRecordDocumentEquality
    implements Equality<NotificacoesRecord> {
  const NotificacoesRecordDocumentEquality();

  @override
  bool equals(NotificacoesRecord? e1, NotificacoesRecord? e2) {
    return e1?.type == e2?.type &&
        e1?.text == e2?.text &&
        e1?.time == e2?.time &&
        e1?.sender == e2?.sender &&
        e1?.receiver == e2?.receiver;
  }

  @override
  int hash(NotificacoesRecord? e) => const ListEquality()
      .hash([e?.type, e?.text, e?.time, e?.sender, e?.receiver]);

  @override
  bool isValidKey(Object? o) => o is NotificacoesRecord;
}
