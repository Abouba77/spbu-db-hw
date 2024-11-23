CREATE TABLE public.courses (
	id varchar NOT NULL,
	"name" varchar NULL,
	is_exam varchar NULL,
	min_grade _numeric NULL,
	max_grade _numeric NULL
);

CREATE TABLE public."group" (
	id varchar NOT NULL,
	full_name varchar NULL,
	short_name varchar NULL,
	students_ids varchar NULL
);

CREATE TABLE public.students (
	id varchar NOT NULL,
	first_name varchar NULL,
	last_name varchar NULL,
	group_id varchar NOT NULL,
	courses_ids varchar NOT NULL
);

CREATE TABLE public.course_student (
	student_id varchar NOT NULL,
	grade _numeric NULL,
	grade_str varchar NULL
);
