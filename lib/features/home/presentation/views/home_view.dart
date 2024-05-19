import 'package:addinfo/features/categories/presentation/manager/cubit/category_cubit.dart';
import 'package:addinfo/features/favourites/presentation/manager/cubit/favourite_cubit.dart';
import 'package:addinfo/features/home/data/home/product.dart';
import 'package:addinfo/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:addinfo/features/home/presentation/views/widgets/form_field.dart';
import 'package:addinfo/features/home/presentation/views/widgets/load_indicator.dart';
import 'package:addinfo/features/home/presentation/views/widgets/page_view_home.dart';
import 'package:addinfo/features/home/presentation/views/widgets/row_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeView extends StatelessWidget {
  var pageController = PageController();
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // var cubit = FavouriteCubit.get(context);
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(12),
            child: ListView(
              shrinkWrap: true,
              children: [
                const FormFieldHome(),
                const SizedBox(
                  height: 15,
                ),
                HomeCubit.get(context).banners?.data?.isEmpty ?? true
                    ? const LoadingIndicator()
                    : PageViewInHome(pageController: pageController),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                    axisDirection: Axis.horizontal,
                    effect: const SlideEffect(
                        spacing: 8.0,
                        radius: 25,
                        dotWidth: 16,
                        dotHeight: 16.0,
                        paintStyle: PaintingStyle.stroke,
                        strokeWidth: 1.5,
                        dotColor: Colors.grey,
                        activeDotColor: Color.fromARGB(255, 37, 42, 68)),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const RowToView(
                  text: "Categories",
                ),
                const SizedBox(
                  height: 15,
                ),
                CategoryCubit.get(context).category?.data?.data?.isEmpty ?? true
                    ? const LoadingIndicator()
                    : SizedBox(
                        height: 70,
                        width: double.infinity,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemCount: CategoryCubit.get(context)
                                  .category
                                  ?.data
                                  ?.data
                                  ?.length ??
                              0,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              width: 15,
                            );
                          },
                          itemBuilder: (context, index) {
                            return CircleAvatar(
                              radius: 35,
                              backgroundImage: NetworkImage(
                                  '${CategoryCubit.get(context).category?.data?.data![index].image}'),
                            );
                          },
                        ),
                      ),
                const SizedBox(
                  height: 15,
                ),
                const RowToView(
                  text: "Products",
                ),
                const SizedBox(
                  height: 15,
                ),
                HomeCubit.get(context).home?.data?.products?.isEmpty ?? true
                    ? const LoadingIndicator()
                    : GridView.builder(
                        itemCount:
                            HomeCubit.get(context).filteredProducts.isEmpty
                                ? HomeCubit.get(context)
                                        .home!
                                        .data!
                                        .products
                                        ?.length ??
                                    0
                                : HomeCubit.get(context)
                                    .filteredProducts
                                    .length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 12,
                                crossAxisSpacing: 15,
                                childAspectRatio: 0.7),
                        itemBuilder: (context, index) {
                          final product = HomeCubit.get(context)
                                  .filteredProducts
                                  .isEmpty
                              ? HomeCubit.get(context)
                                  .home!
                                  .data!
                                  .products![index]
                              : HomeCubit.get(context).filteredProducts[index];
                          return _productItem(
                            model: product,
                            context: context,
                            // cubit: cubit,
                          );
                        },
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _productItem(
    {required Product model,
    required BuildContext context,
    // required FavouriteCubit cubit,
    }) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      color: Colors.grey.withOpacity(0.2),
    ),
    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image.network(
            model.image!,
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          model.name!,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              overflow: TextOverflow.ellipsis),
        ),
        const SizedBox(
          height: 2,
        ),
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "${model.price!} \$",
                        style: const TextStyle(fontSize: 13),
                      )),
                  const SizedBox(
                    width: 5,
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "${model.oldPrice!} \$",
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12.5,
                          decoration: TextDecoration.lineThrough),
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              child: Icon(
                Icons.favorite,
                size: 20,
                color:
                //  FavouriteCubit.get(context).favoriteID.contains(model.id.toString())
                //     ? Colors.red
                //     :
                     Colors.grey,
              ),
              onTap: () {
                // Add | remove product from favorites
                // FavouriteCubit.get(context).addOrRemoveFromFavorites(productID: model.id.toString());
              },
            ),
          ],
        ),
      ],
    ),
  );
}