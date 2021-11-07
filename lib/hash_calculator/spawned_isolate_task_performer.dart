import 'dart:async';
import 'dart:isolate';

import 'package:lecture_2_hometask_starter/hash_calculator/heavy_task_performer.dart';
import 'package:lecture_2_hometask_starter/helpers/random_number_hash_calculator.dart';


class SpawnedIsolateTaskPerformer implements HeavyTaskPerformer {

    Isolate? isolate;

    final _completer = Completer<String>();

    static String _randomHashNumber(int n) {
      return RandomNumberHashCalculator().calculateRandomNumberHash(iterationsCount: n);
    }
    
    @override
    Future<String> doSomeHeavyWork() async {

      try {
        final spawnerReceivePort = ReceivePort();
        isolate = await Isolate.spawn(
          _establishCommunicationWithSpawner,
          spawnerReceivePort.sendPort,
        );

        spawnerReceivePort.listen((message) {
          if (message is SendPort) {
            message.send(_randomHashNumber);
          } else if (message is String) {
            _completer.complete(message);
          }
        });
      } catch (e) {
        _completer.completeError(e);
      }

      return _completer.future;
    }


    static void _establishCommunicationWithSpawner(SendPort spawnerSendPort) {
      final ReceivePort spawneeReceivePort = ReceivePort();
      spawnerSendPort.send(spawneeReceivePort.sendPort);

      spawneeReceivePort.listen((message) {
        if (message is int) {
          final result = _randomHashNumber(message);
          spawnerSendPort.send(result);

          spawneeReceivePort.close();
        }
      });
    }
}
