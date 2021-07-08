import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:samvaad_clone/model/AppCodeModel.dart';
import 'package:samvaad_clone/screens/homescreen.dart';

void main() {
  runApp(MyApp());
}
final _formkey=GlobalKey<FormState>();
final TextEditingController nameController=new TextEditingController();
final TextEditingController mobileController=new TextEditingController();
final TextEditingController codeController=new TextEditingController();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,

      body: Form(
        key: _formkey,
          child:Center(

        child:Container(
          alignment: Alignment.center,
        height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQDibDoK07NlYWOmdkR0WZDPKBpn0WhyWQyA&usqp=CAU"), fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
           _image(),
            _nameTF(),
            _mobileTF(),
            _activationTF(),
            _button(context),

          ],
        ),
      )),))
    );
  }
}

  _image() {
  return Image.network(
      "https://www.logogenie.net/download/preview/medium/3589659",
      height: 200,
      width: 300);
}

  _nameTF() {
  return Padding(
      padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 20.0),
      child: TextFormField(
        controller: nameController,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,)),

            labelText: 'Name',
            hintText: 'Enter valid user name',
            labelStyle: TextStyle(color: Colors.white),
            hintStyle: TextStyle(color: Colors.white)
     ),
        textCapitalization: TextCapitalization.words,
        style: TextStyle(color: Colors.white),
       keyboardType: TextInputType.name,
       textInputAction: TextInputAction.next,
        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))],
        validator: (value){
          if(value==null || value.isEmpty){
            return "Please enter name";
          }
          return null;
        },

      ));
}

  _mobileTF() {
  return Padding(
      padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 20.0),
      child: TextFormField(
        controller: mobileController,
        decoration: InputDecoration(

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,)),

            labelStyle: TextStyle(color: Colors.white),
            hintStyle: TextStyle(color: Colors.white),
            counterText: "",
            labelText: 'Mobile Number',
            hintText: 'Enter valid mobile number'),

        style: TextStyle(color: Colors.white),
        maxLength: 10,
        textInputAction: TextInputAction.next,

        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
        validator: (value){
          if(value==null || value.isEmpty || value.length<10){
            return "Please enter mobile number";
          }
          return null;
        },
      ));
}

  _activationTF() {
  return Padding(
      padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 20.0),
      child: TextFormField(
        controller: codeController,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,)),
            labelStyle: TextStyle(color: Colors.white),
            hintStyle: TextStyle(color: Colors.white),
            labelText: 'Activation Code',
            hintText: 'Enter activation code'),

        style: TextStyle(color: Colors.white),
        textInputAction: TextInputAction.done,

        validator: (value){
          if(value==null || value.isEmpty){
            return "Please enter activation code";
          }
          return null;
        },
      ));
}

  _button(BuildContext context) {
  return Container(
      width: 300,
      height: 50,
      child: RaisedButton(
        elevation: 2,
          padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Colors.red,
          textColor: Colors.white,

          onPressed: () {
            if (_formkey.currentState!.validate()) {

              signIn(nameController.text,mobileController.text,codeController.text,context);
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Processing Data',style: TextStyle(color: Colors.white,fontSize: 20),),backgroundColor: Colors.black,));
            }

          },
          child: Text("Login",style: TextStyle(fontSize: 18),)));
}

Future signIn(String name, String mobile, String code,BuildContext context) async{

  AppCodeModel appCodeModel;
  Uri url=Uri.parse("https://iclickindia.in/sambadwebservise/app_config.php");
  Map data= {"name":name,"mobile_number":mobile,"appcode":code};
  final response=await http.post(url,body: data);
  if(response.statusCode==200){
    var jsonData=json.decode(response.body);

    if(jsonData['status']==200){
      appCodeModel=AppCodeModel.fromJson(jsonData);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(jsonData['msg'],style: TextStyle(color: Colors.white,fontSize: 20),),backgroundColor: Colors.black,));
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
          HomeScreen(appCodeModel:appCodeModel),
      ));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(jsonData['msg'],style: TextStyle(color: Colors.white,fontSize: 20),),backgroundColor: Colors.black,));
    }
  }
  else
    print("fail");

}
