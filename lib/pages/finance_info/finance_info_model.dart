import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'finance_info_widget.dart' show FinanceInfoWidget;
import 'package:flutter/material.dart';

class FinanceInfoModel extends FlutterFlowModel<FinanceInfoWidget> {
  ///  Local state fields for this page.

  double? monthlySalary;

  double? additionalIncome;

  double? totalMonthlyIncome;

  double? rent;

  double? utilities;

  double? groceries;

  double? transporation;

  double? totalmonthlyExpenses;

  double? savingGoal;

  double? investment;

  double? totalSavings;

  double? totalDebt;

  double? monthlyDebt;

  ///  State fields for stateful widgets in this page.

  // State field(s) for MonthlyCheck widget.
  FocusNode? monthlyCheckFocusNode;
  TextEditingController? monthlyCheckTextController;
  String? Function(BuildContext, String?)? monthlyCheckTextControllerValidator;
  // State field(s) for additionalIncome widget.
  FocusNode? additionalIncomeFocusNode;
  TextEditingController? additionalIncomeTextController;
  String? Function(BuildContext, String?)?
      additionalIncomeTextControllerValidator;
  // State field(s) for rent widget.
  FocusNode? rentFocusNode;
  TextEditingController? rentTextController;
  String? Function(BuildContext, String?)? rentTextControllerValidator;
  // State field(s) for utilities widget.
  FocusNode? utilitiesFocusNode;
  TextEditingController? utilitiesTextController;
  String? Function(BuildContext, String?)? utilitiesTextControllerValidator;
  // State field(s) for foodGroceries widget.
  FocusNode? foodGroceriesFocusNode;
  TextEditingController? foodGroceriesTextController;
  String? Function(BuildContext, String?)? foodGroceriesTextControllerValidator;
  // State field(s) for transportation widget.
  FocusNode? transportationFocusNode;
  TextEditingController? transportationTextController;
  String? Function(BuildContext, String?)?
      transportationTextControllerValidator;
  // State field(s) for monthlySavings widget.
  FocusNode? monthlySavingsFocusNode;
  TextEditingController? monthlySavingsTextController;
  String? Function(BuildContext, String?)?
      monthlySavingsTextControllerValidator;
  // State field(s) for investments widget.
  FocusNode? investmentsFocusNode;
  TextEditingController? investmentsTextController;
  String? Function(BuildContext, String?)? investmentsTextControllerValidator;
  // State field(s) for totalDebt widget.
  FocusNode? totalDebtFocusNode;
  TextEditingController? totalDebtTextController;
  String? Function(BuildContext, String?)? totalDebtTextControllerValidator;
  // State field(s) for monthlyDebt widget.
  FocusNode? monthlyDebtFocusNode;
  TextEditingController? monthlyDebtTextController;
  String? Function(BuildContext, String?)? monthlyDebtTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    monthlyCheckFocusNode?.dispose();
    monthlyCheckTextController?.dispose();

    additionalIncomeFocusNode?.dispose();
    additionalIncomeTextController?.dispose();

    rentFocusNode?.dispose();
    rentTextController?.dispose();

    utilitiesFocusNode?.dispose();
    utilitiesTextController?.dispose();

    foodGroceriesFocusNode?.dispose();
    foodGroceriesTextController?.dispose();

    transportationFocusNode?.dispose();
    transportationTextController?.dispose();

    monthlySavingsFocusNode?.dispose();
    monthlySavingsTextController?.dispose();

    investmentsFocusNode?.dispose();
    investmentsTextController?.dispose();

    totalDebtFocusNode?.dispose();
    totalDebtTextController?.dispose();

    monthlyDebtFocusNode?.dispose();
    monthlyDebtTextController?.dispose();
  }
}
