# Template para Dissertação de Mestrado da UnB

Este repositório contém um template para dissertação de mestrado da Universidade de Brasília (UnB). Abaixo estão descrições detalhadas dos arquivos `.tex` e como modificá-los para atender a necessidades específicas.
## Download Direto

Para obter a versão mais recente deste template, você pode:

1. Baixar o arquivo ZIP diretamente através do link:  
  [TemplateDissertacaoUnB-main.zip](https://github.com/SaganGromov/TemplateDissertacaoUnB/archive/refs/heads/main.zip)

2. Ou clonar o repositório via Git:
  ```bash
  git clone https://github.com/SaganGromov/TemplateDissertacaoUnB.git
  ```

---

## Estrutura do Template

### Arquivos Principais

1. **`thesis.tex`**  
   Este é o arquivo principal que compila toda a dissertação. Ele inclui os capítulos, preâmbulo e configurações gerais.  
   - **Modificações principais**:
     - Para alterar o estilo de referências cruzadas (ex.: equações, teoremas), edite as definições de `\crefname` e `\creflabelformat` neste arquivo.
     - Para adicionar ou remover capítulos, modifique os comandos `\include{}`.

2. **`thesis-info.tex`**  
   Contém informações de autoria, título, orientador, coorientador, data, e outros metadados.  
   - **Modificações principais**:
     - Edite este arquivo para personalizar as informações de autoria e título da dissertação.

3. **`PhDThesisPSnPDF.cls`**  
   Este arquivo define o estilo do documento.  
   - **Modificações principais**:
     - Para alterar as barras horizontais pretas acima e abaixo do título, edite a partir da linha 922.
     - Para ajustar margens, fontes ou outros estilos globais, modifique este arquivo.

4. **`pref/pref.tex`**  
   Contém o prefácio da dissertação.  
   - **Modificações principais**:
     - Edite este arquivo para adicionar um prefácio personalizado.

5. **`acknowledgement/acknowledgement.tex`**  
   Contém os agradecimentos.  
   - **Modificações principais**:
     - Personalize este arquivo para incluir agradecimentos específicos.

6. **`abstract/abstract.tex`**  
   Contém o resumo/abstract da dissertação.  
   - **Modificações principais**:
     - Edite este arquivo para adicionar o resumo em português e/ou inglês.

7. **`preamble/preamble.tex`**  
   Contém configurações gerais, como pacotes e comandos personalizados.  
   - **Modificações principais**:
     - Adicione ou remova pacotes conforme necessário.
     - Defina comandos personalizados para uso em toda a dissertação.

8. **`assets/codigo_segunda_pagina/sec.tex`**  
   Este arquivo é usado para compilar a segunda página da dissertação, que geralmente contém informações institucionais e de apresentação.  
   - **Modificações principais**:
     - Edite este arquivo para personalizar o conteúdo da segunda página, como título, autor, data e membros da banca.
     - Certifique-se de que ele está incluído corretamente no arquivo `thesis.tex` com o comando:
       ```tex
       \includepdf[pages=1, pagecommand={{}}]{assets/codigo_segunda_pagina/sec.pdf}
       ```

---

## Capítulos e Seções

Os capítulos estão organizados em subdiretórios e podem ser incluídos ou removidos no arquivo `thesis.tex` usando o comando `\include{}`.

---

## Instruções para Incluir Teoremas, Observações e Outros Elementos

Os estilos para teoremas, observações, definições e outros elementos estão definidos nos arquivos `preamble/preamble.tex`, `preamble/config.tex` e `preamble/notation.tex`. Abaixo estão exemplos de como utilizá-los:

### Teoremas
Para incluir um teorema, utilize o ambiente `teorema`:
```tex
\begin{teorema}
Seja $\mm^3$ uma variedade diferenciável fechada. Então $\mm^3$ é homeomorfa a $\mathbb{S}^3$.
\end{teorema}
```

### Observações
Para incluir uma observação, utilize o ambiente `oobs`:
```tex
\begin{oobs}
Este resultado é uma consequência direta do Teorema de Poincaré.
\end{oobs}
```

### Definições
Para incluir uma definição, utilize o ambiente `deff`
```tex
\begin{deff}
Uma métrica Riemanniana é uma função que associa a cada ponto de uma variedade um produto interno no espaço tangente.
\end{deff}
```

### Proposições
Para incluir uma proposição, utilize o ambiente `proposicao`:
```tex
\begin{proposicao}
Sejam $a, b \in \mathbb{R}$. Então $a + b = b + a$.
\end{proposicao}
```

### Lemas
Para incluir um lema, utilize o ambiente `lema`:
```tex
\begin{lema}
Se $f$ é uma função contínua em um intervalo fechado, então $f$ é limitada.
\end{lema}
```

### Corolários
Para adicionar um corolário, utilize o ambiente `col`:
```tex
\begin{col}
Se $\mm^3$ é simplesmente conexa e compacta, então $\mm^3$ é homeomorfa a $\mathbb{S}^3$.
\end{col}
```

### Perguntas
Para incluir uma pergunta, utilize o ambiente `pergunta`:
```tex
\begin{pergunta}
Quais são todas as topologias possíveis de uma superfície compacta?
\end{pergunta}
```

### Exemplos
Para adicionar um exemplo, utilize o ambiente `exem`:
```tex
\begin{exem}
O toro $\mathbb{T}^2 = \mathbb{S}^1 \times \mathbb{S}^1$ é um exemplo de uma superfície compacta.
\end{exem}
```

---

## Personalização de Notação

Os comandos personalizados para notação matemática estão definidos em `preamble/notation.tex`. Exemplos de comandos disponíveis:

- **Produto de Kulkarni-Nomizu**: `\KN`
- **Divergência**: `\divv`
- **Curvatura Escalar**: `\Scal`
- **Ricci**: `\Ric`
- **Curvatura Riemanniana**: `\Rm`

Exemplo de uso:
```tex
A curvatura escalar é denotada por $\Scal$, enquanto a curvatura de Ricci é $\Ric$.
```

