import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:flutter/material.dart';

class register extends StatefulWidget {
  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  
  final AuthService _auth= AuthService();
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _pswd = '';
  String error = '';
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'brew_crew',
      home: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          title: Text('Sign up into Brew Crew'),
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Sign In'),
              onPressed: () => Navigator.of(context).pushNamed('/signin'),
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Email',),
                  validator: (val) => val.isEmpty ? 'Enter an email': null,
                  onChanged: (val){
                    setState(() => _email = val);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Password',),
                  validator: (val) => val.length < 6 ? 'Enter a passwordd that is 6+ char long':null,
                  obscureText: true,
                  onChanged: (val){
                    setState(() => _pswd = val);
                  },
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  child: Text('Sign Up'),
                  onPressed: () async {
                    // return _formKey.currentState.validate() ? (){
                    //   debugPrint(_email);
                    //   debugPrint(_pswd);
                    // }: print('null');
                    if(_formKey.currentState.validate()){
                      dynamic result =await _auth.regWithEmailAndPswd(_email, _pswd);
                      if(result == null){
                        setState(() {
                          error = 'Please Suply a valid email'; 
                        });
                      }
                    }
                  },
                ),
                SizedBox(height:12),
                Text(
                  error,
                  style: TextStyle(color: Colors.red,fontSize: 14.0)
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}