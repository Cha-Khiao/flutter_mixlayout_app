import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listview_app/components/drawer.dart';
import 'gallery.dart';
import 'product.dart';

void main() {
  runApp(const MyFullImageGridApp());
}

class MyFullImageGridApp extends StatelessWidget {
  const MyFullImageGridApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      home: const FullImageGridScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FullImageGridScreen extends StatefulWidget {
  const FullImageGridScreen({super.key});

  @override
  State<FullImageGridScreen> createState() => _FullImageGridScreenState();
}

class _FullImageGridScreenState extends State<FullImageGridScreen> {
  final List<Map<String, dynamic>> gridItems = const [
    {'image': 'assets/images/01.jpg', 'label': '1'},
    {'image': 'assets/images/02.jpg', 'label': '2'},
    {'image': 'assets/images/03.jpg', 'label': '3'},
    {'image': 'assets/images/04.jpg', 'label': '4'},
    {'image': 'assets/images/05.jpg', 'label': '5'},
  ];

  final List<Map<String, String>> listItems = [
    for (var i = 0; i < 10; i++)
      {"title": "รายการที่ $i", "subtitle": "ละเอียดของรายการ $i"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Flutter App",
        style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 8,
        backgroundColor: const Color.fromARGB(255, 75, 110, 205),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const MyAppDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Text(
                  'รายการรูปภาพ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade800,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Get.to(() => const GalleryPage());
                  },
                  child: Text(
                    'แสดงทั้งหมด',
                    style: TextStyle(
                      color: Colors.teal.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            height: 270,
            padding: const EdgeInsets.symmetric(horizontal: 16),
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
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.transparent, Colors.black54],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          child: Text(
                            item['label'],
                            style: const TextStyle(
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
            child: Row(
              children: [
                Text(
                  'รายการสินค้า',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade800,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Get.to(() => const ProductPage());
                  },
                  child: Text(
                    'แสดงทั้งหมด',
                    style: TextStyle(
                      color: Colors.teal.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: ListView.separated(
                itemCount: listItems.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final item = listItems[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(12),
                      leading: CircleAvatar(
                        backgroundColor: Colors.teal.shade300,
                        child: const Icon(
                          Icons.list,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        item['title']!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(item['subtitle']!),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
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
