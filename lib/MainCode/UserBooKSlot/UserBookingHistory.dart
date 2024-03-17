import 'package:flutter/material.dart';
import 'package:hackhive/MainCode/Model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:table_calendar/table_calendar.dart';



class UserBookingHistory extends StatefulWidget {
  UserBookingHistory({super.key});

  @override
  State<UserBookingHistory> createState() => _UserBookingHistoryState();
}

class _UserBookingHistoryState extends State<UserBookingHistory> {

  final storage = FlutterSecureStorage();
  List<BookingHistory> bookingHistorys = [];

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
        title: Text('Session History'),
      ),
      backgroundColor: Colors.blue.shade50,
      body: ListView.builder(
        itemCount: bookingHistorys.length,
        itemBuilder: (context, index) {


          final bookHistory = bookingHistorys[index];
          String dateTimeString = bookHistory.date;
          List<String> parts = dateTimeString.split('T');
          String date = parts[0]; // Date part




          return Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.book,color: Colors.green,weight: 10,size: 40,),
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Session ID : ${bookHistory.id}\n',style: TextStyle(fontSize: 10,color: Colors.orange.shade900),),
                  Text('Mentor Name : ${bookHistory.mentorId}'),
                  Text('Session Slot : ${bookHistory.slot}'),
                  Text('Session date : ${date}'),
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
    final url = 'https://hackhive-justcoders.onrender.com/api/user/gethistory?userId=65f57138986f930be4d9311c';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if(response.statusCode == 200){
      print(response.statusCode);
      final result = json.decode(response.body);
      final finalResult = result['bookings'] as List<dynamic>;

      setState(() {
        bookingHistorys = finalResult.map((e) {
          return   BookingHistory(mentorId: e['mentorId']['username'], date: e['date'], slot: e['slot'],id: e['_id']);
        }).toList();

      });

      print(result);
      print(finalResult);
      // print(finalResult[0]['id']);
    }else{
      final result = json.decode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(result['messages']),
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
