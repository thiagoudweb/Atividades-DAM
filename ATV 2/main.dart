abstract class Livro {
  final String codigo;
  final String? autor;
  String _titulo;

  Livro({
    required this.codigo,
    required String titulo,
    this.autor,
  }) : _titulo = titulo.trim();

  String get titulo {
    return _titulo;
  }

  set titulo(String novoTitulo) {
    String tituloSemEspacos = novoTitulo.trim();

    if (tituloSemEspacos != '') {
      _titulo = tituloSemEspacos;
    }
  }

  String get descricao;
}

abstract class Emprestavel {
  bool get disponivel;

  bool emprestar();

  bool devolver();
}

class LivroFisico extends Livro implements Emprestavel {
  final int numeroPaginas;
  bool _estaDisponivel = true;

  LivroFisico({
    required String codigo,
    required String titulo,
    String? autor,
    required this.numeroPaginas,
  }) : super(
          codigo: codigo,
          titulo: titulo,
          autor: autor,
        );

  @override
  bool get disponivel {
    return _estaDisponivel;
  }

  @override
  bool emprestar() {
    if (_estaDisponivel == false) {
      return false;
    }

    _estaDisponivel = false;
    return true;
  }

  @override
  bool devolver() {
    if (_estaDisponivel == true) {
      return false;
    }

    _estaDisponivel = true;
    return true;
  }

  @override
  String get descricao {
    String nomeAutor = autor ?? 'Autor desconhecido';

    return 'Livro físico: $codigo, "$titulo", de $nomeAutor, '
        '$numeroPaginas páginas';
  }
}

class LivroDigital extends Livro {
  final double tamanhoMB;

  LivroDigital({
    required String codigo,
    required String titulo,
    String? autor,
    required this.tamanhoMB,
  }) : super(
          codigo: codigo,
          titulo: titulo,
          autor: autor,
        );

  @override
  String get descricao {
    String nomeAutor = autor ?? 'Autor desconhecido';

    return 'Livro digital: $codigo, "$titulo", de $nomeAutor, '
        '$tamanhoMB MB';
  }
}

extension ReferenciaLivro on Livro {
  String get referencia {
    String nomeAutor = autor ?? 'Autor desconhecido';

    return '$titulo - $nomeAutor';
  }
}

void main() {
  LivroFisico livroFisico = LivroFisico(
    codigo: 'F01',
    titulo: 'O Hobbit',
    autor: 'J. R. R. Tolkien',
    numeroPaginas: 310,
  );

  LivroDigital livroDigital = LivroDigital(
    codigo: 'D01',
    titulo: 'Duna',
    tamanhoMB: 2.4,
  );

  List<Livro> livros = [livroFisico, livroDigital];

  print('--- Catálogo ---');

  for (Livro livro in livros) {
    print(livro.descricao);
    print('Referência: ${livro.referencia}');
  }

  print('\n--- Alteração do título ---');

  livroFisico.titulo = '  O Hobbit: Uma Jornada Inesperada  ';
  print('Título depois de uma alteração válida: ${livroFisico.titulo}');

  livroFisico.titulo = '   ';
  print('Título depois de uma alteração em branco: ${livroFisico.titulo}');

  print('\n--- Empréstimo ---');

  print('Primeiro empréstimo: ${livroFisico.emprestar()}');
  print('Segundo empréstimo: ${livroFisico.emprestar()}');
  print('Está disponível? ${livroFisico.disponivel}');

  print('Devolução: ${livroFisico.devolver()}');
  print('Está disponível depois da devolução? ${livroFisico.disponivel}');
}