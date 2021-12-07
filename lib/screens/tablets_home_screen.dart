import 'package:campnotes/bloc/models/tab_item.dart';
import 'package:campnotes/widgets/home_list_todo.dart';
import 'package:campnotes/widgets/leisure_list_todo.dart';
import 'package:campnotes/widgets/floating_action_button_widget.dart';
import 'package:campnotes/widgets/tablets_tab_selector.dart';
import 'package:campnotes/widgets/work_list_todo.dart';
import 'package:flutter/material.dart';
import 'package:campnotes/widgets/widgets.dart';
import 'package:campnotes/localization.dart';


class TabletsHomeScreen extends StatefulWidget {

  TabletsHomeScreen({
    Key key,
  }) : super(key: key);

  @override
  _TabletsHomeScreenState createState() => _TabletsHomeScreenState();
}

class _TabletsHomeScreenState extends State<TabletsHomeScreen>
    with SingleTickerProviderStateMixin {

  TabItem activeTab = TabItem.home;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(FlutterBlocLocalizations.of(context).appTitle),
            actions: <Widget>[
              FilterButton(visible: activeTab == TabItem.home),
              ExtraActions(),
            ],
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home, size: 50)),
                Tab(icon: Icon(Icons.work, size: 50)),
                Tab(icon: Icon(Icons.directions_bike_outlined, size: 50),),
              ],
              onTap: (index) {
                setState(() {
                  activeTab = TabItem.values[index];
                });
              },
              indicatorColor: Color(0xffe7bc3c),
              indicatorWeight: 25,
              indicatorPadding: EdgeInsets.only(right: 10),
            ),
          ),

          body: _buildBody(),

          floatingActionButton: FloatingActionButtonWidget(),

          bottomNavigationBar: TabletletsTabSelector(
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
      default:
        return null;
    }
  }
}
