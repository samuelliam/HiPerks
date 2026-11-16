import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_minimized_view_model.dart';
export 'empty_minimized_view_model.dart';

class EmptyMinimizedViewWidget extends StatefulWidget {
  const EmptyMinimizedViewWidget({super.key});

  @override
  State<EmptyMinimizedViewWidget> createState() =>
      _EmptyMinimizedViewWidgetState();
}

class _EmptyMinimizedViewWidgetState extends State<EmptyMinimizedViewWidget> {
  late EmptyMinimizedViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyMinimizedViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.0,
      height: 0.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
    );
  }
}
