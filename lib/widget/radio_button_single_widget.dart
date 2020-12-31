import 'package:flutter/material.dart';

import 'button_widget.dart';

class RadioButtonSingleWidget extends StatefulWidget {
  @override
  _RadioButtonSingleWidgetState createState() =>
      _RadioButtonSingleWidgetState();
}

class _RadioButtonSingleWidgetState extends State<RadioButtonSingleWidget> {
  int selectedValue = 0;

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.scale(
              scale: 2,
              child: Radio<int>(
                value: 1,
                groupValue: selectedValue,
                onChanged: (value) => setState(() => selectedValue = 1),
              ),
            ),
            const SizedBox(height: 32),
            ButtonWidget(
              text: 'Select Radio',
              onClicked: () => setState(() => selectedValue = 1),
            ),
            const SizedBox(height: 16),
            ButtonWidget(
              text: 'Unselect Radio',
              onClicked: () => setState(() => selectedValue = 0),
            ),
          ],
        ),
      );
}
