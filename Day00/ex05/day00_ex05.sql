SELECT
    (
        SELECT
            name
        FROM
            person
        WHERE
            person.id = person_order.person_id -- обращение к внешней таблице так как id-шники у них связаны
    ) AS NAME
FROM
    person_order
WHERE
    (
        menu_id = 13
        OR menu_id = 14
        OR menu_id = 18
    )
    AND order_date = '2022-01-07';