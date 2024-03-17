import 'package:flutter/material.dart';
import 'package:hackhive/MainCode/MentorUpdate/UpdateSchedulePart2.dart';
import 'package:hackhive/MainCode/UserBooKSlot/BookSlotPart2.dart';
import 'package:hackhive/style/theme.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class BookSlot extends StatefulWidget {
  String mentor;
  BookSlot({super.key, required this.mentor});

  @override
  State<BookSlot> createState() => _BookSlotState();
}

class _BookSlotState extends State<BookSlot> {
  late CalendarFormat _calendarFormat;
  late DateTime _focusedDay;
  late DateTime _selectedDay;

  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.month;
    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Date',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
            SizedBox(height: 20),
           OutlinedButton(
               onPressed: ( ){}, child: Text('Selected Date: ${DateFormat('yyyy-MM-dd').format(_selectedDay)}',style: TextStyle(color: Colors.blue.shade900,fontSize: 17),)),
            SizedBox(height: 40),
            Container(height: 1,color: Colors.black,),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookSlotPart2(
                      date: DateFormat('yyyy-MM-dd').format(_selectedDay),
                      mentorId: widget.mentor,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Change the background color to blue
              ),
              child: Text(
                'Continue Booking...',
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
            SizedBox(height: 20),

          ],
        ),
      ),
    );
  }

  Future<void> _showSelectedDate(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Selected Date'),
          content: Text('You picked: ${DateFormat('yyyy-MM-dd').format(_selectedDay)}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

//DateFormat('yyyy-MM-dd').format(_selectedDay)
