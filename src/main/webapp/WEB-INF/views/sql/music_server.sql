--<ScriptOptions statementTerminator=";"/>

ALTER TABLE `maker`.`music_server` DROP PRIMARY KEY;

DROP TABLE `maker`.`music_server`;

CREATE TABLE `maker`.`music_server` (
	`id` INT NOT NULL,
	`pid` VARCHAR(12) NOT NULL,
	`title_ko` TEXT NOT NULL,
	`author_ko` TEXT NOT NULL,
	`title_en` TEXT NOT NULL,
	`author_en` TEXT NOT NULL,
	`genre` INT NOT NULL,
	`play_time` TEXT NOT NULL,
	`file_size` INT NOT NULL,
	`file_info` TEXT,
	`url_info` TEXT,
	`id` INT NOT NULL,
	`pid` VARCHAR(12) NOT NULL,
	`title_ko` TEXT NOT NULL,
	`author_ko` TEXT NOT NULL,
	`title_en` TEXT NOT NULL,
	`author_en` TEXT NOT NULL,
	`genre` INT NOT NULL,
	`play_time` TEXT NOT NULL,
	`file_size` INT NOT NULL,
	`file_info` TEXT,
	`url_info` TEXT,
	PRIMARY KEY (`id`)
);

