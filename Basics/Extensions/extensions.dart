extension StringExtensions on String {
  bool isPalindrome() {
    var reversed = this.split('').reversed.join();
    return this == reversed;
  }
}

extension IntExtensions on int {
  bool isPrime() {
    if (this < 2) return false;
    for (int i = 2; i <= this / 2; i++) {
      if (this % i == 0) return false;
    }
    return true;
  }
}

extension DateTimeExtensions on DateTime {
  int daysBetween(DateTime other) {
    var difference = other.difference(this);
    return difference.inDays.abs();
  }
}

extension BoolExtensions on bool {
  bool logicalEquation(bool other) {
    return this && other; //Aynı değerse true,değilse false
  }
}

extension SetExtensions<T> on Set<T> {
  Set<T> eliminateDuplicates() {
    return Set<T>.from(this);
  }
}

extension MapExtensions<K, V> on Map<K, V> {
  Map<V, List<K>> groupByValue() {
    var result = <V, List<K>>{};
    this.forEach((key, value) {
      if (!result.containsKey(value)) {
        result[value] = [];
      }
      result[value]!.add(key);
    });
    return result;
  }
}

void main() {
  //Örnekle
  String palindromeString = "madam";
  print(
      "Girilen kelime bir palindrom mu? ${palindromeString.isPalindrome()}\n"); // Output: true

  int primeNumber = 7;
  print("Girilen sayı asal mı? ${primeNumber.isPrime()}\n"); // Output: true

  DateTime startDate = DateTime(2023, 1, 1);
  DateTime endDate = DateTime(2023, 12, 31);
  print(
      "Girilen tarihler arasındaki gün sayısı: ${startDate.daysBetween(endDate)}\n"); // Output: 364

  bool value1 = true;
  bool value2 = false;
  print(
      "Mantıksal denklem sonucu: ${value1.logicalEquation(value2)}\n"); // Output: false

  Set<int> numbersSet = {1, 1, 2, 2, 3, 4, 5, 5, 6, 6, 7};
  print(
      "Tekrarlanan değerleri olmayan küme: ${numbersSet.eliminateDuplicates()}\n"); // Output: {1, 2, 3, 4, 5,6,7}

  Map<String, String> families = {
    'Will': 'David',
    'Smith': 'John',
    'Johnson': 'Robert',
    'Yellow': 'David',
    'Brown': 'Michael',
    'Davis': 'David',
    'Miller': 'James',
    'Marry': 'James'
  };
  print(
      "Soyisimlere göre gruplandırılan isimler:\n ${families.groupByValue()}");
  // Output: {
  //    David: [Will, Yellow, Davis],
  //   'John': ['Smith'],
  //   'Robert': ['Johnson'],
  //   'Michael': ['Brown'],
  //   'James': ['Miller, Marry']
  // }
}
