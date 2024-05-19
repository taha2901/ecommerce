import 'package:addinfo/features/categories/data/category/datum.dart';
import 'package:addinfo/features/categories/presentation/manager/cubit/category_cubit.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    // List<Category> categoriesData = BlocProvider.of<CategoryCubit>(context).category.data.data;
     List<CategoryData> categoriesData = CategoryCubit.get(context).category?.data?.data ?? [];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 12),
        child: GridView.builder(
          itemCount: categoriesData.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 15
            ),
            itemBuilder: (context,index){
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 4),
              child: Column(
                children:
                [
                  Expanded(
                    child: Image.network('${categoriesData[index].image}',fit: BoxFit.fill,),
                  ),
                  const SizedBox(height: 10,),
                  Text('${categoriesData[index].name}')
                ],
              ),
            );
            }
        ),
      )
    );
  }
}
