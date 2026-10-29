-- Reference DDL derived from apps/api/prisma/schema.prisma, inspected 2026-10-29.

-- 21 application tables; not a live database export or a deployment migration.

-- Column types, nullability, PK, UNIQUE and FK only; Prisma/client defaults and indexes are omitted.

CREATE TABLE `account` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nontri_id` varchar(50) NOT NULL,
  `email` varchar(255) NULL,
  `created_at` timestamp(0) NULL,
  `updated_at` timestamp(0) NULL,
  PRIMARY KEY (`id`),
  UNIQUE (`nontri_id`)
);

CREATE TABLE `approval` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `leave_request_id` bigint unsigned NOT NULL,
  `approver_id` bigint unsigned NOT NULL,
  `approver_role` varchar(50) NULL,
  `step` int NULL,
  `decision_status` varchar(50) NULL,
  `reason` text NULL,
  `created_at` timestamp(0) NULL,
  `updated_at` timestamp(3) NULL,
  `activated_at` timestamp(3) NULL,
  `decided_at` timestamp(3) NULL,
  `decision_source` varchar(20) NULL,
  `decided_by_nontri_id` varchar(50) NULL,
  `decided_by_name` varchar(255) NULL,
  `is_delegated` boolean NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `business_calendar_day` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `calendar_date` date NOT NULL,
  `is_working_day` boolean NOT NULL,
  `name` varchar(255) NULL,
  `created_at` timestamp(0) NULL,
  `updated_at` timestamp(0) NULL,
  PRIMARY KEY (`id`),
  UNIQUE (`calendar_date`)
);

CREATE TABLE `district` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name_th` varchar(255) NOT NULL,
  `name_en` varchar(255) NULL,
  `province_id` bigint unsigned NOT NULL,
  `created_at` timestamp(0) NULL,
  `updated_at` timestamp(0) NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `faculty` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name_th` varchar(255) NOT NULL,
  `name_en` varchar(255) NULL,
  `created_at` timestamp(0) NULL,
  `updated_at` timestamp(0) NULL,
  `faculty_code` varchar(20) NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `leave_request` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `leave_type_id` bigint unsigned NOT NULL,
  `student_id` bigint unsigned NOT NULL,
  `academic_term_id` bigint unsigned NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_days` int NULL,
  `affected_subject_count` int NULL,
  `status` varchar(50) NULL,
  `json_file_path` text NULL,
  `evidence_file_path` text NULL,
  `created_at` timestamp(0) NULL,
  `updated_at` timestamp(0) NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `leave_type` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name_th` varchar(255) NOT NULL,
  `name_en` varchar(255) NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `leave_request_lecturer_read` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `leave_request_id` bigint unsigned NOT NULL,
  `read_at` timestamp(0) NULL,
  `created_at` timestamp(0) NULL,
  `updated_at` timestamp(0) NULL,
  `subject_code` varchar(50) NULL,
  `sec` varchar(20) NULL,
  `lecturer_code` varchar(50) NULL,
  PRIMARY KEY (`id`),
  UNIQUE (`leave_request_id`, `subject_code`, `sec`, `lecturer_code`)
);

CREATE TABLE `major` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name_th` varchar(255) NOT NULL,
  `name_en` varchar(255) NULL,
  `faculty_id` bigint unsigned NOT NULL,
  `created_at` timestamp(0) NULL,
  `updated_at` timestamp(0) NULL,
  `major_code` varchar(20) NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `province` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name_th` varchar(255) NOT NULL,
  `name_en` varchar(255) NULL,
  `created_at` timestamp(0) NULL,
  `updated_at` timestamp(0) NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `student` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account_id` bigint unsigned NULL,
  `prefix` varchar(20) NULL,
  `full_name_th` varchar(255) NULL,
  `full_name_en` varchar(255) NULL,
  `year_code` varchar(10) NULL,
  `major_id` bigint unsigned NULL,
  `address_detail` text NULL,
  `zipcode_id` bigint unsigned NULL,
  `phone` varchar(20) NULL,
  `created_at` timestamp(0) NULL,
  `updated_at` timestamp(0) NULL,
  PRIMARY KEY (`id`),
  UNIQUE (`account_id`)
);

