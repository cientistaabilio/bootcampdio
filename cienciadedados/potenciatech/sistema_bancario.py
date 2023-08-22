saldo_atual = 0
op_menu_principal = 0
valor_sacado = 0
limite_saque_diario = 0 # Não defini o valor com constante por precisaria de um contador extra para verificar se atingiu 3 saques.
#usei o if com limitador
LIMITE_VALOR_DIARIO = 500 # Não altere
transacoes = []#ficará registrado as tranações feitas

menu= ("\nMenu \n 1 - Sacar \n 2 - Depositar \n 3 - Extrato \n 4 - Sair\n\n ")

#Trata valores do tipo 2350,40 aonde o correto é 2350.40 então o sistema substituiu o , por .
#e permite a execução
def input_valor(valor):
  valor_sem_tratar = input(valor)
  valor_tratado = valor_sem_tratar.replace(',', '.')
  return float(valor_tratado)
#Esse código estava aninhado com a lógica, porem percebi que havia muita redudancia.
#decidi criar uma função e apenas chamar ela no momento que fosse necessário.

while op_menu_principal != 4:  # Use 4 para sair do loop
    print(menu)
    op_menu_principal = int(input('Qual opção irá ser selecionada: \n '))  # Converta para inteiro a opção do menu

    if op_menu_principal == 1:  # Sacar
        if saldo_atual==0:#Caso o saldo seja 0, o código irá apenas mostrar uma mensagem
          print(f"Não há saldo na conta.R$ {saldo_atual:.2f}\n ")
          continue
        elif limite_saque_diario >3:
          print("Limite diário de saques alcançados, por favor faça o saque no dia seguinte ou procure atendimento em uma caixa.")
          continue

        valor_sacado = input_valor("\nInforme o valor a ser sacado R$ ")#como o valor não é 0 e o limite ainda não passou de saques diário, perguntamos qual o valor a ser sacado

        if valor_sacado > saldo_atual:#validamos se o valor sacado é maior que o saldo atual
          print(f"Não há valor suficiente R$ {saldo_atual:.2f}\n ")
        elif valor_sacado >= LIMITE_VALOR_DIARIO:
          print("O limite é de R$ 500 reais por cada saque.")
        elif valor_sacado <= LIMITE_VALOR_DIARIO:
          saldo_atual -= valor_sacado
          print(f"Saque de R$ {valor_sacado:.2f} realizado.\nSaldo Atual: R$ {saldo_atual:.2f}\n")
          limite_saque_diario += 1
          transacao = {
              "tipo": "saque",
              "valor": valor_sacado
          }
          transacoes.append(transacao)

    elif op_menu_principal == 2:  # Depositar
        valor_deposito = input_valor("Informe o valor a ser depositado R$")
        saldo_atual += valor_deposito
        print(f"\nValor depositado com sucesso\nSaldo atual: R$ {saldo_atual:.2f}")
        transacao = {
              "tipo": "deposito",
              "valor": valor_deposito
          }
        transacoes.append(transacao)

    elif op_menu_principal == 3:  # Extrato

        if len(transacoes) == 0:#caso a lista esteja vazia, é porque o extrato está em branco
          print("Não foram realizadas movimentações.")
        else:
          print(f"\nSaldo atual: R$ {saldo_atual:.2f}\nQuantidades de saques disponiveis {limite_saque_diario:.0f}/3 \nLista de transações realizadas\n")

          for transacao in transacoes:
            tipo = transacao["tipo"]
            valor = transacao["valor"]
            print(f"Tipo: {tipo}, Valor: R$ {valor:.2f}")

    elif op_menu_principal == 4:  # Sair
        print("\nObrigado, sistema finalizado")
        break  # Sai do loop

    else:
        print("\n Opção inválida. Escolha uma opção válida do menu.")
