
import 'package:addinfo/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:flutter/material.dart';

class PageViewInHome extends StatelessWidget {
  const PageViewInHome({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      width: double.infinity,
      child: PageView.builder(
          controller: pageController,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(right: 12.5),
                child: Image.network(
                  fit: BoxFit.fill,
                  '${HomeCubit.get(context).banners!.data![index].image}',
                ),
              ),
          itemCount: 3
          // HomeCubit.get(context).banners?.data?.length ?? 0,
          ),
    );
  }
}