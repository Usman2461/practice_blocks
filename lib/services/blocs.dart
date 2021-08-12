import 'dart:async';
import 'package:practice_blocks/services/validator.dart';
import 'package:rxdart/rxdart.dart';

class Blocs with Validators{

 final StreamController _emailStream = new BehaviorSubject();
 final StreamController _passStream = new BehaviorSubject();

  Stream<bool> get submitValid => Rx.combineLatest2(emailStream, passwordStream, (a, b) => true);

 Stream get emailStream{
   return _emailStream.stream.transform(streamETransformer);
 }
 Stream get passwordStream{
   return _passStream.stream.transform(streamPTransformer);
 }

 void addToEmailStream(String value) {
    _emailStream.sink.add(value);
  }
  void addToPasswordStream(String value) {
    _passStream.sink.add(value);
  }

  dispose(){
   _emailStream.close();
   _passStream.close();
  }

}