import 'package:addinfo/core/helper/api.dart';
import 'package:addinfo/core/helper/cach.dart';
import 'package:addinfo/core/network/end_points.dart';
import 'package:addinfo/features/auth/presentation/view/login.dart';
import 'package:addinfo/features/carts/presentation/manager/cubit/cart_cubit.dart';
import 'package:addinfo/features/categories/presentation/manager/cubit/category_cubit.dart';
import 'package:addinfo/features/favourites/presentation/manager/cubit/favourite_cubit.dart';
import 'package:addinfo/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:addinfo/features/layout/presentation/view/souq_layout.dart';
import 'package:addinfo/features/profile/presentation/manager/profile/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await ChachHelper.init();
  userToken = ChachHelper.getData(key: 'token');
  currentPassword = ChachHelper.getData(key: 'password');
  debugPrint('tokennnn in main is $userToken');
  debugPrint('password in main is $currentPassword');

  Widget widget;
  if (userToken != null) {
    widget = const SouqLayout();
  } else {
    widget = const LoginScreen();
  }
  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final String? token;
  final Widget startWidget;
  const MyApp({super.key, this.token, required this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit()
            ..getBannerData()
            ..getHomeData(),
        ),
        BlocProvider(
          create: (context) => CategoryCubit()..getCategoryData(),
        ),
        BlocProvider(
          create: (context) => FavouriteCubit()..getFavouriteData(),
        ),
        BlocProvider(
          create: (context) => CartCubit()..getCarts(),
        ),
        BlocProvider(
          create: (context) => ProfileCubit()..getUserData(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.red, brightness: Brightness.dark),
        ),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
