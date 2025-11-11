import 'dart:convert';

class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }

  // Método para converter Dependente em JSON
  Map<String, dynamic> toJson() {
    return {
      'nome': _nome,
    };
  }
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    this._nome = nome;
    this._dependentes = dependentes;
  }

  Map<String, dynamic> toJson() {
    return {
      "nome": _nome,
      "dependentes": _dependentes.map((d) => d.toJson()).toList(),
    };
  }
}

class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(String nomeprojeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeprojeto;
    _funcionarios = funcionarios;
  }

  Map<String, dynamic> toJson() {
    return {
      'nomeProjeto': _nomeProjeto,
      'funcionarios':
          _funcionarios.map((f) => f.toJson()).toList(), 
    };
  }
}

void main() {
  Dependente dependente1 = Dependente("Lara");
  Dependente dependente2 = Dependente("Odílio");
  Dependente dependente3 = Dependente("Kamylly");

  Funcionario funcionario1 = Funcionario("Alyne", [dependente1, dependente3]);
  Funcionario funcionario2 = Funcionario("Lorran", [dependente2, dependente3]);

  List<Funcionario> listaDeFuncionarios = [funcionario1, funcionario2];

  EquipeProjeto projecCyberDivos =
      EquipeProjeto("Projeto APPEC", listaDeFuncionarios);

  // Convertendo para JSON
  String jsonString = jsonEncode(projecCyberDivos.toJson());

  // Printando a string JSON
  print(jsonString);
}
