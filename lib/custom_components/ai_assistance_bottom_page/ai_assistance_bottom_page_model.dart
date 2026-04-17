import '/flutter_flow/flutter_flow_util.dart';
import 'ai_assistance_bottom_page_widget.dart'
    show AiAssistanceBottomPageWidget;
import 'package:flutter/material.dart';

class AiAssistanceBottomPageModel
    extends FlutterFlowModel<AiAssistanceBottomPageWidget> {
  ///  Local state fields for this component.

  String? userPrompt;

  String? aiResponse;

  bool isLoading = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for CurrentInvestmentGField widget.
  FocusNode? currentInvestmentGFieldFocusNode;
  TextEditingController? currentInvestmentGFieldTextController;
  String? Function(BuildContext, String?)?
      currentInvestmentGFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    currentInvestmentGFieldFocusNode?.dispose();
    currentInvestmentGFieldTextController?.dispose();
  }
}
