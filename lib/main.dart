import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:showcase_widgets_example/page/home_page.dart';
import 'package:showcase_widgets_example/provider/todos.dart';
import 'package:showcaseview/showcase_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final String title = 'Todo App';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => TodosProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(
            primarySwatch: Colors.pink,
            scaffoldBackgroundColor: Color(0xFFf6f5ee),
          ),
          home: ShowCaseWidget(
            builder: Builder(builder: (_) => HomePage()),
            onStart: (index, key) => print('On started $index'),
            onComplete: (index, key) => print('On completed $index'),
            onFinish: () => print('Finished completely'),
            // autoPlay: true,
            // autoPlayDelay: Duration(seconds: 3),
          ),
        ),
      );
}
