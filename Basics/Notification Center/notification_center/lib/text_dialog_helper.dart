import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notification_center/decrypt.dart';

void showTextInputDialog(BuildContext context, message) {
  String enteredText = '';
  const String accessKey = 'Atakan'; // Access Key
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Access Authority"),
        content: TextField(
          onChanged: (value) {
            enteredText = value;
          },
          decoration: const InputDecoration(hintText: "Type Access Key"),
        ),
        actions: [
          TextButton(
            child: const Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text("Apply"),
            onPressed: () {
              if (enteredText == accessKey) {
                Navigator.of(context).pop(); // Mevcut dialogu kapat
                showTimer(context, message); // Yeni dialogu aç
              } else {
                Navigator.of(context).pop();
                timerError(context);
              }
            },
          ),
        ],
      );
    },
  );
}

// Doğru anahtar girildiğinde
void showTimer(BuildContext context, String decryptedMessage) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      Future.delayed(const Duration(seconds: 15), () {
        Navigator.of(context).pop();
        showDecryptedMessage(context, decryptedMessage: decryptedMessage);
      });

      return const AlertDialog(
        title: Text("Decrypting"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 10),
            Text("Decrypting..."),
          ],
        ),
      );
    },
  );
}

//Yanlış anahtar girildiğinde uygulama kapanır
void timerError(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).pop();
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      });

      return const AlertDialog(
        title: Text("Wrong Access Key"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 10),
            Text("Application is Closing..."),
          ],
        ),
      );
    },
  );
}

//Şifresi çözülmüş mesajı gösterme
void showDecryptedMessage(BuildContext context,
    {required String decryptedMessage}) {
  String decryptedMessage2 = decrypt(decryptedMessage);
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.of(context).pop();
      });

      return AlertDialog(
        title: const Text("Decrypted Message"),
        content: Text(decryptedMessage2),
      );
    },
  );
}
