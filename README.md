# Ferramenta de Numeração de Reis e Rainhas de Cumbúquia

### Descrição

Este projeto foi desenvolvido como resposta a um teste técnico para a vaga de Engenheiro de Suporte na fintech Cumbuca. A ferramenta de linha de comando (CLI) desenvolvida em Elixir visa ajudar o reino de Cumbúquia a recuperar a numeração correta de seus reis e rainhas, que foi perdida.

### Funcionalidade

A ferramenta recebe uma lista de nomes de reis e rainhas, um por linha, e retorna os nomes numerados corretamente em ordem de sucessão.

### Exemplo de Uso

Ao iniciar a ferramenta, uma breve explicação de seu funcionamento é exibida. O usuário deve inserir os nomes um por linha e finalizar a inserção com "0" ou "0\n". A ferramenta retornará a lista de nomes com a devida numeração:

Entrada:
```
João
Maria
Daniel
João
0
```

Saída:
```
### Os governantes de Cumbúquia, por ordem de sucessão:
João I
Maria I
Daniel I
João II 
```
### Como Executar

1.  Clone o repositório:

   	`git clone github.com/soareslucas9090/Desafio-AppCumbuca
    	cd Desafio-AppCumbuca` 
    
2.  Compile o projeto (com o Elixir instalado):

   	`iex -S mix` 
    
4.  Execute a ferramenta: 
	
 	`DesafioCli.main`

### Gerar Documentação

1.  Faça um deps.get:

	`mix deps.get`
    
2.  Compile as dependências:

   	`mix deps.compile`
    
3.  Gere os documentos de documentação:

   	`mix docs`

A documentação será gerada no diretório raiz/doc.

### Testes

O projeto inclui testes automatizados que podem ser executados com o comando:
`mix test` 

Os testes cobrem diferentes cenários de inserção de nomes, incluindo finalização de inserção sem registro, inserções em ordem, fora de ordem, e casos específicos descritos no desafio técnico.
