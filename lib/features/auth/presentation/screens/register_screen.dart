import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:klanet_store_marketters_frontend_mobile/config/utils/app_colors.dart';
import '../../../shared/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    final scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final textStyles = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: ContainerBackground(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 70),
                // Icon Banner
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        if (!context.canPop()) return;
                        context.pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        size: 40,
                        color: AppColors.secondary,
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/images/logo_klanet_d.svg',
                      height: 70,
                      color: AppColors.secondary,
                    ),
                    const Spacer(flex: 1),
                  ],
                ),

                // const SizedBox(height: ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(color: scaffoldBackgroundColor),
                  child: const _RegisterForm(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    // final textStyles = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          const SizedBox(height: 50),

          const CustomTextFormField(
            label: 'Nombre',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 30),

          const CustomTextFormField(
            label: 'Nombre apellido',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 30),

          const CustomTextFormField(
            label: 'Correo',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 30),

          const CustomTextFormField(
            label: 'Telefono',
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 30),

          const CustomTextFormField(label: 'Contraseña', obscureText: true),

          const SizedBox(height: 30),

          const CustomTextFormField(
            label: 'Repita la contraseña',
            obscureText: true,
          ),

          const SizedBox(height: 30),

          const CustomTextFormField(
            label: 'Código de referido',
            obscureText: true,
          ),

          const SizedBox(height: 30),

          SizedBox(
            width: double.infinity,
            height: 60,
            child: CustomFilledButton(text: 'Crear', onPressed: () {}),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('¿Ya tienes cuenta?'),
              TextButton(
                onPressed: () {
                  if (context.canPop()) {
                    return context.pop();
                  }
                  context.go('/login');
                },
                child: const Text('Ingresa aquí'),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
