import 'my_service_worker_pool.dart' show MyServiceWorker;

MyServiceWorker createWorker() =>
    throw UnsupportedError('Not supported on this platform');

String get workerPlatform => 'Unsupported';
