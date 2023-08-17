import 'contact_information.dart';

enum Team {
  flutterDevelopment,
  iOSDevelopment,
  androidDevelopment,
  uiUxDesign,
}

class NeonAcademyMember {
  final String fullName;
  final String title;
  final Team team;
  final String horoscope;
  final String memberLevel;
  final String homeTown;
  final int age;
  final ContactInformation contactInformation;
  int? motivationLevel;

  NeonAcademyMember({
    required this.fullName,
    required this.title,
    required this.team,
    required this.horoscope,
    required this.memberLevel,
    required this.homeTown,
    required this.age,
    required this.contactInformation,
    required this.motivationLevel,
  });

  void increaseMotivation(int increment) {
    if (motivationLevel == null) {
      motivationLevel = 1;
    } else {
      motivationLevel = motivationLevel! + increment;
    }
  }

  void printMotivationLevelMessage() {
    if (motivationLevel == null) {
      print("This member has no motivation level set");
    } else if (motivationLevel! > 5) {
      print("This member is highly motivated");
    } else {
      print("This member's motivation level is $motivationLevel");
    }
  }

  String getMotivationLevelDescription() {
    if (motivationLevel == null) {
      return "Not motivated at all";
    } else if (motivationLevel! > 5) {
      return "Highly motivated";
    } else if (motivationLevel! > 0) {
      return "Moderately motivated";
    } else {
      return "Not motivated at all";
    }
  }

  int getNonNullMotivationLevel() {
    return motivationLevel ?? 0;
  }

  bool isMotivationLevelSufficient(int targetLevel) {
    return motivationLevel != null && motivationLevel! >= targetLevel;
  }
}

void main() {
// Örnek Kullanıcı
  final member = NeonAcademyMember(
    fullName: "John Doe",
    title: "iOS Developer",
    team: Team.iOSDevelopment,
    horoscope: "Aquarius",
    memberLevel: "C2",
    homeTown: "New York",
    age: 25,
    motivationLevel: 30,
    contactInformation: ContactInformation(
      email: "john.doe@example.com",
      phoneNumber: "+1 123-456-7890",
    ),
  );

  member.increaseMotivation(3);
  member
      .printMotivationLevelMessage(); // Output: This member's motivation level is 4

  print(member.getMotivationLevelDescription()); // Output: Moderately motivated

  print(member.getNonNullMotivationLevel()); // Output: 4

  print(member.isMotivationLevelSufficient(5)); // Output: false
}
