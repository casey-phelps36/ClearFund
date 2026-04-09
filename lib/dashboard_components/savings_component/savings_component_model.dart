import '/flutter_flow/flutter_flow_util.dart';
import 'savings_component_widget.dart' show SavingsComponentWidget;
import 'package:flutter/material.dart';

class SavingsComponentModel extends FlutterFlowModel<SavingsComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for monthlySavings widget.
  FocusNode? monthlySavingsFocusNode;
  TextEditingController? monthlySavingsTextController;
  String? Function(BuildContext, String?)?
      monthlySavingsTextControllerValidator;
  // State field(s) for investments widget.
  FocusNode? investmentsFocusNode;
  TextEditingController? investmentsTextController;
  String? Function(BuildContext, String?)? investmentsTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    monthlySavingsFocusNode?.dispose();
    monthlySavingsTextController?.dispose();

    investmentsFocusNode?.dispose();
    investmentsTextController?.dispose();
  }
}
