import '/flutter_flow/flutter_flow_util.dart';
import 'debt_component_widget.dart' show DebtComponentWidget;
import 'package:flutter/material.dart';

class DebtComponentModel extends FlutterFlowModel<DebtComponentWidget> {
  ///  State fields for stateful widgets in this component.

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
    totalDebtFocusNode?.dispose();
    totalDebtTextController?.dispose();

    monthlyDebtFocusNode?.dispose();
    monthlyDebtTextController?.dispose();
  }
}
