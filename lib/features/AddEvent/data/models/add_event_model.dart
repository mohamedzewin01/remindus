class EventModel {
  final String title;
  final String date;
  final String startTime;
  final String endTime;
  final String location;
  final String category;
  final String description;
  final String creatorId;
  final List<Participant> participants;


  EventModel({
    required this.title,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.location,
    required this.category,
    required this.description,
    required this.creatorId,
    required this.participants,

  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      title: json['title'],
      date: json['date'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      location: json['location'],
      category: json['category'],
      description: json['description'],
      creatorId: json['creatorId'],
      participants: (json['participants'] as List<dynamic>)
          .map((e) => Participant.fromJson(e as Map<String, dynamic>))
          .toList(),

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'location': location,
      'category': category,
      'description': description,
      'creatorId': creatorId,
      'participants': participants.map((p) => p.toJson()).toList(),

    };
  }
}
class Participant {
  final String id;
  final String email;
  final String image;
  final String name;
  final String status;

  Participant({
    required this.id,
    required this.email,
    required this.image,
    required this.name,
  }) : status = "pending"; // القيمة ثابتة دائمًا

  factory Participant.fromJson(Map<String, dynamic> json) {
    return Participant(
      id: json['id'],
      email: json['email'],
      image: json['image'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'image': image,
      'name': name,
      'status': status,  // هيكون دايمًا "pending"
    };
  }
}

