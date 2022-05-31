**INTRO**

Flutter has Isolates and the compute method, but these functionalities don't work on the web the same way they work on mobile or desktop platforms. Basically, in a Flutter web app, the Isolates and compute method runs on the same thread as the Flutter UI, which means that if you have some compute-heavy processing in your app, the UI might freeze , unfortunately.

Now we have a question, how to achieve isolated functionality on the web? The short answer is: with WebWorkers.

WebWorkers are just a way to run scripts on background threads on the web. The worker thread can perform tasks without interfering with the UI. Once created, a worker can send messages to the JavaScript code that created it by posting messages to an event handler specified by that code (and vice versa). Simply put, a web worker runs on a background thread and can send and receive messages from the Javascript code that created it. Perfect!

To make this simpler, we could use a package that involves some of the complexity of that, why not, right? Here comes the Squadron package.

In summary, the Squadron package wraps a set of service methods in a cross-platform Worker, allowing seamless access to the service API of Native and Browser platforms.


_**Fonts:**_

_**Dart/Flutter concurrency:**_
1. _[Flutter.dev](https://docs.flutter.dev/cookbook/networking/background-parsing#4-move-this-work-to-a-separate-isolate)_
2. _[Medium](https://medium.com/dartlang/dart-asynchronous-programming-isolates-and-event-loops-bffc3e296a6a)_
3. _[Flutter Youtube channel](https://www.youtube.com/watch?v=vl_AaCgudcY)_
4. _[dart.dev](https://dart.dev/guides/language/concurrency)_

_**Web worker**_

5. _[mozilla](https://developer.mozilla.org/en-US/docs/Web/API/Web_Workers_API/Using_web_workers)_
6. _[w3schools](https://www.w3schools.com/html/html5_webworkers.asp)_

_**Squadron package:**_

7. _https://pub.dev/packages/squadron_

_**Dart to Javascript:**_

8. _https://dart.dev/tools/dart-compile_
9. _https://dart.dev/tools/dart2js#options_

_**Conditional Importing:**_

10. _https://gpalma.pt/](https://gpalma.pt/blog/conditional-importing/)_
11. _https://dart.dev/](https://dart.dev/guides/libraries/create-library-packages#conditionally-importing-and-exporting-library-files)_
12. _https://medium.com/](https://medium.com/flutter-community/conditional-imports-across-flutter-and-web-4b88885a886e)_
13. _[Flutter-community](https://medium.com/flutter-community/conditional-imports-across-flutter-and-web-4b88885a886e)_
