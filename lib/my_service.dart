import 'dart:math';

import 'package:squadron/squadron.dart';

abstract class MyService implements WorkerService {
  static const operationCommand = 1;

  Future<String> computeHeavyMethod(int n);
}

class MyServiceImpl implements MyService {
  @override
  Future<String> computeHeavyMethod(int n) async {
    return _heavyMethod(n);
  }

  ///returns [n] digits of `pi` as hexadecimal values.
  static String _heavyMethod(int n) {
    final end = n;
    var i = 0;
    String result = "";
    while (i < end) {
      result += _getNth(i).toRadixString(16);
      i++;
      if (i >= end) break;
    }
    result = result.replaceRange(1, 1, ".");
    return result;
  }

  static int _getNth(int n) {
    if (n < 0) return -1;
    n -= 1;
    double x =
        4 * _piTerm(1, n) - 2 * _piTerm(4, n) - _piTerm(5, n) - _piTerm(6, n);
    x = x - x.floor();
    return (x * 16).toInt();
  }

  static double _piTerm(int j, int n) {
    // Calculate the left sum
    double s = 0;
    int r = j;
    for (int k = 0; k <= n; k++) {
      s += _powMod(16, n - k, r) / r;
      s = s - s.floor();
      r += 8;
    }
    // Calculate the right sum
    double t = 0;
    int k = n + 1;
    // Keep iterating until t converges (stops changing)
    r = 8 * k + j;
    while (true) {
      double newt = t + pow(16, n - k) / r;
      if (t == newt) {
        break;
      } else {
        t = newt;
      }
      k++;
      r += 8;
    }
    return s + t;
  }

  static int _powMod(int a, int b, int m) {
    int tempo;
    if (b == 0) {
      tempo = 1;
    } else if (b == 1) {
      tempo = a;
    } else {
      int temp = _powMod(a, b ~/ 2, m);
      if (b % 2 == 0) {
        tempo = (temp * temp) % m;
      } else {
        tempo = ((temp * temp) % m) * a % m;
      }
    }
    return tempo;
  }

  @override
  late final Map<int, CommandHandler> operations = {
    MyService.operationCommand: (r) => computeHeavyMethod(r.args[0]),
  };
}
