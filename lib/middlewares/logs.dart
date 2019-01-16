import 'package:redux/redux.dart';

class LogMiddleware extends MiddlewareClass{
  @override
  void call(Store store, action, NextDispatcher next) {
    print("Middleware: calling $action");
    next(action);
  }
}
