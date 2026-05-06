import '/flutter_flow/flutter_flow_util.dart';
import 'income_component_widget.dart' show IncomeComponentWidget;
import 'package:flutter/material.dart';

class IncomeComponentModel extends FlutterFlowModel<IncomeComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for MonthlyCheck widget.
  FocusNode? monthlyCheckFocusNode;
  TextEditingController? monthlyCheckTextController;
  String? Function(BuildContext, String?)? monthlyCheckTextControllerValidator;
  // State field(s) for additionalIncome widget.
  FocusNode? additionalIncomeFocusNode;
  TextEditingController? additionalIncomeTextController;
  String? Function(BuildContext, String?)?
      additionalIncomeTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    monthlyCheckFocusNode?.dispose();
    monthlyCheckTextController?.dispose();

    additionalIncomeFocusNode?.dispose();
    additionalIncomeTextController?.dispose();
  }
}
