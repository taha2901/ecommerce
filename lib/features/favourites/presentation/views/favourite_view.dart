import 'package:addinfo/core/widget/colors.dart';
import 'package:addinfo/features/favourites/presentation/manager/cubit/favourite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Favourite extends StatelessWidget {
  const Favourite({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavouriteCubit, FavouriteState>(
      listener: (context, state) {
        if (state is FavLoadState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Loading...')),
          );
        }
        if (state is FavErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Something went wrong'),
              backgroundColor: Colors.red,
            ),
          );
        }
        if (state is AddOrRemoveFromFavoritesSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Operation successful')),
          );
        }
      },
      builder: (context, state) {
        final cubitFav = FavouriteCubit.get(context).favoritemodel;

        if (state is FavLoadState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FavSuccesState ||
            state is AddOrRemoveFromFavoritesSuccessState) {
          var cubitFav = FavouriteCubit.get(context).favoritemodel;
          return Scaffold(
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 12.5),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 7.5, horizontal: 12),
                      prefixIcon: const Icon(Icons.search),
                      hintText: "Search",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: cubitFav!.data?.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        final favtItem = cubitFav.data!.data![index];
                        final product = favtItem.product;
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            // color: thirdColor,
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 7,
                              ),
                              Image.network(
                                product?.image ?? '',
                                width: 100,
                                height: 100,
                                fit: BoxFit.fill,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.error),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      product?.name ?? ' ',
                                      maxLines: 1,
                                      style: const TextStyle(
                                        fontSize: 16.5,
                                        fontWeight: FontWeight.bold,
                                        // color: mainColor,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${product?.price} \$',
                                          style: TextStyle(
                                            // color: Theme.of(context)
                                            //     .colorScheme
                                            //     .background,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '${product?.oldPrice} \$',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            // color: Theme.of(context)
                                            //     .colorScheme
                                            //     .background,
                                            decoration:
                                                TextDecoration.lineThrough,
                                                // backgroundColor: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    MaterialButton(
                                      onPressed: () {
                                        FavouriteCubit.get(context)
                                            .addOrRemoveFromFavorites(
                                          productID: product!.id.toString(),
                                        );
                                      },
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      color: kPrimaryColor,
                                      child: Text(
                                        "Remove".toUpperCase(),
                                        style: const TextStyle(
                                            // color: Colors.black,
                                            ),
                                      ),
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
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
