import 'dart:math' as math;

void main() {
  final meioDeComunicacao = aleatorio();
  meioDeComunicacao.fazerLigacao('(47) 99876-5432');
}

MeioDeComunicacao aleatorio() {
  final meiosDeComunicacao = <MeioDeComunicacao>[
    Telefone(),
    Celular(),
    Orelhao(),
  ];

  final random = math.Random();

  return meiosDeComunicacao[random.nextInt(
    meiosDeComunicacao.length,
  )];
}

class MeioDeComunicacao {
  void fazerLigacao (String numero) {
    print('${toString()} Ligando para $numero');
  }
}

class Telefone extends MeioDeComunicacao {
  @override
  String toString () {
    return '[TELEFONE]';
  }
}

class Celular extends MeioDeComunicacao {
  @override
  String toString () {
    return '[CELULAR]';
  }
}

class Orelhao extends MeioDeComunicacao {
  @override
  String toString () {
    return '[ORELHAO]';
  }
}


