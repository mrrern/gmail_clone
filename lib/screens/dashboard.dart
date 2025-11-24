import 'package:gmail_clone/logic/email_services.dart';
import 'package:gmail_clone/routes/imports.dart';

class Dashboard extends ConsumerWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailsList = ref.watch(leemeLosDatos);
    return Scaffold(
      appBar: AppBar(),
      body: emailsList.when(
        data: (emails) {
          return ListView.builder(
            itemCount: emails.length,
            itemBuilder: (context, index) {
              final email = emails[index];
              return ListTile(
                leading: CircleAvatar(
                  child: Text(email.remitente![0].toUpperCase()),
                ),
                title: Text(
                  email.asunto ?? "Sin Asunto",
                  style: GoogleFonts.roboto(
                    fontWeight: email.isRead
                        ? FontWeight.normal
                        : FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  email.message ?? "Sin mensaje",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {
                  context.push("/email/${email.id}", extra: email);
                },
              );
            },
          );
        },
        error: (error, stack) {
          print(error);
          print(stack);
          return Center(child: Text("Error: $error"));
        },
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
