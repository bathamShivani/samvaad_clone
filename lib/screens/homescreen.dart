import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:samvaad_clone/database/database_helper.dart';
import 'package:samvaad_clone/model/AppCodeModel.dart';
import 'package:http/http.dart' as http;
import 'package:samvaad_clone/model/ResultModel.dart';
import 'package:samvaad_clone/screens/searchscreen.dart';

class HomeScreen extends StatefulWidget {
  AppCodeModel appCodeModel;

  HomeScreen({required this.appCodeModel});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}
String url="";


class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    url=widget.appCodeModel.file;
    signIn();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(
          widget.appCodeModel.data[0].electionName +
              '\n' +
              widget.appCodeModel.data[0].candidateName +
              '/' +
              widget.appCodeModel.data[0].assemblyName,
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF016ca5),
      ),
      drawer: _drawer(),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    widget.appCodeModel.data[0].splashbackgroundImageUrl
                    //"http:\/\/iclickindia.in\/Ranneeti_App_API\/app_splashbackground_image\/bjp_connecting_people-min.png"
                    ),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            TopContainer(),
            BottomContainer(),
            GridContainer(),
          ],
        ),
      ),
    );
  }

  _drawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
                color: Color(0xff016ca5)
            ),

            accountName: Text("Shivani Batham"),
            accountEmail: Text("shivanibatham23@gmail.com"),

            currentAccountPicture: CircleAvatar(
              backgroundColor:
              Theme.of(context).platform == TargetPlatform.iOS
                  ? Colors.blue
                  : Colors.white,
              child: Text(
                "S",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          /*DrawerHeader(decoration:BoxDecoration(
              color: Colors.blue[500]
            ),
                child: Text("Samvaad",style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.center,)),
*/
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text("Dashboard"),
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text("Search"),
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=>
                    SearchScreen(),
                )
              );


            }
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Divider(
              color: Color(0xffF1A104),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Reports",
              style: TextStyle(fontStyle: FontStyle.normal),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Age Wise"),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Report Wise"),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Colour Wise"),
          ),
        ],
      ),
    );
  }
}

TopContainer() {
  return Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Container(
        padding: EdgeInsets.all(10.0),
        height: 80,
        // color: Colors.blue[500],

        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
          color: Color(0xFF016ca5),
        ),
        child: Column(
          children: [
            Row(
              // mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Icon(
                      Icons.how_to_vote,
                      color: Colors.white,
                    )),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 5, 0),
                  child: Text(
                    "Voter",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Icon(
                      Icons.how_to_vote,
                      color: Colors.white,
                    )),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 5, 0),
                  child: Text(
                    "Age",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Icon(
                      Icons.how_to_vote,
                      color: Colors.white,
                    )),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 5, 0),
                  child: Text(
                    "Family",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              // mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Icon(
                      Icons.how_to_vote,
                      color: Colors.white,
                    )),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 5, 0),
                  child: Text(
                    "Surname",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Icon(
                      Icons.how_to_vote,
                      color: Colors.white,
                    )),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 5, 0),
                  child: Text(
                    "Mobile No.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Icon(
                      Icons.how_to_vote,
                      color: Colors.white,
                    )),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 5, 0),
                  child: Text(
                    "Area",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      ));
}

BottomContainer() {
  return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Container(
          height: 30,
          width: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0)),
            color: Color(0xffF1A104),
          ),
          child: Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Text(
                "Dashboard",
                style: TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ))));
}

List<String> name = [
  'Search',
  'Report',
  'Survey',
  'Voting',
  'Registration',
  'Settings'
];
 List<Icon> iconsImage = [
  Icon(Icons.search),
  Icon(Icons.report),
  Icon(Icons.support_agent_rounded),
  Icon(Icons.how_to_vote),
  Icon(Icons.how_to_reg),
  Icon(Icons.settings),
];

GridContainer() {
  return Padding(
    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
    child: Container(
        padding: EdgeInsets.all(10.0),
        height: 450,
        /*decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      color: Colors.transparent,
      border: Border.all(color: Colors.grey)
    ),*/
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            //crossAxisSpacing: 20,
            //childAspectRatio: 2/2,
          ),
          itemBuilder: (context, index) => SizedBox(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => print(name[index]),
                child: Container(
                  height: 110,
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0),
                    ),
                    color: Color(0xFF016ca5),
                  ),
                  child: Icon(
                    iconsImage[index].icon,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                  height: 30,
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0)),
                    color: Color(0xffF1A104),
                  ),
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: Text(
                        name[index],
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        textAlign: TextAlign.center,
                      )))
            ],
          )

              /*Image.network(
  'https://source.unsplash.com/random?sig=$index',
  fit: BoxFit.cover,
  ),*/

              ),
          itemCount: name.length,
        )

        /* ListView.builder(shrinkWrap: true,itemCount: 4,
    itemBuilder: (BuildContext context, int index) =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
      child: Image.network(
      'https://source.unsplash.com/random?sig=$index',
      fit: BoxFit.cover,
    ), ),),


  ),*/
        ),
  );
}

Future<List<ResultModel>> signIn() async {
  var dataToReturn;
  Uri uri = Uri.parse(url);
  print(uri);
  var response = await http.get(uri, headers: {"Accept": "application/json"},);
  String responseBody = response.body;
  dataToReturn = ResultModelFromJson(responseBody);
  print(dataToReturn.toString().length);
   DBProvider.dbProvider.insert(dataToReturn);
  return dataToReturn;
}


