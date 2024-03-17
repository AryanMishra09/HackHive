import 'package:flutter/material.dart';
import 'package:hackhive/MainCode/Model.dart';
import 'package:hackhive/style/theme.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:table_calendar/table_calendar.dart';



class BookSlotPart2 extends StatefulWidget {


  String date,mentorId;
  BookSlotPart2({super.key,required this.date,required this.mentorId});

  @override
  State<BookSlotPart2> createState() => _BookSlotPart2State();
}

class _BookSlotPart2State extends State<BookSlotPart2> {

  final storage = FlutterSecureStorage();
  List<Slot> slots = [];
  int count = 0;
  String date = '';

  @override
  void initState() {

    super.initState();
    fatchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade50,
        title: Text(widget.date,style: style().medium,),
      ),
      backgroundColor: Colors.blue.shade50,
      body: ListView.builder(
        itemCount: slots.length,
        itemBuilder: (context, index) {


          final slot = slots[index];
          if(slot.available == true){
            count++;
          }

          if(slot.available == false){
            return Container(

              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              margin: EdgeInsets.only(left: 20,right: 20,top: 10),
              child: ListTile(
                onTap: (){
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Book this slot?'),

                        actions: <Widget>[
                          TextButton(
                            onPressed: () async {
                              final id = await storage.read(key: 'Id');
                              final url = 'https://hackhive-justcoders.onrender.com/api/user/book';
                              final uri = Uri.parse(url);
                              final body = {
                                "mentorId": widget.mentorId,
                                "userId": id,
                                "date": widget.date,
                                "slot": slot.time
                              };
                              final header = {
                                'content-type' : 'application/json'
                              };
                              final response = await http.post(uri,body: jsonEncode(body),headers:  header);

                              if(response.statusCode ==200){

                                final result = json.decode(response.body);
                                final fResult = result['sessionDetails'];

                                print(result);
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Booked Successfully')
                                      ,backgroundColor: Colors.green.shade900,));
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BookSlotPart2(date: widget.date, mentorId: widget.mentorId)));

                              }else{
                                final result = json.decode(response.body);
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(result['message'])
                                      ,backgroundColor: Colors.green.shade900,));
                                print(response.statusCode);
                                print(response.body);
                              }

                            },
                            child: Text('Yes',style: TextStyle(color: Colors.green.shade900,fontSize: 20),),
                          ),
                          TextButton(
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                            child: Text('No',style: TextStyle(color: Colors.red.shade900,fontSize: 20)),
                          ),
                        ],
                      );
                    },
                  );
                },
                trailing: Icon(Icons.currency_rupee,color: Colors.green.shade900,weight: 10,size: 25,),
                leading: Icon(Icons.book,color: Colors.orange,weight: 10,size: 25,),
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Slot : ${slot.time}'),

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
          }
          else{
            if(count > 20){
              return ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Change the background color to blue
                ),
                child: Text(
                  'No Slots Available!!',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
          );
            }else{
              return Container();
            }

          }


        },
      ),
    );
  }


  Future<void> fatchData() async {
    final id = await storage.read(key: 'Id');
    print(id);
    print(widget.date);
    final url = 'https://hackhive-justcoders.onrender.com/api/mentor/getSlot?mentorId=${widget.mentorId}&date=${widget.date}';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if(response.statusCode == 200){
      print(response.statusCode);
      final result = json.decode(response.body);
      final finalResult = result['slots'] as List<dynamic>;

      setState(() {
        slots = finalResult.map((e) {
          return   Slot(time: e['time'], available: e['available']);
        }).toList();

      });

      print(result);
      print(finalResult);
      // print(finalResult[0]['id']);
    }else{
      print(response.statusCode);
      print(response.body);
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

