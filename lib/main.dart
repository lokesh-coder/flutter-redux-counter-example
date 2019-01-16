import 'package:flutter/material.dart';
import 'package:flutter_counter/middlewares/logs.dart';
import 'package:flutter_counter/models/counter.dart';
import 'package:flutter_counter/reducers/main.dart';
import 'package:flutter_counter/screens/home.dart';
import 'package:flutter_counter/screens/initial.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  final Store<Counter> store = Store(
    mainReducer,
    initialState: Counter(currentValue: 8),
    middleware: [LogMiddleware()],
  );
  runApp(CounterApp(store: store));
}

class CounterApp extends StatefulWidget {
  final Store<Counter> store;

  CounterApp({this.store});

  @override
  State<StatefulWidget> createState() => CounterAppState();
}

class CounterAppState extends State<CounterApp> {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<Counter>(
      store: widget.store,
      child: MaterialApp(
        routes: {
          "homescreen": (context) => HomeScreen(),
        },
        home: InitialScreen(),
      ),
    );
  }
}
