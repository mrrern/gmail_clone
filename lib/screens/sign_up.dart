import 'package:gmail_clone/routes/imports.dart';
import 'package:gmail_clone/logic/auth/presentation/auth_controller.dart';

class ScreenSign extends StatefulHookConsumerWidget {
  const ScreenSign({super.key});

  @override
  ConsumerState<ScreenSign> createState() => _ScreenSignState();
}

class _ScreenSignState extends ConsumerState<ScreenSign> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final formState = ref.watch(authFormProvider);
    final formNotifier = ref.read(authFormProvider.notifier);

    void submit() {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();

        final email = formState.email;
        final password = formState.password;

        final emailCorrect = "minombre@to.com";
        final passwordCorrect = "tucontrase;asegura 123";

        if (email == emailCorrect && passwordCorrect == password) {
          context.go('/dashboard');
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Nombre: ${formState.name}, email: ${formState.email} ',
            ),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Container(
          padding: EdgeInsets.all(8),
          height: 60,
          width: 60,
          child: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQExly8Xk3GWUOkmUGETvVobduKHck3ivnVA&s',
            fit: BoxFit.cover,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * .8,
                  height: MediaQuery.of(context).size.height * .55,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Registrar usuario',
                          style: GoogleFonts.roboto(fontSize: 25),
                        ),
                      ),
                      Form(
                        autovalidateMode: AutovalidateMode.onUnfocus,
                        key: formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,

                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Por favor introduce email';
                                  }
                                  if (!emailValid.hasMatch(value)) {
                                    "No es un correo valido";
                                  }
                                  return null;
                                },
                                onSaved: (newValue) =>
                                    formNotifier.setEmail(newValue!),

                                autocorrect: false,

                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  enabled: true,
                                  focusColor: blue,
                                  fillColor: blue,
                                  hintText: "email",

                                  contentPadding: EdgeInsets.all(2),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: red),
                                    borderRadius: BorderRadius.circular(20),
                                    gapPadding: 5,
                                  ),
                                  errorStyle: GoogleFonts.roboto(
                                    color: red,
                                    fontSize: 10,
                                  ),

                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: blue),
                                    gapPadding: 5,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: blue),
                                    borderRadius: BorderRadius.circular(20),
                                    gapPadding: 5,
                                  ),
                                ),
                              ),
                              SizedBox(height: 25),

                              TextFormField(
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Por favor introduce nombre';
                                  }
                                  return null;
                                },
                                onSaved: (name) => formNotifier.setName(name!),

                                autocorrect: false,

                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  enabled: true,
                                  focusColor: blue,
                                  fillColor: blue,
                                  hintText: "Nombre",

                                  contentPadding: EdgeInsets.all(2),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: red),
                                    borderRadius: BorderRadius.circular(20),
                                    gapPadding: 5,
                                  ),
                                  errorStyle: GoogleFonts.roboto(
                                    color: red,
                                    fontSize: 10,
                                  ),

                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: blue),
                                    gapPadding: 5,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: blue),
                                    borderRadius: BorderRadius.circular(20),
                                    gapPadding: 5,
                                  ),
                                ),
                              ),
                              SizedBox(height: 25),

                              TextFormField(
                                keyboardType: TextInputType.name,
                                obscureText: formState.obscurePassword,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Por favor introduce contraseña';
                                  }
                                  if (value.length < 8) {
                                    "Contraseña muy corta";
                                  }
                                  return null;
                                },

                                onSaved: (newValue) {
                                  formNotifier.setPassword(newValue!);
                                },

                                autocorrect: false,

                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  enabled: true,
                                  focusColor: blue,
                                  fillColor: blue,
                                  hintText: "Contraseña",
                                  suffixIcon: GestureDetector(
                                    onTap: () =>
                                        formNotifier.togglePasswordVisibility(),
                                    child: Icon(Icons.remove_red_eye),
                                  ),
                                  contentPadding: EdgeInsets.all(2),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: red),
                                    borderRadius: BorderRadius.circular(20),
                                    gapPadding: 5,
                                  ),
                                  errorStyle: GoogleFonts.roboto(
                                    color: red,
                                    fontSize: 10,
                                  ),

                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: blue),
                                    gapPadding: 5,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: blue),
                                    borderRadius: BorderRadius.circular(20),
                                    gapPadding: 5,
                                  ),
                                ),
                              ),

                              SizedBox(height: 25),

                              TextButton(
                                onPressed: submit,
                                style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(blue),
                                ),
                                child: Text(
                                  "enviar",
                                  style: TextStyle(color: white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
