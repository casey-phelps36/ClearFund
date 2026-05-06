import '/flutter_flow/flutter_flow_util.dart';
import 'create_goal_bottom_widget.dart' show CreateGoalBottomWidget;
import 'package:flutter/material.dart';

class CreateGoalBottomModel extends FlutterFlowModel<CreateGoalBottomWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for SavingGoalField widget.
  FocusNode? savingGoalFieldFocusNode;
  TextEditingController? savingGoalFieldTextController;
  String? Function(BuildContext, String?)?
      savingGoalFieldTextControllerValidator;
  // State field(s) for CurrentSavingField widget.
  FocusNode? currentSavingFieldFocusNode;
  TextEditingController? currentSavingFieldTextController;
  String? Function(BuildContext, String?)?
      currentSavingFieldTextControllerValidator;
  // State field(s) for InvestmentGoalField widget.
  FocusNode? investmentGoalFieldFocusNode;
  TextEditingController? investmentGoalFieldTextController;
  String? Function(BuildContext, String?)?
      investmentGoalFieldTextControllerValidator;
  // State field(s) for CurrentInvestmentGField widget.
  FocusNode? currentInvestmentGFieldFocusNode;
  TextEditingController? currentInvestmentGFieldTextController;
  String? Function(BuildContext, String?)?
      currentInvestmentGFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    savingGoalFieldFocusNode?.dispose();
    savingGoalFieldTextController?.dispose();

    currentSavingFieldFocusNode?.dispose();
    currentSavingFieldTextController?.dispose();

    investmentGoalFieldFocusNode?.dispose();
    investmentGoalFieldTextController?.dispose();

    currentInvestmentGFieldFocusNode?.dispose();
    currentInvestmentGFieldTextController?.dispose();
  }
}
