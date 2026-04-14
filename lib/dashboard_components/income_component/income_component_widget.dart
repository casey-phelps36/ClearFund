import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'income_component_model.dart';
export 'income_component_model.dart';

/// adjust income values
class IncomeComponentWidget extends StatefulWidget {
  const IncomeComponentWidget({
    super.key,
    this.parameter1,
    this.parameter2,
  });

  final double? parameter1;
  final double? parameter2;

  @override
  State<IncomeComponentWidget> createState() => _IncomeComponentWidgetState();
}

class _IncomeComponentWidgetState extends State<IncomeComponentWidget> {
  late IncomeComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IncomeComponentModel());

    _model.monthlyCheckTextController ??= TextEditingController();
    _model.monthlyCheckFocusNode ??= FocusNode();

    _model.additionalIncomeTextController ??= TextEditingController();
    _model.additionalIncomeFocusNode ??= FocusNode();

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
                      color: Color(0x1A4CAF50),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        Icons.account_balance_wallet_rounded,
                        color: Colors.green,
                        size: 20.0,
                      ),
                    ),
                  ),
                  Text(
                    'Income',
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
                    'Monthly Salary',
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
                  Semantics(
                    label: 'MonthlyCheck',
                    child: TextFormField(
                      controller: _model.monthlyCheckTextController,
                      focusNode: _model.monthlyCheckFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.monthlyCheckTextController',
                        Duration(milliseconds: 2000),
                        () async {
                          logFirebaseEvent(
                              'INCOME_COMPONENT_MonthlyCheck_ON_TEXTFIE');
                          logFirebaseEvent('MonthlyCheck_backend_call');

                          await currentUserReference!
                              .update(createUsersRecordData(
                            monthlyIncome: double.tryParse(
                                _model.monthlyCheckTextController.text),
                          ));
                          logFirebaseEvent('MonthlyCheck_backend_call');

                          await currentUserReference!
                              .update(createUsersRecordData(
                            totalncome: valueOrDefault(
                                    currentUserDocument?.monthlyIncome, 0.0) +
                                valueOrDefault(
                                    currentUserDocument?.additionalIncome, 0.0),
                          ));
                          logFirebaseEvent('MonthlyCheck_backend_call');

                          await currentUserReference!
                              .update(createUsersRecordData(
                            availableSpendings: valueOrDefault(
                                    currentUserDocument?.totalncome, 0.0) -
                                valueOrDefault(
                                    currentUserDocument?.bills, 0.0) -
                                valueOrDefault(
                                    currentUserDocument?.totalExpenses, 0.0) -
                                valueOrDefault(
                                    currentUserDocument?.investmentAndGoals,
                                    0.0),
                          ));
                          logFirebaseEvent('MonthlyCheck_update_app_state');
                          FFAppState().monthlyIncome = double.parse(
                              _model.monthlyCheckTextController.text);
                          FFAppState().totalMonthlyIncome = valueOrDefault(
                                  currentUserDocument?.monthlyIncome, 0.0) +
                              valueOrDefault(
                                  currentUserDocument?.additionalIncome, 0.0);
                        },
                      ),
                      autofocus: false,
                      textInputAction: TextInputAction.next,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'e.g. 5,000',
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
                        fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
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
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                      keyboardType: TextInputType.number,
                      validator: _model.monthlyCheckTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                  Text(
                    'Additional Income',
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
                  Semantics(
                    label: 'additionalIncome',
                    child: TextFormField(
                      controller: _model.additionalIncomeTextController,
                      focusNode: _model.additionalIncomeFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.additionalIncomeTextController',
                        Duration(milliseconds: 2000),
                        () async {
                          logFirebaseEvent(
                              'INCOME_COMPONENT_additionalIncome_ON_TEX');
                          logFirebaseEvent('additionalIncome_backend_call');

                          await currentUserReference!
                              .update(createUsersRecordData(
                            additionalIncome: double.tryParse(
                                _model.additionalIncomeTextController.text),
                          ));
                          logFirebaseEvent('additionalIncome_backend_call');

                          await currentUserReference!
                              .update(createUsersRecordData(
                            totalncome: valueOrDefault(
                                    currentUserDocument?.monthlyIncome, 0.0) +
                                valueOrDefault(
                                    currentUserDocument?.additionalIncome, 0.0),
                          ));
                          logFirebaseEvent('additionalIncome_backend_call');

                          await currentUserReference!
                              .update(createUsersRecordData(
                            availableSpendings: valueOrDefault(
                                    currentUserDocument?.totalncome, 0.0) -
                                valueOrDefault(
                                    currentUserDocument?.bills, 0.0) -
                                valueOrDefault(
                                    currentUserDocument?.totalExpenses, 0.0) -
                                valueOrDefault(
                                    currentUserDocument?.investmentAndGoals,
                                    0.0),
                          ));
                          logFirebaseEvent('additionalIncome_update_app_state');
                          FFAppState().additionaMonthlylncome = double.parse(
                              _model.additionalIncomeTextController.text);
                          FFAppState().totalMonthlyIncome = valueOrDefault(
                                  currentUserDocument?.monthlyIncome, 0.0) +
                              valueOrDefault(
                                  currentUserDocument?.additionalIncome, 0.0);
                        },
                      ),
                      autofocus: false,
                      textInputAction: TextInputAction.next,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'e.g. 1,200',
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
                        fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
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
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                      keyboardType: TextInputType.number,
                      validator: _model.additionalIncomeTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ].divide(SizedBox(height: 12.0)),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Semantics(
                  label: 'updateIncomeCom',
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'INCOME_COMPONENT_updateIncomeCom_ON_TAP');
                      logFirebaseEvent(
                          'updateIncomeCom_google_analytics_event');
                      logFirebaseEvent(
                        'dashboard_Update',
                        parameters: {
                          'Param 11': 'dashboard_income',
                        },
                      );
                      logFirebaseEvent('updateIncomeCom_update_app_state');
                      FFAppState().availableSpending =
                          valueOrDefault(currentUserDocument?.totalncome, 0.0) -
                              valueOrDefault(currentUserDocument?.bills, 0.0) -
                              valueOrDefault(
                                  currentUserDocument?.totalExpenses, 0.0) -
                              valueOrDefault(
                                  currentUserDocument?.investmentAndGoals, 0.0);
                      FFAppState().update(() {});
                      logFirebaseEvent('updateIncomeCom_backend_call');

                      await currentUserReference!.update(createUsersRecordData(
                        availableSpendings: valueOrDefault(
                                currentUserDocument?.totalncome, 0.0) -
                            valueOrDefault(currentUserDocument?.bills, 0.0) -
                            valueOrDefault(
                                currentUserDocument?.totalExpenses, 0.0) -
                            valueOrDefault(
                                currentUserDocument?.investmentAndGoals, 0.0),
                      ));
                      logFirebaseEvent('updateIncomeCom_bottom_sheet');
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
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
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
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(24.0),
                    ),
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
