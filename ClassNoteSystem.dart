import 'dart:io';

void main() {
String result;
double sum=0;
double classAverage=0;

  print("Kaç öğrenciniz var?");
  int? number = int.tryParse(stdin.readLineSync()!);

  if (number == null || number <= 0) 
  {
    print("Geçerli bir sayı girmediniz.");
    return;
  }

  Map<String, Map<String, dynamic>> studentInformation = {};

  for (int i = 1; i <= number; i++) 
  {
    print("$i. öğrencinin adını girin:");
    String? name = stdin.readLineSync();

    if (name == null || name.isEmpty ||!RegExp(r"^[a-zA-ZğüşöçıİĞÜŞÖÇ\s]+$").hasMatch(name)) 
    {
      print("Geçersiz isim. Bu öğrenci atlandı.");
      continue;
    }

    print("$name'in Matematik notunu girin:");
    int? mathematic = int.tryParse(stdin.readLineSync()!);

    print("$name'in Türkçe notunu girin:");
    int? turkish = int.tryParse(stdin.readLineSync()!);

    if (mathematic == null || turkish == null) 
    {
      studentInformation[name] = {
        "ortalama":"",
        "durum": "Not girilmemiş"
      };
      continue;
    }

    double average = (mathematic + turkish) / 2;
    if (average >= 0 && average < 50) 
    {
    result = "Kaldı";
    } 
    else if (average >= 50 && average <= 100) 
    {
    result = "Geçti";
    } 
    else 
    {
    result = "Not Yok";
    }


    studentInformation[name] = {
      "ortalama": average,
      "durum": result
    };
    sum=average+sum;
    classAverage=sum/studentInformation.length;


  }

  print("Öğrenci-Ortalama-Durum Listesi:");
  studentInformation.forEach((namenew, info) {
    print("$namenew:${info["ortalama"]} -> ${info["durum"]}");
  });
  print("sınıf ortalaması=$classAverage");
  
}
