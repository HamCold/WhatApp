import 'package:flutter/material.dart';

class GroupItems extends StatelessWidget {
  final String imageUrl;
  final String groupName;
  final String groupSubtitle;

  const GroupItems({
    super.key,
    required this.imageUrl,
    required this.groupName,
    required this.groupSubtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,  // Increase size for a better look
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: Text(
        groupName,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        groupSubtitle,
        style: TextStyle(
          color: Colors.white,
        ),
        maxLines: 1,  // Prevent long text from taking up multiple lines
        overflow: TextOverflow.ellipsis,  // Add ellipsis for overflow
      ),
      trailing: Icon(
        Icons.group,
        color: Colors.green,
      ),
    );
  }
}
