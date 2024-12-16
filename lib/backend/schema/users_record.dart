import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "shortDescription" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  bool hasShortDescription() => _shortDescription != null;

  // "last_active_time" field.
  DateTime? _lastActiveTime;
  DateTime? get lastActiveTime => _lastActiveTime;
  bool hasLastActiveTime() => _lastActiveTime != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "blockedUsers" field.
  List<DocumentReference>? _blockedUsers;
  List<DocumentReference> get blockedUsers => _blockedUsers ?? const [];
  bool hasBlockedUsers() => _blockedUsers != null;

  // "addresses" field.
  List<AddressStruct>? _addresses;
  List<AddressStruct> get addresses => _addresses ?? const [];
  bool hasAddresses() => _addresses != null;

  // "EuSou" field.
  EuSou? _euSou;
  EuSou? get euSou => _euSou;
  bool hasEuSou() => _euSou != null;

  // "MinhaLocalizacao" field.
  LatLng? _minhaLocalizacao;
  LatLng? get minhaLocalizacao => _minhaLocalizacao;
  bool hasMinhaLocalizacao() => _minhaLocalizacao != null;

  // "oitoHoras" field.
  double? _oitoHoras;
  double get oitoHoras => _oitoHoras ?? 0.0;
  bool hasOitoHoras() => _oitoHoras != null;

  // "dozeHoras" field.
  double? _dozeHoras;
  double get dozeHoras => _dozeHoras ?? 0.0;
  bool hasDozeHoras() => _dozeHoras != null;

  // "vintequatroHoras" field.
  double? _vintequatroHoras;
  double get vintequatroHoras => _vintequatroHoras ?? 0.0;
  bool hasVintequatroHoras() => _vintequatroHoras != null;

  // "horaAdicional" field.
  double? _horaAdicional;
  double get horaAdicional => _horaAdicional ?? 0.0;
  bool hasHoraAdicional() => _horaAdicional != null;

  // "minhaCidade" field.
  String? _minhaCidade;
  String get minhaCidade => _minhaCidade ?? '';
  bool hasMinhaCidade() => _minhaCidade != null;

  // "meusServicos" field.
  List<String>? _meusServicos;
  List<String> get meusServicos => _meusServicos ?? const [];
  bool hasMeusServicos() => _meusServicos != null;

  // "arquivo" field.
  String? _arquivo;
  String get arquivo => _arquivo ?? '';
  bool hasArquivo() => _arquivo != null;

  // "CPF" field.
  String? _cpf;
  String get cpf => _cpf ?? '';
  bool hasCpf() => _cpf != null;

  // "possuiCUrso" field.
  String? _possuiCUrso;
  String get possuiCUrso => _possuiCUrso ?? '';
  bool hasPossuiCUrso() => _possuiCUrso != null;

  // "dataNascimento" field.
  String? _dataNascimento;
  String get dataNascimento => _dataNascimento ?? '';
  bool hasDataNascimento() => _dataNascimento != null;

  // "tokenMeuPix" field.
  String? _tokenMeuPix;
  String get tokenMeuPix => _tokenMeuPix ?? '';
  bool hasTokenMeuPix() => _tokenMeuPix != null;

  // "DataDoProxPagamento" field.
  DateTime? _dataDoProxPagamento;
  DateTime? get dataDoProxPagamento => _dataDoProxPagamento;
  bool hasDataDoProxPagamento() => _dataDoProxPagamento != null;

  // "planoEscolhido" field.
  PlanosStruct? _planoEscolhido;
  PlanosStruct get planoEscolhido => _planoEscolhido ?? PlanosStruct();
  bool hasPlanoEscolhido() => _planoEscolhido != null;

  // "precisaValidarPix_pixID" field.
  String? _precisaValidarPixPixID;
  String get precisaValidarPixPixID => _precisaValidarPixPixID ?? '';
  bool hasPrecisaValidarPixPixID() => _precisaValidarPixPixID != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _shortDescription = snapshotData['shortDescription'] as String?;
    _lastActiveTime = snapshotData['last_active_time'] as DateTime?;
    _title = snapshotData['title'] as String?;
    _blockedUsers = getDataList(snapshotData['blockedUsers']);
    _addresses = getStructList(
      snapshotData['addresses'],
      AddressStruct.fromMap,
    );
    _euSou = snapshotData['EuSou'] is EuSou
        ? snapshotData['EuSou']
        : deserializeEnum<EuSou>(snapshotData['EuSou']);
    _minhaLocalizacao = snapshotData['MinhaLocalizacao'] as LatLng?;
    _oitoHoras = castToType<double>(snapshotData['oitoHoras']);
    _dozeHoras = castToType<double>(snapshotData['dozeHoras']);
    _vintequatroHoras = castToType<double>(snapshotData['vintequatroHoras']);
    _horaAdicional = castToType<double>(snapshotData['horaAdicional']);
    _minhaCidade = snapshotData['minhaCidade'] as String?;
    _meusServicos = getDataList(snapshotData['meusServicos']);
    _arquivo = snapshotData['arquivo'] as String?;
    _cpf = snapshotData['CPF'] as String?;
    _possuiCUrso = snapshotData['possuiCUrso'] as String?;
    _dataNascimento = snapshotData['dataNascimento'] as String?;
    _tokenMeuPix = snapshotData['tokenMeuPix'] as String?;
    _dataDoProxPagamento = snapshotData['DataDoProxPagamento'] as DateTime?;
    _planoEscolhido = snapshotData['planoEscolhido'] is PlanosStruct
        ? snapshotData['planoEscolhido']
        : PlanosStruct.maybeFromMap(snapshotData['planoEscolhido']);
    _precisaValidarPixPixID =
        snapshotData['precisaValidarPix_pixID'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? shortDescription,
  DateTime? lastActiveTime,
  String? title,
  EuSou? euSou,
  LatLng? minhaLocalizacao,
  double? oitoHoras,
  double? dozeHoras,
  double? vintequatroHoras,
  double? horaAdicional,
  String? minhaCidade,
  String? arquivo,
  String? cpf,
  String? possuiCUrso,
  String? dataNascimento,
  String? tokenMeuPix,
  DateTime? dataDoProxPagamento,
  PlanosStruct? planoEscolhido,
  String? precisaValidarPixPixID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'shortDescription': shortDescription,
      'last_active_time': lastActiveTime,
      'title': title,
      'EuSou': euSou,
      'MinhaLocalizacao': minhaLocalizacao,
      'oitoHoras': oitoHoras,
      'dozeHoras': dozeHoras,
      'vintequatroHoras': vintequatroHoras,
      'horaAdicional': horaAdicional,
      'minhaCidade': minhaCidade,
      'arquivo': arquivo,
      'CPF': cpf,
      'possuiCUrso': possuiCUrso,
      'dataNascimento': dataNascimento,
      'tokenMeuPix': tokenMeuPix,
      'DataDoProxPagamento': dataDoProxPagamento,
      'planoEscolhido': PlanosStruct().toMap(),
      'precisaValidarPix_pixID': precisaValidarPixPixID,
    }.withoutNulls,
  );

  // Handle nested data for "planoEscolhido" field.
  addPlanosStructData(firestoreData, planoEscolhido, 'planoEscolhido');

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.shortDescription == e2?.shortDescription &&
        e1?.lastActiveTime == e2?.lastActiveTime &&
        e1?.title == e2?.title &&
        listEquality.equals(e1?.blockedUsers, e2?.blockedUsers) &&
        listEquality.equals(e1?.addresses, e2?.addresses) &&
        e1?.euSou == e2?.euSou &&
        e1?.minhaLocalizacao == e2?.minhaLocalizacao &&
        e1?.oitoHoras == e2?.oitoHoras &&
        e1?.dozeHoras == e2?.dozeHoras &&
        e1?.vintequatroHoras == e2?.vintequatroHoras &&
        e1?.horaAdicional == e2?.horaAdicional &&
        e1?.minhaCidade == e2?.minhaCidade &&
        listEquality.equals(e1?.meusServicos, e2?.meusServicos) &&
        e1?.arquivo == e2?.arquivo &&
        e1?.cpf == e2?.cpf &&
        e1?.possuiCUrso == e2?.possuiCUrso &&
        e1?.dataNascimento == e2?.dataNascimento &&
        e1?.tokenMeuPix == e2?.tokenMeuPix &&
        e1?.dataDoProxPagamento == e2?.dataDoProxPagamento &&
        e1?.planoEscolhido == e2?.planoEscolhido &&
        e1?.precisaValidarPixPixID == e2?.precisaValidarPixPixID;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.shortDescription,
        e?.lastActiveTime,
        e?.title,
        e?.blockedUsers,
        e?.addresses,
        e?.euSou,
        e?.minhaLocalizacao,
        e?.oitoHoras,
        e?.dozeHoras,
        e?.vintequatroHoras,
        e?.horaAdicional,
        e?.minhaCidade,
        e?.meusServicos,
        e?.arquivo,
        e?.cpf,
        e?.possuiCUrso,
        e?.dataNascimento,
        e?.tokenMeuPix,
        e?.dataDoProxPagamento,
        e?.planoEscolhido,
        e?.precisaValidarPixPixID
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
