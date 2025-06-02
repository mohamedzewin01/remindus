
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:remindus/core/resources/app_constants.dart';
import 'package:remindus/core/widgets/custom_text_form.dart';
import 'package:remindus/features/AddEvent/data/models/add_event_model.dart';
import 'package:remindus/features/AddEvent/presentation/bloc/AddEvent_cubit.dart';
import 'package:remindus/features/AddEvent/presentation/widgets/add_participant.dart';
import 'package:remindus/features/AddEvent/presentation/widgets/change_category.dart';
import 'package:remindus/l10n/app_localizations.dart';

class AddEventBody extends StatefulWidget {
  const AddEventBody({super.key, required this.viewModel});
  final AddEventCubit viewModel;
  @override
  State<AddEventBody> createState() => _AddEventBodyState();
}

class _AddEventBodyState extends State<AddEventBody> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _eventTitleController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();




  DateTime? _selectedDate ;
  TimeOfDay? _selectedStartTime;
  TimeOfDay? _selectedEndTime ;

  @override
  void dispose() {
    _eventTitleController.dispose();
    _dateController.dispose();
    _startTimeController.dispose();
    _endTimeController.dispose();
    _locationController.dispose();
    _descriptionController.dispose();
    widget.viewModel.close();
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
      initialTime:
      (isStartTime ? _selectedStartTime : _selectedEndTime) ??
          TimeOfDay.now(),
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



  @override
  Widget build(BuildContext context) {
    return BlocListener<AddEventCubit, AddEventState>(
      listener: (context, state) {
        if (state is AddEventSuccess) {
          Navigator.pop(context);
          Navigator.pop(context);
        }
        if (state is AddEventFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('حدث خطاء')));
        }
        if (state is AddEventLoading) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Row(
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(width: 10),
                    Text(AppLocalizations.of(context)!.loading),
                  ],
                ),
              );
            },
          );
        }
      },
      child: SafeArea(
        child: GestureDetector(
          onTap: () =>  FocusScope.of(context).unfocus(),
          child: Scaffold(
            backgroundColor: Colors.grey[100], // خلفية الصفحة مشابهة للصورة
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    spacing: 16,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Text(
                        "Add Event",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Enter your event details below",
                        style: TextStyle(color: Colors.grey[600], fontSize: 14),
                      ),
                      CustomTextForm(
                        usernameController: _eventTitleController,
                        hintText: '',
                        title: "Event Title",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter event title';
                          }
                          return null;
                        },
                      ),
                      CustomTextForm(
                        usernameController: _dateController,
                        hintText: '',
                        title: "Date",
                        suffixIcon: Icon(
                          Icons.calendar_today,
                          color: Colors.grey[600],
                        ),
                        readOnly: true,
                        onTap: () => _selectDate(context),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter event Date';
                          }
                          return null;
                        },
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextForm(
                              usernameController: _startTimeController,
                              hintText: '',
                              title: 'Time',
                              suffixIcon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.grey[600],
                              ),

                              readOnly: true,
                              onTap: () => _selectTime(context, true),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter event Time';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.access_time,
                            color: Colors.grey[600],
                          ),
                        ],
                      ),
                      CustomTextForm(
                        usernameController: _locationController,
                        hintText: '',
                        title: 'Location',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter event location';
                          }
                          return null;
                        },
                      ),
                      ChangeCategory(viewModel: widget.viewModel),
                      CustomTextForm(
                        usernameController: _descriptionController,
                        hintText: '',
                        title: 'Description',
                        maxLines: 3,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter event description';
                          }
                          return null;
                        },
                      ),
                      AddParticipant(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Cancel"),
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  widget.viewModel.addEvent(
                                    EventModel(
                                      title: _eventTitleController.text,
                                      date: _dateController.text,
                                      startTime: _startTimeController.text,
                                      endTime: _endTimeController.text,
                                      location: _locationController.text,
                                      category:widget.viewModel.category,
                                      description: _descriptionController.text,
                                      creatorId: AppConstants.currentUserId??'',
                                      participants: widget.viewModel.participants,
                                    ),
                                  );
                                }
                              },
                              child: Text("Add Event"), // تغيير نص الزر هنا
                            ),
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
      ),
    );
  }
}
