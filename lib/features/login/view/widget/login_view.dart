part of '../login_screen.dart';

class _LoginView extends StatelessWidget {
  const _LoginView();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        log('listen');
        if (state is LoginSuccessState) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppPages.productScreen,
            arguments: {'email': state.email, 'password': state.password},
            (route) => false,
          );
        } else if (state is LoginErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.errorMessage,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        log('Build');
        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SingleChildScrollView(
              child: Form(
                key: context.read<LoginCubit>().formKey,
                child: Column(
                  children: [
                    SizedBox(height: 70),
                    CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                        'https://cdn-icons-png.flaticon.com/512/9118/9118813.png',
                      ),
                    ),
                    SizedBox(height: 30),
                    MainTextField(
                      prefixIcon: Icon(
                        Icons.email,
                        size: 30,
                        color: Colors.grey,
                      ),
                      controller: context.read<LoginCubit>().emailController,
                      validator: (email) {
                        if (email?.isEmpty ?? true) {
                          return 'Email is required.';
                        }
                        if (!AppRegex.emailRegex.hasMatch(email!)) {
                          return 'Invalid email. Hint: email@example.com';
                        }
                        return null;
                      },
                      labelText: 'Email',
                    ),
                    SizedBox(height: 30),
                    MainTextField(
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 30,
                        color: Colors.grey,
                      ),
                      obscureText: true,
                      controller: context.read<LoginCubit>().passwordController,
                      validator: (password) {
                        if (password?.isEmpty ?? true) {
                          return 'Password is required.';
                        }
                        // else if (!password!.contains(AppRegex.passwordRegex)) {
                        //   return 'Password must be at least 8 characters, with uppercase, lowercase, number, and symbol.';
                        // }
                        return null;
                      },
                      labelText: 'Password',
                    ),
                    SizedBox(height: 50),
                    ElevatedButton(
                      onPressed: context.read<LoginCubit>().login,
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(200, 60),
                        backgroundColor: Colors.blueGrey,
                      ),
                      child: state is LoginLoadingState
                          ? Center(
                              child: SizedBox(
                                height: 30,
                                width: 30,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.5,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
