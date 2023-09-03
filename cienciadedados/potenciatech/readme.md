# Projeto baseado no bootacamp powered by iFood da plataforma DIO.

### Notas
```
Desafios python é dividido em 2 versão
sistema_bancario.py
sistema_bancari_002.py
```

# Desafio SQL
```
Desafio 1 já adicionado e é composto por 4 arquivos
1 Ecommerce_diagrama_ER.png --imagem do diagrama ER.
1 Banco de dados esquema_relacional.sql.
1 queries_desafio.sql.
1 Ecommerce_diagrama_ER.mwb
```
## Observações:
```py
1 É recomendado sempre usar aspas simples, no MySQL não haverá impacto entre aspas '' ou "", porem em outros SGBD(sistemas de gerenciamento de banco de dados) o PostgreSQL terá um contexto e funcionalidade totalmente diferente.
2 Em alguns pontos irei adicionar conteúdos como personalização apenas para fins cosmétistico e só se aplica ao desenvolvedor que irá ler, pois para  aplicação isso não será efetivo.
3 Foi mostrado 2 exemplo linha 198 e 207, aonde ambas funcionam e trocam o null por 1 espaço em branco, mais uma vez apenas para fins cosméticos.
```
# Queries Simples
#### Nesse caso ficarão as que usam instruções simples com where, order e outros

1 Lista de Clientes
2 Lista de fornecedores
3 Lista de clientes(PF E PJ) com e sem ocultação de campos sensiveis


## Queries avançadas
#### O uso de quaisquers joins necessários para o propósito.
```py
1 Informação completa contendo concat do nome completo, item do pedido, quantidade, status do pedido, descrição do pedido, valor efetuado, forma de pagamento, data do pagamento, status da entrega e o código do rastreio.
2 Nome e sobrenome com o nome do produto e código de rastreio
	2.1 no final deixei 2 linhas comentadas, basta comentar 2 e deixar 1 sem comentar e assim altera o fluxo.
3  Quantos pedidos foram feitos por cada cliente?
	3.1  Tem a opção de mostrar por id e agrupando, como agrupar por CPF, ambos tendo o mesmo resultado
4 Algum vendedor também é fornecedor?
5 Relação de produtos e estoques
6 Relação de nomes dos fornecedores e nomes dos produtos;

7 Lista todos os pedidos que tenham 2 ou mais pedidos.
```
# Desafio SQL Oficina
```py
Desafio Oficina é composto por 4 arquivos
1 oficina.sql aonde está o banco de dados
2 queries_oficina.sql aonde está as instruções.
3 oficina_diagrama_ER.png
4 oficina_diagrama_ER.mwb

1 Pesquisar apenas por uma parte da string rua alameda, estrada do sertão, podemos filtrar por apenas rua com o comando Like.
2 Consulta simples que retorna em forma ascendente pelo sobrenome.
3 Mostra todos que solicitaram mais que 3 pedidos.
4 Lista os clientes e calcula os dias necessários para a manutenção ter ocorrido.
5 Lista todos os clientes que deixaram os veiculos, situação da manutenção e se já tem um um mecanico ou mecanica atuando no problema.
Uma estrutura bem comum em python porem não vejo em SQL com frequencia pelo menos quando vou pesquisar um assunto, me baseie pelo site w3cschools
```
