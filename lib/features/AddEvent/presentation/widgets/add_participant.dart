import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remindus/core/widgets/custom_text_form.dart';
import 'package:remindus/features/AddEvent/data/models/add_event_model.dart';
import 'package:remindus/features/AddEvent/presentation/bloc/AddEvent_cubit.dart';
import 'package:remindus/features/AddEvent/presentation/bloc/add_partcipant_cubit/add_participant_cubit.dart';

import '../../../../core/di/di.dart';

class AddParticipant extends StatefulWidget {
  const AddParticipant({super.key});

  @override
  State<AddParticipant> createState() => _AddParticipantState();
}

class _AddParticipantState extends State<AddParticipant> {
  late AddParticipantCubit _viewModel;
  final TextEditingController _participantNameController =
      TextEditingController();
  final List<Participant> _participants = [];

  @override
  void initState() {
    _viewModel = getIt.get<AddParticipantCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _viewModel,
      child: BlocListener<AddParticipantCubit, AddParticipantState>(
        listener: (context, state) {
          if (state is AddParticipantSuccess) {
            _participants.add(state.participant);
            _participantNameController.clear();
            print(_participants.length);
            print(_participants.first.name);
            print(_participants.first.email);
            print(_participants.first.image);
            context.read<AddEventCubit>().participants.add(state.participant);
          }
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Participants',style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomTextForm(
                    usernameController: _participantNameController,
                    hintText: 'Enter email or name',
                    title: '',
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.grey.shade100,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.add, color: Colors.black54),
                    onPressed: () {
                      if (_participantNameController.text.isEmpty) {
                        return;
                      }
                      _viewModel.getParticipant(
                        _participantNameController.text,
                      );
                    },
                    constraints: BoxConstraints(),
                    padding: EdgeInsets.all(10),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            BlocConsumer<AddParticipantCubit, AddParticipantState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                if (state is AddParticipantSuccess) {
                  return Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _participants.length,
                      itemBuilder: (context, index) {
                        final participant = _participants[index];
                        return Container(
                          margin: EdgeInsets.only(bottom: 8.0),
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 18,
                                backgroundImage: participant.image != ''
                                    ? NetworkImage(participant.image)
                                    : null,
                                backgroundColor: Colors.blueGrey,
                                child: participant.image == ''
                                    ? Icon(
                                        Icons.person,
                                        size: 18,
                                        color: Colors.white,
                                      )
                                    : null,
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(participant.name),
                                    Text(
                                      participant.email,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.delete_outline,
                                  color: Colors.black54,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _participants.remove(participant);
                                  });
                                },
                                constraints: BoxConstraints(),
                                padding: EdgeInsets.zero,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _participants.length,
                  itemBuilder: (context, index) {
                    final participant = _participants[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: 8.0),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 18,
                            backgroundImage: participant.image != ''
                                ? NetworkImage(participant.image)
                                : null,
                            backgroundColor: Colors.blueGrey,
                            child: participant.image == ''
                                ? Icon(
                                    Icons.person,
                                    size: 18,
                                    color: Colors.white,
                                  )
                                : null,
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(participant.name),
                                Text(
                                  participant.email,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.delete_outline,
                              color: Colors.black54,
                            ),
                            onPressed: () {
                              setState(() {
                                _participants.remove(participant);
                              });
                            },
                            constraints: BoxConstraints(),
                            padding: EdgeInsets.zero,
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
