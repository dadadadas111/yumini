import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BotsRecord extends FirestoreRecord {
  BotsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bots');

  static Stream<BotsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BotsRecord.fromSnapshot(s));

  static Future<BotsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BotsRecord.fromSnapshot(s));

  static BotsRecord fromSnapshot(DocumentSnapshot snapshot) => BotsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BotsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BotsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BotsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BotsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBotsRecordData({
  String? name,
  String? description,
  String? displayName,
  String? photoUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'display_name': displayName,
      'photo_url': photoUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class BotsRecordDocumentEquality implements Equality<BotsRecord> {
  const BotsRecordDocumentEquality();

  @override
  bool equals(BotsRecord? e1, BotsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl;
  }

  @override
  int hash(BotsRecord? e) => const ListEquality()
      .hash([e?.name, e?.description, e?.displayName, e?.photoUrl]);

  @override
  bool isValidKey(Object? o) => o is BotsRecord;
}
