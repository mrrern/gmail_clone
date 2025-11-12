import 'package:gmail_clone/routes/imports.dart';

class ScreenSign extends StatefulHookConsumerWidget {
  const ScreenSign({super.key});

  @override
  ConsumerState<ScreenSign> createState() => _ScreenSignState();
}

class _ScreenSignState extends ConsumerState<ScreenSign> {
  
  @override
  Widget build(BuildContext context) {
  final formKey = GlobalKey<FormState>();
  final formState = ref.watch(formProvider);
  final formNotifier = ref.read(formProvider.notifier);
  final isVisible = ref.watch(obscureProvider.notifier).state;

  final controllerName = TextEditingController();
  final controllerPass = TextEditingController();
  final controllerEmail = TextEditingController();

   void submit() {
    if(formKey.currentState!.validate()) {
      formKey.currentState!.save();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Nombre: ${formState.name}, email: ${formState.email} '))
      );
      context.go('/dashboard');
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
                        child: Text('Registrar usuario', style: GoogleFonts.roboto(fontSize: 25),),
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
                                controller: controllerEmail,
                                validator: (value) {
                                  if (value!.isEmpty || value == null) {
                                    return 'Por favor introduce email';
                                  }
                                  return null; 
                                },
                                onSaved: (newValue) => formNotifier.setEmail(newValue!),
                               
                                
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
                                  errorStyle: GoogleFonts.roboto(color: red, fontSize: 10),
                                  
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
                                  if (value!.isEmpty || value == null) {
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
                                  errorStyle: GoogleFonts.roboto(color: red, fontSize: 10),
                                  
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
                              SizedBox(height: 25,),
                              
                              TextFormField(
                                 keyboardType: TextInputType.name,
                                 obscureText: isVisible,
                                validator: (value) {
                                  if (value!.isEmpty || value == null) {
                                    return 'Por favor introduce contraseña';
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
                                  suffixIcon: GestureDetector(onTap: () { ref.read(obscureProvider.notifier).state = !ref.read(obscureProvider.notifier).state ;}, child: Icon(Icons.remove_red_eye), ) ,
                                  contentPadding: EdgeInsets.all(2),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: red),
                                    borderRadius: BorderRadius.circular(20),
                                    gapPadding: 5,
                                  ),
                                  errorStyle: GoogleFonts.roboto(color: red, fontSize: 10),
                                  
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
