import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oweme/core/theme.dart';
import 'package:oweme/features/auth/data/firebase_auth_repo.dart';
import 'package:oweme/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:oweme/features/auth/presentation/cubits/auth_state.dart';
import 'package:oweme/features/auth/presentation/screens/auth_page.dart';
import 'package:oweme/features/home_page.dart';

class MyApp extends StatelessWidget {
  final authRepo = FirebaseAuthRepo();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(authRepo: authRepo)..checkAuth(),
      child: MaterialApp(
        title: 'OWEME',
        debugShowCheckedModeBanner: false,
        theme: lightMode,
        home: BlocConsumer<AuthCubit, AuthState>(
          builder: (context, authState) {
            if (authState is AuthFailure) {
              return const AuthPage();
            } 
            if (authState is AuthSuccess){
              return const HomePage();
            }
            else{
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
          listener: (context, state){},
        ),
      ),
    );
  }
}
