import 'package:addinfo/features/favourites/presentation/manager/cubit/favourite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Favourite extends StatelessWidget {
  const Favourite({super.key});

  @override
  Widget build(BuildContext context) {
    var cubitFav = FavouriteCubit.get(context).favoritemodel;
    // return BlocConsumer<FavouriteCubit, FavouriteState>(
    //   listener: (context, state) {},
    //   builder: (context, state) {
    //     return Scaffold(
    //       body: Padding(
    //         padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12.5),
    //         child: Column(
    //           children: [
    //             TextFormField(
    //               decoration: InputDecoration(
    //                 contentPadding: const EdgeInsets.symmetric(
    //                     vertical: 7.5, horizontal: 12),
    //                 prefixIcon: const Icon(Icons.search),
    //                 hintText: "Search",
    //                 border: OutlineInputBorder(
    //                   borderRadius: BorderRadius.circular(50),
    //                 ),
    //               ),
    //             ),
    //             const SizedBox(
    //               height: 5,
    //             ),
    //             Expanded(
    //               child: ListView.builder(
    //                 itemCount: cubitFav?.data?.data?.length ?? 0,
    //                 itemBuilder: (context, index) {
    //                   final product = cubitFav?.data?.data?[index].product;
    //                   return Container(
    //                     decoration: BoxDecoration(
    //                       borderRadius: BorderRadius.circular(4),
    //                       color: const Color.fromARGB(255, 109, 124, 35)
    //                           .withOpacity(0.4),
    //                     ),
    //                     margin: const EdgeInsets.symmetric(vertical: 10),
    //                     child: Row(
    //                       children: [
    //                         Image.asset(
    //                           product?.image ?? '',
    //                           width: 100,
    //                           height: 100,
    //                           fit: BoxFit.fill,
    //                         ),
    //                         const SizedBox(
    //                           width: 15,
    //                         ),
    //                         Expanded(
    //                           child: Column(
    //                             crossAxisAlignment: CrossAxisAlignment.center,
    //                             children: [
    //                               Text(
    //                                 product?.name ?? ' ',
    //                                 maxLines: 1,
    //                                 style: const TextStyle(
    //                                   fontSize: 16.5,
    //                                   fontWeight: FontWeight.bold,
    //                                   color: Colors.blue,
    //                                   overflow: TextOverflow.ellipsis,
    //                                 ),
    //                               ),
    //                               const SizedBox(
    //                                 height: 7,
    //                               ),
    //                               Row(
    //                                 mainAxisAlignment: MainAxisAlignment.center,
    //                                 children: [
    //                                   Text(
    //                                     '${product?.price} \$',
    //                                   ),
    //                                   const SizedBox(
    //                                     width: 5,
    //                                   ),
    //                                   Text(
    //                                     '${product?.oldPrice} \$',
    //                                     style: const TextStyle(
    //                                       color: Colors.grey,
    //                                       decoration:
    //                                           TextDecoration.lineThrough,
    //                                     ),
    //                                   ),
    //                                 ],
    //                               ),
    //                               const SizedBox(
    //                                 height: 5,
    //                               ),
    //                               MaterialButton(
    //                                 onPressed: () {
    //                                   FavouriteCubit.get(context)
    //                                       .addOrRemoveFromFavorites(
    //                                     productID: FavouriteCubit.get(context).favoritemodel!.data!.data![index].id.toString(),
    //                                   );
    //                                 },
    //                                 textColor: Colors.white,
    //                                 shape: RoundedRectangleBorder(
    //                                   borderRadius: BorderRadius.circular(25),
    //                                 ),
    //                                 color: Colors.blue,
    //                                 child: const Text("Remove"),
    //                               ),
    //                             ],
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   );
    //                 },
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     );
    //   },
    // );

    return BlocConsumer<FavouriteCubit, FavouriteState>(
      listener: (context, state) {
        if (state is AddOrRemoveFromFavoritesErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Something went wrong'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is FavLoadState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FavSuccesState) {
          var cubitFav = state.fav;
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
                      itemCount: cubitFav.data?.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        final product = cubitFav.data?.data?[index].product;
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: const Color.fromARGB(255, 109, 124, 35)
                                .withOpacity(0.4),
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
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
                                        color: Colors.blue,
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
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '${product?.oldPrice} \$',
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            decoration:
                                                TextDecoration.lineThrough,
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
                                          productID: cubitFav
                                              .data!.data![index].id
                                              .toString(),
                                        );
                                      },
                                      textColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      color: Colors.blue,
                                      child: const Text("Remove"),
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
        } else if (state is FavErrorState) {
          return const Center(child: Text('Something went wrong'));
        } else {
          return const Center(child: Text('Something went wrong'));
        }
      },
    );
  }
}
