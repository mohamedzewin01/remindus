import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remindus/features/AddEvent/presentation/widgets/add_event_body.dart';
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
      child: Scaffold(body: AddEventBody(viewModel: viewModel)),
    );
  }
}



