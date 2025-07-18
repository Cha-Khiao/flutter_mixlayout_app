import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../gallery.dart';
import '../product.dart';

class MyAppDrawer extends StatelessWidget {
  const MyAppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Center(
              child: Text(
                'เมนูหลัก',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('หน้าแรก'),
            onTap: () {
              Navigator.pop(context);
              Get.offAllNamed('/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_album),
            title: const Text('รูปภาพ'),
            onTap: () {
              Navigator.pop(context);
              Get.to(() => const GalleryPage());
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('สินค้า'),
            onTap: () {
              Navigator.pop(context);
              Get.to(() => const ProductPage());
            },
          ),
        ],
      ),
    );
  }
}
