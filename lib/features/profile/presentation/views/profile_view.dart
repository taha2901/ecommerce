import 'package:addinfo/core/widget/colors.dart';
import 'package:addinfo/features/profile/presentation/manager/profile/profile_cubit.dart';
import 'package:addinfo/features/profile/presentation/views/widgets/change_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  width: double.infinity,
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(ProfileCubit.get(context).profileModel!.data!.image!),
                        radius: 45,
                      ),
                      const SizedBox(height: 15),
                      Text(ProfileCubit.get(context).profileModel!.data!.name!),
                      const SizedBox(height: 10),
                      Text(ProfileCubit.get(context).profileModel!.data!.email!),
                      const SizedBox(height: 15),
                      MaterialButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePasswordScreen()));
                        },
                        color: mainColor,
                        textColor: Colors.white,
                        child: const Text("Change Password"),
                      ),
                      const SizedBox(height: 15),
                      MaterialButton(
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateUserDataScreen()));
                        },
                        color: mainColor,
                        textColor: Colors.white,
                        child: const Text("Update Data"),
                      ),
                    ],
                  ),
                )
              : const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
