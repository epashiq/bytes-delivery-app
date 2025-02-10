import 'package:bytes_delivery_app/features/catgegory/presentation/provider/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final ScrollController _scrollController = ScrollController();
  static const String _defaultValue = '123';

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CategoryProvider>().initialize(_defaultValue);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<CategoryProvider>().loadMore(_defaultValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Vegetables & Fruits'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implement search
            },
          ),
        ],
      ),
      body: Consumer<CategoryProvider>(
        builder: (context, provider, _) {
          if (provider.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(provider.error!),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => provider.initialize(_defaultValue),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (provider.isLoading && provider.products.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return Row(
            children: [
              // Category List
              SizedBox(
                width: 60,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: provider.categories.length,
                  itemBuilder: (context, index) {
                    final category = provider.categories[index];
                    final isSelected =
                        category.id == provider.selectedCategoryId;

                    return GestureDetector(
                      onTap: () =>
                          provider.selectCategory(_defaultValue, category.id),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 8),
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: isSelected
                                  ? Colors.green
                                  : Colors.transparent,
                              width: 3,
                            ),
                          ),
                          color:
                              isSelected ? Colors.green.withOpacity(0.1) : null,
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                category.image,
                                height: 40,
                                width: 40,
                                fit: BoxFit.cover,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  }
                                  return Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      color: Colors.white,
                                    ),
                                  );
                                },
                                errorBuilder: (_, __, ___) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              category.title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color:
                                    isSelected ? Colors.green : Colors.black54,
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Product Grid
              Expanded(
                child: GridView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: provider.products.length +
                      (provider.isLoading && provider.products.isNotEmpty
                          ? 1
                          : 0),
                  itemBuilder: (context, index) {
                    if (index == provider.products.length) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    final product = provider.products[index];
                    final bool isAvailable = product.status == true;

                    return Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: Colors.grey.shade200),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(12)),
                            child: Stack(
                              children: [
                                Image.network(
                                  product.image.first.url,
                                  height: 140,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    }
                                    return Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[100]!,
                                      child: Container(
                                        height: 140,
                                        width: double.infinity,
                                        color: Colors.white,
                                      ),
                                    );
                                  },
                                  errorBuilder: (_, __, ___) =>
                                      const Icon(Icons.error),
                                ),
                                if (!isAvailable)
                                  Container(
                                    color: Colors.black54,
                                    child: const Center(
                                      child: Text(
                                        'Out of Stock',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.title,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '500 g',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    if (product.discountPrice != null) ...[
                                      Text(
                                        '₹${product.discountPrice}',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        '₹${product.price}',
                                        style: TextStyle(
                                          fontSize: 13,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ] else
                                      Text(
                                        '₹${product.price}',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

