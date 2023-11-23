import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

mixin ControllerProvider<T extends Store> on Widget {
  T controller(BuildContext context, {bool listen = false}) {
    return Provider.of<T>(context, listen: listen);
  }
}