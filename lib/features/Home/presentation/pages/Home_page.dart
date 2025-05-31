import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../bloc/Home_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late HomeCubit viewModel;

  @override
  void initState() {
    viewModel = getIt.get<HomeCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: viewModel,
      child: Scaffold(

        body: EventsScreen(),
      ),
    );
  }
}



// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Events App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         fontFamily: 'Inter', // A common, clean font. You might need to add it to pubspec.yaml
//         scaffoldBackgroundColor: Colors.grey[100], // Light grey background
//         cardTheme: CardTheme(
//           elevation: 2,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//           margin: const EdgeInsets.symmetric(vertical: 8.0),
//         ),
//         textTheme: const TextTheme(
//           headlineSmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black87),
//           titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black87),
//           bodyMedium: TextStyle(fontSize: 14, color: Colors.black54),
//           labelSmall: TextStyle(fontSize: 12, color: Colors.white),
//         ),
//       ),
//       home: const EventsScreen(),
//     );
//   }
// }

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  // For ToggleButtons state
  final List<bool> _isSelected = [true, false]; // Upcoming, Past

  final List<EventData> upcomingEvents = [
    EventData(
      title: 'Team Planning Meeting',
      tag: 'Work',
      tagColor: Colors.blue[100]!,
      tagTextColor: Colors.blue[800]!,
      description: 'Quarterly planning session to discuss upcoming projects and goals for Q3.',
      dateTime: 'Thu, Jun 15',
      time: '10:00 AM - 11:30 AM',
      location: 'Conference Room A',
      attendeesAvatars: [
        'https://randomuser.me/api/portraits/men/32.jpg',
        'https://randomuser.me/api/portraits/women/44.jpg',
        'https://randomuser.me/api/portraits/men/51.jpg',
      ],
      extraAttendees: 1,
      totalAttendees: 4,
    ),
    EventData(
      title: 'Birthday Party',
      tag: 'Personal',
      tagColor: Colors.purple[100]!,
      tagTextColor: Colors.purple[800]!,
      description: 'Celebration for Mike\'s 30th birthday. Casual attire, food and drinks provided.',
      dateTime: 'Tue, Jun 20',
      time: '7:00 PM - 10:00 PM',
      location: 'Central Park',
      attendeesAvatars: [
        'https://randomuser.me/api/portraits/women/68.jpg',
        'https://randomuser.me/api/portraits/men/76.jpg',
      ],
      extraAttendees: 0,
      totalAttendees: 2,
    ),
    EventData(
      title: 'Team Planning Meeting',
      tag: 'Work',
      tagColor: Colors.blue[100]!,
      tagTextColor: Colors.blue[800]!,
      description: 'Quarterly planning session to discuss upcoming projects and goals for Q3.',
      dateTime: 'Thu, Jun 15',
      time: '10:00 AM - 11:30 AM',
      location: 'Conference Room A',
      attendeesAvatars: [
        'https://randomuser.me/api/portraits/men/32.jpg',
        'https://randomuser.me/api/portraits/women/44.jpg',
        'https://randomuser.me/api/portraits/men/51.jpg',
      ],
      extraAttendees: 1,
      totalAttendees: 4,
    ),
    EventData(
      title: 'Birthday Party',
      tag: 'Personal',
      tagColor: Colors.purple[100]!,
      tagTextColor: Colors.purple[800]!,
      description: 'Celebration for Mike\'s 30th birthday. Casual attire, food and drinks provided.',
      dateTime: 'Tue, Jun 20',
      time: '7:00 PM - 10:00 PM',
      location: 'Central Park',
      attendeesAvatars: [
        'https://randomuser.me/api/portraits/women/68.jpg',
        'https://randomuser.me/api/portraits/men/76.jpg',
      ],
      extraAttendees: 0,
      totalAttendees: 2,
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header: Welcome back & Icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome back!',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Here are your upcoming events',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.wb_sunny_outlined, color: Colors.grey[600]),
                    onPressed: () {
                      // Theme toggle action
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Toggle Buttons: Upcoming / Past
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ToggleButtons(
                  isSelected: _isSelected,
                  onPressed: (int index) {
                    setState(() {
                      for (int i = 0; i < _isSelected.length; i++) {
                        _isSelected[i] = i == index;
                      }
                      // Here you would also switch the list of events being displayed
                    });
                  },
                  borderRadius: BorderRadius.circular(8),
                  selectedColor: Colors.black87, // Text color when selected
                  color: Colors.grey[600], // Text color when not selected
                  fillColor: Colors.white, // Background color when selected
                  splashColor: Colors.blue.withOpacity(0.12),
                  hoverColor: Colors.blue.withOpacity(0.04),
                  renderBorder: false, // Remove default borders
                  constraints: BoxConstraints.expand( // Make buttons fill height
                    height: 40,
                    width: (MediaQuery.of(context).size.width - 32 - 4) / 2, // Adjust for padding and inner spacing
                  ),
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text('Upcoming'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text('Past'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Event Cards
              // Display upcoming or past based on _isSelected
              if (_isSelected[0]) // Upcoming is selected
                ...upcomingEvents.map((event) => _buildEventCard(context, event)).toList(),
              // if (_isSelected[1]) // Past is selected
              //   ...pastEvents.map((event) => _buildEventCard(context, event)).toList(),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEventCard(BuildContext context, EventData event) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(event.title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: event.tagColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                event.tag,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(color: event.tagTextColor, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 12),
            Text(event.description, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 16),
            _buildInfoRow(context, Icons.calendar_today_outlined, event.dateTime),
            const SizedBox(height: 8),
            _buildInfoRow(context, Icons.access_time_outlined, event.time),
            const SizedBox(height: 8),
            _buildInfoRow(context, Icons.location_on_outlined, event.location),
            const SizedBox(height: 16),
            _buildAttendeesRow(context, event),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey[600]),
        const SizedBox(width: 8),
        Text(text, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[700])),
      ],
    );
  }

  Widget _buildAttendeesRow(BuildContext context, EventData event) {
    const double avatarSize = 28.0;
    const double overlap = 12.0; // How much avatars overlap

    List<Widget> avatarWidgets = [];
    for (int i = 0; i < event.attendeesAvatars.length; i++) {
      avatarWidgets.add(
        Positioned(
          left: i * (avatarSize - overlap),
          child: CircleAvatar(
            radius: avatarSize / 2,
            backgroundColor: Colors.grey[300], // Fallback color
            backgroundImage: NetworkImage(event.attendeesAvatars[i]),
          ),
        ),
      );
    }

    return Row(
      children: [
        SizedBox(
          width: event.attendeesAvatars.isNotEmpty
              ? (event.attendeesAvatars.length * (avatarSize - overlap)) + overlap
              : 0,
          height: avatarSize,
          child: Stack(
            children: avatarWidgets,
          ),
        ),
        if (event.extraAttendees > 0) ...[
          const SizedBox(width: 4),
          Text(
            '+${event.extraAttendees}',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500, color: Colors.grey[700]),
          ),
        ],
        const SizedBox(width: 8),
        Icon(Icons.group_outlined, size: 18, color: Colors.grey[600]),
        const SizedBox(width: 4),
        Text(
          '${event.totalAttendees}',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
        ),
      ],
    );
  }
}

// Data model for an event
class EventData {
  final String title;
  final String tag;
  final Color tagColor;
  final Color tagTextColor;
  final String description;
  final String dateTime;
  final String time;
  final String location;
  final List<String> attendeesAvatars; // URLs for avatars
  final int extraAttendees; // Number of attendees not shown as avatars (e.g., +1)
  final int totalAttendees;

  EventData({
    required this.title,
    required this.tag,
    required this.tagColor,
    required this.tagTextColor,
    required this.description,
    required this.dateTime,
    required this.time,
    required this.location,
    required this.attendeesAvatars,
    required this.extraAttendees,
    required this.totalAttendees,
  });
}