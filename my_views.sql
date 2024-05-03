CREATE VIEW ALL_WORKERS AS
SELECT last_name AS lastname, first_name AS firstname, age, first_day AS start_date
FROM WORKERS_FACTORY_1
WHERE last_day IS NULL
UNION ALL
SELECT last_name, first_name, NULL as age, start_date
FROM WORKERS_FACTORY_2
WHERE end_date IS NULL
ORDER BY start_date DESC;

CREATE VIEW ALL_WORKERS_ELAPSED AS
SELECT lastname, firstname, age, start_date,
       TRUNC(SYSDATE - start_date) AS days_elapsed
FROM ALL_WORKERSS;


CREATE VIEW BEST_SUPPLIERS AS
SELECT s.name AS supplier_name, COUNT(sb.spare_part_id) AS parts_delivered
FROM SUPPLIERS s
JOIN SUPPLIERS_BRING_TO_FACTORY_1 sb ON s.supplier_id = sb.supplier_id
GROUP BY s.name
HAVING COUNT(sb.spare_part_id) > 1000
ORDER BY COUNT(sb.spare_part_id) DESC;


CREATE VIEW ROBOTS_FACTORIES AS
SELECT r.id AS robot_id, f.main_location AS factory_location
FROM ROBOTS r
JOIN ROBOTS_FROM_FACTORY rf ON r.id = rf.robot_id
JOIN FACTORIES f ON rf.factory_id = f.id;
