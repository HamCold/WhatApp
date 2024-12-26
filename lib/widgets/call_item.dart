import 'package:flutter/material.dart';

class CallItems extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String callType; // Incoming or Missed call
  final String timeAgo;

  const CallItems({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.callType,
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
        "$callType • $timeAgo",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      trailing: Icon(
        Icons.phone,
        color: callType == "Incoming" ? Colors.green : Colors.red,
      ),
    );
  }
}
