import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/di/di.dart';
import '../bloc/AddEvent_cubit.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({super.key});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {

  late AddEventCubit viewModel;

  @override
  void initState() {
    viewModel = getIt.get<AddEventCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: viewModel,
      child: Scaffold(
        body: AddEventScreen(),
      ),
    );
  }
}





class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  _AddEventScreenState createState() => _AddEventScreenState();
}

// نموذج بيانات للمشاركين (لأغراض العرض)
class Participant {
  final String name;
  final String? avatarUrl; // يمكن أن يكون null إذا لم يكن هناك صورة

  Participant({required this.name, this.avatarUrl});
}

// نموذج بيانات للتذكيرات
class ReminderInfo {
  String timeOption;
  String typeOption;

  ReminderInfo({this.timeOption = "30 minutes before", this.typeOption = "Push"});
}


class _AddEventScreenState extends State<AddEventScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _eventTitleController = TextEditingController(text: "Team Planning Meeting");
  final TextEditingController _dateController = TextEditingController(text: "June 15th, 2023");
  final TextEditingController _startTimeController = TextEditingController(text: "10:00 AM");
  final TextEditingController _endTimeController = TextEditingController(text: "11:30 AM");
  final TextEditingController _locationController = TextEditingController(text: "Conference Room A");
  final TextEditingController _descriptionController = TextEditingController(text: "Quarterly planning session to discuss upcoming projects and goals for Q3.");
  final TextEditingController _participantNameController = TextEditingController();

  String? _selectedCategory = "Work";
  List<String> _categories = ["Work", "Personal", "Meeting", "Appointment", "Other"];

  DateTime? _selectedDate = DateTime(2023, 6, 15);
  TimeOfDay? _selectedStartTime = TimeOfDay(hour: 10, minute: 0);
  TimeOfDay? _selectedEndTime = TimeOfDay(hour: 11, minute: 30);

  final List<Participant> _participants = [
    Participant(name: "John Doe", avatarUrl: "https://randomuser.me/api/portraits/men/32.jpg"),
    Participant(name: "Jane Smith", avatarUrl: "https://randomuser.me/api/portraits/women/44.jpg"),
  ];

  final List<ReminderInfo> _reminders = [
    ReminderInfo(timeOption: "30 minutes before", typeOption: "Push"),
    ReminderInfo(timeOption: "1 day before", typeOption: "Email"),
  ];

  final List<String> _reminderTimeOptions = [
    "5 minutes before",
    "10 minutes before",
    "15 minutes before",
    "30 minutes before",
    "1 hour before",
    "1 day before",
    "1 week before"
  ];

  final List<String> _reminderTypeOptions = ["Push", "Email", "SMS"];


  @override
  void dispose() {
    _eventTitleController.dispose();
    _dateController.dispose();
    _startTimeController.dispose();
    _endTimeController.dispose();
    _locationController.dispose();
    _descriptionController.dispose();
    _participantNameController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat('MMMM dd, yyyy').format(picked);
      });
    }
  }

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: (isStartTime ? _selectedStartTime : _selectedEndTime) ?? TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        if (isStartTime) {
          _selectedStartTime = picked;
          _startTimeController.text = picked.format(context);
        } else {
          _selectedEndTime = picked;
          _endTimeController.text = picked.format(context);
        }
      });
    }
  }

  void _addParticipant() {
    if (_participantNameController.text.isNotEmpty) {
      setState(() {
        // في تطبيق حقيقي، قد تبحث عن المستخدم أو تسمح بإضافة بريد إلكتروني
        _participants.add(Participant(name: _participantNameController.text));
        _participantNameController.clear();
      });
    }
  }

  void _removeParticipant(int index) {
    setState(() {
      _participants.removeAt(index);
    });
  }

  void _addReminder() {
    setState(() {
      _reminders.add(ReminderInfo()); // Add with default values
    });
  }

  void _removeReminder(int index) {
    setState(() {
      _reminders.removeAt(index);
    });
  }


  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 16.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // خلفية الصفحة مشابهة للصورة
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card( // استخدام Card لإعطاء شكل الحاوية البيضاء
            elevation: 0, // يمكن تعديل الظل
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Add Event", // تغيير العنوان هنا
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Enter your event details below", // نص توضيحي
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                    SizedBox(height: 24),

                    _buildSectionTitle("Event Title"),
                    TextFormField(
                      controller: _eventTitleController,
                      decoration: InputDecoration(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter event title';
                        }
                        return null;
                      },
                    ),

                    _buildSectionTitle("Date"),
                    TextFormField(
                      controller: _dateController,
                      readOnly: true,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.calendar_today, color: Colors.grey[600]),
                      ),
                      onTap: () => _selectDate(context),
                    ),

                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildSectionTitle("Start Time"),
                              TextFormField(
                                controller: _startTimeController,
                                readOnly: true,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.access_time, color: Colors.grey[600]),
                                  suffixIcon: Icon(Icons.arrow_drop_down, color: Colors.grey[600]),
                                ),
                                onTap: () => _selectTime(context, true),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildSectionTitle("End Time"),
                              TextFormField(
                                controller: _endTimeController,
                                readOnly: true,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.access_time, color: Colors.grey[600]),
                                  suffixIcon: Icon(Icons.arrow_drop_down, color: Colors.grey[600]),
                                ),
                                onTap: () => _selectTime(context, false),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    _buildSectionTitle("Location"),
                    TextFormField(
                      controller: _locationController,
                      decoration: InputDecoration(),
                    ),

                    _buildSectionTitle("Category"),
                    DropdownButtonFormField<String>(
                      value: _selectedCategory,
                      decoration: InputDecoration(
                        // suffixIcon: Icon(Icons.arrow_drop_down, color: Colors.grey[600]), // DropdownButtonFormField يضيفها تلقائياً
                      ),
                      items: _categories.map((String category) {
                        return DropdownMenuItem<String>(
                          value: category,
                          child: Text(category),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedCategory = newValue;
                        });
                      },
                    ),

                    _buildSectionTitle("Description"),
                    TextFormField(
                      controller: _descriptionController,
                      decoration: InputDecoration(),
                      maxLines: 3,
                    ),

                    _buildSectionTitle("Participants"),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _participantNameController,
                            decoration: InputDecoration(
                              hintText: "Enter email or name",
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.white,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.add, color: Colors.black54),
                            onPressed: _addParticipant,
                            constraints: BoxConstraints(), // لإزالة الحشو الافتراضي
                            padding: EdgeInsets.all(10), // تعديل الحشو
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _participants.length,
                      itemBuilder: (context, index) {
                        final participant = _participants[index];
                        return Container(
                          margin: EdgeInsets.only(bottom: 8.0),
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 18,
                                backgroundImage: participant.avatarUrl != null
                                    ? NetworkImage(participant.avatarUrl!)
                                    : null,
                                child: participant.avatarUrl == null
                                    ? Icon(Icons.person, size: 18, color: Colors.white,)
                                    : null,
                                backgroundColor: Colors.blueGrey,
                              ),
                              SizedBox(width: 12),
                              Expanded(child: Text(participant.name)),
                              IconButton(
                                icon: Icon(Icons.delete_outline, color: Colors.black54),
                                onPressed: () => _removeParticipant(index),
                                constraints: BoxConstraints(),
                                padding: EdgeInsets.zero,
                              ),
                            ],
                          ),
                        );
                      },
                    ),

                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildSectionTitle("Reminders"),
                        TextButton.icon(
                          icon: Icon(Icons.add, size: 20),
                          label: Text("Add"),
                          onPressed: _addReminder,
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.black87,
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: BorderSide(color: Colors.grey.shade400)
                            ),
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _reminders.length,
                      itemBuilder: (context, index) {
                        final reminder = _reminders[index];
                        return Container(
                          margin: EdgeInsets.only(bottom: 8.0),
                          padding: EdgeInsets.all(4), // تقليل الحشو حول الخانات الداخلية
                          decoration: BoxDecoration(
                            color: Colors.white, // لضمان ظهور حدود Dropdown
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: DropdownButtonFormField<String>(
                                  value: reminder.timeOption,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                                  ),
                                  items: _reminderTimeOptions.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value, style: TextStyle(fontSize: 14)),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    if (newValue != null) {
                                      setState(() {
                                        reminder.timeOption = newValue;
                                      });
                                    }
                                  },
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                flex: 1,
                                child: DropdownButtonFormField<String>(
                                  value: reminder.typeOption,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                                  ),
                                  items: _reminderTypeOptions.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value, style: TextStyle(fontSize: 14)),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    if (newValue != null) {
                                      setState(() {
                                        reminder.typeOption = newValue;
                                      });
                                    }
                                  },
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.delete_outline, color: Colors.black54),
                                onPressed: () => _removeReminder(index),
                                constraints: BoxConstraints(),
                                padding: EdgeInsets.all(4),
                              ),
                            ],
                          ),
                        );
                      },
                    ),

                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // أو أي إجراء إلغاء آخر
                          },
                          child: Text("Cancel"),
                        ),
                        SizedBox(width: 12),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // عملية إضافة الحدث
                              // يمكنك جمع البيانات من الـ controllers والمتغيرات هنا
                              print("Event Title: ${_eventTitleController.text}");
                              print("Date: ${_dateController.text}");
                              // ... وهكذا لباقي الحقول
                              print("Adding event...");
                              // Navigator.of(context).pop(); // العودة بعد الإضافة
                            }
                          },
                          child: Text("Add Event"), // تغيير نص الزر هنا
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}