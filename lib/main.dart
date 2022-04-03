import 'package:flutter/material.dart';
import 'package:sample_one/models/student.dart';
import "package:http/http.dart" as http;

import 'dart:convert';
import 'package:async/async.dart';

void main()=> runApp( MyApp() );

Future<Student> sendData(String apiLink, {Map? body}) async{

  return http.post(apiLink, body:body).then ((http.Response response){
  print(response.body);
  return json.decode(response.body);
  } );


}


class MyApp extends StatelessWidget {

  TextEditingController name = TextEditingController();
  TextEditingController rollnumber = TextEditingController();
  TextEditingController admissionNo = TextEditingController();
  TextEditingController college = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Student App"),
        ),

        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(height: 20,),

                TextField(
                  controller: name,
                  decoration: InputDecoration(
                  prefixIcon: Icon(Icons.account_box),
                  hintText: "Student Name",
                  labelText: "Student Name",
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                    )
                  ),
                ),
                SizedBox(height: 20,),

                TextField(
                  controller: rollnumber,
                  decoration: InputDecoration(
                  prefixIcon: Icon(Icons.dehaze),
                  hintText: "Roll Number",
                  labelText: "Roll Number",
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                      )
                ),),
                SizedBox(height: 20,),

                TextField(
                  controller: admissionNo,
                  decoration: InputDecoration(
                  prefixIcon: Icon(Icons.align_vertical_bottom),
                  hintText: "Admission Number",
                  labelText: "Admission Number",
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                      )),),
                SizedBox(height: 20,),

                TextField(
                  controller: college,
                  decoration: InputDecoration(
                  prefixIcon: Icon(Icons.school),
                  hintText: "College",
                  labelText: "College",
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                      )
                ),),
                SizedBox(height: 20,),
                SizedBox(
                  height:60,
                  width: double.infinity,

                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side: BorderSide(color: Colors.amber)
                            )),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.indigo
                        )
                    ),

                    onPressed: () async {
                      var getName=name.text;
                      var getRollnumber=rollnumber.text;
                      var getAdmissionNo=admissionNo.text;
                      var getCollege=college.text;

                      print(getName);
                      print(getRollnumber);
                      print(getAdmissionNo);
                      print(getCollege);

                      Student studentdata= new Student (
                        name:getName,
                        rollnumber:getRollnumber,
                        admissionNo:getAdmissionNo,
                        college:getCollege,
                      );

                      Student datatosend= await sendData("",body: studentdata.toJson());
                    },
                    child: Text("SUBMIT",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                      ),
                    )),
                )

              ],
            ),
          ),
        ),
      ),

    );
  }
}

