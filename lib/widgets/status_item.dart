import 'package:flutter/material.dart';

class StatusItems extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String timeAgo;

  const StatusItems({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,  // Increase size for a better look
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: Text(
        name,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        timeAgo,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      trailing: Icon(
        Icons.check_circle,
        color: Colors.green,
      ),
    );
  }
}
