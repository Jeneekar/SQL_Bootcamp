WITH
tab_balance AS (
    SELECT
  		B.user_id,
  		B.currency_id,
        B.type AS type,
        SUM(B.money) AS volume
    FROM balance AS B
    GROUP BY B.type, B.user_id, B.currency_id
), LRTU AS ( -- last_rate_to_usd
  	SELECT cur.id, cur.rate_to_usd FROM currency AS cur
    WHERE cur.updated = (SELECT MAX(updated) FROM currency)
    GROUP BY cur.id, cur.rate_to_usd
)
 SELECT DISTINCT
        COALESCE(U.name, 'not defined') AS name,
        COALESCE(U.lastname, 'not defined') AS lastname,
 		tab_balance.type,
        tab_balance.volume,
        COALESCE(currency.name, 'not defined') AS currency_name,
        COALESCE(LRTU.rate_to_usd,'1') AS last_rate_to_usd,
        (tab_balance.volume *   COALESCE(LRTU.rate_to_usd,'1'))::real AS total_volume_in_usd
 FROM "user" U FULL JOIN tab_balance on U.id =tab_balance.user_id
 			   LEFT JOIN currency ON tab_balance.currency_id = currency.id
               LEFT JOIN LRTU ON LRTU.id = tab_balance.currency_id
ORDER BY name DESC, lastname ASC, type ASC;