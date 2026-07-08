import 'package:flutter/material.dart';
import 'package:nti_ecommerce_team4/features/cart/presentation/widgets/order_summary.dart';
import 'package:nti_ecommerce_team4/features/cart/presentation/widgets/product_itme.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "AUREA",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            fontFamily: "playfairdisplay",
          ),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.shopping_bag),
          ),
        ],
        leading: const Padding(
          padding: EdgeInsets.only(left: 12),
          child: Icon(Icons.menu),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Column(
            children: const [
              Text(
                "YOUR SHOPPING BAG",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 8),
            ],
          ),
          const SizedBox(height: 16),

          const ProductItem(
            imageUrl: "assets/images/cart_image1.png",
            title: "Ethereal Diamond Necklace",
            subtitle: "18K Yellow Gold / 0.5CT Pear Cut",
            price: "€2,430",
          ),

          const ProductItem(
            title: "Celestial Emerald Ring",
            subtitle: "18K Rose Gold / 1.2CT Emerald",
            price: "€3,100",
            imageUrl: "assets/images/cart_image2.png",
          ),
          const ProductItem(
            title: "Luminous Pearl Drops",
            subtitle: "18K Yellow Gold / AAA Pearls",
            price: "€1,850",
            imageUrl: "assets/images/cart_image3.png",
          ),

          const SizedBox(height: 20),

          const OrderSummary(),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
