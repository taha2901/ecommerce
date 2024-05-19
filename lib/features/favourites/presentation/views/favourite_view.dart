import 'package:addinfo/features/favourites/presentation/manager/cubit/favourite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Favourite extends StatelessWidget {
  const Favourite({super.key});

  @override
  Widget build(BuildContext context) {
   
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12.5),
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
                    itemCount: 10 ,
                    //  FavouriteCubit.get(context)
                    //         .favoritemodel
                    //         ?.data
                    //         ?.data
                    //         ?.length ??
                        // 0,

                    itemBuilder: (context, index) {
                      // final product = FavouriteCubit.get(context)
                      //     .favoritemodel
                      //     ?.data
                      //     ?.data?[index]
                      //     .product;
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: const Color.fromARGB(255, 109, 124, 35)
                              .withOpacity(0.4),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Image.asset(
                              // product?.image ?? '', 
                              '',
                              width: 100,
                              height: 100,
                              fit: BoxFit.fill,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'product?.name ?? ''',
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        // '${product?.price} \$',
                                        '152'
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        // '${product?.oldPrice} \$',
                                        '129',
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
                                      // FavouriteCubit.get(context)
                                      //     .addOrRemoveFromFavorites(
                                      //   productID: FavouriteCubit.get(context).favoritemodel!.data!.data![index].id.toString(),
                                      // );
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
     
  }
}
