import 'package:addinfo/core/widget/custom_button.dart';
import 'package:addinfo/features/carts/presentation/manager/cubit/cart_cubit.dart';
import 'package:addinfo/features/favourites/data/add_or_remove_favourite_model/product.dart';
import 'package:addinfo/features/home/data/home/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavItemDetails extends StatelessWidget {
  final ProductHome product;

  FavItemDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Image.network(
                '${product.image}',
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 3,
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name',
                        style: Theme.of(context).textTheme.displaySmall),
                    Text(
                      product.name.toString(),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text('Description',
                        style: Theme.of(context).textTheme.displaySmall),
                    Text(
                      product.description.toString(),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        const Text(
                          'total price',
                          style: TextStyle( fontSize: 12),
                        ),
                        Text(
                          '\$${product.price}',
                          style: const TextStyle(
                              // color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 44,
                    ),
                    Expanded(
                      child: CustomButton(
                        icon: Icons.arrow_circle_right_rounded,
                        onTap: () {
                          CartCubit.get(context)
                              .addOrRemoveFromCarts(id: product.id.toString());
                        },
                        text: 'Add To Cart',
                        color: Theme.of(context).colorScheme.onBackground,
                        circular: 5,
                        textcolor: Theme.of(context).colorScheme.background,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
