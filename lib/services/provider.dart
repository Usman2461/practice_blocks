import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice_blocks/services/blocs.dart';


class Provider extends InheritedWidget{
  final bloc = Blocs();

  Provider({Key? key, required Widget child}) : super(key: key, child: child);


  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

  static Blocs of(BuildContext context){
    return (context.dependOnInheritedWidgetOfExactType<Provider>() as Provider).bloc;
  }

}