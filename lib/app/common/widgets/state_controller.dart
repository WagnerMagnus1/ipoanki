import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class StateController<TWidget extends StatefulWidget,
    TBind extends Object> extends State<TWidget> {
  final TBind _scope = Modular.get<TBind>();

  TBind get store => _scope;
  TBind get bloc => _scope;
  TBind get cubit => _scope;
  TBind get controller => _scope;

  @override
  void dispose() {
    Modular.dispose<TBind>();
    super.dispose();
  }
}
