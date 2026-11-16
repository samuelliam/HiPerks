import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'color_picker_component_model.dart';
export 'color_picker_component_model.dart';

class ColorPickerComponentWidget extends StatefulWidget {
  const ColorPickerComponentWidget({
    super.key,
    required this.initialColor,
    required this.didSelectColor,
  });

  final Color? initialColor;
  final Future Function(Color? colorSelected)? didSelectColor;

  @override
  State<ColorPickerComponentWidget> createState() =>
      _ColorPickerComponentWidgetState();
}

class _ColorPickerComponentWidgetState
    extends State<ColorPickerComponentWidget> {
  late ColorPickerComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ColorPickerComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: custom_widgets.ColorPicker(
        width: double.infinity,
        height: double.infinity,
        initialColor: widget!.initialColor,
        didSelectColor: (selectedColor) async {},
      ),
    );
  }
}
