import 'dart:io';

enum Priority {dusuk,orta,yuksek}

class Task{
  final int id;
  final String title;
  final String? description;  
  final Priority priority;
  bool isDone;  
  final DateTime createdAt;

  Task({
  required this.id,
  required this.title,
  this.description,
  required this.priority,
  this.isDone=false,
  required this.createdAt,
});
}

void printAllTasks(List<Task>taskList)
{
  print("tüm görevler");
  for(var task in taskList)
  {
    String durum="";
    if(task.isDone)
    {
      durum="tamamlandı";
    }
    else
    {
      durum="devam ediyor";
    }
    String oncelik=task.priority.name;
    String tarih = "${task.createdAt.day.toString().padLeft(2, '0')}-${task.createdAt.month.toString().padLeft(2, '0')}-${task.createdAt.year}"; //


    print(
        "[${task.id}] ${task.title} - Öncelik: $oncelik - Durum: $durum - Tarih: $tarih");
  }
  print("");

}




void markTaskAsDone(List<Task> taskList, int id)
{
  bool check=false;
  for (var task in taskList) {
    if(task.id==id)
    {
      task.isDone=true;
      check=true;
      print('görev [${task.id}]"${task.title}" tamamlandı olarak işaretlendi.\n');
      break;
    }
    
  }
  if(!check)
  {
    print("görev bulunamadı: ID= $id\n");
  }
}




void printCompletedTasks(List<Task> taskList)
{
  print("tamamlanan görevler");
  List<Task> completedTasks = [];


  for (var task in taskList) {
    if (task.isDone) {
      completedTasks.add(task);
    }
  }
    if (completedTasks.isEmpty) {
      print("hiç tamamlanan görev yok.");
    }
    else{
      for (var task in completedTasks) {
        print("[${task.id}] ${task.title} - öncelik: ${task.priority.name}");
      }
    }
  
  print("");
}


void sortTasksByPriority(List<Task> taskList) {    //bubble sort ile yapıldı
  for (int i = 0; i < taskList.length - 1; i++) {
    for (int j = 0; j < taskList.length - i - 1; j++) 
    {
      if (taskList[j].priority.index > taskList[j + 1].priority.index) {
        Task temp = taskList[j];
        taskList[j] = taskList[j + 1];
        taskList[j + 1] = temp;
      }
    }
  }
  print("Görevler önceliğe göre sıralandı (düşük→yüksek).\n");
}



void main() {
  List<Task> taskList = [];

  while (true) {
    print("Yapmak istediğiniz işlemi seçin:");
    print("[1] Görev oluştur");
    print("[2] Tüm Görevleri Listele");
    print("[3] Tamamlanan görevleri listele");
    print("[4] Görevleri önceliğe göre sırala");
    print("[5] Görevi tamamlandı olarak işaretle");
    print("[0] Çıkış");

    int? number = int.tryParse(stdin.readLineSync()!);

    if (number == 0) {
      print("Güle güle");
      break;
    }

    if (number == 1) {
      print("Görev başlığını girin:");
      String? title = stdin.readLineSync();

      print("Öncelik girin: (1 = dusuk, 2 = orta, 3 = yuksek)");
      int? p = int.tryParse(stdin.readLineSync()!);
      Priority priority;
      if (p == 1) {
        priority = Priority.dusuk;
      } else if (p == 2) {
        priority = Priority.orta;
      } else {
        priority = Priority.yuksek;
      }

      print("Tarih girin (örnek: 01-02-2025):");
      String? dateInput = stdin.readLineSync();
      DateTime createdAt;
      List<String> parts = dateInput!.split('-');
      int day = int.parse(parts[0]);
      int month = int.parse(parts[1]);
      int year = int.parse(parts[2]);
      createdAt = DateTime(year, month, day);
      
     


      int id = taskList.length + 1;

      Task newTask = Task(
        id: id,
        title: title!,
        priority: priority,
        createdAt: createdAt,
      );
      taskList.add(newTask);

      print("Görev başarıyla eklendi!\n");
    }

    else if (number == 2) {
      printAllTasks(taskList);
    }

    else if (number == 3) {
      printCompletedTasks(taskList);
    }

    else if (number == 4) {
      sortTasksByPriority(taskList);
      printAllTasks(taskList);
    }

    else if (number == 5) {
      print("Tamamlandı olarak işaretlenecek görevin ID'sini girin:");
      int? id = int.tryParse(stdin.readLineSync()!);
      if (id != null) {
        markTaskAsDone(taskList, id);
      } else {
        print("Geçerli bir sayı girilmedi.\n");
      }
    }

    else {
      print("Geçersiz seçim. Lütfen 0-5 arası bir sayı girin.");
    }
  }
}
