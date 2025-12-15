BEGIN; -- Inicia uma transação

-- Remove o registro pelo email
DELETE FROM accounts
WHERE email = 'ricardofeira@teste.com';

-- Insere uma nova conta e obtém o ID da conta recém-inserida
WITH new_account AS (
    INSERT INTO accounts (name, email, cpf)
    VALUES ('Ricardo da Feira', 'ricardofeira@teste.com', '99145722005')
    RETURNING id
)

-- Insere um registro na tabela memberships com o ID da conta
INSERT INTO memberships (account_id, plan_id, credit_card, price, status)
SELECT id, 1, '4242', 99.99, true
FROM new_account;

COMMIT; -- Confirma a transação
