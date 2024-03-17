import 'package:flutter/material.dart';
import 'package:hackhive/MainCode/Model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:url_launcher/url_launcher.dart';



class UpdateSession extends StatefulWidget {
  UpdateSession({super.key});

  @override
  State<UpdateSession> createState() => _UpdateSessionState();
}

class _UpdateSessionState extends State<UpdateSession> {

  final storage = FlutterSecureStorage();
  List<Session> sessions = [];

  String date = '',meet='',status='';

  String sta = 'Pending';
  var items = [
    'Pending',
    'Successfull',
    'Missed by Mentor',
    'Missed by User',
  ];

  @override
  void initState() {

    super.initState();
    fatchData();
  }

  @override
  Widget build(BuildContext context) {

    TextEditingController meetController = TextEditingController();


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade50,
        title: Text('Update Session'),
      ),
      backgroundColor: Colors.blue.shade50,
      body: ListView.builder(
        itemCount: sessions.length,
        itemBuilder: (context, index) {


          final session = sessions[index];
          String dateTimeString = session.date;
          List<String> parts = dateTimeString.split('T');
          String date = parts[0]; // Date part

          meetController.text = session.meetLink;


          return Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            margin: EdgeInsets.all(10),
            child: ListTile (
              trailing: IconButton(onPressed: () async{
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Update Session'),
                      content: Container(
                        height: 150,
                        child: Column(
                          children: [
                            TextField(
                              controller: meetController,
                              onChanged: (value){
                                meet = value;
                              },
                              style: TextStyle(fontSize: 18,color: Colors.black),
                              decoration: InputDecoration(
                                hintText: 'Meet',
                                hintStyle: TextStyle(color: Colors.black54),
                               border: OutlineInputBorder(

                               )
                              ),
                            ),
                            SizedBox(height: 10,),
                            DropdownButton(
                              value: sta,

                              icon: const Icon(Icons.keyboard_arrow_down),

                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  sta = newValue!;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          child: Text('Yes'),
                        ),
                        TextButton(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          child: Text('No'),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Icon(Icons.edit),),
              leading: Icon(Icons.book,color: Colors.orange,weight: 10,size: 30,),
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Session Date : ${date}'),
                  Text('Session Slot : ${session.slot}'),
                  Text('Session Status : ${session.sessionStatus}'),

                  Center(
                    child: InkWell (
                      onTap: () async{
                        final encodedUrl =
                        Uri.encodeFull(session.meetLink);
                        await launch(encodedUrl);

                      },
                        child: Text('MeetLink',style: TextStyle(color: Colors.blue.shade900,fontSize: 20),)),
                  ),
                ],
              ),
              // trailing: IconButton(
              //   icon: Icon(Icons.),
              //   onPressed: () {
              //     setState(() {
              //
              //     });
              //   },
              // ),
            ),
          );
        },
      ),
    );
  }


  Future<void> fatchData() async {
    final id = await storage.read(key: 'Id');
    final url = 'https://hackhive-justcoders.onrender.com/api/mentor/getHistory?mentorId=${id}';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if(response.statusCode == 200){
      print(response.statusCode);
      final result = json.decode(response.body);
      final finalResult = result['sessionHistory'] as List<dynamic>;

      setState(() {
        sessions = finalResult.map((e) {
          return  Session(date: e['date'], sessionStatus: e['sessionStatus'], slot: e['slot'],meetLink: e['meetLink']);
        }).toList();

      });

      print(result);
      print(finalResult);
      print(finalResult[0]['meetLink']);
      // print(finalResult[0]['id']);
    }else{
      final result = json.decode(response.body);

      print(response.statusCode);
      print(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(result['message']),
          backgroundColor: Colors.green.shade900,
        ),
      );
      print(response.statusCode);
    }
  }

  String extractDate(String inputString) {

    if (inputString.length >= 6) {
      String datePart = inputString.substring(0, 6);
      return datePart;
    } else {
      // If the input string is too short, return an empty string
      return '';
    }
  }
}
