import 'package:flutter_counter/actions/add.dart';
import 'package:flutter_counter/models/counter.dart';
import 'package:redux/redux.dart';

Reducer<Counter> mainReducer = combineReducers<Counter>([
  TypedReducer<Counter, AddCounterValue>(addCounterValueReducer),
]);

Counter addCounterValueReducer(Counter state, AddCounterValue action) {
  var newValue = state.currentValue + 1;
  return Counter.increase(newValue);
}
