import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:samvaad_clone/database/database_helper.dart';
import 'package:samvaad_clone/model/ResultModel.dart';
import 'main.dart';

class SearchScreen extends StatelessWidget {

  // receive data from the FirstScreen as a parameter

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
              Container(
                child: FutureBuilder(
                  future: DBProvider.dbProvider.getAllEmployees(),
                  builder: (context, AsyncSnapshot<List<ResultModel>>snapshot) {
                   // print(snapshot.data);
                    if (snapshot.hasData) {
                      return ListView.builder(
                        shrinkWrap: true,
                          itemCount: snapshot.data?.length,
                          itemBuilder: (BuildContext context, index) {
                            ResultModel product = snapshot.data![index];
                            return Card(
                                child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                /*Image.network(
                                              '${product.productImg}',
                                              height: 100.0,
                                            ),*/
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${product.vnameEng}',
                                      style: TextStyle(
                                          color: Colors.orange,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 15.0),
                                    ),
                                    Text('${product.vname}',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black,
                                        ))
                                  ],
                                )
                              ],
                            ));
                          });
                    } else {
                      return CircularProgressIndicator();
                    }
            },
          ),
        ),
      );

  }

}