CREATE TABLE `sub_district` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name_th` varchar(255) NOT NULL,
  `name_en` varchar(255) NULL,
  `district_id` bigint unsigned NOT NULL,
  `created_at` timestamp(0) NULL,
  `updated_at` timestamp(0) NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `student_subject_shortcut` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `student_id` bigint unsigned NOT NULL,
  `subject_code` varchar(50) NOT NULL,
  `subject_name` varchar(255) NULL,
  `section_id` varchar(50) NOT NULL,
  `section` varchar(20) NOT NULL,
  `schedule_text` varchar(255) NULL,
  `created_at` timestamp(0) NULL,
  `updated_at` timestamp(0) NULL,
  `schedule` json NULL,
  PRIMARY KEY (`id`),
  UNIQUE (`student_id`, `subject_code`, `section_id`)
);

CREATE TABLE `academic_term` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `academic_year` year NOT NULL,
  `term` varchar(20) NOT NULL,
  `created_at` timestamp(0) NULL,
  `updated_at` timestamp(0) NULL,
  PRIMARY KEY (`id`),
  UNIQUE (`academic_year`, `term`)
);

CREATE TABLE `course_offering` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `academic_term_id` bigint unsigned NOT NULL,
  `subject_code` varchar(50) NOT NULL,
  `subject_name` varchar(255) NULL,
  `section` varchar(20) NOT NULL,
  `schedule_status` varchar(20) NOT NULL,
  `created_at` timestamp(0) NOT NULL,
  `updated_at` timestamp(0) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE (`academic_term_id`, `subject_code`, `section`)
);

CREATE TABLE `course_schedule` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `course_offering_id` bigint unsigned NOT NULL,
  `day_of_week` tinyint unsigned NOT NULL,
  `start_time` time(0) NOT NULL,
  `end_time` time(0) NOT NULL,
  `created_at` timestamp(0) NOT NULL,
  `updated_at` timestamp(0) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE (`course_offering_id`, `day_of_week`, `start_time`, `end_time`)
);

CREATE TABLE `course_schedule_lecturer` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `course_schedule_id` bigint unsigned NOT NULL,
  `lecturer_code` varchar(50) NOT NULL,
  `created_at` timestamp(0) NOT NULL,
  `updated_at` timestamp(0) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE (`course_schedule_id`, `lecturer_code`)
);

CREATE TABLE `academic_setting` (
  `id` tinyint unsigned NOT NULL,
  `current_academic_term_id` bigint unsigned NULL,
  `created_at` timestamp(0) NULL,
  `updated_at` timestamp(0) NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `user_auto_approve_rule` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account_id` bigint unsigned NOT NULL,
  `role` varchar(50) NOT NULL,
  `enabled` boolean NOT NULL,
  `after_days` int unsigned NOT NULL,
  `created_at` timestamp(0) NULL,
  `updated_at` timestamp(0) NULL,
  PRIMARY KEY (`id`),
  UNIQUE (`account_id`, `role`)
);

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account_id` bigint unsigned NULL,
  `major_id` bigint unsigned NULL,
  `created_at` timestamp(0) NULL,
  `updated_at` timestamp(0) NULL,
  PRIMARY KEY (`id`),
  UNIQUE (`account_id`)
);

CREATE TABLE `zipcode` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `zipcode` varchar(10) NOT NULL,
  `sub_district_id` bigint unsigned NOT NULL,
  `created_at` timestamp(0) NULL,
  `updated_at` timestamp(0) NULL,
  PRIMARY KEY (`id`)
);

ALTER TABLE `approval` ADD FOREIGN KEY (`leave_request_id`) REFERENCES `leave_request` (`id`);

ALTER TABLE `approval` ADD FOREIGN KEY (`approver_id`) REFERENCES `users` (`id`);

ALTER TABLE `district` ADD FOREIGN KEY (`province_id`) REFERENCES `province` (`id`);

ALTER TABLE `leave_request` ADD FOREIGN KEY (`academic_term_id`) REFERENCES `academic_term` (`id`);

ALTER TABLE `leave_request` ADD FOREIGN KEY (`leave_type_id`) REFERENCES `leave_type` (`id`);

ALTER TABLE `leave_request` ADD FOREIGN KEY (`student_id`) REFERENCES `student` (`id`);

ALTER TABLE `leave_request_lecturer_read` ADD FOREIGN KEY (`leave_request_id`) REFERENCES `leave_request` (`id`);

ALTER TABLE `major` ADD FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`);

ALTER TABLE `student` ADD FOREIGN KEY (`account_id`) REFERENCES `account` (`id`);

ALTER TABLE `student` ADD FOREIGN KEY (`major_id`) REFERENCES `major` (`id`);

ALTER TABLE `student` ADD FOREIGN KEY (`zipcode_id`) REFERENCES `zipcode` (`id`);

ALTER TABLE `sub_district` ADD FOREIGN KEY (`district_id`) REFERENCES `district` (`id`);

ALTER TABLE `student_subject_shortcut` ADD FOREIGN KEY (`student_id`) REFERENCES `student` (`id`);

ALTER TABLE `course_offering` ADD FOREIGN KEY (`academic_term_id`) REFERENCES `academic_term` (`id`);

ALTER TABLE `course_schedule` ADD FOREIGN KEY (`course_offering_id`) REFERENCES `course_offering` (`id`);

ALTER TABLE `course_schedule_lecturer` ADD FOREIGN KEY (`course_schedule_id`) REFERENCES `course_schedule` (`id`);

ALTER TABLE `academic_setting` ADD FOREIGN KEY (`current_academic_term_id`) REFERENCES `academic_term` (`id`);

ALTER TABLE `user_auto_approve_rule` ADD FOREIGN KEY (`account_id`) REFERENCES `account` (`id`);

ALTER TABLE `users` ADD FOREIGN KEY (`account_id`) REFERENCES `account` (`id`);

ALTER TABLE `users` ADD FOREIGN KEY (`major_id`) REFERENCES `major` (`id`);

ALTER TABLE `zipcode` ADD FOREIGN KEY (`sub_district_id`) REFERENCES `sub_district` (`id`);
