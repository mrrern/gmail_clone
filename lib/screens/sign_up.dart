import 'package:gmail_clone/routes/imports.dart';

class ScreenSign extends StatelessWidget {
  const ScreenSign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(
              "Esta es otra pantalla",
              style: TextStyle(color: blue, fontSize: 20),
            ),
            IconButton(
              color: yellow,
              onPressed: () {
                context.go('/');

             
              },
              icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
