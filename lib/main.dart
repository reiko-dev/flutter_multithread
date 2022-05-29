import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multithread/worker/my_service_worker_pool.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int digits = 0;
  String result = "";
  bool isLoading = false;

  Stopwatch? timer;
  void calculatePi() async {
    if (digits <= 0) return;
    timer = Stopwatch()..start();
    setState(() {
      result = "";
      isLoading = true;
    });

    result = await MyServiceWorkerPool().computeHeavyMethod(digits);

    setState(() {
      timer!.stop();
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Enter the number of pi digits to calculate:',
                ),
                Center(
                  child: SizedBox(
                    width: 100,
                    child: TextField(
                      textAlign: TextAlign.center,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onChanged: (val) {
                        if (int.tryParse(val) != null) {
                          setState(() {
                            digits = int.parse(val);
                          });
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        if (timer != null)
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                                "Elapsed time (in ms): ${timer!.elapsedMilliseconds}"),
                          ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: SelectableText(
                              result.isEmpty ? '' : result,
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: calculatePi,
        tooltip: 'Calculates',
        child: const Text("Run"),
      ),
    );
  }
}
