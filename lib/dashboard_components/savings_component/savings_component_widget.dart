import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'savings_component_model.dart';
export 'savings_component_model.dart';

/// adjust savings values
class SavingsComponentWidget extends StatefulWidget {
  const SavingsComponentWidget({
    super.key,
    this.parameter1,
    this.parameter2,
  });

  final double? parameter1;
  final double? parameter2;

  @override
  State<SavingsComponentWidget> createState() => _SavingsComponentWidgetState();
}

class _SavingsComponentWidgetState extends State<SavingsComponentWidget> {
  late SavingsComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SavingsComponentModel());

    _model.monthlySavingsTextController ??= TextEditingController();
    _model.monthlySavingsFocusNode ??= FocusNode();

    _model.investmentsTextController ??= TextEditingController();
    _model.investmentsFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          maxWidth: 400.0,
          maxHeight: 350.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 8.0,
              color: Color(0x1A000000),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 36.0,
                    height: 36.0,
                    decoration: BoxDecoration(
                      color: Color(0x1A2196F3),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        Icons.savings_rounded,
                        color: Colors.blue,
                        size: 20.0,
                      ),
                    ),
                  ),
                  Text(
                    'Savings & Investments',
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          font: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          fontStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontStyle,
                        ),
                  ),
                ].divide(SizedBox(width: 8.0)),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Monthly Savings Goal',
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          font: GoogleFonts.roboto(
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .fontStyle,
                        ),
                  ),
                  TextFormField(
                    controller: _model.monthlySavingsTextController,
                    focusNode: _model.monthlySavingsFocusNode,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.monthlySavingsTextController',
                      Duration(milliseconds: 2000),
                      () async {
                        logFirebaseEvent(
                            'SAVINGS_COMPONENT_monthlySavings_ON_TEXT');
                        logFirebaseEvent('monthlySavings_backend_call');

                        await currentUserReference!
                            .update(createUsersRecordData(
                          savingGoal: double.tryParse(
                              _model.monthlySavingsTextController.text),
                        ));
                        logFirebaseEvent('monthlySavings_backend_call');

                        await currentUserReference!
                            .update(createUsersRecordData(
                          investmentAndGoals: valueOrDefault(
                                  currentUserDocument?.savingGoal, 0.0) +
                              valueOrDefault(
                                  currentUserDocument?.investmentGoal, 0.0),
                        ));
                        logFirebaseEvent('monthlySavings_backend_call');

                        await currentUserReference!
                            .update(createUsersRecordData(
                          availableSpendings: valueOrDefault(
                                  currentUserDocument?.totalncome, 0.0) -
                              valueOrDefault(currentUserDocument?.bills, 0.0) -
                              valueOrDefault(
                                  currentUserDocument?.totalExpenses, 0.0) -
                              valueOrDefault(
                                  currentUserDocument?.investmentAndGoals, 0.0),
                        ));
                        logFirebaseEvent('monthlySavings_update_app_state');
                        FFAppState().availableSpending = valueOrDefault(
                            currentUserDocument?.availableSpendings, 0.0);
                        FFAppState().savingsGoal = valueOrDefault(
                            currentUserDocument?.savingGoal, 0.0);
                      },
                    ),
                    autofocus: false,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'e.g. 800',
                      hintStyle: FlutterFlowTheme.of(context)
                          .bodyMedium
                          .override(
                            font: GoogleFonts.roboto(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.of(context).primaryBackground,
                      contentPadding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 14.0, 16.0, 14.0),
                      prefixIcon: Icon(
                        Icons.attach_money_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 18.0,
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.roboto(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                    keyboardType: TextInputType.number,
                    validator: _model.monthlySavingsTextControllerValidator
                        .asValidator(context),
                  ),
                  Text(
                    'Investment Contributions',
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          font: GoogleFonts.roboto(
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .fontStyle,
                        ),
                  ),
                  TextFormField(
                    controller: _model.investmentsTextController,
                    focusNode: _model.investmentsFocusNode,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.investmentsTextController',
                      Duration(milliseconds: 2000),
                      () async {
                        logFirebaseEvent(
                            'SAVINGS_COMPONENT_investments_ON_TEXTFIE');
                        logFirebaseEvent('investments_backend_call');

                        await currentUserReference!
                            .update(createUsersRecordData(
                          investmentGoal: double.tryParse(
                              _model.investmentsTextController.text),
                        ));
                        logFirebaseEvent('investments_backend_call');

                        await currentUserReference!
                            .update(createUsersRecordData(
                          investmentAndGoals: valueOrDefault(
                                  currentUserDocument?.savingGoal, 0.0) +
                              valueOrDefault(
                                  currentUserDocument?.investmentGoal, 0.0),
                        ));
                        logFirebaseEvent('investments_backend_call');

                        await currentUserReference!
                            .update(createUsersRecordData(
                          availableSpendings: valueOrDefault(
                                  currentUserDocument?.totalncome, 0.0) -
                              valueOrDefault(currentUserDocument?.bills, 0.0) -
                              valueOrDefault(
                                  currentUserDocument?.totalExpenses, 0.0) -
                              valueOrDefault(
                                  currentUserDocument?.investmentAndGoals, 0.0),
                        ));
                        logFirebaseEvent('investments_update_app_state');
                        FFAppState().availableSpending = valueOrDefault(
                            currentUserDocument?.availableSpendings, 0.0);
                        FFAppState().investments = valueOrDefault(
                            currentUserDocument?.investmentGoal, 0.0);
                      },
                    ),
                    autofocus: false,
                    textInputAction: TextInputAction.done,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'e.g. 500',
                      hintStyle: FlutterFlowTheme.of(context)
                          .bodyMedium
                          .override(
                            font: GoogleFonts.roboto(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.of(context).primaryBackground,
                      contentPadding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 14.0, 16.0, 14.0),
                      prefixIcon: Icon(
                        Icons.trending_up_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 18.0,
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.roboto(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                    keyboardType: TextInputType.number,
                    validator: _model.investmentsTextControllerValidator
                        .asValidator(context),
                  ),
                ].divide(SizedBox(height: 12.0)),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent(
                        'SAVINGS_COMPONENT_updateSavingsCom_ON_TA');
                    logFirebaseEvent('updateSavingsCom_google_analytics_event');
                    logFirebaseEvent(
                      'dashboard_Update',
                      parameters: {
                        'Param 13': 'dashboard_savings',
                      },
                    );
                    logFirebaseEvent('updateSavingsCom_update_app_state');
                    FFAppState().availableSpending =
                        valueOrDefault(currentUserDocument?.totalncome, 0.0) -
                            valueOrDefault(currentUserDocument?.bills, 0.0) -
                            valueOrDefault(
                                currentUserDocument?.totalExpenses, 0.0) -
                            valueOrDefault(
                                currentUserDocument?.investmentAndGoals, 0.0);
                    FFAppState().update(() {});
                    logFirebaseEvent('updateSavingsCom_backend_call');

                    await currentUserReference!.update(createUsersRecordData(
                      availableSpendings:
                          valueOrDefault(currentUserDocument?.totalncome, 0.0) -
                              valueOrDefault(currentUserDocument?.bills, 0.0) -
                              valueOrDefault(
                                  currentUserDocument?.totalExpenses, 0.0) -
                              valueOrDefault(
                                  currentUserDocument?.investmentAndGoals, 0.0),
                    ));
                    logFirebaseEvent('updateSavingsCom_bottom_sheet');
                    Navigator.pop(context);
                  },
                  text: 'Save',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.roboto(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: Colors.white,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                ),
              ),
            ].divide(SizedBox(height: 16.0)),
          ),
        ),
      ),
    );
  }
}
