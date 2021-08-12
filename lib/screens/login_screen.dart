import 'package:flutter/material.dart';
import 'package:practice_blocks/services/blocs.dart';
import 'package:practice_blocks/services/provider.dart';

class LoginScreen extends StatelessWidget {
  String eError = " ";
  String pError = " ";

  @override
  Widget build(BuildContext context) {
    final _blocs = Provider.of(context);
    print("created");
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          emailField(_blocs),
          SizedBox(
            height: 10.0,
          ),
          passwordField(_blocs),
          SizedBox(
            height: 10.0,
          ),
          submitButton(_blocs),
        ],
      ),
    );
  }

  Widget emailField(Blocs _blocs) {
    return StreamBuilder(
      stream: _blocs.emailStream,
      builder: (_, snapshot) {
        return TextField(
          onChanged: _blocs.addToEmailStream,
          decoration: InputDecoration(
            labelText: "Email",
            errorText: snapshot.hasData
                ? snapshot.data.toString()
                : snapshot.error.toString(),
            hintText: "Email address",
            border: OutlineInputBorder(),
          ),
        );
      },
    );
  }

  Widget passwordField(Blocs _blocs) {
    return StreamBuilder(
      stream: _blocs.passwordStream,
      builder: (_, snapshot) {
        return TextField(
          onChanged: (changedValue) {
            _blocs.addToPasswordStream(changedValue);
          },
          obscureText: true,
          decoration: InputDecoration(
            labelText: "Password",
            errorText: "${snapshot.hasData ? snapshot.data : snapshot.error}",
            hintText: "Password",
            border: OutlineInputBorder(),
          ),
        );
      },
    );
  }

  Widget submitButton(Blocs blocs) {
    return StreamBuilder(
      stream: blocs.submitValid,
      builder: (context, snapshot) {
        return ElevatedButton(
          onPressed: snapshot.hasData?(){ }:null,
          child: Text("Login"),
          style: ElevatedButton.styleFrom(primary: Colors.blue),
        );
      },
    );
  }

  eventlistener(Blocs _blocs) {
    _blocs.emailStream.listen((event) {
      print(event);
      eError = "$event";
    }, onError: (value) {
      print(value);
      eError = "$value";
    });
  }
}
