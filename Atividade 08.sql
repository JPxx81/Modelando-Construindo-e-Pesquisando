SELECT
    -- Extrai apenas a data da coluna DATETIME para agrupamento
    DATE(PD.data_pedido) AS data_do_pedido,
    -- Soma o valor total de todos os itens vendidos naquela data
    SUM(IP.quantidade * PR.preco) AS faturamento_diario
FROM
    Pedido PD
INNER JOIN
    ItemPedido IP ON PD.cod_pedido = IP.cod_pedido
INNER JOIN
    Produto PR ON IP.cod_produto = PR.cod_produto
GROUP BY
    data_do_pedido
ORDER BY
    data_do_pedido ASC;