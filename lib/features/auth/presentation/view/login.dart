import 'package:addinfo/core/helper/cach.dart';
import 'package:addinfo/core/network/end_points.dart';
import 'package:addinfo/core/widget/custom_button.dart';
import 'package:addinfo/core/widget/custom_show_toast.dart';
import 'package:addinfo/core/widget/custom_text_form_field.dart';
import 'package:addinfo/features/auth/presentation/manager/login/login_cubit.dart';
import 'package:addinfo/features/auth/presentation/manager/login/login_state.dart';
import 'package:addinfo/features/auth/presentation/view/register.dart';
import 'package:addinfo/features/layout/presentation/view/souq_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passWordController = TextEditingController();

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            if (state.loginModel.status == true) {
              ChachHelper.saveData(
                      key: 'token', value: state.loginModel.data!.token)
                  .then(
                (value) {
                  userToken = '${state.loginModel.data!.token}';
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SouqLayout(),
                    ),
                    (route) => false,
                  );
                },
              );
              showToast(
                  msg: state.loginModel.message!, state: ToastStates.SUCCESS);
            } else {
              print(state.loginModel.message);
              showToast(
                  msg: state.loginModel.message!, state: ToastStates.ERROR);
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
                      Text(
                        'Login',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              color: Colors.black,
                            ),
                      ),
                      Text('Login now to browse our hot offers',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.grey)),
                      const SizedBox(
                        height: 30.0,
                      ),
                      CustomTextField(
                        hint: 'Email Address',
                        prefixIcon: const Icon(Icons.email_outlined),
                        controller: emailController,
                        onSubmitted: (value) {
                          emailController.text = value;
                        },
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      CustomTextField(
                        hint: 'password',
                        prefixIcon: const Icon(Icons.lock_outlined),
                        obscure: LoginCubit.get(context).isObsecure,
                        onSubmitted: (value) {
                          passWordController.text = value;
                        },
                        controller: passWordController,
                        suffixIcon: LoginCubit.get(context).suffix,
                        suffixPressed: () {
                          LoginCubit.get(context).changePasswordVisibility();
                        },
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      state is LoginLoaded
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : CustomButton(
                              text: 'LOGIN',
                              color: Colors.blue,
                              textcolor: Colors.white,
                              circular: 10.0,
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  LoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passWordController.text);
                                }
                              },
                            ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Don\'t have an account?'),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return RegisterScreen();
                                  },
                                ),
                              );
                            },
                            child: const Text('Register'),
                          ),
                        ],
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
