import 'package:flutter/material.dart';
import 'package:showcase_widgets_example/widget/add_todo_dialog_widget.dart';
import 'package:showcase_widgets_example/widget/completed_list_widget.dart';
import 'package:showcase_widgets_example/widget/todo_list_widget.dart';
import 'package:showcaseview/showcase_widget.dart';
import 'package:showcaseview/showcaseview.dart';

import '../main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  final keyOne = GlobalKey();
  final keyTwo = GlobalKey();
  final keyThree = GlobalKey();
  final keyFour = GlobalKey();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ShowCaseWidget.of(context).startShowCase([
        keyOne,
        keyThree,
        keyFour,
        keyTwo,
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [
      TodoListWidget(),
      CompletedListWidget(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
        actions: [
          CustomShowcaseWidget(
            globalKey: keyOne,
            description: 'Search For Todos',
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: CustomShowcaseWidget(
              globalKey: keyThree,
              description: 'See Incomplete Todos',
              child: Icon(Icons.fact_check_outlined),
            ),
            label: 'Todos',
          ),
          BottomNavigationBarItem(
            icon: CustomShowcaseWidget(
              globalKey: keyFour,
              description: 'See Completed Todos',
              child: Icon(Icons.done, size: 28),
            ),
            label: 'Completed',
          ),
        ],
      ),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        isExtended: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.black,
        onPressed: () => showDialog(
          context: context,
          child: AddTodoDialogWidget(),
        ),
        child: CustomShowcaseWidget(
          globalKey: keyTwo,
          description: 'Add New Todos',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class CustomShowcaseWidget extends StatelessWidget {
  final Widget child;
  final String description;
  final GlobalKey globalKey;

  const CustomShowcaseWidget({
    @required this.description,
    @required this.child,
    @required this.globalKey,
  });

  @override
  Widget build(BuildContext context) => Showcase(
        key: globalKey,
        showcaseBackgroundColor: Colors.pink.shade400,
        contentPadding: EdgeInsets.all(12),
        showArrow: false,
        disableAnimation: true,
        // title: 'Hello',
        // titleTextStyle: TextStyle(color: Colors.white, fontSize: 32),
        description: description,
        descTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        // overlayColor: Colors.white,
        // overlayOpacity: 0.7,
        child: child,
      );
}
