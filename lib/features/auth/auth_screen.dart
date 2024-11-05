import 'package:flutter/material.dart';

import '../../_helpers/debug.dart';
import '../../_helpers/forms/form_validation_helper.dart';
import '../../_helpers/navigation.dart';
import '../../_theme/helpers.dart';
import '../../_theme/spacing.dart';
import '../../_theme/variables.dart';
import '../../_widgets/buttons/button.dart';
import '../../_widgets/forms/auth_input.dart';
import '../../_widgets/others/blur.dart';
import '../../_widgets/others/icons.dart';
import '../../_widgets/others/loader.dart';
import '../../_widgets/others/text.dart';
import '../../_widgets/others/toast.dart';
import '_helpers/email_signin.dart';
import '_helpers/email_signup.dart';
import '_helpers/reset_password.dart';
import 'button.dart';
import 'intro.dart';
import 'var/var.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<AuthScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();

  bool isSignIn = true;
  bool isNewAccount = false;
  bool isResetPassword = false;
  bool isBusy = false;
  bool isSuccessful = false;

  bool showDemo = true;
  bool isBusyDemo = false;

  @override
  Widget build(BuildContext context) {
    changeStatusAndNavigationBarColor(getThemeType());

    return Scaffold(
      body: Stack(
        children: [
          //
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Container(
                margin: padL(),
                constraints: BoxConstraints(maxWidth: 400),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(borderRadiusSmall)),
                child: Blur(
                  blur: 200,
                  radius: borderRadiusSmall,
                  child: AppButton(
                    radius: borderRadiusSmall,
                    color: styler.appColor(1),
                    padding: padM(),
                    child: Form(
                      key: authFormKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          //
                          AuthIntro(),
                          //
                          Padding(
                            padding: padS('lrb'),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                //
                                if (!isNewAccount && !isResetPassword)
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      //
                                      SignInButton(
                                        onPressed: () => showToast(1, 'Not available at the moment.', smallTopMargin: true),
                                        imagePath: 'google.png',
                                        label: 'Continue with Google',
                                      ),
                                      if (showDemo) ph(6),
                                      if (showDemo)
                                        SignInButton(
                                          onPressed: () async {
                                            setState(() => isBusyDemo = true);
                                            await signInUsingEmailPassword(
                                                email: 'duncanmwanik@gmail.com', password: '12345678', validate: false);
                                            setState(() => isBusyDemo = false);
                                          },
                                          isBusy: isBusyDemo,
                                          label: 'Try the Demo',
                                        ),
                                      //
                                      ph(9),
                                      AppText(text: 'OR', size: small, extraFaded: true),
                                      ph(9),
                                      //
                                    ],
                                  ),
                                //
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    //
                                    FormInput(
                                      hintText: 'Email',
                                      controller: emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (value) => Validator.validateEmail(email: value!),
                                      isBusy: isBusy,
                                    ),
                                    //
                                    if (isNewAccount) ph(6),
                                    if (isNewAccount)
                                      FormInput(
                                        hintText: 'Username',
                                        controller: userNameController,
                                        keyboardType: TextInputType.name,
                                        validator: (value) => Validator.validateName(name: value!),
                                      ),
                                    //
                                    if (!isResetPassword) ph(6),
                                    if (!isResetPassword)
                                      FormInput(
                                        hintText: 'Password',
                                        controller: passwordController,
                                        keyboardType: TextInputType.visiblePassword,
                                        textInputAction: isSignIn ? TextInputAction.done : TextInputAction.next,
                                        validator: (value) => Validator.validatePassword(password: value!),
                                      ),
                                    //
                                    if (isNewAccount) ph(6),
                                    if (isNewAccount)
                                      FormInput(
                                        hintText: 'Confirm Password',
                                        controller: confirmPasswordController,
                                        keyboardType: TextInputType.visiblePassword,
                                        textInputAction: TextInputAction.done,
                                        validator: (value) => Validator.validatePassword(password: value!),
                                      ),
                                    // action button
                                    ph(6),
                                    AppButton(
                                      onPressed: isBusy || isSuccessful
                                          ? null
                                          : () async {
                                              hideKeyboard();
                                              //
                                              if (isNewAccount && !isBusy) {
                                                setState(() => isBusy = true);
                                                show('Creating new account......');
                                                await signUpUsingEmailPassword(
                                                  name: userNameController.text.trim(),
                                                  email: emailController.text.trim(),
                                                  password: passwordController.text.trim(),
                                                  confirmPassword: confirmPasswordController.text.trim(),
                                                ).then((sucess) => setState(() => isSuccessful = sucess));
                                                setState(() => isBusy = false);
                                              }
                                              //
                                              if (isSignIn && !isBusy) {
                                                setState(() => isBusy = true);
                                                show('Signing in......');
                                                await signInUsingEmailPassword(
                                                  email: emailController.text.trim(),
                                                  password: passwordController.text.trim(),
                                                ).then((sucess) => setState(() => isSuccessful = sucess));
                                                setState(() => isBusy = false);
                                              }
                                              //
                                              if (isResetPassword && !isBusy) {
                                                setState(() => isBusy = true);
                                                show('Resetting password......');
                                                await resetPassword(email: emailController.text.trim())
                                                    .then((sucess) => setState(() => isSuccessful = sucess));
                                                setState(() => isBusy = false);
                                              }
                                            },
                                      height: 30,
                                      hoverColor: isBusy ? transparent : null,
                                      child: Center(
                                        child: isBusy
                                            ? AppLoader(color: styler.accentColor())
                                            : isSuccessful
                                                ? AppIcon(Icons.check_circle, color: Colors.green)
                                                : Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Flexible(
                                                        child: AppText(
                                                          text: isNewAccount
                                                              ? 'Create Account'
                                                              : isResetPassword
                                                                  ? 'Send Reset Link'
                                                                  : isSignIn
                                                                      ? 'Sign In'
                                                                      : 'Continue',
                                                        ),
                                                      ),
                                                      spw(),
                                                      AppIcon(Icons.arrow_forward, size: medium),
                                                    ],
                                                  ),
                                      ),
                                    ),
                                    //
                                    if (isSignIn) msph(),
                                    if (isSignIn)
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          // forgot password
                                          if (isSignIn)
                                            AppButton(
                                              onPressed: () {
                                                setState(() {
                                                  isResetPassword = true;
                                                  isSignIn = false;
                                                });
                                              },
                                              noStyling: true,
                                              child:
                                                  AppText(text: 'Forgot password?', weight: isDark() ? FontWeight.w400 : null, faded: true),
                                            ),
                                          //
                                          if (isSignIn)
                                            Expanded(child: AppText(text: '|', size: tiny, extraFaded: true, textAlign: TextAlign.center)),
                                          // create account
                                          if (isSignIn)
                                            AppButton(
                                              onPressed: () {
                                                setState(() {
                                                  isNewAccount = true;
                                                  isSignIn = false;
                                                });
                                              },
                                              color: styler.appColor(0.5),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  AppIcon(Icons.person_add, size: medium),
                                                  spw(),
                                                  Flexible(child: AppText(text: 'Create Account')),
                                                ],
                                              ),
                                            ),
                                          //
                                        ],
                                      ),
                                    //
                                    if (isNewAccount || isResetPassword) msph(),
                                    if (isNewAccount || isResetPassword) AppText(text: '•', size: tiny, extraFaded: true),
                                    if (isNewAccount || isResetPassword)
                                      AppButton(
                                        onPressed: () {
                                          setState(() {
                                            isSignIn = true;
                                            isResetPassword = false;
                                            isNewAccount = false;
                                            isBusy = false;
                                            isBusyDemo = false;
                                            isSuccessful = false;
                                          });
                                        },
                                        noStyling: true,
                                        svp: true,
                                        child: AppText(text: 'Go back', faded: true),
                                      ),
                                    //
                                  ],
                                ),
                                //
                              ],
                            ),
                          ),
                          //
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          //
        ],
      ),
    );
  }
}
