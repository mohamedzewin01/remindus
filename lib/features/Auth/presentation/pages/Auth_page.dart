import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:remindus/assets_manager.dart';
import 'package:remindus/core/functions/auth_function.dart';
import 'package:remindus/core/resources/routes_manager.dart';
import 'package:remindus/core/widgets/custom_text_form.dart';
import 'package:remindus/l10n/app_localizations.dart';

import '../../../../core/di/di.dart';
import '../bloc/Auth_cubit.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late AuthCubit viewModel;

  @override
  void initState() {
    viewModel = getIt.get<AuthCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: viewModel,
      child: Scaffold(body: LoginPage(viewModel: viewModel)),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.viewModel});

  final AuthCubit viewModel;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoginTabSelected = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoginSuccess) {
          Navigator.pushReplacementNamed(context, RoutesManager.layoutScreen);
        }
        if (state is AuthLoginFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.exception.toString())));
        }
        if (state is AuthLoginLoading) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Row(
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(width: 10),
                    Text(AppLocalizations.of(context)!.loading),
                  ],
                ),
              );
            },
          );
        }
        if (state is AuthSingUpSuccess) {
          Navigator.pushReplacementNamed(context, RoutesManager.layoutScreen);
        }
        if (state is AuthSingUpFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.exception.toString())));
        }
        if (state is AuthSingUpLoading) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Row(
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(width: 10),
                    Text(AppLocalizations.of(context)!.loading),
                  ],
                ),
              );
            },
          );
        }
      },
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 40.0),
            child: Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context)!.appName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      AppLocalizations.of(context)!.loginToContinue,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                    SizedBox(height: 30),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200]?.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          _buildTabOption(
                            AppLocalizations.of(context)!.login,
                            true,
                          ),
                          _buildTabOption(
                            AppLocalizations.of(context)!.register,
                            false,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25),
                    _isLoginTabSelected == false
                        ? CustomTextForm(
                            title: AppLocalizations.of(context)!.username,
                            usernameController: _usernameController,
                            hintText: 'jonea',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppLocalizations.of(
                                  context,
                                )!.pleaseEnterYourUsername;
                              }
                              return null;
                            },
                            textInputType: TextInputType.name,
                          )
                        : SizedBox(height: 31),
                    CustomTextForm(
                      title: AppLocalizations.of(context)!.email,
                      usernameController: _emailController,
                      hintText: 'm@example.com',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(
                            context,
                          )!.pleaseEnterYourEmail;
                        }
                        if (!value.contains('@')) {
                          return AppLocalizations.of(
                            context,
                          )!.pleaseEnterAValidEmail;
                        }
                        return null;
                      },
                      textInputType: TextInputType.emailAddress,
                    ),
                    CustomTextForm(
                      title: AppLocalizations.of(context)!.password,
                      usernameController: _passwordController,
                      hintText: AppLocalizations.of(context)!.enterYourPassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(
                            context,
                          )!.pleaseEnterYourPassword;
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                      textInputType: TextInputType.visiblePassword,
                    ),
                    _isLoginTabSelected == true
                        ? Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                AuthFunctions.resetPassword(
                                  context,
                                  'mohammedzewin01@gmai.com',
                                );
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              child: Text(
                                AppLocalizations.of(context)!.forgotPassword,
                              ),
                            ),
                          )
                        : SizedBox(),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _singUp,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF2A2A2A),
                        // Dark button
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 3,
                      ),
                      child: Text(
                        _isLoginTabSelected == false
                            ? AppLocalizations.of(context)!.register
                            : AppLocalizations.of(context)!.login,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    Row(
                      children: <Widget>[
                        Expanded(child: Divider(color: Colors.grey[350])),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            AppLocalizations.of(context)!.orContinueWith,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(child: Divider(color: Colors.grey[350])),
                      ],
                    ),
                    SizedBox(height: 25),

                    // Social Login Buttons
                    Row(
                      children: [
                        Expanded(
                          child: _socialButton(
                            Assets.googleSvg, // Replace with your asset path
                            AppLocalizations.of(context)!.google,
                            () {
                              widget.viewModel.signInWithGoogle();
                            },
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: _socialButton(
                            Assets.facebookSvg, // Replace with your asset path
                            AppLocalizations.of(context)!.facebook,
                            () {
                            widget.viewModel.signInWithGithub();
                            },
                            isGithub: true,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                          height: 1.5,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                '${AppLocalizations.of(context)!.byContinuingYouAgreeToOur}\n',
                          ),
                          TextSpan(
                            text: AppLocalizations.of(context)!.termsOfService,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // TODO: Navigate to Terms of Service
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      AppLocalizations.of(
                                        context,
                                      )!.termsOfServiceClicked,
                                    ),
                                  ),
                                );
                              },
                          ),
                          TextSpan(text: AppLocalizations.of(context)!.and),
                          TextSpan(
                            text: AppLocalizations.of(context)!.privacyPolicy,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // TODO: Navigate to Privacy Policy
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      AppLocalizations.of(
                                        context,
                                      )!.privacyPolicyClicked,
                                    ),
                                  ),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

 void _singUp()  {
      if (_formKey.currentState!.validate()) {
        _isLoginTabSelected == true
            ? widget.viewModel.signIn(
          email: _emailController.text,
          password: _passwordController.text,
        )
            : widget.viewModel.signUp(
          password: _passwordController.text,
          email: _emailController.text,
          userName: _usernameController.text,
        );
      }

  }

  Widget _buildTabOption(String title, bool isLogin) {
    bool isSelected =
        (_isLoginTabSelected && isLogin) || (!_isLoginTabSelected && !isLogin);
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isLoginTabSelected = isLogin;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ]
                : [],
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Colors.black87 : Colors.grey[700],
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }

  Widget _socialButton(
    String assetPath,
    String label,
    VoidCallback onPressed, {
    bool isGithub = false,
  }) {
    return OutlinedButton.icon(
      icon: SvgPicture.asset(assetPath, height: 20),

      label: Text(
        label,
        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w500),
      ),
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        side: BorderSide(color: Colors.grey[300]!),
        elevation: 1,
      ),
    );
  }
}


