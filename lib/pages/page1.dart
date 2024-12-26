import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import '../widgets/chat_item.dart';
import '../widgets/status_item.dart';
import '../widgets/group_item.dart';
import '../widgets/call_item.dart';

class Page1 extends StatefulWidget {
  Page1({super.key});

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  int _selectedIndex = 0;
  var faker = new Faker();

  // Fungsi untuk menampilkan konten berdasarkan tab yang dipilih
  Widget _getBody() {
    switch (_selectedIndex) {
      case 0: // Chats
        return Scaffold(
          body: Container(
            color: Colors.grey[800],  // WhatsApp background color
            child: ListView.builder(
              itemCount: 30,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ChatItems(
                    imageUrl: "https://picsum.photos/id/$index/200/300",
                    subtitle: faker.lorem.sentence(),
                    title: faker.person.name(),
                  ),
                );
              },
            ),
          ),
        );
      case 1: // Status
        return Scaffold(
          body: Container(
            color: Colors.grey[800],  // WhatsApp background color
            child: ListView.builder(
              itemCount: 10, // Limit number of statuses
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: StatusItems(
                    imageUrl: "https://picsum.photos/id/${index + 10}/200/300", // Different image IDs for statuses
                    name: faker.person.name(),
                    timeAgo: "2 minutes ago",
                  ),
                );
              },
            ),
          ),
        );
      case 2: // Groups
        return Scaffold(
          body: Container(
            color: Colors.grey[800],  // WhatsApp background color
            child: ListView.builder(
              itemCount: 10, // Example number of groups
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GroupItems(
                    imageUrl: "https://picsum.photos/id/${index + 20}/200/300", // Different image IDs for groups
                    groupName: faker.company.name(),
                    groupSubtitle: faker.lorem.sentence(),
                  ),
                );
              },
            ),
          ),
        );
      case 3: // Calls
        return Scaffold(
          body: Container(
            color: Colors.grey[800],  // WhatsApp background color
            child: ListView.builder(
              itemCount: 10, // Example number of calls
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CallItems(
                    imageUrl: "https://picsum.photos/id/${index + 30}/200/300", // Different image IDs for calls
                    name: faker.person.name(),
                    callType: index % 2 == 0 ? "Missed" : "Incoming",
                    timeAgo: "${index + 1} minutes ago",
                  ),
                );
              },
            ),
          ),
        );
      default:
        return const Scaffold();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  // Disable debug banner
      theme: ThemeData(
        primaryColor: Colors.green,  // WhatsApp green theme
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("WhatsApp"),
          backgroundColor: Colors.green,  // WhatsApp green color
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
        body: _getBody(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chats',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_time),
              label: 'Status',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: 'Groups',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.call),
              label: 'Calls',
            ),
          ],
          selectedItemColor: Colors.black,  // Change the selected item color to black
          unselectedItemColor: Colors.grey,  // Change the unselected item color to grey
        ),
      ),
    );
  }
}
