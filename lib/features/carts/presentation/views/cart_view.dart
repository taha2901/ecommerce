import 'package:addinfo/core/widget/colors.dart';
import 'package:addinfo/features/carts/presentation/manager/cubit/cart_cubit.dart';
import 'package:addinfo/features/favourites/presentation/manager/cubit/favourite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Carts extends StatelessWidget {
  const Carts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartsLoadState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Loading...')),
          );
        }
        if (state is CartsErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Something went wrong')),
          );
        }
      },
      builder: (context, state) {
        final cubit = CartCubit.get(context).cartModel;

        if (state is CartsLoadState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (cubit == null ||
            cubit.data == null ||
            cubit.data!.cartItems == null ||
            cubit.data!.cartItems!.isEmpty) {
          return const Center(
            child: Text('No items in the cart.'),
          );
        }

        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
            child: Column(
              children: [
                // Text('My Cart',style: Theme.of(context).textTheme.displayMedium,),
                Expanded(
                  child: ListView.separated(
                    itemCount: cubit.data!.cartItems!.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 12,
                      );
                    },
                    itemBuilder: (context, index) {
                      final cartItem = cubit.data!.cartItems![index];
                      final product = cartItem.product;

                      // استخدام BlocBuilder لضمان تحديث الواجهة عند تغيير حالة المفضلة
                      return BlocBuilder<FavouriteCubit, FavouriteState>(
                        builder: (context, favState) {
                          return Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              // color: thirdColor,
                            ),
                            child: Row(
                              children: [
                                Image.network(
                                  product!.image!,
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.fill,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(Icons.error),
                                ),
                                const SizedBox(width: 12.5),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.name!,
                                        style: const TextStyle(
                                            // color: mainColor,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Text("${product.price!} \$"),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          if (product.price != product.oldPrice)
                                            Text(
                                              "${product.oldPrice!} \$",
                                              style: const TextStyle(
                                                  decoration: TextDecoration
                                                      .lineThrough),
                                            ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          OutlinedButton(
                                            onPressed: () {
                                              FavouriteCubit.get(context)
                                                  .addOrRemoveFromFavorites(
                                                      productID: product.id
                                                          .toString());
                                            },
                                            child: Icon(
                                              Icons.favorite,
                                              // تغيير حالة الأيقونة بناءً على حالة المفضلة
                                              color: FavouriteCubit.get(context)
                                                      .favoriteID
                                                      .contains(
                                                          product.id.toString())
                                                  ? Colors.red
                                                  : Colors.grey,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              // تنفيذ منطق الحذف هنا
                                              CartCubit.get(context)
                                                  .addOrRemoveFromCarts(
                                                      id: product.id
                                                          .toString());
                                              // CartCubit.get(context).addOrRemoveFromCarts(id: product.id.toString());
                                            },
                                            child: const Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Container(
                  child: Text(
                    "TotalPrice : ${cubit.data!.total} \$",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        // color: mainColor,
                        ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
