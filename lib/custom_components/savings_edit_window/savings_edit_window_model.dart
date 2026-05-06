import '/flutter_flow/flutter_flow_util.dart';
import 'savings_edit_window_widget.dart' show SavingsEditWindowWidget;
import 'package:flutter/material.dart';

class SavingsEditWindowModel extends FlutterFlowModel<SavingsEditWindowWidget> {
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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    savingGoalFieldFocusNode?.dispose();
    savingGoalFieldTextController?.dispose();

    currentSavingFieldFocusNode?.dispose();
    currentSavingFieldTextController?.dispose();
  }
}
