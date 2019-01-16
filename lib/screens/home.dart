import 'package:flutter/material.dart';
import 'package:flutter_counter/actions/add.dart';
import 'package:flutter_counter/models/counter.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: (Store<Counter> store)=>store,
      builder:(BuildContext context,Store<Counter> store)=> Scaffold(
        appBar: AppBar(
          title: Text("Home screen"),
        ),
        body: Center(
          child: Text(
            "${store.state.currentValue}",
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: ()  {
            store.dispatch(AddCounterValue());
          },
          child: Icon(Icons.plus_one),
        ),
      ),
    );
  }
}
