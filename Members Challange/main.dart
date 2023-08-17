import 'contact_information.dart';
import 'neon_academy.dart';

void main() {
  // NeonAcademyMember örnekleri oluştur ve üye bilgilerini doldur
  NeonAcademyMember member1 = NeonAcademyMember(
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
  );

  NeonAcademyMember member2 = NeonAcademyMember(
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
  );

  NeonAcademyMember member3 = NeonAcademyMember(
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
  );

  NeonAcademyMember member4 = NeonAcademyMember(
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
  );

  NeonAcademyMember member5 = NeonAcademyMember(
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
  );

  NeonAcademyMember member6 = NeonAcademyMember(
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
  );

  NeonAcademyMember member7 = NeonAcademyMember(
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
  );

  // Üyeleri bir diziye ekle
  List<NeonAcademyMember> members = [
    member1,
    member2,
    member3,
    member4,
    member5,
    member6,
    member7
  ];

  // Üyelerin bilgilerini kullanarak çıktı oluştur
  for (var member in members) {
    print('Full Name: ${member.fullName}');
    print('Title: ${member.title}');
    print('Horoscope: ${member.horoscope}');
    print('Member Level: ${member.memberLevel}');
    print('Home Town: ${member.homeTown}');
    print('Age: ${member.age}');
    print('-----------------------');
  }
}
