-- перед запуском добавить строки
--insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29'); 
--insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH c AS (SELECT DISTINCT currency.id, currency.name FROM currency)
SELECT coalesce (public.user.name, 'not defined') AS name, coalesce(public.user.lastname, 'not defined') AS lastname, c.name AS currency_name, money *
coalesce((SELECT rate_to_usd FROM currency WHERE balance.currency_id = currency.id AND currency.updated < balance.updated ORDER BY currency.updated DESC LIMIT 1),
          (SELECT rate_to_usd FROM currency WHERE balance.currency_id = currency.id AND currency.updated > balance.updated ORDER BY currency.updated ASC LIMIT 1)) AS currency_in_usd
FROM balance JOIN
	c ON c.id = balance.currency_id
	LEFT JOIN public.user ON public.user.id = balance.user_id
	ORDER BY 1 DESC, 2, 3;
