abstract class Matematika {
  int hasil();
}

class KelipatanPersekutuanTerkecil implements Matematika {
  int x = 0;
  int y = 0;

  @override
  int hasil() {
    int _xTemp = x;
    int _yTemp = y;
    while (_xTemp != _yTemp) {
      if (_xTemp < _yTemp) {
        _xTemp += x;
      } else {
        _yTemp += y;
      }
      if (_xTemp == _yTemp) {
        return _xTemp;
      }
    }
    return 0;
  }
}

class FaktorPersekutuanTerbesar implements Matematika {
  int x = 0;
  int y = 0;

  @override
  int hasil() {
    int hasil = 1;
    for (int i = 1; i <= x && i <= y; i++) {
      if (x % i == 0 && y % i == 0) {
        hasil = i;
      }
    }
    return hasil;
  }
}

void main() {
  KelipatanPersekutuanTerkecil operation = KelipatanPersekutuanTerkecil();
  operation.x = 6;
  operation.y = 4;
  print(operation.hasil());

  FaktorPersekutuanTerbesar operation2 = FaktorPersekutuanTerbesar();
  operation2.x = 120;
  operation2.y = 180;
  print(operation2.hasil());
}
