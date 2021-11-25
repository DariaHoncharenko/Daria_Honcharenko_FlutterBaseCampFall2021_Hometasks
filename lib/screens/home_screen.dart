import 'package:campnotes/bloc/models/app_tab.dart';
import 'package:campnotes/data/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:todos_app_core/todos_app_core.dart';
import 'package:campnotes/widgets/widgets.dart';
import 'package:campnotes/localization.dart';

class HomeScreen extends StatefulWidget {

   final HomeScreen tab;

   HomeScreen({
       Key key,
   this.tab,
   }) : super(key: key ?? ArchSampleKeys.tab);


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

  class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    final activeTab = AppTab.home;
    return Scaffold(
      key: UniqueKey(),
      appBar: AppBar(
        title: Text(FlutterBlocLocalizations.of(context).appTitle),
        actions: [
          FilterButton(visible: activeTab == AppTab.home),
          ExtraActions(),
        ],
      ),

      body: activeTab  == AppTab.home ? FilteredTodos() : Stats(),

      floatingActionButton: FloatingActionButton(
        key: ArchSampleKeys.addTodoFab,
        onPressed: () {
          Navigator.pushNamed(context, ArchSampleRoutes.addTodo);
        },
        child: Icon(Icons.add),
        tooltip: ArchSampleLocalizations
            .of(context)
            .addTodo,
      ),

      bottomNavigationBar: BottomNavigationBar(

        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey[500],
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          switch (value) {
            case 0:
             AppTab.home;
              break;
            case 1:
              AppTab.work;
              break;
            case 2:
              AppTab.leisure;
              break;
          }
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            label: 'Work',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Leisure',
          ),
        ],
      ),
    );
  }
  @override
  bool get wantKeepAlive {
    if (widget.tab == AppTab.leisure)
      return true;
    else
      return false;
  }
}




