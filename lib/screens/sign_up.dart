import 'package:gmail_clone/routes/imports.dart';

class ScreenSign extends StatefulWidget {
  const ScreenSign({super.key});

  @override
  State<ScreenSign> createState() => _ScreenSignState();
}

class _ScreenSignState extends State<ScreenSign> {
  String email = '';
  String password = '';
  bool isLoading = false;
  String? error = '';

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() {
    setState(() {
      isLoading = true;
      error = null;
    });

    email = emailController.text;
    password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      
       ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email vacio o password Vacio")
      ));
    }

    
    if (email.isNotEmpty && password.isNotEmpty) {
      context.go('/dashboard');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Faltan los datos")
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  height: MediaQuery.of(context).size.height * .4,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUnfocus,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            keyboardType: TextInputType.emailAddress,

                            controller: emailController,
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
                          Divider(),
                          CustomTextField(
                            hint: "password",
                            controller: passwordController,
                          ),

                          SizedBox(height: 25),

                          TextButton(
                            onPressed: () {
                              login();
                            },
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  String hint;
  TextEditingController? controller;
  CustomTextField({super.key, required this.hint, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autocorrect: false,

      decoration: InputDecoration(
        border: InputBorder.none,
        enabled: true,
        focusColor: blue,
        fillColor: blue,
        hintText: hint,

        contentPadding: EdgeInsets.all(2),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: red),
          borderRadius: BorderRadius.circular(20),
          gapPadding: 5,
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
    );
  }
}
