import 'package:flutter/material.dart';

class ChatItems extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  const ChatItems({
    super.key,
    required this.imageUrl,
    required this.subtitle,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,  // Increase size for a better look
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        style: TextStyle(
          color: Colors.white,
        ),
        subtitle,
        maxLines: 1,  // Prevent long text from taking up multiple lines
        overflow: TextOverflow.ellipsis,  // Add ellipsis for overflow
      ),
      trailing: Text("12.00 pm"),
    );
  }
}
