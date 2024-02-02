import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:scaleup/core/constants/ui_constants.dart';
import 'package:scaleup/pages/home_page.dart';
import 'package:scaleup/utils/extensions.dart';
import 'package:scaleup/utils/global_keys.dart';
import 'package:scaleup/utils/widgets/gaps.dart';

class LoginPage extends StatefulHookWidget {
  const LoginPage({super.key});

  static const routeName = 'login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final inputDecoration =
        isDark ? kTextFieldDecoratoinDark : kTextFieldDecoration;

    final formKey = useState(GlobalKey<FormState>());
    final emailController =
        useTextEditingController(text: 'jacobthomas@email.com'.ifDebugging);
    final passwordController =
        useTextEditingController(text: 'asdf1234'.ifDebugging);

    /// [ Functions ]

    void submit() {
      navigatorKey.currentState!.pushReplacementNamed(HomePage.routeName);
    }

    /// [ Widgets ]

    final loginForm = Form(
      key: formKey.value,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: emailController,
            decoration: inputDecoration.copyWith(
              hintText: 'Email',
              prefixIcon: const Icon(Icons.mail_rounded),
            ),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value!.isEmpty) return 'Please enter your email';
              return null;
            },
          ),
          gapH12,
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: inputDecoration.copyWith(
              hintText: 'Password',
              prefixIcon: const Icon(Icons.lock_rounded),
            ),
            textInputAction: TextInputAction.done,
            validator: (value) {
              if (value!.isEmpty) return 'Please enter your password';
              if (value.length < 8) {
                return 'Password must be at least 8 characters';
              }
              return null;
            },
          ),
          gapH28,
          FilledButton(
            onPressed: submit,
            child: const Text('Log in'),
          ),
        ],
      ),
    );

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: kPaddingMd,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Login',
                  style: theme.textTheme.displayMedium,
                  textAlign: TextAlign.center),
              gapH40,
              loginForm,
              gapH16,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  gapW4,
                  TextButton(
                    onPressed: () {},
                    child: const Text('Register'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
