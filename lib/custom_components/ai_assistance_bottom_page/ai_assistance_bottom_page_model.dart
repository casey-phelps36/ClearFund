import '/backend/api_requests/api_calls.dart';
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

  // State field(s) for askAIPrompt widget.
  FocusNode? askAIPromptFocusNode;
  TextEditingController? askAIPromptTextController;
  String? Function(BuildContext, String?)? askAIPromptTextControllerValidator;
  // Stores action output result for [Backend Call - API (ClearFund AI)] action in Button widget.
  ApiCallResponse? apiResult1wa;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    askAIPromptFocusNode?.dispose();
    askAIPromptTextController?.dispose();
  }
}
