// presentationTier/forms/profile_item.dart
import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function(String)? onTap;

  ProfileItem(this.title, this.icon, this.onTap);
  
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
      return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: IconButton(
        icon: Icon(Icons.edit),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Edit $title'),
                content: TextField(
                  controller: controller,
                  decoration: InputDecoration(hintText: 'Enter here'),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text('Save'),
                    onPressed: () {
                      onTap?.call(controller.text);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}