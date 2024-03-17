import 'package:flutter/material.dart';
import 'package:hackhive/MainCode/Model.dart';
import 'package:hackhive/style/theme.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:table_calendar/table_calendar.dart';



class UpdateSchedulePart2 extends StatefulWidget {
  String date;
  UpdateSchedulePart2({super.key,required this.date});

  @override
  State<UpdateSchedulePart2> createState() => _UpdateSchedulePart2State();
}

class _UpdateSchedulePart2State extends State<UpdateSchedulePart2> {

  final storage = FlutterSecureStorage();
  List<Slot> slots = [];

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

          Icon avail = slot.available == false ? Icon(Icons.task_alt_sharp,color: Colors.green.shade900,weight: 10,size: 25,) : Icon(Icons.cancel_outlined,color: Colors.red.shade900,weight: 10,size: 25,);

          return Container(

            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            margin: EdgeInsets.only(left: 20,right: 20,top: 10),
            child: ListTile(
              onTap: () async{

                bool a;
                if(slot.available == false){
                  a = true;
                }else{
                  a = false;
                }


                final id = await storage.read(key: 'Id');

                final url = 'https://hackhive-justcoders.onrender.com/api/mentor/updateSlot';
                final uri = Uri.parse(url);
                final body = {
                  'mentorId' : id,
                  'date': widget.date,
                  'slot':slot.time,
                  'available': a
                };
                final header = {
                  'content-type' : 'application/json'
                };
                final response = await http.post(uri,body: jsonEncode(body),headers:  header);

                if(response.statusCode ==200){

                  final result = json.decode(response.body);
                  final fResult = result['slots'];

                  print(fResult);

                  fatchData();
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Update Successfully')
                        ,backgroundColor: Colors.green.shade900,));


                }else{
                  final result = json.decode(response.body);

                  final finalResult = result['slots'];
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(finalResult['message']),
                      backgroundColor: Colors.green.shade900,
                    ),
                  );
                  print(response.statusCode);
                  print(response.body);
                }
              },
              trailing: avail,
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
        },
      ),
    );
  }


  Future<void> fatchData() async {
    final id = await storage.read(key: 'Id');
    print(id);
    print(widget.date);

    final url = 'https://hackhive-justcoders.onrender.com/api/mentor/getSlot?mentorId=${id}&date=${widget.date}';
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
      final result = json.decode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(result['message']),
          backgroundColor: Colors.green.shade900,
        ),
      );
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

