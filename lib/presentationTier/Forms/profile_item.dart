// presentationTier/forms/profile_item.dart
import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function(String)? onTap;

  const ProfileItem(this.title, this.icon, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        final controller = TextEditingController();
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Edit your $title'),
              content: TextField(
                controller: controller,
                decoration: const InputDecoration(hintText: 'Enter here'),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Save'),
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
    );
  }
}
