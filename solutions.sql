-- ? ESERCIZIO 1
-- 1. Selezionare tutti gli studenti nati nel 1990 (160)
SELECT * FROM `students` WHERE YEAR(`date_of_birth`) = 1990;

-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)
SELECT * FROM `courses` WHERE `cfu` > 10;

-- 3. Selezionare tutti gli studenti che hanno più di 30 anni
SELECT `name`, `surname` FROM `students` WHERE YEAR(CURRENT_DATE) - YEAR(`date_of_birth`) > 30;

-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
SELECT * FROM `courses` WHERE `period` = 'I semestre' AND `year` = 1;

-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)
SELECT * FROM `exams` WHERE `date` = '2020-06-20' AND `hour` > '14:00:00';

-- 6. Selezionare tutti i corsi di laurea magistrale (38)
SELECT * FROM `degrees` WHERE `name` LIKE '%Magistrale%';

-- 7. Da quanti dipartimenti è composta l'università? (12)
SELECT COUNT(id) AS 'dipartimenti_totali' FROM `departments`;

-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
SELECT `name`, `surname`, `phone` FROM `teachers` WHERE `phone` IS NULL;


-- ? ESERCIZIO 2
-- 1. Contare quanti iscritti ci sono stati ogni anno
SELECT YEAR(`enrolment_date`) AS 'data_iscrizione', COUNT(id) AS 'numero_iscritti' FROM `students` GROUP BY YEAR(`enrolment_date`);

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT COUNT(id) AS 'numero_insegnanti', `office_address` FROM `teachers` GROUP BY `office_address`;

-- 3. Calcolare la media dei voti di ogni appello d'esame
SELECT ROUND(AVG(`vote`), 2) AS 'media_voti', `exam_id` FROM `exam_student` GROUP BY `exam_id`;

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT COUNT(`name`) AS 'num_corsi_di_laurea', `department_id` FROM `degrees` GROUP BY `department_id`;


-- ? ESERCIZIO 3
-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT S.`name`, S.`surname`, D.`name` FROM `students` AS S JOIN `degrees` AS D ON D.`id` = S.`degree_id` WHERE D.`name` = 'Corso di Laurea in Economia';

-- 2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
SELECT DEG.`name` AS 'Corsi', DEP.`name` AS 'Dipartimento' FROM `degrees` AS DEG JOIN `departments` AS DEP ON DEP.`id` = DEG.`department_id` WHERE DEP.`name` = 'Dipartimento di Neuroscienze';

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT T.`name` AS 'Nome', T.`surname` AS 'Cognome',T.`id`, C.`name` AS 'Corsi' FROM `courses` AS C JOIN `course_teacher` AS CT ON C.`id` = CT.`course_id` JOIN `teachers` AS t ON T.`id` = CT.`teacher_id` WHERE T.`name` = 'Fulvio' AND T.`surname` = 'Amato';

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT S.`surname` AS 'Cognome', S.`name` AS 'Nome', DEG.*, DEP.`name` AS 'Dipartimento' FROM `students` AS S JOIN `degrees` AS DEG ON DEG.`id` = S.`degree_id` JOIN `departments` AS DEP ON DEP.`id` = DEG.`department_id` ORDER BY S.`surname`;

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti


-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)


-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami