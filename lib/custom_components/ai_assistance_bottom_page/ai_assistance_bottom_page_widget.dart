import '/auth/firebase_auth/auth_util.dart';
import '/backend/ai_agents/ai_agent.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ai_assistance_bottom_page_model.dart';
export 'ai_assistance_bottom_page_model.dart';

class AiAssistanceBottomPageWidget extends StatefulWidget {
  const AiAssistanceBottomPageWidget({super.key});

  @override
  State<AiAssistanceBottomPageWidget> createState() =>
      _AiAssistanceBottomPageWidgetState();
}

class _AiAssistanceBottomPageWidgetState
    extends State<AiAssistanceBottomPageWidget> {
  late AiAssistanceBottomPageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AiAssistanceBottomPageModel());

    _model.currentInvestmentGFieldTextController ??= TextEditingController();
    _model.currentInvestmentGFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 298.0,
      height: 301.15,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.roboto(
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              width: 200.0,
              child: TextFormField(
                controller: _model.currentInvestmentGFieldTextController,
                focusNode: _model.currentInvestmentGFieldFocusNode,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.currentInvestmentGFieldTextController',
                  Duration(milliseconds: 2000),
                  () async {
                    logFirebaseEvent(
                        'AI_ASSISTANCE_BOTTOM_CurrentInvestmentGF');
                    logFirebaseEvent(
                        'CurrentInvestmentGField_update_component');
                    _model.userPrompt = '';
                    safeSetState(() {});
                  },
                ),
                autofocus: false,
                enabled: true,
                obscureText: false,
                decoration: InputDecoration(
                  isDense: true,
                  labelText: 'Get help from us',
                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        font: GoogleFonts.roboto(
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).labelMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelMedium.fontStyle,
                      ),
                  hintText: 'How can I help',
                  hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        font: GoogleFonts.roboto(
                          fontWeight: FontWeight.normal,
                          fontStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .fontStyle,
                        ),
                        fontSize: 12.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelMedium.fontStyle,
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primaryText,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.roboto(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                cursorColor: FlutterFlowTheme.of(context).primaryText,
                enableInteractiveSelection: true,
                validator: _model.currentInvestmentGFieldTextControllerValidator
                    .asValidator(context),
              ),
            ),
          ),
          FFButtonWidget(
            onPressed: () async {
              logFirebaseEvent('AI_ASSISTANCE_BOTTOM_ASK_BTN_ON_TAP');
              logFirebaseEvent('Button_a_i_agent');
              await callAiAgent(
                context: context,
                prompt: null,
                threadId: currentUserUid,
                agentCloudFunctionName: 'clearFundAI',
                provider: 'GOOGLE',
                agentJson:
                    '{\"status\":\"LIVE\",\"identifier\":{\"name\":\"clearFundAI\",\"key\":\"eu0or\"},\"name\":\"ClearFund AI\",\"description\":\"This AI is used to help ClearFund users make informed financial decisions by analyzing their income, expenses, savings habits, goals, and spending behavior. It should provide practical recommendations for saving money, budgeting, investing appropriate amounts, and improving overall financial health in a clear and supportive way.\",\"aiModel\":{\"provider\":\"GOOGLE\",\"model\":\"gemini-2.5-pro\",\"parameters\":{\"temperature\":{\"inputValue\":0.5},\"maxTokens\":{\"inputValue\":1000},\"topP\":{\"inputValue\":0.8}},\"messages\":[{\"role\":\"SYSTEM\",\"text\":\"You are ClearFund’s AI financial assistant. Your role is to help users make smarter personal finance decisions based on the information they provide, such as income, expenses, debt, savings, goals, and spending habits.\\n\\nYour responsibilities:\\n- Help users budget more effectively\\n- Suggest practical ways to save money\\n- Recommend reasonable amounts to save or invest based on the user’s situation\\n- Identify wasteful spending patterns and opportunities to improve financial health\\n- Explain financial ideas in simple, easy-to-understand language\\n- Give step-by-step guidance when helpful\\n\\nRules:\\n- Be supportive, practical, and clear\\n- Personalize advice to the user’s financial situation\\n- Ask for missing financial details when needed before making strong recommendations\\n- Do not pretend to know information the user has not provided\\n- Do not guarantee financial outcomes or promise investment returns\\n- Do not give reckless, overly aggressive, or unrealistic advice\\n- Frame investment guidance as general educational support, not professional financial advice\\n- Prioritize emergency savings, debt awareness, affordability, and risk tolerance before suggesting investing\\n- Keep answers concise, structured, and actionable\\n\\nWhen helping users:\\n1. Understand their current financial situation\\n2. Identify their main goal, such as saving money, paying off debt, or investing\\n3. Recommend the safest and most reasonable next steps\\n4. Explain why the recommendation makes sense\\n5. When possible, provide numbers, categories, or example allocations\"}]},\"requestOptions\":{\"requestTypes\":[\"PLAINTEXT\"]},\"responseOptions\":{\"responseType\":\"PLAINTEXT\"}}',
                responseType: 'PLAINTEXT',
              ).then((generatedText) {
                safeSetState(() => {});
              });
            },
            text: 'Ask',
            options: FFButtonOptions(
              height: 40.0,
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    font: GoogleFonts.roboto(
                      fontWeight:
                          FlutterFlowTheme.of(context).titleSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleSmall.fontStyle,
                    ),
                    color: Colors.white,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).titleSmall.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleSmall.fontStyle,
                  ),
              elevation: 0.0,
              borderRadius: BorderRadius.circular(24.0),
            ),
          ),
        ],
      ),
    );
  }
}
