import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_ecommerce_team4/features/cart/data/models/cart_item_model.dart';
import 'package:nti_ecommerce_team4/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:nti_ecommerce_team4/features/cart/presentation/cubits/cart_state.dart';
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
    return BlocProvider(
      create: (context) => CartCubit()..getCart(),
      child: Scaffold(
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
        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is CartLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is CartErrorState) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.cloud_off_rounded,
                        size: 64,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Could not connect to cart API",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        state.errorMessage,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.red[400],
                            ),
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton.icon(
                        onPressed: () {
                          context.read<CartCubit>().getCart();
                        },
                        icon: const Icon(Icons.refresh),
                        label: const Text("Retry Connection"),
                      ),
                    ],
                  ),
                ),
              );
            }

            List<CartItemModel> items = [];
            if (state is CartSuccessState) {
              items = state.items;
            }

            if (items.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.shopping_bag_outlined,
                      size: 72,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "YOUR SHOPPING BAG IS EMPTY",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.0,
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        context.read<CartCubit>().getCart();
                      },
                      child: const Text("Refresh Bag"),
                    ),
                  ],
                ),
              );
            }

            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const Column(
                  children: [
                    Text(
                      "YOUR SHOPPING BAG",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
                const SizedBox(height: 16),
                ...items.map((item) {
                  return ProductItem(
                    key: ValueKey(item.id),
                    title: item.name,
                    subtitle: item.description,
                    price: "€${item.price.toStringAsFixed(2)}",
                    imageUrl: item.coverPictureUrl,
                    onDelete: () {
                      context.read<CartCubit>().deleteCartItem(item.id);
                    },
                  );
                }),
                const SizedBox(height: 20),
                const OrderSummary(),
                const SizedBox(height: 16),
              ],
            );
          },
        ),
      ),
    );
  }
}
