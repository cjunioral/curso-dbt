SELECT p.id_pedido
,p.id_cliente
,p.data_pedido
,p.status
,i.id_produto
,i.quantidade
,i.preco_unitario
,i.desconto

-- valor bruto
,{{ calculo_dois_valores ('i.quantidade', 'i.preco_unitario')}} AS valor_bruto

-- valor liquido
,{{ calculo_dois_valores ('i.quantidade', 'i.preco_unitario')}} AS valor_liquido

FROM {{ref('stg_pedidos')}} p
JOIN {{ref('stg_itens_pedido')}} i
ON p.id_pedido = i.id_pedido
WHERE i.fl_quantidade_invalida = 0 AND i.fl_preco_unitario_nulo = 0