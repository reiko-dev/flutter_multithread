import '../my_service_worker_pool.dart' show MyServiceWorker;

MyServiceWorker createWorker() =>
    MyServiceWorker('/workers/my_service_worker.dart.js');

String get workerPlatform => 'browser';
