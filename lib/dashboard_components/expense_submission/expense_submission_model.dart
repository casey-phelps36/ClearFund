import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'expense_submission_widget.dart' show ExpenseSubmissionWidget;
import 'package:flutter/material.dart';

class ExpenseSubmissionModel extends FlutterFlowModel<ExpenseSubmissionWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for expenseInput widget.
  FocusNode? expenseInputFocusNode;
  TextEditingController? expenseInputTextController;
  String? Function(BuildContext, String?)? expenseInputTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expenseInputFocusNode?.dispose();
    expenseInputTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();
  }
}
