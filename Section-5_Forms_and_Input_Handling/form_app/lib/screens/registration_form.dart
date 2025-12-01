import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _selectedGender;
  bool _termsAccepted = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Email validation RegExp
  final RegExp emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');

  void _submitForm() {
    if (!_termsAccepted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("You must accept terms")));
      return;
    }

    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, '/success');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registration Form")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        // FORM STARTS HERE
        child: Form(
          key: _formKey,

          child: ListView(
            children: [
              const Text(
                "Create Account",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // NAME FIELD
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Full Name",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? "Name is required" : null,
              ),
              const SizedBox(height: 16),

              // EMAIL FIELD
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) return "Email is required";
                  if (!emailRegex.hasMatch(value)) return "Enter a valid email";
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // PASSWORD FIELD
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) => value!.length < 6
                    ? "Password must be at least 6 characters"
                    : null,
              ),
              const SizedBox(height: 16),

              // DROPDOWN GENDER
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Gender",
                ),
                value: _selectedGender,
                items: const [
                  DropdownMenuItem(value: "Male", child: Text("Male")),
                  DropdownMenuItem(value: "Female", child: Text("Female")),
                  DropdownMenuItem(value: "Other", child: Text("Other")),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
                validator: (value) =>
                    value == null ? "Please select your gender" : null,
              ),
              const SizedBox(height: 20),

              // TERMS CHECKBOX
              CheckboxListTile(
                title: const Text("I accept the Terms & Conditions"),
                value: _termsAccepted,
                onChanged: (value) {
                  setState(() => _termsAccepted = value!);
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),

              const SizedBox(height: 20),

              // SUBMIT BUTTON
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text("Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
