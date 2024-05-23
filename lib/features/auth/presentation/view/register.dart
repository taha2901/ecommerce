import 'package:addinfo/core/helper/cach.dart';
import 'package:addinfo/core/widget/colors.dart';
import 'package:addinfo/core/widget/custom_button.dart';
import 'package:addinfo/core/widget/custom_show_toast.dart';
import 'package:addinfo/core/widget/custom_text_form_field.dart';
import 'package:addinfo/core/widget/logo.dart';
import 'package:addinfo/features/auth/presentation/manager/register/register_cubit.dart';
import 'package:addinfo/features/auth/presentation/view/widgets/text_field.dart';
import 'package:addinfo/features/layout/presentation/view/souq_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  var emailController = TextEditingController();
  var passWordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            if (state.registerModel.status == true) {
              ChachHelper.saveData(
                      key: 'token', value: state.registerModel.data!.token)
                  .then((value) {
                String token = '${state.registerModel.data!.token}';
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SouqLayout(),
                  ),
                  (route) => false,
                );
              });
              print('The Token is ${state.registerModel.data!.token}');
              showToast(
                  msg: state.registerModel.message!,
                  state: ToastStates.SUCCESS);
            } else {
              print(state.registerModel.message);
              showToast(
                  msg: state.registerModel.message!, state: ToastStates.ERROR);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Logo(),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Register',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Text('Register now to browse our hot offers',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.grey)),
                      const SizedBox(
                        height: 30.0,
                      ),
                      CustomField(
                        controller: nameController,
                        lable: "Name",
                        onSubmitted: (value) {
                          emailController.text = value;
                        },
                        icon: Iconsax.user,
                        showBorder: false,
                      ),
                      CustomField(
                        controller: emailController,
                        lable: "Email",
                        icon: Iconsax.direct,
                        showBorder: false,
                      ),
                      CustomField(
                        showBorder: false,
                        obscure: RegisterCubit.get(context).isObsecure,
                        controller: passWordController,
                        lable: "Password",
                        icon: Iconsax.password_check,
                        isPass: true,
                        onSubmitted: (value) {
                          passWordController.text = value;
                        },
                        suffixIcon: RegisterCubit.get(context).suffix,
                        suffixPressed: () {
                          RegisterCubit.get(context).changePasswordVisibility();
                        },
                      ),
                      CustomField(
                        controller: phoneController,
                        onSubmitted: (value) {
                          passWordController.text = value;
                        },
                        lable: "Phone",
                        icon: Icons.phone,
                        showBorder: false,
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      state is RegisterLoaded
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : CustomButton(
                              text: 'Register'.toUpperCase(),
                              color: kPrimaryColor,
                              textcolor: Colors.black,
                              circular: 10.0,
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  RegisterCubit.get(context).userRegister(
                                      name: nameController.text,
                                      phone: phoneController.text,
                                      email: emailController.text,
                                      password: passWordController.text);
                                }
                              },
                            ),
                      const SizedBox(
                        height: 15.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
