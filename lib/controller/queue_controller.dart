import 'package:mais_saude/model/queue_model.dart';

class QueueController {
  static int _waitingPeopleCount = 0;

  final QueueModel queueModel;

  QueueController()
      : queueModel = QueueModel(
          userNumber: _generateUserNumber(),
          waitingPeople: _calculateWaitingPeople(),
          estimatedTime: _calculateEstimatedTime(),
        );

  static int _generateUserNumber() {
    // Gera um número aleatório de 3 dígitos para o usuário
    return 100 + (DateTime.now().millisecondsSinceEpoch % 900);
  }

  static int _calculateWaitingPeople() {
    // Incrementa o número de pessoas esperando a cada novo usuário
    _waitingPeopleCount++;
    return _waitingPeopleCount;
  }

  static int _calculateEstimatedTime() {
    // Calcula o tempo estimado com base no número de pessoas esperando
    return _waitingPeopleCount * 20; // 20 minutos por pessoa
  }

  QueueModel getQueueData() {
    return queueModel;
  }
}
