import 'package:flutter_multithread/my_service.dart';
import 'package:squadron/squadron.dart';

//
// Fortunately, Dart allows us to use [Conditional Importing] to import specific files per platform.
// In essence, Dart checks if it can use dart:io or dart:html (or another library) and imports the
// file that we have declared for it.
//
import 'my_service_worker_activator.dart' //stub file implementation
    if (dart.library.js) 'package:flutter_multithread/worker/browser/my_service_worker_activator.dart'
    if (dart.library.html) 'package:flutter_multithread/worker/browser/my_service_worker_activator.dart'
    if (dart.library.io) 'package:flutter_multithread/worker/vm/my_service_worker_activator.dart';

class MyServiceWorkerPool extends WorkerPool<MyServiceWorker>
    implements MyService {
  MyServiceWorkerPool() : super(createWorker);

  @override
  Future<String> computeHeavyMethod(int n) =>
      execute((worker) => worker.computeHeavyMethod(n));
}

class MyServiceWorker extends Worker implements MyService {
  MyServiceWorker(dynamic entryPoint, {List args = const []})
      : super(entryPoint, args: args);

  @override
  Future<String> computeHeavyMethod(int n) =>
      send(MyService.operationCommand, args: [n]);
}
