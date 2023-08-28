import textwrap
#### Ainda é possivel fazer diversas melhorias bem como validação de datas, validação de nomes, validação de idade entre outroas.
#### Foi feita algumas mas nada que mude o que foi solicitado pelo bootcamp
#### Validações como se o numero é positivo, se o usuário não colocou , em vez de .
#### Validação de usuário, mesmo o usuário sendo criado não pode sacar, depositar ou ver o extrato se não possuir conta.
#### Alguns trechos foram baseados na lógica da resolução porem foi a minoria como pode ver, o motivo de ter aceitado é que
#### estava refinada a um nivel que não tinha o que melhorar, porem foquei em manter o código com originalidade.
#### Fiz a inserção de emojis, apenas detalhe estético

def menu():
    mensagem = "Por favor, selecione uma opção do menu abaixo:"
    menu = """
     ================ MENU ================
    1 - Sacar
    2 - Depositar
    3 - Extrato
    4 - Novo usuário
    5 - Nova Conta
    6 - Listar Conta
    7 - Sair\n\n =>"""
    print(textwrap.dedent(mensagem))
    return input(textwrap.dedent(menu))

def input_numero_inteiro(numero_parametro):
    while True:#enquanto não for true, irá ficar infinitamente solicitando.
        numero_nao_tratado = input(numero_parametro)
        if numero_nao_tratado.isdigit():# se for numero, então passamos o valora para a variavel numero/tratado
            numero_tratado = int(numero_nao_tratado)
            if numero_tratado >= 0:# uma vez confirmado que é numero é verificado se o numero é positivo
                return numero_tratado
        else:
            print("🚫Por favor, insira apenas números🚫")
def input_numero_float(numero_parametro):
    while True:#enquanto não for true, irá ficar infinitamente solicitando.
        numero_nao_tratado = input(numero_parametro)
        numero_nao_tratado = numero_nao_tratado.replace(',', '.')  # Substitui vírgulas por pontos, caso não encontre nada acontece
        try:# usei esse código para forçar a aceitar somente numero conforme os if else, caso de erro por digitar letras
        # simbolos ou outros, irá para o except
            numero = float(numero_nao_tratado)
            if numero >= 0:
                return numero
            else:
                print("🚫Por favor, insira um número válido.🚫")
        except ValueError:
            print("🚫Por favor, insira um número válido.🚫")
            
def depositar(usuario,saldo,valor, /):
   usuario["saldo"] += valor
   print(f"\n✅ Valor depositado com sucesso✅ \nSaldo atual: R$ {usuario['saldo']:.2f}")

   transacao = {
               "tipo": "deposito",
               "valor": valor
          }
   usuario["transacoes"].append(transacao)

   return saldo,transacao
def sacar(*, usuario_logado, saldo, valor, limite_valor_diario, numero_saques, limite_saques_diario):
    if valor <= 0:
        print("\n❌Operação falhou! O valor informado é inválido. ❌")
        return saldo, numero_saques

    excedeu_saldo = valor > saldo
    excedeu_limite = valor > limite_valor_diario
    excedeu_saques = numero_saques >= limite_saques_diario

    if excedeu_saldo:
        print(f"\n❌Operação falhou! Você não tem saldo suficiente.❌\nSaldo: R$ {saldo:.2f}\n")
    elif excedeu_limite:
        print(f"\n❌Operação falhou! O valor do saque excede o limite da sua conta.❌\n O limite de saque é de R$ {limite_valor_diario:.2f}\n")
    elif excedeu_saques:
        print("\n🚫Limite diário de saques alcançados, por favor faça o saque no dia seguinte ou procure atendimento em uma caixa.🚫")
    else:
        saldo -= valor        
        numero_saques += 1
        print(f"\n✅ Saque de R$ {valor:.2f} realizado com sucesso! ✅\n Saldo Atual: {saldo:.2f}")
        transacao = {
            "tipo": "saque",
            "valor": valor
        }
        usuario_logado["transacoes"].append(transacao)

    return saldo, numero_saques
def exibir_extrato(usuario, limite_saque_diario, /):
    saldo = usuario["saldo"]
    transacoes = usuario["transacoes"]
    numero_saques = usuario["numero_saques"]
    limite_saques_diario = limite_saque_diario
  
    if len(transacoes) == 0:
        print("\n✅ Não foram realizadas movimentações. ✅")
    else:
        print(f"\nSaldo atual: R$ {saldo:.2f}\nQuantidades de saques disponiveis {numero_saques:.0f}/{limite_saques_diario:.0f} \n\nLista de transações realizadas\n")

        for transacao in transacoes:
            tipo = transacao["tipo"]
            valor = transacao["valor"]
            print(f"Tipo: {tipo}, Valor: R$ {valor:.2f}")

    
def verificar_usuario_existente(cpf, usuarios):
    for usuario in usuarios:
        if usuario["cpf"] == cpf:
            return True
    return False

