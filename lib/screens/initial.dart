import 'package:flutter/material.dart';
import 'package:flutter_counter/models/counter.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class InitialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Initial screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StoreConnector(
              converter: (Store<Counter> store) => store.state,
              onInit: (Store<Counter> store) {
                print("On Init");
              },
              onDispose: (Store<Counter> store){
                print("onDispose");
              },
              onInitialBuild: (dynamic viewModel){
                print("onInitialBuild");
              },
              onDidChange: (dynamic viewModel){
                print("onDidChange");
                print(viewModel);
              },
              onWillChange: (dynamic viewModel){
                print("onWillChange");
              },
              builder: (context, counterObj) {
                return Text(
                  '${counterObj.currentValue}',
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "homescreen");
        },
        tooltip: 'Increment',
        child: Icon(Icons.chevron_right),
      ),
    );
  }
}
