import 'package:flutter/material.dart';
import 'package:nti_ecommerce_team4/core/theme/themes.dart';

import '../widgets/product_card.dart';
import '../widgets/qunatity_section_with_label.dart';
import '../widgets/specification_row.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // Header
          SliverAppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {},
            ),
            centerTitle: true,
            title: Text(
              'Aurea',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: const Color(0xFFD4AF37),
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.bookmark_outline, color: Colors.black),
                onPressed: () {},
              ),
            ],
          ),

          // Product Image
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              height: 320,
              color: Colors.grey[200],
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Placeholder for image
                  Container(
                    color: AppColors.lightText.withOpacity(0.1),
                  ),
                  // Dotted lines for product center
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 2,
                        height: 80,
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Colors.blue.withOpacity(0.3),
                              width: 2,
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Product Info Section (card overlapping image)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Transform.translate(
                offset: const Offset(0, -40),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 12,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // carousel pill
                      Center(
                        child: Container(
                          width: 40,
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Product Name and Wishlist (with circular heart)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ethereal Diamond\nNecklace',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                    height: 1.25,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  'عقد الألماس الأثيري',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.lightText,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(22),
                              border: Border.all(color: Colors.grey[300]!),
                              boxShadow: [
                                BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0,2)),
                              ],
                            ),
                            child: IconButton(
                              icon: Icon(Icons.favorite_border, color: Colors.grey[700]),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      // Rating and Reviews
                      Row(
                        children: [
                          Row(
                            children: List.generate(
                              5,
                              (index) => Icon(
                                Icons.star,
                                color: index < 4 ? Colors.orange : Colors.grey[300],
                                size: 14,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '4.9',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '120 reviews',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Price
                      Row(
                        children: [
                          Text(
                            '\$4,500',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: AppColors.gold,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            '\$5,200',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[500],
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF6F6F6),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              'Save 15%',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: AppColors.lightText,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 18),

                      // Description Section
                      Text(
                        'DESCRIPTION',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Handcrafted with meticulous precision, the Ethereal Diamond Necklace showcases a breathtaking central diamond suspended in a halo of ethically sourced gemstones, exuding timeless grace and modern luxury.',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[700],
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'تم تصنيع هذا القلادة بدقة فائقة من الذهب الخالص مع ماسة مركزية محاطة بحجر كريم أخلاقي المصدر، مما يضفي عليها جمالاً خالداً وفخامة حديثة.',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[600],
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Specifications Section
                      Text(
                        'SPECIFICATIONS',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SpecificationRow(label: 'MATERIAL', value: '18K Solid Gold'),
                      SpecificationRow(label: 'WEIGHT', value: '4.2g'),
                      SpecificationRow(label: 'SKU', value: 'AU-882'),
                      SpecificationRow(
                        label: 'AVAILABILITY',
                        value: 'In Stock',
                        valueColor: Colors.green,
                      ),
                      const SizedBox(height: 18),

                      // Quantity Section
                      QuantitySectionWithLabel(),
                      const SizedBox(height: 18),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'COMPLETE THE SET',
                            style: TextStyle(
                              color:AppColors.lightText,
                              letterSpacing: 1,
                            ),
                          ),
                          Text(
                            'View All',
                            style: TextStyle(
                              color: AppColors.gold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      Row(
                        children: [
                          Expanded(
                            child: ProductCard(
                              title: 'BAGUETTE RING',
                              price: '\$1,250',
                              imageColor: Colors.amber[100],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ProductCard(
                              title: 'TEARDROP STUDS',
                              price: '\$2,300',
                              imageColor: Colors.grey[300],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),

                      // Action Buttons (Buy Now + Add to Cart)
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 52,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.gold,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'BUY NOW',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: SizedBox(
                              height: 52,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: AppColors.gold),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.shopping_cart_outlined, color: AppColors.gold),
                                    const SizedBox(width: 8),
                                    Text(
                                      'ADD TO CART',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.gold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

