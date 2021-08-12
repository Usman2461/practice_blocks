import 'dart:async';

class Validators{


  final streamETransformer = StreamTransformer.fromHandlers(
      handleData: (data, sink){
        if(data.toString().contains("@"))
        {
          sink.add(data);
        }
        else{
          sink.addError("emial not valid");
        }
      },
      handleError: (data, st, sink){
        print("got error");
      }
  );
  final streamPTransformer = StreamTransformer.fromHandlers(
      handleData: (data, sink){
        print(data);
        if(data.toString().length>5)
        {
          sink.add(data);
        }
        else{
          sink.addError("password not valid");
        }
      },
      handleError: (data, st, sink){
        print("got error");
      }
  );

}