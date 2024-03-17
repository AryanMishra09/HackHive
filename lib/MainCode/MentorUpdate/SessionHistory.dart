import 'package:flutter/material.dart';
import 'package:hackhive/MainCode/Model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:table_calendar/table_calendar.dart';

class SessionHistory extends StatefulWidget {
  const SessionHistory({Key? key}) : super(key: key);

  @override
  State<SessionHistory> createState() => _SessionHistoryState();
}

class _SessionHistoryState extends State<SessionHistory> {
  final storage = FlutterSecureStorage();
  List<Session> sessions = [];
  String date = '';
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade50,
        title: Text('Session History'),
      ),
      backgroundColor: Colors.blue.shade50,
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: sessions.length,
        itemBuilder: (context, index) {
          final session = sessions[index];
          String dateTimeString = session.date;
          List<String> parts = dateTimeString.split('T');
          String date = parts[0]; // Date part

          return Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.book, color: Colors.green, size: 40,),
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Session Date : $date'),
                  Text('Session Slot : ${session.slot}'),
                  Text('Session Status : ${session.sessionStatus}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });

    final id = await storage.read(key: 'Id');
    final url = 'https://hackhive-justcoders.onrender.com/api/mentor/getHistory?mentorId=$id';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      print(response.statusCode);
      final result = json.decode(response.body);
      final finalResult = result['sessionHistory'] as List<dynamic>;

      setState(() {
        sessions = finalResult.map((e) {
          return Session(date: e['date'], sessionStatus: e['sessionStatus'], slot: e['slot'], meetLink: e['meetLink']);
        }).toList();
        isLoading = false;
      });

      print(result);
      print(finalResult);
    } else {
      final result = json.decode(response.body);
      final finalResult = result['sessionHistory'];

      print(response.statusCode);
      print(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(result['message']),
          backgroundColor: Colors.green.shade900,
        ),
      );

      setState(() {
        isLoading = false;
      });
    }
  }
}
