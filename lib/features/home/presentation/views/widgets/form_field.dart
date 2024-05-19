
import 'package:addinfo/features/home/data/home/home.dart';
import 'package:addinfo/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:flutter/material.dart';

class FormFieldHome extends StatelessWidget {
  const FormFieldHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (input) {
        HomeCubit.get(context).filterProducts(input: input);
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: "Search",
        suffixIcon: const Icon(Icons.clear),
        filled: true,
        fillColor: Colors.black12.withOpacity(0.1),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: Colors.grey)),
        contentPadding: const EdgeInsets.symmetric(vertical: 17),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}