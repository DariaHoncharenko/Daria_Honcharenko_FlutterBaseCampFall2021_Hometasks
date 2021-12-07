import 'package:campnotes/bloc/models/app_tab.dart';
import 'package:campnotes/bloc/models/tab_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todos_app_core/todos_app_core.dart';

class TabletletsTabSelector extends StatelessWidget {
  final TabItem activeTab;
  final Function(AppTab) onTabSelected;

  TabletletsTabSelector({
    Key key,
    @required this.activeTab,
    @required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        key: ArchSampleKeys.tabs,
        items:  [
          BottomNavigationBarItem(
            icon: Icon(Icons.list, size: 70),
            label: 'Todos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart, size: 70),
            label: 'Stats',
          ),
        ]
    );
  }
}