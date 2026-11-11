enum Classificacao { semAvaliacoes, baixa, regular, alta }

void main() {
  const notaMinima = 1;
  const notaMaxima = 5;
  const notaPositiva = 4;

  // Todas as notas recebidas representam números inteiros.
  // Algumas estão fora do intervalo permitido.
  final notasRecebidas = <String, List<String>>{
    'Agenda UFAPE': ['5', '4', '5', '0', '3', '6'],
    'Biblioteca Digital': ['3', '2', '4', '1'],
    'Mapa do Campus': [],
    'Restaurante Universitário': ['5', '5', '4', '4', '5'],
    'Transporte Universitário': ['0', '6', '-1'],
  };

  final categoriasPorApp = <String, String>{
    'Agenda UFAPE': 'Organização',
    'Biblioteca Digital': 'Serviços',
    'Mapa do Campus': 'Localização',
    'Restaurante Universitário': 'Serviços',
    'Transporte Universitário': 'Serviços',
  };

  final contatosPorApp = <String, String?>{
    'Agenda UFAPE': 'agenda@exemplo.com',
    'Biblioteca Digital': null,
    'Mapa do Campus': 'mapa@exemplo.com',
    'Restaurante Universitário': 'ru@exemplo.com',
    // Transporte Universitário não possui chave neste mapa.
  };

  final notasValidasPorApp = <String, List<int>>{};
  final descartadasPorApp = <String, int>{};
  final categoriasUnicas = <String>{};

  // QUESTÃO 1 — PREPARAÇÃO DOS DADOS

  for (final entrada in notasRecebidas.entries) {
    final app = entrada.key;
    final textos = entrada.value;
    final validas = <int>[];
    int descartadas = 0;

    for (final texto in textos) {
      final numero = int.parse(texto);
      if (numero >= notaMinima && numero <= notaMaxima) {
        validas.add(numero);
      } else {
        descartadas += 1;
      }
    }

    notasValidasPorApp[app] = validas;
    descartadasPorApp[app] = descartadas;
  }

  for (final categoria in categoriasPorApp.values) {
    categoriasUnicas.add(categoria);
  }



  // QUESTÃO 2 — RELATÓRIO

  print('RELATÓRIO DE AVALIAÇÕES');
  print('======================');

  for (final entrada in notasValidasPorApp.entries) {
    final app = entrada.key;
    final notas = entrada.value;
    final descartadas = descartadasPorApp[app];
    final categoria = categoriasPorApp[app];
    final contato = contatosPorApp[app] ?'não inserido';

    Classificacao classificacao;
    String textoMedia;
    String textoPositivas;

    if (notas.isEmpty) {
      classificacao = Classificacao.semAvaliacoes;
      textoMedia = 'não foi calculada';
      textoPositivas = 'não foi calculado';
   
    } else {
      int soma = 0;
      int positivas = 0;

      for (final nota in notas) {
        soma += nota;
        if (nota >= notaPositiva) {
          positivas += 1;
        }
      }

      final media = soma / notas.length;
      final percentual = positivas * 100 / notas.length;

      textoMedia = media.toStringAsFixed(2);
      textoPositivas = '${percentual.toStringAsFixed(1)}%';

      if (media < 3) {
        classificacao = Classificacao.baixa;
      
      } else if (media < 4) {
        classificacao = Classificacao.regular;
     
      } else {
        classificacao = Classificacao.alta;
     
      }
    }

    String textoClassificacao = '';
    switch (classificacao) {
     
      case Classificacao.semAvaliacoes:
        textoClassificacao = 'sem avaliação';
     
      case Classificacao.baixa:
        textoClassificacao = 'baixa';
     
      case Classificacao.regular:
        textoClassificacao = 'media';
     
     case Classificacao.alta:
        textoClassificacao = 'alta';
    }

    print('\n$app');
    print('  Categoria: $categoria');
    print('  Contato: $contato');
    print('  Notas válidas: ${notas.length}');
    print('  Notas descartadas: $descartadas');
    print('  Média: $textoMedia');
    print('  Notas positivas: $textoPositivas');
    print('  Classificação: $textoClassificacao');
  }

  print('\nCATEGORIAS ENCONTRADAS');

  categoriasUnicas.forEach((categoria) {
    print('- $categoria');
  });
}


