import 'package:flutter/material.dart';
import 'package:capbox/features/auth/presentation/widgets/role_dropdown.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/services.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  String? selectedRole;
  bool acceptTerms = false;
  bool obscurePassword = true;

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final birthdateController = TextEditingController();
  final phoneController = TextEditingController();
  final gymNameController = TextEditingController();
  final gymKeyController = TextEditingController();

  final redColor = const Color(0xFFFF0909);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          const Text(
            'Registro',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Inter',
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          const Text(
            'Rol',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          RoleDropdown(
            value: selectedRole,
            onChanged: (value) {
              setState(() {
                selectedRole = value;
              });
            },
          ),
          const SizedBox(height: 16),
          if (selectedRole == 'Boxeador') ...[
            _buildTextField(
              hint: 'Clave del gym',
              icon: Icons.lock,
              controller: gymKeyController,
            ),
            const SizedBox(height: 12),
            const Text(
              '¿No tienes una clave? Solicítala',
              style: TextStyle(color: Colors.white70, fontFamily: 'Inter', fontSize: 12),
            ),
            const SizedBox(height: 12),
          ],
          if (selectedRole != null) ...[
            const Text(
              'Datos personales',
              style: TextStyle(color: Colors.white, fontFamily: 'Inter', fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            _buildTextField(
              hint: 'Correo electrónico',
              icon: Icons.email,
              controller: emailController,
              inputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 12),
            _buildTextField(
              hint: 'Nombre',
              icon: Icons.person,
              controller: nameController,
            ),
            const SizedBox(height: 12),
            _buildTextField(
              hint: 'Contraseña',
              icon: Icons.lock,
              isPassword: true,
              controller: passwordController,
            ),
            const SizedBox(height: 12),
            _buildTextField(
              hint: 'Fecha de nacimiento',
              icon: Icons.calendar_today,
              controller: birthdateController,
              readOnly: true,
              onTap: _pickDate,
            ),
            const SizedBox(height: 12),
            _buildTextField(
              hint: 'Número telefónico',
              icon: Icons.phone,
              controller: phoneController,
              inputType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
            ),
          ],
          if (selectedRole == 'Entrenador' || selectedRole == 'Administrador') ...[
            const SizedBox(height: 12),
            const Text(
              'Datos de gimnasio',
              style: TextStyle(color: Colors.white, fontFamily: 'Inter', fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            _buildTextField(
              hint: 'Nombre del gimnasio',
              icon: Icons.fitness_center,
              controller: gymNameController,
            ),
          ],
          const SizedBox(height: 12),
          Row(
            children: [
              Checkbox(
                value: acceptTerms,
                onChanged: (value) {
                  setState(() {
                    acceptTerms = value ?? false;
                  });
                },
                activeColor: redColor,
              ),
              const Expanded(
                child: Text(
                  'Acepto los términos y condiciones',
                  style: TextStyle(color: Colors.white, fontFamily: 'Inter'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                if (!acceptTerms) {
                  _showError('Debes aceptar los términos y condiciones');
                  return;
                }
                if (!_validateEmail(emailController.text)) {
                  _showError('Correo electrónico no válido');
                  return;
                }
                if (!_validatePhone(phoneController.text)) {
                  _showError('El teléfono debe contener solo números y tener 10 dígitos');
                  return;
                }
                if (!_validatePassword(passwordController.text)) {
                  _showError('La contraseña debe tener al menos 6 caracteres, una mayúscula y un número');
                  return;
                }

                // lógica de registro
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: redColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Registrar',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () => context.pop(),
            child: const Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '¿Ya tienes cuenta? ',
                      style: TextStyle(color: Color(0xFFFF0909), fontFamily: 'Inter'),
                    ),
                    TextSpan(
                      text: 'Inicia sesión',
                      style: TextStyle(color: Colors.white, fontFamily: 'Inter'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String hint,
    required IconData icon,
    TextEditingController? controller,
    bool isPassword = false,
    TextInputType? inputType,
    List<TextInputFormatter>? inputFormatters,
    bool readOnly = false,
    void Function()? onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.35),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword ? obscurePassword : false,
        style: const TextStyle(color: Colors.white, fontFamily: 'Inter'),
        keyboardType: inputType,
        readOnly: readOnly,
        onTap: onTap,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white70),
          border: InputBorder.none,
          prefixIcon: Icon(icon, color: Colors.white),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    obscurePassword ? Icons.visibility_off : Icons.visibility,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1, 1),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(primary: redColor),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      birthdateController.text = '${picked.day}/${picked.month}/${picked.year}';
    }
  }

  bool _validateEmail(String email) {
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return regex.hasMatch(email);
  }

  bool _validatePhone(String phone) {
    final regex = RegExp(r'^\d{10}$');
    return regex.hasMatch(phone);
  }

  bool _validatePassword(String password) {
    final regex = RegExp(r'^(?=.*[A-Z])(?=.*\d).{6,}$');
    return regex.hasMatch(password);
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }
}
