import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
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

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "budget_max" field.
  int? _budgetMax;
  int get budgetMax => _budgetMax ?? 0;
  bool hasBudgetMax() => _budgetMax != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "monthly_income" field.
  double? _monthlyIncome;

  /// monthly income
  double get monthlyIncome => _monthlyIncome ?? 0.0;
  bool hasMonthlyIncome() => _monthlyIncome != null;

  // "saving_goal" field.
  double? _savingGoal;

  /// monthly savings goal
  double get savingGoal => _savingGoal ?? 0.0;
  bool hasSavingGoal() => _savingGoal != null;

  // "investment_goal" field.
  double? _investmentGoal;

  /// monthly investments
  double get investmentGoal => _investmentGoal ?? 0.0;
  bool hasInvestmentGoal() => _investmentGoal != null;

  // "total_expenses" field.
  double? _totalExpenses;

  /// tracks what user spends throughout the month
  double get totalExpenses => _totalExpenses ?? 0.0;
  bool hasTotalExpenses() => _totalExpenses != null;

  // "monthly_salary" field.
  double? _monthlySalary;
  double get monthlySalary => _monthlySalary ?? 0.0;
  bool hasMonthlySalary() => _monthlySalary != null;

  // "additional_income" field.
  double? _additionalIncome;

  /// monthly additional income
  double get additionalIncome => _additionalIncome ?? 0.0;
  bool hasAdditionalIncome() => _additionalIncome != null;

  // "rent" field.
  double? _rent;

  /// monthly rent
  double get rent => _rent ?? 0.0;
  bool hasRent() => _rent != null;

  // "utilities" field.
  double? _utilities;

  /// monthly utilities
  double get utilities => _utilities ?? 0.0;
  bool hasUtilities() => _utilities != null;

  // "groceries" field.
  double? _groceries;

  /// monthly food
  double get groceries => _groceries ?? 0.0;
  bool hasGroceries() => _groceries != null;

  // "transportation" field.
  double? _transportation;

  /// monthly transportation costs
  double get transportation => _transportation ?? 0.0;
  bool hasTransportation() => _transportation != null;

  // "total_debt" field.
  double? _totalDebt;

  /// total amount of debt that needs to be paid off
  double get totalDebt => _totalDebt ?? 0.0;
  bool hasTotalDebt() => _totalDebt != null;

  // "monthly_debt" field.
  double? _monthlyDebt;

  /// how much of debt paid off each month
  double get monthlyDebt => _monthlyDebt ?? 0.0;
  bool hasMonthlyDebt() => _monthlyDebt != null;

  // "investmentAndGoals" field.
  double? _investmentAndGoals;

  /// total progress towards goal, inludes saving and investments
  double get investmentAndGoals => _investmentAndGoals ?? 0.0;
  bool hasInvestmentAndGoals() => _investmentAndGoals != null;

  // "current_savings" field.
  double? _currentSavings;
  double get currentSavings => _currentSavings ?? 0.0;
  bool hasCurrentSavings() => _currentSavings != null;

  // "current_investment" field.
  double? _currentInvestment;
  double get currentInvestment => _currentInvestment ?? 0.0;
  bool hasCurrentInvestment() => _currentInvestment != null;

  // "income_type" field.
  String? _incomeType;
  String get incomeType => _incomeType ?? '';
  bool hasIncomeType() => _incomeType != null;

  // "goalInput" field.
  String? _goalInput;
  String get goalInput => _goalInput ?? '';
  bool hasGoalInput() => _goalInput != null;

  // "availableSpendings" field.
  double? _availableSpendings;

  /// amount that can be spent
  double get availableSpendings => _availableSpendings ?? 0.0;
  bool hasAvailableSpendings() => _availableSpendings != null;

  // "totalncome" field.
  double? _totalncome;

  /// total income including monthly income and additional income
  double get totalncome => _totalncome ?? 0.0;
  bool hasTotalncome() => _totalncome != null;

  // "bills" field.
  double? _bills;

  /// total of all monthly reaccuring expenses
  double get bills => _bills ?? 0.0;
  bool hasBills() => _bills != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _budgetMax = castToType<int>(snapshotData['budget_max']);
    _photoUrl = snapshotData['photo_url'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _monthlyIncome = castToType<double>(snapshotData['monthly_income']);
    _savingGoal = castToType<double>(snapshotData['saving_goal']);
    _investmentGoal = castToType<double>(snapshotData['investment_goal']);
    _totalExpenses = castToType<double>(snapshotData['total_expenses']);
    _monthlySalary = castToType<double>(snapshotData['monthly_salary']);
    _additionalIncome = castToType<double>(snapshotData['additional_income']);
    _rent = castToType<double>(snapshotData['rent']);
    _utilities = castToType<double>(snapshotData['utilities']);
    _groceries = castToType<double>(snapshotData['groceries']);
    _transportation = castToType<double>(snapshotData['transportation']);
    _totalDebt = castToType<double>(snapshotData['total_debt']);
    _monthlyDebt = castToType<double>(snapshotData['monthly_debt']);
    _investmentAndGoals =
        castToType<double>(snapshotData['investmentAndGoals']);
    _currentSavings = castToType<double>(snapshotData['current_savings']);
    _currentInvestment = castToType<double>(snapshotData['current_investment']);
    _incomeType = snapshotData['income_type'] as String?;
    _goalInput = snapshotData['goalInput'] as String?;
    _availableSpendings =
        castToType<double>(snapshotData['availableSpendings']);
    _totalncome = castToType<double>(snapshotData['totalncome']);
    _bills = castToType<double>(snapshotData['bills']);
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
  String? uid,
  DateTime? createdTime,
  int? budgetMax,
  String? photoUrl,
  String? phoneNumber,
  double? monthlyIncome,
  double? savingGoal,
  double? investmentGoal,
  double? totalExpenses,
  double? monthlySalary,
  double? additionalIncome,
  double? rent,
  double? utilities,
  double? groceries,
  double? transportation,
  double? totalDebt,
  double? monthlyDebt,
  double? investmentAndGoals,
  double? currentSavings,
  double? currentInvestment,
  String? incomeType,
  String? goalInput,
  double? availableSpendings,
  double? totalncome,
  double? bills,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'uid': uid,
      'created_time': createdTime,
      'budget_max': budgetMax,
      'photo_url': photoUrl,
      'phone_number': phoneNumber,
      'monthly_income': monthlyIncome,
      'saving_goal': savingGoal,
      'investment_goal': investmentGoal,
      'total_expenses': totalExpenses,
      'monthly_salary': monthlySalary,
      'additional_income': additionalIncome,
      'rent': rent,
      'utilities': utilities,
      'groceries': groceries,
      'transportation': transportation,
      'total_debt': totalDebt,
      'monthly_debt': monthlyDebt,
      'investmentAndGoals': investmentAndGoals,
      'current_savings': currentSavings,
      'current_investment': currentInvestment,
      'income_type': incomeType,
      'goalInput': goalInput,
      'availableSpendings': availableSpendings,
      'totalncome': totalncome,
      'bills': bills,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.budgetMax == e2?.budgetMax &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.monthlyIncome == e2?.monthlyIncome &&
        e1?.savingGoal == e2?.savingGoal &&
        e1?.investmentGoal == e2?.investmentGoal &&
        e1?.totalExpenses == e2?.totalExpenses &&
        e1?.monthlySalary == e2?.monthlySalary &&
        e1?.additionalIncome == e2?.additionalIncome &&
        e1?.rent == e2?.rent &&
        e1?.utilities == e2?.utilities &&
        e1?.groceries == e2?.groceries &&
        e1?.transportation == e2?.transportation &&
        e1?.totalDebt == e2?.totalDebt &&
        e1?.monthlyDebt == e2?.monthlyDebt &&
        e1?.investmentAndGoals == e2?.investmentAndGoals &&
        e1?.currentSavings == e2?.currentSavings &&
        e1?.currentInvestment == e2?.currentInvestment &&
        e1?.incomeType == e2?.incomeType &&
        e1?.goalInput == e2?.goalInput &&
        e1?.availableSpendings == e2?.availableSpendings &&
        e1?.totalncome == e2?.totalncome &&
        e1?.bills == e2?.bills;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.uid,
        e?.createdTime,
        e?.budgetMax,
        e?.photoUrl,
        e?.phoneNumber,
        e?.monthlyIncome,
        e?.savingGoal,
        e?.investmentGoal,
        e?.totalExpenses,
        e?.monthlySalary,
        e?.additionalIncome,
        e?.rent,
        e?.utilities,
        e?.groceries,
        e?.transportation,
        e?.totalDebt,
        e?.monthlyDebt,
        e?.investmentAndGoals,
        e?.currentSavings,
        e?.currentInvestment,
        e?.incomeType,
        e?.goalInput,
        e?.availableSpendings,
        e?.totalncome,
        e?.bills
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
