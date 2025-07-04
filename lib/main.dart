import 'package:flutter/material.dart';

void main() {
  runApp(MyFullImageGridApp());
}

class MyFullImageGridApp extends StatelessWidget {
  const MyFullImageGridApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.grey.shade100,
      ),
      home: FullImageGridScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FullImageGridScreen extends StatelessWidget {
  final List<Map<String, dynamic>> gridItems = [
    {
      'image': 'assets/images/01.jpg',
      'label': '1',
    },
    {
      'image': 'assets/images/02.jpg',
      'label': '2',
    },
    {
      'image': 'assets/images/03.jpg',
      'label': '3',
    },
    {
      'image': 'assets/images/04.jpg',
      'label': '4',
    },
    {
      'image': 'assets/images/05.jpg',
      'label': '5',
    },
    {
      'image': 'assets/images/06.jpg',
      'label': '6',
    },
    {
      'image': 'assets/images/07.jpg',
      'label': '7',
    },
    {
      'image': 'assets/images/08.jpg',
      'label': '8',
    },
    {
      'image': 'assets/images/09.jpg',
      'label': '9',
    },
    {
      'image': 'assets/images/10.jpg',
      'label': '10',
    },
  ];

  final List<Map<String, String>> listItems = List.generate(
    10,
    (index) => {
      "title": "List Item $index",
      "subtitle": "This is the detail for item $index.",
    },
  );

  FullImageGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Flutter App"),
        centerTitle: true,
        elevation: 8,
        backgroundColor: Colors.teal.shade700,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Grid Section',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade800,
              ),
            ),
          ),
          Container(
            height: 270,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: gridItems.map((item) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        item['image'],
                        fit: BoxFit.cover,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.transparent, Colors.black54],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          child: Text(
                            item['label'],
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              shadows: [
                                Shadow(
                                  offset: Offset(0, 1),
                                  blurRadius: 2,
                                  color: Colors.black45,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'List Section',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade800,
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: ListView.separated(
                itemCount: listItems.length,
                separatorBuilder: (_, __) => SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final item = listItems[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                    child: ListTile(
                      contentPadding: EdgeInsets.all(12),
                      leading: CircleAvatar(
                        backgroundColor: Colors.teal.shade300,
                        child: Icon(
                          Icons.list,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        item['title']!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(item['subtitle']!),
                      trailing: Icon(Icons.arrow_forward_ios_rounded, size: 16),
                      onTap: () {},
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
