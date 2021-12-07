import 'package:campnotes/widgets/todos_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos_app_core/todos_app_core.dart';
import 'package:campnotes/localization.dart';
import 'package:campnotes/screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    TodosApp(),
  );
}

class TodosApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
  create: (context) => TodosProvider(),
    child: MaterialApp(
      title: FlutterBlocLocalizations().appTitle,
      theme: ArchSampleTheme.theme,
      localizationsDelegates: [
        ArchSampleLocalizationsDelegate(),
        FlutterBlocLocalizationsDelegate(),
      ],
      routes: {
        ArchSampleRoutes.home: (context) {
          return HomeScreen();
        },
        ArchSampleRoutes.addTodo: (context) {
          return AddEditScreen(
            key: ArchSampleKeys.addTodoScreen,
            onSave: (task, note) {},
            isEditing: false,
          );
        },
      },
    )
  );
}

