double medyaniBul(List<int> liste1, List<int> liste2) {
  if (liste1.length > liste2.length) {
    return medyaniBul(liste2, liste1);
  }

  int kisa = liste1.length;
  int uzun = liste2.length;
  int bas = 0;
  int son = kisa;

  while (bas <= son) {
    int kes1 = (bas + son) ~/ 2;
    int kes2 = (kisa + uzun + 1) ~/ 2 - kes1;

    int sol1;
    if (kes1 == 0) {
      sol1 = -1000000;
    } else {
      sol1 = liste1[kes1 - 1];
    }

    int sag1;
    if (kes1 == kisa) {
      sag1 = 1000000;
    } else {
      sag1 = liste1[kes1];
    }

    int sol2;
    if (kes2 == 0) {
      sol2 = -1000000;
    } else {
      sol2 = liste2[kes2 - 1];
    }

    int sag2;
    if (kes2 == uzun) {
      sag2 = 1000000;
    } else {
      sag2 = liste2[kes2];
    }

    if (sol1 <= sag2) {
      if (sol2 <= sag1) {
        if ((kisa + uzun) % 2 == 0) {
          int solMax;
          if (sol1 > sol2) {
            solMax = sol1;
          } else {
            solMax = sol2;
          }

          int sagMin;
          if (sag1 < sag2) {
            sagMin = sag1;
          } else {
            sagMin = sag2;
          }

          return (solMax + sagMin) / 2.0;
        } else {
          if (sol1 > sol2) {
            return sol1.toDouble();
          } else {
            return sol2.toDouble();
          }
        }
      } else {
        bas = kes1 + 1;
      }
    } else {
      son = kes1 - 1;
    }
  }

  throw Exception("Bir hata oluştu");
}
