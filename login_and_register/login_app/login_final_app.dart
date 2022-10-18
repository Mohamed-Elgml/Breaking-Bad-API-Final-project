import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/Final_project_course/login_and_register/login_app/cubit_login.dart';
import 'package:untitled1/Final_project_course/login_and_register/login_app/states_login.dart';

import '../../features/characters/view.dart';
import '../register_app/register_view.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: BlocListener<LoginCubit, LoginStates>(
          listener: (context, state) {
            if (state is LoginSuccessesState) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CharacterCard(),
                ),
              );
            } else if (state is LoginErrorState) {
              print(' ERROR');
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Builder(builder: (context) {
              final cubit = BlocProvider.of<LoginCubit>(context);
              return Form(
                key: cubit.formKey,
                child: ListView(children: [
                  const Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.blue),
                    ),
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onSaved: (v) => cubit.email = v,
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        counterStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return 'Email can not empty';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PasswordField(
                      color: Colors.blue,
                      passwordConstraint: r'.*[@$#.*].*',
                      inputDecoration: PasswordDecoration(),
                      hintText: 'Password',
                      border: PasswordBorder(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue.shade100,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue.shade100,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              BorderSide(width: 2, color: Colors.red.shade200),
                        ),
                      ),
                      errorMessage:
                          'must contain special character either \n. * @ # \$',
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '     Don\`t have account',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterView(),
                            ),
                          );
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.red[900]),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<LoginCubit, LoginStates>(
                    builder: (context, state) {
                      if (state is LoginLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ElevatedButton(
                        onPressed: () => cubit.login(),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                ]),
              );
            }),
          ),
        ),
      ),
    );
  }
}
