import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/class_1.dart';
import 'package:flutter_design_patterns/class_2.dart';
import 'package:flutter_design_patterns/count_bloc_provider.dart';
import 'package:flutter_design_patterns/counter_bloc.dart';
import 'package:flutter_design_patterns/my_counter.dart';
import 'package:random_pk/random_pk.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var myCounter = MyCounter(0);

  @override
  Widget build(BuildContext context) {
    var myCounter = MyCounter(0);
    CounterBloc counterBloc = CounterBloc();
    return CountBlocProvider(
      bloc: counterBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Default'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Class1(),
              Class2(),
              RandomContainer(
                height: 100.0,
                width: 100.0,
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //Adding to sink
            counterBloc.add.add(myCounter);
            //
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
