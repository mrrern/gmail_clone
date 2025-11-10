import 'package:gmail_clone/routes/imports.dart';


class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("aqui iniciaste sesin"),
      ),
    );
  }
}