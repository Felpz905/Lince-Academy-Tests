import 'dart:math' as math;

// Considerando o objetivo do programa, efetue uma refatoração utilizando os conceitos de orientação a objetos, completando
// os requisitos especificados abaixo, utilizando comentarios para demarcar no código onde os objetivos foram atingidos.
//
// 1. Criar novos fornecedores: sanduiches, bolos, saladas, petiscos, ultra-caloricos
// 2. Alterar o programa para escolher um novo fornecedor aleatoriamente para cada "refeição"
// 3. Nas informações da pessoa, adicione uma lógica "status" do nivel de calorias (dica: utilizar um enum)
// 1. Calorias <= 500 : Deficit extremo de calorias;
// 2. 500 > Calorias < 1800 : Deficit de calorias;
// 3. 1800 > Calorias < 2500 : Pessoa está satisfeita;
// 4. Calorias > 2500 : Excesso de calorias;
// 4. Altere o programa para definir um nivel inicial de calorias aleatoriamente ao instanciar uma pessoa;
// 5. Altere o programa para se basear no nivel de calorias para definir se a pessoa precisa de refeições
// 6. Imprima o número de refeições realizadas nas informações da pessoa;

void main() {
  final pessoa = Pessoa();
  int calorias = math.Random().nextInt(6000);
  int caloriasConsumidas = 0;

  while (calorias < 2000) {
    calorias = math.Random().nextInt(6000);
  }

  while (calorias > caloriasConsumidas) {
    final fornecedor = aleatorio();
    // Consumindo produtos fornecidos
    for (var i = 0; i < 5; i++) {
      caloriasConsumidas = pessoa.refeicao(fornecedor);
    }
  }

  pessoa.informacoes(calorias);
}

enum Status {
  DeficitExtremoDeCalorias,
  DeficitDeCalorias,
  PessoaEstaSatisfeita,
  ExcessoDeCalorias,
}

Fornecedor aleatorio() {
  final fornecedores = <Fornecedor>[
    FornecedorDeBebidas(),
    FornecedorDeBolos(),
    FornecedorDePetiscos(),
    FornecedorDeSaladas(),
    FornecedorDeSanduiche(),
    FornecedorDeUltraCal(),
  ];

  final random = math.Random();

  return fornecedores[random.nextInt(
    fornecedores.length,
  )];
}

class Produto {
  Produto(this.nome, this.calorias);

  /// Nome deste produto
  final String nome;

  /// Total de calorias
  final int calorias;
}

class Fornecedor {
  Produto fornecer() {
    final random = math.Random();
    return [][random.nextInt([].length)];
  }
}

class FornecedorDeBebidas extends Fornecedor {
  final bebidasDisponiveis = <Produto>[
    Produto('Agua', 0),
    Produto('Refrigerante', 200),
    Produto('Suco de fruta', 100),
    Produto('Energetico', 135),
    Produto('Café', 60),
    Produto('Cha', 35),
  ];

  Produto fornecer() {
    final random = math.Random();
    return bebidasDisponiveis[random.nextInt(bebidasDisponiveis.length)];
  }
}

class FornecedorDeSanduiche extends Fornecedor {
  final sanduichesDisponiveis = <Produto>[
    Produto('Sanduiche De presunto', 0),
    Produto('Sanduiche De queijo', 130),
    Produto('Sanduiche Misto', 100),
    Produto('Sanduiche Com requeijao', 135),
    Produto('Sanduiche Com margarina', 75),
    Produto('Sanduiche Com Hamburguer', 300),
  ];

  Produto fornecer() {
    final random = math.Random();
    return sanduichesDisponiveis[random.nextInt(sanduichesDisponiveis.length)];
  }
}

class FornecedorDeSaladas extends Fornecedor {
  final saladasDisponiveis = <Produto>[
    Produto('Rucula', 0),
    Produto('Agriao', 200),
    Produto('Tomate', 125),
    Produto('Alface', 75),
    Produto('Cenoura', 60),
    Produto('Pepino', 35),
  ];

  Produto fornecer() {
    final random = math.Random();
    return saladasDisponiveis[random.nextInt(saladasDisponiveis.length)];
  }
}

class FornecedorDePetiscos extends Fornecedor {
  final petiscosDisponiveis = <Produto>[
    Produto('Linguicinha', 10),
    Produto('Batata frita', 235),
    Produto('Coracao', 100),
    Produto('Frango na chapa', 135),
    Produto('Queijinho de churras', 80),
    Produto('Pao de alho', 12),
  ];

  Produto fornecer() {
    final random = math.Random();
    return petiscosDisponiveis[random.nextInt(petiscosDisponiveis.length)];
  }
}

class FornecedorDeUltraCal extends Fornecedor {
  final ultraCalDisponiveis = <Produto>[
    Produto('Lasanha', 500),
    Produto('X-burguer', 125),
    Produto('Pizza', 100),
    Produto('Prenssadao', 130),
    Produto('Nuggets', 60),
    Produto('Chocolate', 35),
  ];

  Produto fornecer() {
    final random = math.Random();
    return ultraCalDisponiveis[random.nextInt(ultraCalDisponiveis.length)];
  }
}

class FornecedorDeBolos extends Fornecedor {
  final bolosDisponiveis = <Produto>[
    Produto('Bolo De morango', 1000),
    Produto('Bolo De milho', 200),
    Produto('Bolo De cenoura', 100),
    Produto('Bolo De Café', 135),
    Produto('Bolo De chocolate', 60),
    Produto('Bolo De Baunilha', 35),
  ];

  Produto fornecer() {
    final random = math.Random();
    return bolosDisponiveis[random.nextInt(bolosDisponiveis.length)];
  }
}

class Pessoa {
  // Acumulador de calorias
  int _caloriasConsumidas = 0;

  Status? status;

  int refeicoes = 0;

  /// Imprime as informações desse consumidor
  void informacoes(int cal) {
    switch (status) {
      case Status.DeficitExtremoDeCalorias:
        print('Deficit coma muito mais\n');
        break;
      case Status.DeficitDeCalorias:
        print('Deficit coma mais\n');
        break;
      case Status.PessoaEstaSatisfeita:
        print('Está dibas\n');
        break;
      case Status.ExcessoDeCalorias:
        print('Comeu demais\n');
        break;
      default:
        print('Sei lá\n');
    }
    print('Caloria base: $cal');
    print('\nCalorias consumidas: $_caloriasConsumidas');
    print('\nRefeições: $refeicoes');
  }

  /// Consome um produto e aumenta o numero de calorias
  int refeicao(Fornecedor fornecedor) {
    final produto = fornecedor.fornecer();
    print('Consumindo ${produto.nome} (${produto.calorias} calorias)');

    _caloriasConsumidas += produto.calorias;
    if (_caloriasConsumidas <= 500) {
      status = Status.DeficitExtremoDeCalorias;
    } else if (_caloriasConsumidas > 500 && _caloriasConsumidas <= 1800) {
      status = Status.DeficitDeCalorias;
    } else if (_caloriasConsumidas > 1800 && _caloriasConsumidas <= 2500) {
      status = Status.PessoaEstaSatisfeita;
    } else if (_caloriasConsumidas > 2500) {
      status = Status.ExcessoDeCalorias;
    }

    refeicoes++;
    return _caloriasConsumidas;
  }
}
