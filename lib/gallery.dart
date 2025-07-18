import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'รูปภาพทั้งหมด',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 77, 183, 236),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                final imagePath =
                    'assets/images/${(index + 1).toString().padLeft(2, '0')}.jpg';
                return GestureDetector(
                  onTap: () {
                    Get.to(() => ImageDetailPage(imagePath: imagePath));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton.icon(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.home, color: Colors.white),
              label: const Text(
                'กลับหน้าแรก',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 77, 183, 236),
                minimumSize: const Size.fromHeight(48),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageDetailPage extends StatelessWidget {
  final String imagePath;

  const ImageDetailPage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'รายละเอียดภาพ',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 77, 183, 236),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              label: const Text('กลับไปยังรูปภาพทั้งหมด',
              style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
                backgroundColor: const Color.fromARGB(255, 77, 183, 236),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
