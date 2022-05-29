import '../my_service_worker_pool.dart' show MyServiceWorker;

import 'my_service_worker.dart' as isolate;

MyServiceWorker createWorker() => MyServiceWorker(isolate.start);

String get workerPlatform => 'vm';
