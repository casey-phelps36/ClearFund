import '/custom_components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dashboardv3_widget.dart' show Dashboardv3Widget;
import 'package:flutter/material.dart';

class Dashboardv3Model extends FlutterFlowModel<Dashboardv3Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    navBarModel.dispose();
  }
}
