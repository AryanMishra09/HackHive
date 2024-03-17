class Mentors {
  final String id;
  final String name;
  final String profession;
  final String qualification;
  final int charges;
  final String image;

  Mentors({required this.name, required this.profession,required this.qualification,required this.charges,required this.id,required this.image});

}

class CategoryMentors {
  final String id;
  final String name;
  final String profession;
  final String qualification;
  final int charges;

  CategoryMentors({required this.name, required this.profession,required this.qualification,required this.charges, required this.id});

}

class Session {
  final String date;
  final String sessionStatus;
  final String slot;
  final String meetLink;


  Session({required this.date, required this.sessionStatus,required this.slot,required this.meetLink });

}

class Slot {
  final String time;
  final bool available;


  Slot({required this.time, required this.available });

}

class BookingHistory {
  final String id;
  final String mentorId;
  final String slot;
  final String date;


  BookingHistory({required this.mentorId, required this.date,required this.slot,required  this.id });


}