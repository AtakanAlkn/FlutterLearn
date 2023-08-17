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

  // 1. Sadece Flutter Development Team üyelerini içeren bir liste oluştur ve tam adlarını yazdır
  List<String> flutterDevelopers = members
      .where((member) => member.team == Team.flutterDevelopment)
      .map((member) => member.fullName)
      .toList();
  print('Flutter Development Team Üyeleri: $flutterDevelopers');

  // 2. Her bir takımdaki üye sayısını içeren bir sözlük oluştur ve UI/UX Design Team'in üye sayısını yazdır
  Map<String, int> teamMemberCounts = {};
  for (var member in members) {
    String teamName = member.team.toString().split('.').last;
    if (!teamMemberCounts.containsKey(teamName)) {
      teamMemberCounts[teamName] = 1;
    } else {
      teamMemberCounts[teamName] = teamMemberCounts[teamName]! + 1;
    }
  }

  int uiUxDesignTeamCount =
      teamMemberCounts[Team.uiUxDesign.toString().split('.').last] ?? 0;
  print('UI/UX Design Team Üye Sayısı: $uiUxDesignTeamCount');

  // Task 3: Bir takımı parametre olarak alan ve o takımdaki üyelerin tam adlarını yazdıran bir fonksiyon oluştur
  void printTeamMembers(Team team) {
    List<String> teamMembers = members
        .where((member) => member.team == team)
        .map((member) => member.fullName)
        .toList();
    print('$team Takımı Üyeleri: $teamMembers');
  }

  // printTeamMembers(Team.flutterDevelopment);

  // Task 4: Bir üyenin takımına göre farklı eylemler gerçekleştiren bir switch ifadesi oluştur
  void performActionBasedOnTeam(NeonAcademyMember member) {
    switch (member.team) {
      case Team.flutterDevelopment:
        print('${member.fullName} bir yetenekli Flutter geliştiricidir');
        break;
      case Team.iOSDevelopment:
        print('${member.fullName} deneyimli bir iOS geliştiricidir');
        break;
      case Team.androidDevelopment:
        print('${member.fullName} yetenekli bir Android geliştiricidir');
        break;
      case Team.uiUxDesign:
        print('${member.fullName} yetenekli bir UI/UX tasarımcısıdır');
        break;
    }
  }

  // performActionBasedOnTeam(members[0]);

  // Task 5: Bir takımı ve bir yaş değerini parametre olarak alan ve o takımda belirtilen yaşın üstünde olan üyelerin tam adlarını yazdıran bir fonksiyon oluştur
  void printOlderTeamMembers(Team team, int age) {
    List<String> olderTeamMembers = members
        .where((member) => member.team == team && member.age > age)
        .map((member) => member.fullName)
        .toList();
    print('$team Takımında $age yaşından büyük üyeler: $olderTeamMembers');
  }

  //printOlderTeamMembers(Team.flutterDevelopment, 25);

// Task 6: Bir üyenin takımına göre terfi alan bir switch ifadesi oluştur
  void promoteMember(NeonAcademyMember member) {
    String newTitle;
    switch (member.team) {
      case Team.flutterDevelopment:
        newTitle = 'Kıdemli Flutter Geliştirici';
        break;
      case Team.iOSDevelopment:
        newTitle = 'Kıdemli iOS Geliştirici';
        break;
      case Team.androidDevelopment:
        newTitle = 'Kıdemli Android Geliştirici';
        break;
      case Team.uiUxDesign:
        newTitle = 'Tasarım Lideri';
        break;
    }
    print('${member.fullName} isimli üye $newTitle olarak terfi etti');
  }

  //promoteMember(members[1]);

// Task 7: Bir takımı parametre olarak alan ve o takımdaki üyelerin yaşlarının ortalamasını hesaplayan bir fonksiyon oluştur
  double calculateAverageAge(Team team) {
    List<int> teamAges = members
        .where((member) => member.team == team)
        .map((member) => member.age)
        .toList();
    if (teamAges.isEmpty) return 0;
    double averageAge =
        teamAges.reduce((value, element) => value + element) / teamAges.length;
    return averageAge;
  }

  // double averageAge = calculateAverageAge(Team.uiUxDesign);
  // print('UI/UX Design Takımının yaş ortalaması: $averageAge');