def verificar_conta_existente(cpf,contas):
    if not contas:  # Verifica se a lista está vazia
        print("❌ Não há dados cadastrados no sistema. ❌\n")
    else:
        for conta in contas:
            if cpf == conta['usuario']['cpf']:
                return True
        return False

def criar_usuario(usuarios):
  cpf = input_numero_inteiro("Informe o CPF (somente número): ")

  if verificar_usuario_existente(cpf, usuarios):
      print("\n🚫Já existe usuário com esse CPF! 🚫")
      return

  nome = input("Informe o nome completo: ")
  data_nascimento = input("Informe a data de nascimento (dd-mm-aaaa): ")
  endereco = input("Informe o endereço (logradouro, nro - bairro - cidade/sigla estado): ")

  novo_usuario = {
        "nome": nome,
        "data_nascimento": data_nascimento,
        "cpf": cpf,
        "endereco": endereco,
        "saldo": 0,  
        "transacoes": [], 
        "numero_saques": 0
    }

  usuarios.append(novo_usuario)

  print("✅ Usuário criado com sucesso! ✅")
def filtrar_usuario(cpf, usuarios):
     for usuario in usuarios:
        if usuario["cpf"] == cpf:
            return usuario
     return None  # Retorna None se o usuário não for encontrado
  
def criar_conta(agencia, numero_conta, usuarios,contas):
    cpf = input_numero_inteiro("Informe o CPF do usuário: ")
    usuario = filtrar_usuario(cpf, usuarios)

    if usuario:
        conta = {"agencia": agencia, "numero_conta": numero_conta, "usuario": usuario, "saldo": 0,"CPF": cpf, "transacoes": []}
        contas.append(conta)
        print("\n✅ Conta criada com sucesso! ✅")
        
        return conta
    else:
        print("\n🚫 Usuário não encontrado, encerrando a criação de conta! 🚫")
        
def listar_contas(contas):
    if not contas:  # Verifica se a lista está vazia
        print("❌Não há dados cadastrados no sistema.❌\n")
    else:
        for conta in contas:
            linha = f"""\
                Agência:\t{conta['agencia']}
                C/C:\t\t{conta['numero_conta']}
                Titular:\t{conta['usuario']['nome']}
                CPF:\t{conta['usuario']['cpf']}
            """
            print("=" * 100)
            print(textwrap.dedent(linha))
            
def selecionar_usuario(usuarios):
    print("\n=== Lista de Usuários ===")
    for idx, usuario in enumerate(usuarios):
        print(f"{idx + 1} - {usuario['nome']} ({usuario['cpf']})")
    
    while True:
        try:
            escolha = int(input("\nSelecione um usuário pelo número: \n"))
            if 1 <= escolha <= len(usuarios):
                return usuarios[escolha - 1]
            else:
                print("🚫Escolha inválida. Por favor, selecione novamente.🚫")
        except ValueError:
            print("🚫Por favor, insira um número válido.🚫")
            
def main():
    LIMITE_SAQUES_DIARIO = 3
    AGENCIA = "0001"
    LIMITE_VALOR_DIARIO = 500 #Esse valor é uma constante, a menos que tenha autorização é para ser o saque padrão de 500 reais
    #para todos os usuários.

    saldo = 0
    usuarios = []
    contas = []
    
    while True:
        opcao = menu()
        
        if opcao in ["1", "2", "3"]:
            usuario_logado = selecionar_usuario(usuarios)#Esse valor será usado pelas opções 1, 2 ou 3

            # Verifica se o usuário possui uma conta
            if not verificar_conta_existente(usuario_logado["cpf"], contas):
                print("🚫Você precisa criar uma conta antes de efetuar saques ou depósitos.🚫")
                continue

        if opcao == "1":#Sacar
            valor_sacado = input_numero_float("\nInforme o valor a ser sacado R$ ")

            usuario_logado["saldo"], usuario_logado["numero_saques"] = sacar(
                usuario_logado=usuario_logado,
                saldo=usuario_logado["saldo"],
                valor=valor_sacado,
                limite_valor_diario=LIMITE_VALOR_DIARIO,
                numero_saques=usuario_logado["numero_saques"],
                limite_saques_diario=LIMITE_SAQUES_DIARIO
            )
            
        elif opcao == "2":#depositar
            valor = input_numero_float("Informe o valor do depósito: ")

            saldo = depositar(
                usuario_logado,saldo, valor)  

        elif opcao == "3":#Extrato
            exibir_extrato(usuario_logado,LIMITE_SAQUES_DIARIO)
            
        elif opcao == "4":#Novo usuário
            criar_usuario(usuarios)

        elif opcao == "5":#Nova Conta
            numero_conta = len(contas) + 1
            criar_conta(AGENCIA, numero_conta, usuarios,contas)

        elif opcao == "6":#Listar Conta
            listar_contas(contas)

        elif opcao == "7":#Sair
            break

        else:
            print("Operação inválida, por favor selecione novamente a operação desejada.")

main()
