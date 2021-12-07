import 'package:campnotes/screens/big_container.dart';
import 'package:campnotes/screens/small_container.dart';
import 'package:campnotes/widgets/todos_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    TodosApp(),
  );
}

class TodosApp extends StatelessWidget  {

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => TodosProvider(),
      child: MaterialApp(
          home: LayoutBuilder (
              builder: (BuildContext context, BoxConstraints constraints) {
                if (constraints.maxWidth > 500) {
                  return BigContainer();
                } else {
                  return SmallContainer();
                }
              }),
      ));
}

