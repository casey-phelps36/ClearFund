import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:integration_test/integration_test.dart';
import 'package:clear_fund/flutter_flow/flutter_flow_icon_button.dart';
import 'package:clear_fund/flutter_flow/flutter_flow_widgets.dart';
import 'package:clear_fund/flutter_flow/flutter_flow_theme.dart';
import 'package:clear_fund/index.dart';
import 'package:clear_fund/main.dart';
import 'package:clear_fund/flutter_flow/flutter_flow_util.dart';

import 'package:provider/provider.dart';
import 'package:clear_fund/backend/firebase/firebase_config.dart';
import 'package:clear_fund/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initFirebase();

    await FlutterFlowTheme.initialize();
  });

  setUp(() async {
    await authManager.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();
  });

  group('Us4', () {
    testWidgets('navigate to finance', (WidgetTester tester) async {
      _overrideOnError();
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: 'test@test.com', password: 'password');
      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: Dashboardv3Widget(),
        ),
      ));
      await GoogleFonts.pendingFonts();

      await tester.pumpAndSettle(const Duration(milliseconds: 5000));
      await tester.tap(find.descendant(
        of: find.byKey(const ValueKey('navBar_80i6')),
        matching: find.byWidgetPredicate((Widget widget) =>
            widget is FaIcon && widget.icon == FontAwesomeIcons.moneyCheckAlt),
      ));
      await tester.pumpAndSettle(const Duration(milliseconds: 5000));
      expect(find.text('Financial Info'), findsWidgets);
    }, skip: true);

    testWidgets('finance update', (WidgetTester tester) async {
      _overrideOnError();
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: 'test123@gmail.com', password: 'password');
      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: Dashboardv3Widget(),
        ),
      ));
      await GoogleFonts.pendingFonts();

      await tester.tap(find.descendant(
        of: find.byKey(const ValueKey('navBar_80i6')),
        matching: find.byWidgetPredicate((Widget widget) =>
            widget is FaIcon && widget.icon == FontAwesomeIcons.moneyCheckAlt),
      ));
      await tester.pumpAndSettle(const Duration(milliseconds: 5000));
      await tester.enterText(
          find.byKey(const ValueKey('MonthlyCheck_lmjc')), '5000');
      await tester.enterText(
          find.byKey(const ValueKey('additionalIncome_dm9x')), '1200');
      await tester.enterText(find.byKey(const ValueKey('rent_f26p')), '1500');
      await tester.enterText(
          find.byKey(const ValueKey('utilities_bac4')), '300');
      await tester.enterText(
          find.byKey(const ValueKey('foodGroceries_p64f')), '600');
      await tester.enterText(
          find.byKey(const ValueKey('transportation_m4eo')), '250');
      await tester.enterText(
          find.byKey(const ValueKey('monthlySavings_t4vo')), '800');
      await tester.enterText(
          find.byKey(const ValueKey('investments_5a4k')), '500');
      await tester.enterText(
          find.byKey(const ValueKey('totalDebt_h6yk')), '12000');
      await tester.enterText(
          find.byKey(const ValueKey('financeInfo_jq67')), '400');
      await tester.pumpAndSettle(const Duration(milliseconds: 10000));
      await tester.scrollUntilVisible(
        find.byKey(const ValueKey('Button_yce1')),
        100.0,
        scrollable: find
            .descendant(
              of: find.byKey(const ValueKey('Column_wetv')),
              matching: find.byType(Scrollable),
            )
            .first,
      );
      await tester.tap(find.byKey(const ValueKey('Button_yce1')));
      await tester.pump(kDoubleTapMinTime);
      await tester.tap(find.byKey(const ValueKey('Button_yce1')));
      await tester.pumpAndSettle(const Duration(milliseconds: 5000));
      expect(
        find.descendant(
          of: find.byKey(const ValueKey('moneyavailable_o450')),
          matching: find.text('\$1,850'),
        ),
        findsWidgets,
      );
      await tester.pumpAndSettle(const Duration(milliseconds: 5000));
      expect(
        find.descendant(
          of: find.byKey(const ValueKey('moneyavailable_xxo6')),
          matching: find.text('\$1,850'),
        ),
        findsWidgets,
      );
      await tester.pumpAndSettle(const Duration(milliseconds: 5000));
      expect(
        find.descendant(
          of: find.byKey(const ValueKey('monthlyincome_6v4l')),
          matching: find.text('\$6,200'),
        ),
        findsWidgets,
      );
      await tester.pumpAndSettle(const Duration(milliseconds: 5000));
      await tester.scrollUntilVisible(
        find.byKey(const ValueKey('Row_9h3c')),
        100.0,
        scrollable: find
            .descendant(
              of: find.byKey(const ValueKey('monthlyCosts_wqhm')),
              matching: find.byType(Scrollable),
            )
            .first,
      );
      await tester.pumpAndSettle(const Duration(milliseconds: 5000));
      expect(
        find.descendant(
          of: find.byKey(const ValueKey('monthlyCosts_wqhm')),
          matching: find.text('\$3,050'),
        ),
        findsWidgets,
      );
    });

    testWidgets('widget finance update', (WidgetTester tester) async {
      _overrideOnError();
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: 'test123@gmail.com', password: 'password');
      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: Dashboardv3Widget(),
        ),
      ));
      await GoogleFonts.pendingFonts();

      await tester.pumpAndSettle(const Duration(milliseconds: 5000));
      await tester.tap(find.byKey(const ValueKey('Container_4ph9')));
      await tester.pumpAndSettle(const Duration(milliseconds: 5000));
      expect(find.text('Monthly Salary'), findsWidgets);
      await tester.enterText(
          find.bySemanticsLabel(RegExp('MonthlyCheck')), '6000');
      await tester.enterText(
          find.bySemanticsLabel(RegExp('additionalIncome')), '1200');
      await tester.tap(find.bySemanticsLabel(RegExp('incomeSaveCom')));
      await tester.pumpAndSettle(const Duration(milliseconds: 10000));
      expect(
        find.descendant(
          of: find.byKey(const ValueKey('dashboardv3_n8td')),
          matching: find.text('\$2,850'),
        ),
        findsOneWidget,
      );
      await tester.pumpAndSettle(const Duration(milliseconds: 5000));
      expect(
        find.descendant(
          of: find.byKey(const ValueKey('moneyavailable_xxo6')),
          matching: find.text('\$2,850'),
        ),
        findsOneWidget,
      );
      await tester.pumpAndSettle(const Duration(milliseconds: 5000));
      expect(
        find.descendant(
          of: find.byKey(const ValueKey('monthlyincome_6v4l')),
          matching: find.text('\$7,200'),
        ),
        findsOneWidget,
      );
    });
  });

  group('US 1', () {
    testWidgets('Scenario 1', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: LoginWidget(),
        ),
      ));
      await GoogleFonts.pendingFonts();

      await tester.tap(find.byKey(const ValueKey('SignupTab_fhcw')));
      await tester.enterText(find.byKey(const ValueKey('Signup-Email_sare')),
          'casey.phelps@uri.edu');
      await tester.enterText(
          find.byKey(const ValueKey('Signup-Password_annp')), '1234567!');
      await tester.enterText(
          find.byKey(const ValueKey('Confirm-Password_9eqp')), '1234567!');
      await tester.tap(find.byKey(const ValueKey('Signup-button_8yzi')));
      await tester.pumpAndSettle(
        const Duration(milliseconds: 3000),
        EnginePhase.sendSemanticsUpdate,
        const Duration(milliseconds: 3000),
      );
      expect(find.byKey(const ValueKey('IconButton_g968')), findsOneWidget);
    }, skip: true);

    testWidgets('Scenario 2', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: LoginWidget(),
        ),
      ));
      await GoogleFonts.pendingFonts();

      await tester.tap(find.byKey(const ValueKey('SignupTab_fhcw')));
      await tester.enterText(find.byKey(const ValueKey('Signup-Email_sare')),
          'casey.phelps@uri.edu');
      await tester.enterText(
          find.byKey(const ValueKey('Signup-Password_annp')), '1234567!');
      await tester.enterText(
          find.byKey(const ValueKey('Confirm-Password_9eqp')), '1234567!');
      await tester.tap(find.byKey(const ValueKey('Signup-button_8yzi')));
      await tester.pumpAndSettle(
        const Duration(milliseconds: 3000),
        EnginePhase.sendSemanticsUpdate,
        const Duration(milliseconds: 3000),
      );
      expect(find.byKey(const ValueKey('Signup-Email_sare')), findsWidgets);
    }, skip: true);

    testWidgets('Scenario 3', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: LoginWidget(),
        ),
      ));
      await GoogleFonts.pendingFonts();

      await tester.tap(find.byKey(const ValueKey('SignupTab_fhcw')));
      await tester.enterText(find.byKey(const ValueKey('Signup-Email_sare')),
          'phelpscasey8@gmail.com');
      await tester.enterText(
          find.byKey(const ValueKey('Signup-Password_annp')), '1234567');
      await tester.enterText(
          find.byKey(const ValueKey('Confirm-Password_9eqp')), '1224567');
      await tester.pumpAndSettle(
        const Duration(milliseconds: 3000),
        EnginePhase.sendSemanticsUpdate,
        const Duration(milliseconds: 3000),
      );
      expect(find.byKey(const ValueKey('Confirm-Password_9eqp')), findsWidgets);
    }, skip: true);

    testWidgets('Scenario 4', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: LoginWidget(),
        ),
      ));
      await GoogleFonts.pendingFonts();

      await tester.tap(find.byKey(const ValueKey('SignupTab_fhcw')));
      await tester.enterText(
          find.byKey(const ValueKey('Signup-Email_sare')), 'casey.phelps');
      await tester.pumpAndSettle(
        const Duration(milliseconds: 3000),
        EnginePhase.sendSemanticsUpdate,
        const Duration(milliseconds: 3000),
      );
      expect(
          find.byKey(const ValueKey('Confirm-Password_9eqp')), findsOneWidget);
    }, skip: true);
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }

  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }
  // Web-specific error when interacting with TextInputType.emailAddress
  if (error.contains('setSelectionRange') &&
      error.contains('HTMLInputElement')) {
    return true;
  }

  return false;
}
