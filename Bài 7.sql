CREATE TABLE `student` (
  `student_id` int NOT NULL,
  `student_name` varchar(150) DEFAULT NULL,
  `student_birth` datetime DEFAULT NULL,
  `class_id` int DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  KEY `class_id` (`class_id`),
  FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`)
);

CREATE TABLE `subject` (
  `subject_id` int NOT NULL,
  `subject1_name` varchar(100) NOT NULL,
  `subject1_credit` int NOT NULL,
  `teacher_id` int DEFAULT NULL,
  PRIMARY KEY (`subject_id`),
  KEY `teacher_id` (`teacher_id`),
  FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`),
  CHECK ((`subject1_credit` > 0))
);

CREATE TABLE `score` (
  `student_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `process_score` decimal(4,2) NOT NULL,
  `final_score` decimal(4,2) NOT NULL,
  PRIMARY KEY (`student_id`,`subject_id`),
  KEY `subject_id` (`subject_id`),
  FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`),
  CHECK ((`process_score` between 0 and 10)),
  CHECK ((`final_score` between 0 and 10))
);

