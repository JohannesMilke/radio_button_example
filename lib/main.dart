import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:radio_button_example/widget/radio_button_advanced_widget.dart';
import 'package:radio_button_example/widget/radio_button_group_widget.dart';
import 'package:radio_button_example/widget/radio_button_single_widget.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Radio Example';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.red),
        home: MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    @required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 2;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          selectedItemColor: Colors.red,
          items: [
            BottomNavigationBarItem(
              icon: Text('RadioButton'),
              title: Text('Single'),
            ),
            BottomNavigationBarItem(
              icon: Text('RadioButton'),
              title: Text('Groups'),
            ),
            BottomNavigationBarItem(
              icon: Text('TextField'),
              title: Text('Groups II'),
            ),
          ],
          onTap: (int index) => setState(() => this.index = index),
        ),
        body: buildPages(),
      );

  Widget buildPages() {
    switch (index) {
      case 0:
        return RadioButtonSingleWidget();
      case 1:
        return RadioButtonGroupWidget();
      case 2:
        return RadioButtonAdvancedWidget();
      default:
        return Container();
    }
  }
}
