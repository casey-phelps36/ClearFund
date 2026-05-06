import '/flutter_flow/flutter_flow_util.dart';
import 'investment_edit_window_widget.dart' show InvestmentEditWindowWidget;
import 'package:flutter/material.dart';

class InvestmentEditWindowModel
    extends FlutterFlowModel<InvestmentEditWindowWidget> {
  ///  State fields for stateful widgets in this component.

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
    investmentGoalFieldFocusNode?.dispose();
    investmentGoalFieldTextController?.dispose();

    currentInvestmentGFieldFocusNode?.dispose();
    currentInvestmentGFieldTextController?.dispose();
  }
}
