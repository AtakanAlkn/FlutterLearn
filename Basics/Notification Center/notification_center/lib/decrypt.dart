List<String> alphabet = [
  'a',
  'b',
  'c',
  'd',
  'e',
  'f',
  'g',
  'h',
  'i',
  'j',
  'k',
  'l',
  'm',
  'n',
  'o',
  'p',
  'q',
  'r',
  's',
  't',
  'u',
  'v',
  'w',
  'x',
  'y',
  'z'
];

String decrypt(message) {
  int? a;
  String word = '';
  String newMessage = message.toLowerCase(); //Küçük harfe çevrilir
  String newMessage2 =
      newMessage.trimRight(); //Sonundaki boşluk karakterleri sil
  String newMessage3 = newMessage2.replaceAll(' ', '');

  for (int i = 0; i < newMessage3.length; i++) {
    String currentItem = newMessage3[i];
    //Mesajın içeriği alfabenin harfleri mi
    if (alphabet.contains(currentItem)) {
      a = (alphabet.indexOf(newMessage3[i]) - 2) % 26;
      word += alphabet[a];
    } else {
      //eğer değilse doğrudan ekrana yazdırılır bir işlem yapılmaz
      word += newMessage3[i];
    }
  }

  String result = word;

  return result;
}
