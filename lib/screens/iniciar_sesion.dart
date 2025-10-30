import 'package:gmail_clone/routes/imports.dart';

class Pantalla2 extends StatelessWidget {
  const Pantalla2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cambio")),
      body: Center(child: Text("Esta es una segunda pantalla")),
    );
  }
}
