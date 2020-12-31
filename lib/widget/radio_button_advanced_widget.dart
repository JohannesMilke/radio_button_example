import 'package:flutter/material.dart';
import 'package:radio_button_example/model/user.dart';

class RadioButtonAdvancedWidget extends StatefulWidget {
  @override
  _RadioButtonAdvancedWidgetState createState() =>
      _RadioButtonAdvancedWidgetState();
}

class _RadioButtonAdvancedWidgetState extends State<RadioButtonAdvancedWidget> {
  static const users = [
    User(
      name: 'Mike',
      description: 'Flutter Developer, Freelancer',
    ),
    User(
      name: 'Emma',
      description: 'Creative Director, Photo Stylist',
    ),
    User(
      name: 'James',
      description: 'Industrial Designer, YouTuber',
    ),
  ];

  User selectedValue = users.first;

  @override
  Widget build(BuildContext context) => ListView(
        padding: EdgeInsets.symmetric(vertical: 16),
        children: users
            .map((user) => Container(
                  margin: EdgeInsets.only(bottom: 16),
                  child: RadioListTile<User>(
                    value: user,
                    groupValue: selectedValue,
                    title: Text(user.name),
                    subtitle: Text(user.description),
                    secondary: OutlineButton(
                      child: Text('View Profile'),
                      onPressed: () {
                        final snackBar = SnackBar(
                          content: Text('Profile: ${user.name}'),
                        );

                        Scaffold.of(context)
                          ..removeCurrentSnackBar()
                          ..showSnackBar(snackBar);
                      },
                    ),
                    onChanged: (value) => setState(() => selectedValue = value),
                  ),
                ))
            .toList(),

        // RadioListTile<int>(
        //   value: 0,
        //   groupValue: selectedValue,
        //   title: Text('Mike'),
        //   subtitle: Text('Flutter Developer, Freelancer'),
        //   secondary: OutlineButton(
        //     child: Text('View Profile'),
        //     onPressed: () {},
        //   ),
        //   onChanged: (value) => setState(() => selectedValue = value),
        // ),
        // RadioListTile<int>(
        //   value: 1,
        //   groupValue: selectedValue,
        //   title: Text('Emma'),
        //   subtitle: Text('Creative Director, Photo Stylist'),
        //   secondary: OutlineButton(
        //     child: Text('View Profile'),
        //     onPressed: () {},
        //   ),
        //   onChanged: (value) => setState(() => selectedValue = value),
        // ),
        // RadioListTile<int>(
        //   value: 2,
        //   groupValue: selectedValue,
        //   title: Text('James'),
        //   subtitle: Text('Industrial Designer, YouTuber'),
        //   secondary: OutlineButton(
        //     child: Text('View Profile'),
        //     onPressed: () {},
        //   ),
        //   onChanged: (value) => setState(() => selectedValue = value),
        // ),
      );
}
