import 'package:gmail_clone/routes/imports.dart';

class DetailEmail extends StatelessWidget {
  final EmailModel email;
  const DetailEmail({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(email.asunto ?? "Sin Asunto ...")),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "De: ${email.remitente}",
                style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text("Asunto: ${email.asunto}", style: GoogleFonts.roboto()),
              Divider(height: 24),
              Text(email.message ?? "Sin mensaje", style: GoogleFonts.roboto()),
              const SizedBox(height: 10),
              if (email.images!.isNotEmpty)
                Text(
                  "Imagenes:",
                  style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                ),
              ...email.images!.map(
                (url) => Padding(
                  padding: EdgeInsets.all(9),
                  child: Image.network(url),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
