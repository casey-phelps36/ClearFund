import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReceiptsRecord extends FirestoreRecord {
  ReceiptsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "vendor" field.
  String? _vendor;
  String get vendor => _vendor ?? '';
  bool hasVendor() => _vendor != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  void _initializeFields() {
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _amount = castToType<double>(snapshotData['amount']);
    _vendor = snapshotData['vendor'] as String?;
    _category = snapshotData['category'] as String?;
    _date = snapshotData['date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('receipts');

  static Stream<ReceiptsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReceiptsRecord.fromSnapshot(s));

  static Future<ReceiptsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReceiptsRecord.fromSnapshot(s));

  static ReceiptsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReceiptsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReceiptsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReceiptsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReceiptsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReceiptsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReceiptsRecordData({
  DocumentReference? userRef,
  double? amount,
  String? vendor,
  String? category,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_ref': userRef,
      'amount': amount,
      'vendor': vendor,
      'category': category,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReceiptsRecordDocumentEquality implements Equality<ReceiptsRecord> {
  const ReceiptsRecordDocumentEquality();

  @override
  bool equals(ReceiptsRecord? e1, ReceiptsRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.amount == e2?.amount &&
        e1?.vendor == e2?.vendor &&
        e1?.category == e2?.category &&
        e1?.date == e2?.date;
  }

  @override
  int hash(ReceiptsRecord? e) => const ListEquality()
      .hash([e?.userRef, e?.amount, e?.vendor, e?.category, e?.date]);

  @override
  bool isValidKey(Object? o) => o is ReceiptsRecord;
}
