import 'package:flutter/material.dart';

class SignupFormField extends StatefulWidget {
  final TextEditingController phoneNumberController;
  final TextEditingController ageController;
  final TextEditingController selectedEducationalLevel;
  final TextEditingController selectedJobStatus;
  final TextEditingController selectedFieldOfInterests;

  SignupFormField({
    required this.phoneNumberController,
    required this.ageController,
    required this.selectedEducationalLevel,
    required this.selectedJobStatus,
    required this.selectedFieldOfInterests,
  });

  @override
  _SignupFormFieldState createState() => _SignupFormFieldState();
}

class _SignupFormFieldState extends State<SignupFormField> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Form(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: widget.phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(labelText: 'Phone Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: widget.ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Age'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your age';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: widget.selectedEducationalLevel.text.isNotEmpty
                    ? widget.selectedEducationalLevel.text
                    : null,
                onChanged: (value) {
                  setState(() {
                    widget.selectedEducationalLevel.text = value!;
                  });
                },
                items: ['High School', 'Bachelor\'s Degree', 'Master\'s Degree']
                    .map((level) => DropdownMenuItem(
                          value: level,
                          child: Text(level),
                        ))
                    .toList(),
                decoration: InputDecoration(labelText: 'Educational Level'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select your educational level';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: widget.selectedJobStatus.text.isNotEmpty
                    ? widget.selectedJobStatus.text
                    : null,
                onChanged: (value) {
                  setState(() {
                    widget.selectedJobStatus.text = value!;
                  });
                },
                items: ['Employed', 'Unemployed', 'Student']
                    .map((status) => DropdownMenuItem(
                          value: status,
                          child: Text(status),
                        ))
                    .toList(),
                decoration: InputDecoration(labelText: 'Job Status'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select your job status';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: widget.selectedFieldOfInterests.text.isNotEmpty
                    ? widget.selectedFieldOfInterests.text
                    : null,
                onChanged: (value) {
                  setState(() {
                    widget.selectedFieldOfInterests.text = value!;
                  });
                },
                items: [
                  'Engineering',
                  'Programming',
                  'Arts',
                  'Healthcare',
                  'Finance',
                  'Marketing',
                  'Design',
                  'Education',
                  'Science',
                  'Others'
                ]
                    .map((field) => DropdownMenuItem(
                          value: field,
                          child: Text(field),
                        ))
                    .toList(),
                decoration: InputDecoration(labelText: 'Field of Interests'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select your field of interest';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
