import '/flutter_flow/flutter_flow_util.dart';
import 'monthly_costs_component_widget.dart' show MonthlyCostsComponentWidget;
import 'package:flutter/material.dart';

class MonthlyCostsComponentModel
    extends FlutterFlowModel<MonthlyCostsComponentWidget> {
  ///  State fields for stateful widgets in this component.

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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    rentFocusNode?.dispose();
    rentTextController?.dispose();

    utilitiesFocusNode?.dispose();
    utilitiesTextController?.dispose();

    foodGroceriesFocusNode?.dispose();
    foodGroceriesTextController?.dispose();

    transportationFocusNode?.dispose();
    transportationTextController?.dispose();
  }
}
