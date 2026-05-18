# Template para Dissertação de Mestrado da UnB

Template LaTeX para dissertações de mestrado e teses de doutorado da Universidade de Brasília (UnB), baseado no modelo `PhDThesisPSnPDF`.

![Prévia da dissertação](docs/images/ex3.png)

![Prévia da capa](docs/images/ex4_upscayl_4x_ultrasharp-4x.png)

## Download

Baixe o ZIP mais recente:

```text
https://github.com/SaganGromov/TemplateDissertacaoUnB/archive/refs/heads/main.zip
```

Ou clone o repositório:

```bash
git clone https://github.com/SaganGromov/TemplateDissertacaoUnB.git
cd TemplateDissertacaoUnB
```

## Requisitos

Instale uma distribuição LaTeX com `pdflatex`, `bibtex` e `makeindex`. No Linux, uma instalação TeX Live completa costuma ser suficiente.

Para verificar as ferramentas:

```bash
pdflatex --version
bibtex --version
makeindex --version
```

## Compilação

O arquivo principal é `thesis.tex`.

Compile com o script:

```bash
./compile-thesis.sh compile
```

Ou informe outro arquivo principal, sem a extensão `.tex`:

```bash
./compile-thesis.sh compile thesis
```

Também é possível usar o Makefile:

```bash
make
```

Para remover arquivos auxiliares gerados pela compilação:

```bash
./compile-thesis.sh clean
```

## Estrutura

```text
.
├── thesis.tex                         # Arquivo principal
├── thesis-info.tex                    # Título, autor, orientador, data e metadados
├── preamble/
│   ├── preamble.tex                   # Pacotes e ajustes gerais do template
│   ├── config.tex                     # Idioma, teoremas e comandos do trabalho
│   └── notation.tex                   # Notação matemática personalizada
├── abstract/abstract.tex              # Resumo e abstract
├── acknowledgement/acknowledgement.tex# Agradecimentos
├── dedication/dedication.tex          # Dedicatória
├── introduction/intro.tex             # Introdução
├── chapter_1/chapter_1.tex            # Capítulo 1
├── chapter_2/chapter_2.tex            # Capítulo 2
├── pref/0.pref.tex                    # Prefácio opcional
├── assets/codigo_segunda_pagina/      # Fonte e PDF da segunda página
├── creditos/                          # Instruções em PDF incluídas no início
├── figs/                              # Brasões e figuras usadas pelo template
├── material/                          # PDFs de apoio e referências locais
├── docs/images/                       # Imagens usadas nesta documentação
└── hooks/                             # Hooks Git opcionais
```

## Personalização Básica

Edite `thesis-info.tex` para alterar título, autor, orientador, grau, data, assunto e palavras-chave.

Adicione ou remova capítulos em `thesis.tex`, na seção `Main Matter`:

```tex
\include{introduction/intro}
\include{chapter_1/chapter_1}
\include{chapter_2/chapter_2}
```

Se quiser usar o prefácio, descomente:

```tex
\include{pref/0.pref}
```

## Páginas Pré-Textuais

O PDF principal inclui dois PDFs prontos antes da dedicatória:

```tex
\includepdf[pages=-, pagecommand={}]{creditos/creditos.pdf}
\includepdf[pages=1, pagecommand={}]{assets/codigo_segunda_pagina/sec.pdf}
```

Para remover as instruções do PDF final, comente a linha de `creditos/creditos.pdf` em `thesis.tex`.

Para alterar a segunda página, edite os arquivos em `assets/codigo_segunda_pagina/` e recompile o PDF correspondente antes de compilar `thesis.tex`.

## Ambientes Matemáticos

Os ambientes estão definidos em `preamble/config.tex`.

```tex
\begin{teorema}
Seja $\mm^3$ uma variedade diferenciável fechada.
\end{teorema}

\begin{oobs}
Este resultado é uma consequência direta do teorema anterior.
\end{oobs}

\begin{deff}
Uma métrica Riemanniana associa um produto interno a cada espaço tangente.
\end{deff}
```

Ambientes disponíveis incluem `teorema`, `oobs`, `deff`, `proposicao`, `lema`, `col`, `pergunta` e `exem`.

## Notação

Comandos de notação ficam em `preamble/notation.tex`. Exemplos:

- `\KN`: produto de Kulkarni-Nomizu
- `\divv`: divergência
- `\Scal`: curvatura escalar
- `\Ric`: curvatura de Ricci
- `\Rm`: curvatura Riemanniana

## Hooks Git

Os hooks em `hooks/` são opcionais. Para instalá-los:

```bash
./hooks/install.sh
```

O hook `pre-commit` recompila `thesis.pdf` quando arquivos relevantes são adicionados ao commit.

## Observações

O repositório mantém `thesis.pdf` versionado como prévia compilada. Arquivos auxiliares de LaTeX, como `.aux`, `.log`, `.toc`, `.out`, `.idx`, `.nlo` e `.nls`, são ignorados pelo Git.
