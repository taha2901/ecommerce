// import 'package:addinfo/features/profile/presentation/manager/profile/profile_cubit.dart';
// import 'package:addinfo/features/profile/presentation/views/widgets/change_password_screen.dart';
// import 'package:addinfo/features/profile/presentation/views/widgets/update_user_data_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:iconsax_flutter/iconsax_flutter.dart';

// class Profile extends StatelessWidget {
//   const Profile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ProfileCubit, ProfileState>(
//       listener: (context, state) {
//         if (state is ProfileSuccess) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('Profile loaded successfully')),
//           );
//         } else if (state is ProfileFailure) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text(state.errMessage)),
//           );
//         }
//       },
//       builder: (context, state) {
//         final cubitChange = ProfileCubit.get(context);
//         if (state is ProfileLoaded) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//         if (cubitChange.profileModel == null) cubitChange.getUserData();
//         return Scaffold(
//           body: cubitChange.profileModel != null
//               ? Container(
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//                   width: double.infinity,
//                   child: SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         CircleAvatar(
//                           backgroundImage: NetworkImage(ProfileCubit.get(context)
//                               .profileModel!
//                               .data!
//                               .image!),
//                           radius: 45,
//                         ),
//                         const SizedBox(height: 15),
//                         // Text(ProfileCubit.get(context).profileModel!.data!.name!),
//                         // const SizedBox(height: 10),
//                         // Text(ProfileCubit.get(context).profileModel!.data!.email!),
//                         // const SizedBox(height: 15),
//                         // MaterialButton(
//                         //   onPressed: () {
//                         //     Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePasswordScreen()));
//                         //   },
//                         //   color: mainColor,
//                         //   textColor: Colors.white,
//                         //   child: const Text("Change Password"),
//                         // ),
//                         // const SizedBox(height: 15),
//                         // MaterialButton(
//                         //   onPressed: () {
//                         //     Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateUserDataScreen()));
//                         //   },
//                         //   color: mainColor,
//                         //   textColor: Colors.white,
//                         //   child: const Text("Update Data"),
//                         // ),
                    
//                         Card(
//                           child: ListTile(
//                             leading: const Icon(Iconsax.user_octagon),
//                             trailing: IconButton(
//                                 onPressed: () {}, icon: const Icon(Iconsax.edit)),
//                             title: TextField(
//                               enabled: false,
//                               decoration: InputDecoration(
//                                 labelText: ProfileCubit.get(context)
//                                     .profileModel!
//                                     .data!
//                                     .name!,
//                                 border: InputBorder.none,
//                               ),
//                             ),
//                           ),
//                         ),
                    
//                         Card(
//                           child: ListTile(
//                               leading: const Icon(Iconsax.direct),
//                               title: const Text("Email"),
//                               subtitle: Text(ProfileCubit.get(context)
//                                   .profileModel!
//                                   .data!
//                                   .email!)),
//                         ),
//                         Card(
//                           child: ListTile(
//                             leading: const Icon(Iconsax.timer_1),
//                             title: const Text("Change Password"),
//                             onTap: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           ChangePasswordScreen()));
//                             },
//                           ),
//                         ),
//                         Card(
//                           child: ListTile(
//                             leading: const Icon(Iconsax.information),
//                             trailing: IconButton(
//                                 onPressed: () {}, icon: const Icon(Iconsax.edit)),
//                             title: const Text("Update Profile"),
//                             onTap: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           UpdateUserDataScreen()));
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 )
//               : const Center(child: CircularProgressIndicator()),
//         );
//       },
//     );
//   }
// }


import 'package:addinfo/features/profile/presentation/manager/profile/profile_cubit.dart';
import 'package:addinfo/features/profile/presentation/views/widgets/change_password_screen.dart';
import 'package:addinfo/features/profile/presentation/views/widgets/update_user_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Profile loaded successfully')),
          );
        } else if (state is ProfileFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errMessage)),
          );
        }
      },
      builder: (context, state) {
        final cubitChange = ProfileCubit.get(context);
        if (state is ProfileLoaded) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (cubitChange.profileModel == null) cubitChange.getUserData();
        return Scaffold(
          body: cubitChange.profileModel != null
              ? Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // إضافة زر التبديل هنا
                        ListTile(
                          leading: const Icon(Icons.brightness_6),
                          title: const Text('Toggle Theme'),
                          onTap: () {
                            AdaptiveTheme.of(context).toggleThemeMode();
                          },
                        ),
                        const SizedBox(height: 15),
                        CircleAvatar(
                          backgroundImage: NetworkImage(ProfileCubit.get(context)
                              .profileModel!
                              .data!
                              .image!),
                          radius: 45,
                        ),
                        const SizedBox(height: 15),
                        // Text(ProfileCubit.get(context).profileModel!.data!.name!),
                        // const SizedBox(height: 10),
                        // Text(ProfileCubit.get(context).profileModel!.data!.email!),
                        // const SizedBox(height: 15),
                        // MaterialButton(
                        //   onPressed: () {
                        //     Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePasswordScreen()));
                        //   },
                        //   color: mainColor,
                        //   textColor: Colors.white,
                        //   child: const Text("Change Password"),
                        // ),
                        // const SizedBox(height: 15),
                        // MaterialButton(
                        //   onPressed: () {
                        //     Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateUserDataScreen()));
                        //   },
                        //   color: mainColor,
                        //   textColor: Colors.white,
                        //   child: const Text("Update Data"),
                        // ),
                    
                        Card(
                          child: ListTile(
                            leading: const Icon(Iconsax.user_octagon),
                            trailing: IconButton(
                                onPressed: () {}, icon: const Icon(Iconsax.edit)),
                            title: TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                labelText: ProfileCubit.get(context)
                                    .profileModel!
                                    .data!
                                    .name!,
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                    
                        Card(
                          child: ListTile(
                              leading: const Icon(Iconsax.direct),
                              title: const Text("Email"),
                              subtitle: Text(ProfileCubit.get(context)
                                  .profileModel!
                                  .data!
                                  .email!)),
                        ),
                        Card(
                          child: ListTile(
                            leading: const Icon(Iconsax.timer_1),
                            title: const Text("Change Password"),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ChangePasswordScreen()));
                            },
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: const Icon(Iconsax.information),
                            trailing: IconButton(
                                onPressed: () {}, icon: const Icon(Iconsax.edit)),
                            title: const Text("Update Profile"),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          UpdateUserDataScreen()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
