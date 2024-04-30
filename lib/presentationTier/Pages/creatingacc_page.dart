import 'package:flutter/material.dart';

import 'package:graduationinterface/presentationTier/Pages/questions_page.dart';

class CreatingAcc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/assets/NiceJob.png',
              height: 140,
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/assets/signn.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 120.0,
                      height: 120.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 0.5),
                        image: DecorationImage(
                          image: AssetImage('images/assets/8.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.camera_alt_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              SignupFormField(
                label: 'Phone Number',
                keyboardType: TextInputType.text,
              ),
              SignupFormField(
                label: 'Age',
                keyboardType: TextInputType.text,
              ),
              SignupFormField(
                label: 'Educational Level',
                options: [
                  'High School',
                  'Bachelor\'s Degree',
                  'Master\'s Degree'
                ],
              ),
              SignupFormField(
                label: 'Job Status',
                options: ['Employed', 'Unemployed', 'Student'],
              ),
              SignupFormField(
                label: 'Field of Interests',
                options: [
                  'Engineering',
                  'Programming',
                  'Arts',
                  'Healthcare',
                  'Finance',
                  'Marketing',
                  'Design',
                  'Education',
                  'Science',
                  'Others', // Placeholder for additional options
                ],
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => QuestionsPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF3B52BB), // Background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignupFormField extends StatefulWidget {
  final String label;
  final List<String>? options;
  final TextInputType? keyboardType;

  SignupFormField({required this.label, this.options, this.keyboardType});

  @override
  _SignupFormFieldState createState() => _SignupFormFieldState();
}

class _SignupFormFieldState extends State<SignupFormField> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          widget.label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        if (widget.options != null)
          DropdownButtonFormField(
            value: _selectedOption,
            onChanged: (String? value) {
              setState(() {
                _selectedOption = value;
              });
            },
            items: widget.options!.map((String option) {
              return DropdownMenuItem(
                value: option,
                child: Text(option),
              );
            }).toList(),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          )
        else
          TextFormField(
            keyboardType: widget.keyboardType,
            onChanged: (value) {},
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
        SizedBox(height: 16.0),
      ],
    );
  }
}
