import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  final List<Map<String, String>> products = const [
    {
      'name': 'สินค้า A',
      'description': 'รายละเอียดของสินค้า A',
      'price': '฿100',
      'image': 'assets/images/01.jpg',
    },
    {
      'name': 'สินค้า B',
      'description': 'รายละเอียดของสินค้า B',
      'price': '฿200',
      'image': 'assets/images/02.jpg',
    },
    {
      'name': 'สินค้า C',
      'description': 'รายละเอียดของสินค้า C',
      'price': '฿300',
      'image': 'assets/images/03.jpg',
    },
    {
      'name': 'สินค้า D',
      'description': 'รายละเอียดของสินค้า D',
      'price': '฿400',
      'image': 'assets/images/04.jpg',
    },
    {
      'name': 'สินค้า E',
      'description': 'รายละเอียดของสินค้า E',
      'price': '฿500',
      'image': 'assets/images/05.jpg',
    },
    {
      'name': 'สินค้า F',
      'description': 'รายละเอียดของสินค้า F',
      'price': '฿600',
      'image': 'assets/images/06.jpg',
    },
    {
      'name': 'สินค้า G',
      'description': 'รายละเอียดของสินค้า G',
      'price': '฿700',
      'image': 'assets/images/07.jpg',
    },
    {
      'name': 'สินค้า H',
      'description': 'รายละเอียดของสินค้า H',
      'price': '฿800',
      'image': 'assets/images/08.jpg',
    },
    {
      'name': 'สินค้า I',
      'description': 'รายละเอียดของสินค้า I',
      'price': '฿900',
      'image': 'assets/images/09.jpg',
    },
    {
      'name': 'สินค้า J',
      'description': 'รายละเอียดของสินค้า J',
      'price': '฿1000',
      'image': 'assets/images/10.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'สินค้าทั้งหมด',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 32, 129, 109),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 4,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        product['image']!,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      product['name']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(product['description']!),
                    trailing: Text(
                      product['price']!,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 51, 141, 198),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    onTap: () {
                      Get.to(() => ProductDetailPage(product: product));
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton.icon(
              onPressed: () {
                Get.offAllNamed('/');
              },
              icon: const Icon(Icons.home, color: Colors.white),
              label: const Text(
                'กลับหน้าแรก',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
                backgroundColor: const Color.fromARGB(255, 26, 170, 141),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final Map<String, String> product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          product['name'] ?? 'รายละเอียดสินค้า',
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 32, 129, 109),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                product['image']!,
                fit: BoxFit.cover,
                height: 250,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              product['name']!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              product['description']!,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Text(
              'ราคา: ${product['price']}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 51, 141, 198),
              ),
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              label: const Text(
                'กลับหน้าสินค้าทั้งหมด',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 32, 129, 109),
                minimumSize: const Size.fromHeight(48),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
