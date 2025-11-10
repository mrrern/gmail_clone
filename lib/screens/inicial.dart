import 'package:gmail_clone/routes/imports.dart';

class PortalInicial extends StatefulWidget {
  const PortalInicial({super.key});

  @override
  State<PortalInicial> createState() => _PortalInicialState();
}

class _PortalInicialState extends State<PortalInicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 5,
        title: SizedBox(
          width: 35,
          height: 25,
          child: Image.network(logoGmail, fit: BoxFit.fill),
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.push('/iniciar_sesion');
            },
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(border: Border.all(color: blue)),
              child: Text("Acceder", style: GoogleFonts.roboto(fontSize: 16)),
            ),
          ),
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Correo electrónico seguro, \n inteligente \n y fácil de usar",
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 300,
                child: Text(
                  "Mejora tu productividad con Gmail, que ahora se integra con Google Chat, Google Meet y otros servicios, todos en un mismo lugar.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(fontSize: 16),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.pushReplacementNamed('/crear_cuenta');
                      },

                      child: Container(
                        decoration: BoxDecoration(
                          color: blue,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(7),
                            bottomLeft: Radius.circular(7),
                          ),
                          border: Border(
                            right: BorderSide(color: Colors.black26),
                          ),
                        ),
                        width: 150,
                        height: 50,
                        child: Center(
                          child: Text(
                            "Crear cuenta",
                            style: GoogleFonts.roboto(
                              color: white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(color: blue),
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