// Task 8: Bir takımı parametre olarak alan ve o takım için farklı mesajlar içeren bir switch ifadesi oluştur
  void printTeamMessage(Team team) {
    String message;
    switch (team) {
      case Team.flutterDevelopment:
        message = 'Flutter Development Takımı, akademimizin bel kemiğidir';
        break;
      case Team.iOSDevelopment:
        message =
            'iOS Development Takımı, akademimizde yenilikçi projeler üretir';
        break;
      case Team.androidDevelopment:
        message =
            'Android Development Takımı, mobil uygulama geliştirme konusunda uzmandır';
        break;
      case Team.uiUxDesign:
        message =
            'UI/UX Design Takımı, akademimizin tasarım yönünü şekillendirir';
        break;
    }
    print(message);
  }

  //printTeamMessage(Team.androidDevelopment);

  // Task 9: Bir takımı parametre olarak alan ve o takımdaki tüm üyelerin iletişim bilgilerini içeren bir dizi döndüren bir fonksiyon oluştur
  List<ContactInformation> getTeamContactInfo(Team team) {
    List<ContactInformation> teamContactInfo = members
        .where((member) => member.team == team)
        .map((member) => member.contactInformation)
        .toList();
    return teamContactInfo;
  }

  /* List<ContactInformation> contactInfo =
      getTeamContactInfo(Team.iOSDevelopment);
  print('iOS Development Takımının İletişim Bilgileri:');
  for (var info in contactInfo) {
    print('Telefon: ${info.phoneNumber}, E-posta: ${info.email}');
  } */

// Task 10: Bir üyenin takımına ve yaşına göre farklı eylemler gerçekleştiren bir switch ifadesi oluştur
  void performActionBasedOnTeamAndAge(NeonAcademyMember member) {
    switch (member.team) {
      case Team.flutterDevelopment:
        if (member.age > 23) {
          print('${member.fullName} deneyimli bir Flutter geliştiricidir');
        } else {
          print('${member.fullName} tasarım dünyasında yükselen bir yıldızdır');
        }
        break;
      case Team.iOSDevelopment:
        if (member.age > 24) {
          print('${member.fullName} deneyimli bir iOS geliştiricidir');
        } else {
          print(
              '${member.fullName} iOS geliştirme alanında gelecek vaad eden bir yetenektir');
        }
        break;
      case Team.androidDevelopment:
        if (member.age > 25) {
          print('${member.fullName} deneyimli bir Android geliştiricidir');
        } else {
          print(
              '${member.fullName} gelecek vaad eden bir Android geliştiricidir');
        }
        break;
      case Team.uiUxDesign:
        if (member.age > 22) {
          print('${member.fullName} deneyimli bir UI/UX tasarımcısıdır');
        } else {
          print('${member.fullName} tasarım dünyasında yükselen bir yıldızdır');
        }
        break;
    }
  }

  // performActionBasedOnTeamAndAge(members[2]);

// Task 11: UI/UX Tasarım Takımında 30 yaşından büyük olan üyelerin tam adlarını içeren bir dizi oluştur ve yazdır
  List<String> olderMembersInUiUxDesign = members
      .where((member) => member.team == Team.uiUxDesign && member.age > 30)
      .map((member) => member.fullName)
      .toList();
  print(
      'UI/UX Tasarım Takımında 30 yaşından büyük olan üyeler: $olderMembersInUiUxDesign');

// Task 12: Flutter Development Takımındaki üyelerin yaşlarının ortalamasını hesapla ve yazdır
  double flutterDevelopmentAverageAge =
      calculateAverageAge(Team.flutterDevelopment);
  print(
      'Flutter Development Takımının yaş ortalaması: $flutterDevelopmentAverageAge');
}
