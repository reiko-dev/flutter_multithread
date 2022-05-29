import 'package:flutter_multithread/my_service.dart';
import 'package:squadron/squadron_service.dart';

void start(Map command) => run((_) => MyServiceImpl(), command);
