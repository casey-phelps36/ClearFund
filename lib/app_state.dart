import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  double _additionaMonthlylncome = 0.0;
  double get additionaMonthlylncome => _additionaMonthlylncome;
  set additionaMonthlylncome(double value) {
    _additionaMonthlylncome = value;
  }

  double _utility = 0.0;
  double get utility => _utility;
  set utility(double value) {
    _utility = value;
  }

  double _rent = 0.0;
  double get rent => _rent;
  set rent(double value) {
    _rent = value;
  }

  double _groceries = 0.0;
  double get groceries => _groceries;
  set groceries(double value) {
    _groceries = value;
  }

  double _transportation = 0.0;
  double get transportation => _transportation;
  set transportation(double value) {
    _transportation = value;
  }

  double _monthlyDebt = 0.0;
  double get monthlyDebt => _monthlyDebt;
  set monthlyDebt(double value) {
    _monthlyDebt = value;
  }

  double _totalDebt = 0.0;
  double get totalDebt => _totalDebt;
  set totalDebt(double value) {
    _totalDebt = value;
  }

  double _savingsGoal = 0.0;
  double get savingsGoal => _savingsGoal;
  set savingsGoal(double value) {
    _savingsGoal = value;
  }

  double _currentSavings = 0.0;
  double get currentSavings => _currentSavings;
  set currentSavings(double value) {
    _currentSavings = value;
  }

  double _totalMonthlyCosts = 0.0;
  double get totalMonthlyCosts => _totalMonthlyCosts;
  set totalMonthlyCosts(double value) {
    _totalMonthlyCosts = value;
  }

  double _monthlyIncome = 0.0;
  double get monthlyIncome => _monthlyIncome;
  set monthlyIncome(double value) {
    _monthlyIncome = value;
  }

  double _totalMonthlyIncome = 0.0;
  double get totalMonthlyIncome => _totalMonthlyIncome;
  set totalMonthlyIncome(double value) {
    _totalMonthlyIncome = value;
  }

  double _availableSpending = 0.0;
  double get availableSpending => _availableSpending;
  set availableSpending(double value) {
    _availableSpending = value;
  }

  double _monthlySavings = 0.0;
  double get monthlySavings => _monthlySavings;
  set monthlySavings(double value) {
    _monthlySavings = value;
  }

  double _investments = 0.0;
  double get investments => _investments;
  set investments(double value) {
    _investments = value;
  }
}
