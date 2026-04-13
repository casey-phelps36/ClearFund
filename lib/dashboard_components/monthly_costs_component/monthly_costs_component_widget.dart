import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'monthly_costs_component_model.dart';
export 'monthly_costs_component_model.dart';

/// adjust monthly expenses
class MonthlyCostsComponentWidget extends StatefulWidget {
  const MonthlyCostsComponentWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
    this.parameter4,
  });

  final double? parameter1;
  final double? parameter2;
  final double? parameter3;
  final double? parameter4;

  @override
  State<MonthlyCostsComponentWidget> createState() =>
      _MonthlyCostsComponentWidgetState();
}

class _MonthlyCostsComponentWidgetState
    extends State<MonthlyCostsComponentWidget> {
  late MonthlyCostsComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MonthlyCostsComponentModel());

    _model.rentTextController ??= TextEditingController();
    _model.rentFocusNode ??= FocusNode();

    _model.utilitiesTextController ??= TextEditingController();
    _model.utilitiesFocusNode ??= FocusNode();

    _model.foodGroceriesTextController ??= TextEditingController();
    _model.foodGroceriesFocusNode ??= FocusNode();

    _model.transportationTextController ??= TextEditingController();
    _model.transportationFocusNode ??= FocusNode();

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
          maxHeight: 550.0,
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
                      color: Color(0x1AF44336),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        Icons.receipt_long_rounded,
                        color: Colors.red,
                        size: 20.0,
                      ),
                    ),
                  ),
                  Text(
                    'Monthly Expenses',
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
                    'Housing (Rent / Mortgage)',
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
                    controller: _model.rentTextController,
                    focusNode: _model.rentFocusNode,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.rentTextController',
                      Duration(milliseconds: 2000),
                      () async {
                        logFirebaseEvent(
                            'MONTHLY_COSTS_COMPONENT_rent_ON_TEXTFIEL');
                        logFirebaseEvent('rent_backend_call');

                        await currentUserReference!
                            .update(createUsersRecordData(
                          rent: double.tryParse(_model.rentTextController.text),
                        ));
                        logFirebaseEvent('rent_backend_call');

                        await currentUserReference!
                            .update(createUsersRecordData(
                          bills: (valueOrDefault(
                                  currentUserDocument?.rent, 0.0)) +
                              (valueOrDefault(
                                  currentUserDocument?.groceries, 0.0)) +
                              (valueOrDefault(
                                  currentUserDocument?.transportation, 0.0)) +
                              (valueOrDefault(
                                  currentUserDocument?.utilities, 0.0)) +
                              (valueOrDefault(
                                  currentUserDocument?.monthlyDebt, 0.0)),
                        ));
                        logFirebaseEvent('rent_backend_call');

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
                        logFirebaseEvent('rent_update_app_state');
                        FFAppState().rent =
                            valueOrDefault(currentUserDocument?.rent, 0.0);
                        FFAppState().totalMonthlyCosts =
                            valueOrDefault(currentUserDocument?.bills, 0.0);
                        FFAppState().availableSpending = valueOrDefault(
                            currentUserDocument?.availableSpendings, 0.0);
                      },
                    ),
                    autofocus: false,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'e.g. 1,500',
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
                        Icons.home_rounded,
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
                    validator:
                        _model.rentTextControllerValidator.asValidator(context),
                  ),
                  Text(
                    'Utilities & Bills',
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
                    controller: _model.utilitiesTextController,
                    focusNode: _model.utilitiesFocusNode,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.utilitiesTextController',
                      Duration(milliseconds: 2000),
                      () async {
                        logFirebaseEvent(
                            'MONTHLY_COSTS_COMPONENT_utilities_ON_TEX');
                        logFirebaseEvent('utilities_backend_call');

                        await currentUserReference!
                            .update(createUsersRecordData(
                          utilities: double.tryParse(
                              _model.utilitiesTextController.text),
                        ));
                        logFirebaseEvent('utilities_backend_call');

                        await currentUserReference!
                            .update(createUsersRecordData(
                          bills: (valueOrDefault(
                                  currentUserDocument?.rent, 0.0)) +
                              (valueOrDefault(
                                  currentUserDocument?.groceries, 0.0)) +
                              (valueOrDefault(
                                  currentUserDocument?.transportation, 0.0)) +
                              (valueOrDefault(
                                  currentUserDocument?.utilities, 0.0)) +
                              (valueOrDefault(
                                  currentUserDocument?.monthlyDebt, 0.0)),
                        ));
                        logFirebaseEvent('utilities_backend_call');

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
                        logFirebaseEvent('utilities_update_app_state');
                        FFAppState().utility =
                            valueOrDefault(currentUserDocument?.utilities, 0.0);
                        FFAppState().totalMonthlyCosts =
                            valueOrDefault(currentUserDocument?.bills, 0.0);
                        FFAppState().availableSpending = valueOrDefault(
                            currentUserDocument?.availableSpendings, 0.0);
                      },
                    ),
                    autofocus: false,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'e.g. 300',
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
                        Icons.bolt_rounded,
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
                    validator: _model.utilitiesTextControllerValidator
                        .asValidator(context),
                  ),
                  Text(
                    'Food & Groceries',
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
                    controller: _model.foodGroceriesTextController,
                    focusNode: _model.foodGroceriesFocusNode,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.foodGroceriesTextController',
                      Duration(milliseconds: 2000),
                      () async {
                        logFirebaseEvent(
                            'MONTHLY_COSTS_COMPONENT_foodGroceries_ON');
                        logFirebaseEvent('foodGroceries_backend_call');

                        await currentUserReference!
                            .update(createUsersRecordData(
                          groceries: double.tryParse(
                              _model.foodGroceriesTextController.text),
                        ));
                        logFirebaseEvent('foodGroceries_backend_call');

                        await currentUserReference!
                            .update(createUsersRecordData(
                          bills: (valueOrDefault(
                                  currentUserDocument?.rent, 0.0)) +
                              (valueOrDefault(
                                  currentUserDocument?.groceries, 0.0)) +
                              (valueOrDefault(
                                  currentUserDocument?.transportation, 0.0)) +
                              (valueOrDefault(
                                  currentUserDocument?.utilities, 0.0)) +
                              (valueOrDefault(
                                  currentUserDocument?.monthlyDebt, 0.0)),
                        ));
                        logFirebaseEvent('foodGroceries_backend_call');

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
                        logFirebaseEvent('foodGroceries_update_app_state');
                        FFAppState().groceries =
                            valueOrDefault(currentUserDocument?.groceries, 0.0);
                        FFAppState().totalMonthlyCosts =
                            valueOrDefault(currentUserDocument?.bills, 0.0);
                        FFAppState().availableSpending = valueOrDefault(
                            currentUserDocument?.availableSpendings, 0.0);
                      },
                    ),
                    autofocus: false,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'e.g. 600',
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
                        Icons.shopping_cart_rounded,
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
                    validator: _model.foodGroceriesTextControllerValidator
                        .asValidator(context),
                  ),
                  Text(
                    'Transportation',
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
                    controller: _model.transportationTextController,
                    focusNode: _model.transportationFocusNode,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.transportationTextController',
                      Duration(milliseconds: 2000),
                      () async {
                        logFirebaseEvent(
                            'MONTHLY_COSTS_COMPONENT_transportation_O');
                        logFirebaseEvent('transportation_backend_call');

                        await currentUserReference!
                            .update(createUsersRecordData(
                          transportation: double.tryParse(
                              _model.transportationTextController.text),
                        ));
                        logFirebaseEvent('transportation_backend_call');

                        await currentUserReference!
                            .update(createUsersRecordData(
                          bills: (valueOrDefault(
                                  currentUserDocument?.rent, 0.0)) +
                              (valueOrDefault(
                                  currentUserDocument?.groceries, 0.0)) +
                              (valueOrDefault(
                                  currentUserDocument?.transportation, 0.0)) +
                              (valueOrDefault(
                                  currentUserDocument?.utilities, 0.0)) +
                              (valueOrDefault(
                                  currentUserDocument?.monthlyDebt, 0.0)),
                        ));
                        logFirebaseEvent('transportation_backend_call');

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
                        logFirebaseEvent('transportation_update_app_state');
                        FFAppState().transportation = valueOrDefault(
                            currentUserDocument?.transportation, 0.0);
                        FFAppState().totalMonthlyCosts =
                            valueOrDefault(currentUserDocument?.bills, 0.0);
                        FFAppState().availableSpending = valueOrDefault(
                            currentUserDocument?.availableSpendings, 0.0);
                      },
                    ),
                    autofocus: false,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'e.g. 250',
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
                        Icons.directions_car_rounded,
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
                    validator: _model.transportationTextControllerValidator
                        .asValidator(context),
                  ),
                ].divide(SizedBox(height: 12.0)),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent(
                        'MONTHLY_COSTS_COMPONENT_updateCostCom_ON');
                    logFirebaseEvent('updateCostCom_google_analytics_event');
                    logFirebaseEvent(
                      'dashboard_Update',
                      parameters: {
                        'Param 12': 'dashboard_costs',
                      },
                    );
                    logFirebaseEvent('updateCostCom_update_app_state');
                    FFAppState().availableSpending =
                        valueOrDefault(currentUserDocument?.totalncome, 0.0) -
                            valueOrDefault(currentUserDocument?.bills, 0.0) -
                            valueOrDefault(
                                currentUserDocument?.totalExpenses, 0.0) -
                            valueOrDefault(
                                currentUserDocument?.investmentAndGoals, 0.0);
                    FFAppState().update(() {});
                    logFirebaseEvent('updateCostCom_backend_call');

                    await currentUserReference!.update(createUsersRecordData(
                      availableSpendings:
                          valueOrDefault(currentUserDocument?.totalncome, 0.0) -
                              valueOrDefault(currentUserDocument?.bills, 0.0) -
                              valueOrDefault(
                                  currentUserDocument?.totalExpenses, 0.0) -
                              valueOrDefault(
                                  currentUserDocument?.investmentAndGoals, 0.0),
                    ));
                    logFirebaseEvent('updateCostCom_bottom_sheet');
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
