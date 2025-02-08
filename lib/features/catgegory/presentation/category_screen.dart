

import 'package:flutter/material.dart';

class FruitsVegetablesPage extends StatelessWidget {
  final List<ProductItem> products = [
    ProductItem(
      name: 'Yellaki Banana (Nallpoovan)',
      weight: '500 g',
      price: 49,
      discount: 20,
      type: 'Energy Booster',
    ),
    ProductItem(
      name: 'Nendran Banana (Pazham)',
      weight: '500 g',
      price: 60,
      discount: 25,
      type: 'Energy Booster',
    ),
    ProductItem(
      name: 'Banana (Robusta)',
      weight: '3 units',
      price: 35,
      discount: 20,
      type: 'Energy Booster',
    ),
    ProductItem(
      name: 'Brown Coconut (Nariyal)',
      weight: '1 unit',
      price: 44,
      discount: 25,
      type: 'Narikelam',
    ),
  ];

   FruitsVegetablesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Text('Vegetables & Fruits'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          _buildCategoryTabs(),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return _buildProductCard(products[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTabs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _categoryChip('All', isSelected: true),
          _categoryChip('Fresh Vegetables'),
          _categoryChip('Fresh Fruits'),
          _categoryChip('Exotics'),
          _categoryChip('Coriander & Others'),
        ],
      ),
    );
  }

  Widget _categoryChip(String label, {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Chip(
        label: Text(label),
        backgroundColor: isSelected ? Colors.green : Colors.grey[300],
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  Widget _buildProductCard(ProductItem product) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${product.weight} • ${product.type}',
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        '₹${product.price}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${product.discount}% OFF',
                        style: const TextStyle(
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('ADD'),
            style: TextButton.styleFrom(
              foregroundColor: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}

class ProductItem {
  final String name;
  final String weight;
  final int price;
  final int discount;
  final String type;

  ProductItem({
    required this.name,
    required this.weight,
    required this.price,
    required this.discount,
    required this.type,
  });
}