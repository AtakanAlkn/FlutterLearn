import 'contact_information.dart';
import 'neon_academy.dart';

void main() {
  List<NeonAcademyMember> getNeonAcademyMembers() {
    // Üyelerin listesini oluşturma veya alma işlemleri burada gerçekleştirilir
    List<NeonAcademyMember> members = [
      NeonAcademyMember(
        fullName: "Atakan Alkan",
        title: "Intern Flutter Developer",
        team: Team.flutterDevelopment,
        horoscope: "Leo",
        memberLevel: "A2",
        homeTown: "Istanbul",
        age: 23,
        contactInformation: ContactInformation(
          phoneNumber: "05369132578",
          email: "alkan.atakan@outlook.com",
        ),
      ),
      NeonAcademyMember(
        fullName: "John Doe",
        title: "Flutter Developer",
        team: Team.flutterDevelopment,
        horoscope: "Leo",
        memberLevel: "A1",
        homeTown: "New York",
        age: 25,
        contactInformation: ContactInformation(
          phoneNumber: "123456789",
          email: "example@example.com",
        ),
      ),
      NeonAcademyMember(
        fullName: "Jane Smith",
        title: "Flutter Developer",
        team: Team.flutterDevelopment,
        horoscope: "Libra",
        memberLevel: "B1",
        homeTown: "Los Angeles",
        age: 35,
        contactInformation: ContactInformation(
          phoneNumber: "987654321",
          email: "example2@example.com",
        ),
      ),
      NeonAcademyMember(
        fullName: "Michael Brown",
        title: "Android Developer",
        team: Team.androidDevelopment,
        horoscope: "Leo",
        memberLevel: "B3",
        homeTown: "Istanbul",
        age: 28,
        contactInformation: ContactInformation(
          phoneNumber: "05369132578",
          email: "example3@example.com",
        ),
      ),
      NeonAcademyMember(
        fullName: "Emma Johnson",
        title: "iOS Developer",
        team: Team.iOSDevelopment,
        horoscope: "Scorpio",
        memberLevel: "B2",
        homeTown: "San Francisco",
        age: 31,
        contactInformation: ContactInformation(
          phoneNumber: "987654321",
          email: "emma@example.com",
        ),
      ),
      NeonAcademyMember(
        fullName: "David Lee",
        title: "Flutter Developer",
        team: Team.flutterDevelopment,
        horoscope: "Aquarius",
        memberLevel: "A3",
        homeTown: "Seoul",
        age: 26,
        contactInformation: ContactInformation(
          phoneNumber: "123456789",
          email: "david@example.com",
        ),
      ),
      NeonAcademyMember(
        fullName: "Sophia Rodriguez",
        title: "UI/UX Designer",
        team: Team.uiUxDesign,
        horoscope: "Gemini",
        memberLevel: "B2",
        homeTown: "Mexico City",
        age: 32,
        contactInformation: ContactInformation(
          phoneNumber: "555555555",
          email: "sophia@example.com",
        ),
      ),
    ];

    return members;
  }

  List<NeonAcademyMember> members = getNeonAcademyMembers();

  // 1. 3. üyeyi sil
  if (members.length >= 3) {
    members.removeAt(2);
  }

  // 2. Üyeleri yaşlarına göre büyükten küçüğe sırala
  members.sort((a, b) => b.age.compareTo(a.age));

  // 3. Üyeleri isimlerine göre (Z-A) sırala
  members.sort((a, b) => b.fullName.compareTo(a.fullName));

  // 4. 24 yaşından büyük olan üyeleri filtrele ve yeni bir diziye aktar
  List<NeonAcademyMember> olderMembers =
      members.where((member) => member.age > 24).toList();
  List<String> olderMemberNames =
      olderMembers.map((member) => member.fullName).toList();
  print('Üyeleri 24 yaşından büyük olanlar: $olderMemberNames');

  // 5. Flutter Geliştiricilerinin toplam sayısını yazdır
  int flutterDevelopersCount =
      members.where((member) => member.title == 'Flutter Developer').length;
  print('Flutter Geliştiricilerinin Sayısı: $flutterDevelopersCount');

  // 6. Kendi indeksinizi bulun ve yazdırın
  int myIndex =
      members.indexWhere((member) => member.fullName == 'Atakan Alkan');
  print('Kendi İndeksim: $myIndex');

  // 7. Yeni bir mentor üye ekle
  ContactInformation mentorContactInfo = ContactInformation(
    phoneNumber: "987654321",
    email: "mentor@example.com",
  );
  NeonAcademyMember mentor = NeonAcademyMember(
    fullName: "Mentor Smith",
    title: "Mentor",
    team: Team.uiUxDesign,
    horoscope: "Pisces",
    memberLevel: "D1",
    homeTown: "London",
    age: 40,
    contactInformation: mentorContactInfo,
  );
  members.add(mentor);

  // 8. Belirli bir memberLevel'a sahip üyeleri kaldır
  String specificMemberLevel = "A1";
  members.removeWhere((member) => member.memberLevel == specificMemberLevel);

  // 9. En yüksek yaşa sahip üyeyi bul ve yazdır
  int maxAge = members
      .map((member) => member.age)
      .reduce((value, element) => value > element ? value : element);
  NeonAcademyMember oldestMember =
      members.firstWhere((member) => member.age == maxAge);
  print('En Yaşlı Üye: ${oldestMember.fullName}, Yaşı: ${oldestMember.age}');

  // 10. En uzun isme sahip üyeyi bul ve yazdır
  int maxLength = members
      .map((member) => member.fullName.length)
      .reduce((value, element) => value > element ? value : element);
  NeonAcademyMember longestNameMember =
      members.firstWhere((member) => member.fullName.length == maxLength);
  print(
      'En Uzun İsimli Üye: ${longestNameMember.fullName}, İsim Uzunluğu: ${longestNameMember.fullName.length}');

  // 11. Aynı burç işaretine sahip üyeleri grupla
  Map<String, List<NeonAcademyMember>> horoscopeGroups = {};
  for (var member in members) {
    if (!horoscopeGroups.containsKey(member.horoscope)) {
      horoscopeGroups[member.horoscope] = [];
    }
    horoscopeGroups[member.horoscope]?.add(member);
  }
  print('Burç Grupları:');
  for (var entry in horoscopeGroups.entries) {
    print(
        '${entry.key}: ${entry.value.map((member) => member.fullName).toList()}');
  }

  // 12. En yaygın doğum yeri şehrini bul
  Map<String, int> hometownCount = {};
  for (var member in members) {
    if (!hometownCount.containsKey(member.homeTown)) {
      hometownCount[member.homeTown] = 1;
    } else {
      hometownCount[member.homeTown] = hometownCount[member.homeTown]! + 1;
    }
  }
  String mostCommonHometown =
      hometownCount.entries.reduce((a, b) => a.value > b.value ? a : b).key;
  print('En Yaygın Doğum Yeri Şehir: $mostCommonHometown');

  // 13. Tüm üyelerin yaş ortalamasını bul
  double averageAge = members
          .map((member) => member.age)
          .reduce((value, element) => value + element) /
      members.length;
  print('Yaş Ortalaması: $averageAge');

  // 14. Sadece iletişim bilgilerini içeren bir dizi oluştur ve e-posta adreslerini yazdır
  List<ContactInformation> contactInfoList =
      members.map((member) => member.contactInformation).toList();
  List<String> emailAddresses =
      contactInfoList.map((contactInfo) => contactInfo.email).toList();
  print('E-posta Adresleri: $emailAddresses');

  // 15. Üyeleri memberLevel'a göre sırala ve tam adlarını yazdır
  members.sort((a, b) => b.memberLevel.compareTo(a.memberLevel));
  List<String> sortedMemberNames =
      members.map((member) => member.fullName).toList();
  print('Sıralanmış Üye İsimleri: $sortedMemberNames');

  // 16. Aynı ünvana sahip üyeleri grupla ve iletişim bilgilerini içeren yeni bir dizi oluştur, ardından telefon numaralarını yazdır
  Map<String, List<ContactInformation>> titleGroups = {};
  for (var member in members) {
    if (!titleGroups.containsKey(member.title)) {
      titleGroups[member.title] = [];
    }
    titleGroups[member.title]?.add(member.contactInformation);
  }
  print('Ünvana Göre Gruplanmış Telefon Numaraları:');
  for (var entry in titleGroups.entries) {
    List<String> phoneNumbers =
        entry.value.map((contactInfo) => contactInfo.phoneNumber).toList();
    print('${entry.key}: $phoneNumbers');
  }
}
