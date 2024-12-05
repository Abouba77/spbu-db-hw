

CREATE TABLE public.student_courses (
    id SERIAL PRIMARY KEY,
    student_id VARCHAR NOT NULL,
    course_id VARCHAR NOT NULL,
    UNIQUE (student_id, course_id) -- Уникальное отношение между студентами и курсами
);


CREATE TABLE group_courses (
    id SERIAL PRIMARY  KEY,
    group_id VARCHAR NOT NULL,
    course_id VARCHAR NOT NULL,
    UNIQUE (group_id, course_id) -- Уникальное отношение между группами и курсами
);
INSERT INTO student_courses (student_id, course_id) VALUES
(1, 101),
(1, 102),
(2, 101),
(3, 103),
(2, 102);

INSERT INTO group_courses (group_id, course_id) VALUES
(1, 101),
(1, 102),
(2, 103),
(2, 102);


ALTER TABLE students DROP COLUMN courses_ids; 





ALTER TABLE courses ADD CONSTRAINT unique_course_name UNIQUE (name);

-- Создание индекса на поле group_id в таблице students
CREATE INDEX idx_group_id ON students(group_id); 




SELECT s.id AS student_id, s.first_name AS student_name, c.name AS course_name
FROM students s
join student_courses sc ON s.id = sc.student_id
join courses c ON sc.course_id = c.id;

-- Нахождение студентов, у которых средняя оценка по курсам выше, чем у любого другого студента в их группе
SELECT 
    c.id AS course_id, 
    c.name AS course_name, 
    AVG(grade) AS average_grade
FROM 
    public.courses c
LEFT JOIN 
    cs ON c.id = cs.course_id
CROSS JOIN 
    UNNEST(cs.grade) AS grade
GROUP BY 
    c.id, c.name;





