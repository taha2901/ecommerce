import 'package:addinfo/core/network/end_points.dart';
import 'package:addinfo/core/widget/colors.dart';
import 'package:addinfo/features/profile/presentation/manager/profile/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ChangePasswordScreen extends StatelessWidget {
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ProfileCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Password"),
        backgroundColor: thirdColor,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // TextField(
            //   controller: currentPasswordController,
            //   decoration: const InputDecoration(
            //     border: OutlineInputBorder(),
            //     labelText: "Current Password"
            //   ),
            // ),

            Card(
              child: ListTile(
                leading: const Icon(Iconsax.password_check),
                title: TextField(
                  controller: newPasswordController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                      hintText: "Current Password"),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Card(
              child: ListTile(
                leading: const Icon(Iconsax.password_check),
                title: TextField(
                  controller: currentPasswordController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                      hintText: "New Password"),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            BlocConsumer<ProfileCubit, ProfileState>(
                listener: (context, state) {
              if (state is ChangePassSuccess) {
                showSnackBarItem(
                    context, "Password Updated Successfully", true);
                Navigator.pop(context);
              }
              if (state is ChangePassFailure) {
                showSnackBarItem(context, state.errMessage, false);
              }
            }, builder: (context, state) {
              return MaterialButton(
                onPressed: () {
                  debugPrint(
                      "From TextField : ${currentPasswordController.text} , current : $currentPassword");
                  if (currentPasswordController.text == currentPassword) {
                    if (newPasswordController.text.length >= 6) {
                      cubit.changePasswordMethod(
                          userCurrentPassword: currentPassword!,
                          newPassword: newPasswordController.text.trim());
                    } else {
                      showSnackBarItem(context,
                          "Password must be at least 6 characters", false);
                    }
                  } else {
                    showSnackBarItem(
                        context,
                        "please, verify current password, try again later",
                        false);
                  }
                },
                color: kPrimaryColor,
                height: MediaQuery.of(context).size.height*0.07,
                minWidth: double.infinity,
                
                textColor: Colors.black,
                child:
                    Text(state is ChangePassLoaded ? "Loading..." : "Update"),
              );
            })
          ],
        ),
      ),
    );
  }

  void showSnackBarItem(
      BuildContext context, String message, bool forSuccessOrFailure) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: forSuccessOrFailure ? Colors.green : Colors.red,
    ));
  }
}
