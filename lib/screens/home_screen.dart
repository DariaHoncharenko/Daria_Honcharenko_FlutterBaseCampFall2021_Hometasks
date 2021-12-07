import 'package:campnotes/bloc/models/tab_item.dart';
import 'package:campnotes/widgets/home_list_todo.dart';
import 'package:campnotes/widgets/leisure_list_todo.dart';
import 'package:campnotes/widgets/work_list_todo.dart';
import 'package:flutter/material.dart';
import 'package:todos_app_core/todos_app_core.dart';
import 'package:campnotes/widgets/widgets.dart';
import 'package:campnotes/localization.dart';


class HomeScreen extends StatefulWidget {

  HomeScreen({
    Key key,
  }) : super(key: key ?? ArchSampleKeys.homeScreen);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TabItem activeTab = TabItem.home;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
       length: 3,
       child: Scaffold(
         appBar: AppBar(
          title: Text(FlutterBlocLocalizations.of(context).appTitle),
          actions: <Widget> [
          FilterButton(visible: activeTab == TabItem.home),
          ExtraActions(),
           ],
          bottom: TabBar(
            tabs: [
             Tab(icon: Icon(Icons.home), text: 'Home'),
             Tab(icon: Icon(Icons.work), text: 'Work'),
             Tab(icon: Icon(Icons.directions_bike_outlined), text: 'Leisure'),
          ],
          onTap: (index) {
            setState(() {
              activeTab = TabItem.values[index];
            });
          },
          indicatorColor: Color(0xffe7bc3c),
          indicatorWeight: 10,
          indicatorPadding: EdgeInsets.only(right: 20),
         ),
        ),
         body: _buildBody(),

          floatingActionButton: FloatingActionButton(
           key: ArchSampleKeys.addTodoFab,
           onPressed: () {
           Navigator.pushNamed(
              context, ArchSampleRoutes.addTodo);
            },
           child: Icon(Icons.add),
           tooltip: ArchSampleLocalizations.of(context).addTodo,
         ),
         bottomNavigationBar: TabSelector(
         activeTab: activeTab,
         onTabSelected: (tab) {},
       ),
     )
    );
  }

  Widget _buildBody() {
    switch (activeTab) {
      case TabItem.home:
        return HomeListTodo();
      case TabItem.work:
        return WorkListTodo();
      case TabItem.leisure:
        return LeisureListTodo();
      default: return null;
    }
  }
}
