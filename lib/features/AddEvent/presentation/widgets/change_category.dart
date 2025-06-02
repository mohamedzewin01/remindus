import 'package:flutter/material.dart';
import 'package:remindus/core/resources/app_constants.dart';
import 'package:remindus/features/AddEvent/presentation/bloc/AddEvent_cubit.dart';

class ChangeCategory extends StatefulWidget {
  const ChangeCategory({super.key, required this.viewModel});
  final AddEventCubit viewModel;

  @override
  State<ChangeCategory> createState() => _ChangeCategoryState();
}

class _ChangeCategoryState extends State<ChangeCategory> {
  late List<String> _categories;
  String? _selectedCategory;


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _categories = AppConstants.getCategories(context);
    _selectedCategory = _categories[0];
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Category"),
        SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: _selectedCategory,
          isExpanded: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
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
              // حدّث الكاتيجوري في الـ viewModel مباشرة
              widget.viewModel.category = newValue!;
            });
          },
        ),
      ],
    );
  }
}