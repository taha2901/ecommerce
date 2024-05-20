import 'package:addinfo/core/widget/colors.dart';
import 'package:addinfo/features/profile/presentation/manager/profile/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class UpdateUserDataScreen extends StatelessWidget {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
   UpdateUserDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ProfileCubit>(context);
    nameController.text = '${cubit.profileModel?.data?.name}';
    phoneController.text ='${cubit.profileModel?.data?.phone}';
    emailController.text = '${cubit.profileModel?.data?.email}';
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Data"),
        backgroundColor: thirdColor,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children:
          [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "User Name"
              ),
            ),
            const SizedBox(height: 15,),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Phone"
              ),
            ),
            const SizedBox(height: 15,),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email"
              ),
            ),
            const SizedBox(height: 20,),
            BlocConsumer<ProfileCubit,ProfileState>(
              listener: (context,state)
              {
                if( state is UpdateUserLoaded )
                  {
                    showSnackBarItem(context, "Data Updated Successfully", true);
                    Navigator.pop(context);
                  }
                if( state is UpdateUserFailure )
                  {
                    showSnackBarItem(context, state.errMessage, false);
                  }
              },
              builder: (context,state)
              {
                return MaterialButton(
                  onPressed: ()
                  {
                    if( nameController.text.isNotEmpty && phoneController.text.isNotEmpty && emailController.text.isNotEmpty )
                    {
                      cubit.updateUserData(name: nameController.text, phone: phoneController.text, email: emailController.text);
                    }
                    else
                    {
                      showSnackBarItem(context, 'Please, Enter all Data !!', false);
                    }
                  },
                  color: mainColor,
                  textColor: Colors.white,
                  child: Text(state is UpdateUserLoaded ? "Loading..." : "Update"),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  void showSnackBarItem(BuildContext context,String message,bool forSuccessOrFailure){
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(message),backgroundColor: forSuccessOrFailure ? Colors.green : Colors.red,));
  }

}

