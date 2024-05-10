import 'package:flutter/material.dart';

class AdminConfigurationPage extends StatefulWidget {
  @override
  _AdminConfigurationPageState createState() => _AdminConfigurationPageState();
}

class _AdminConfigurationPageState extends State<AdminConfigurationPage> {
  // Define variables to hold configuration values
  bool _featureEnabled = false;
  String _selectedOption = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Configuration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Feature Configuration',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SwitchListTile(
              title: Text('Enable Feature'),
              value: _featureEnabled,
              onChanged: (value) {
                setState(() {
                  _featureEnabled = value;
                });
                // Implement logic to update feature configuration in Firestore or other database
              },
            ),
            SizedBox(height: 20),
            Text(
              'Option Selection',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: _selectedOption,
              onChanged: (newValue) {
                setState(() {
                  _selectedOption = newValue!;
                });
                // Implement logic to update selected option configuration in Firestore or other database
              },
              items: <String>['Option 1', 'Option 2', 'Option 3']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement logic to save configuration changes
                // Provide feedback to the admin upon successful configuration update
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Configuration saved successfully')),
                );
              },
              child: Text('Save Configuration'),
            ),
          ],
        ),
      ),
    );
  }
}
