-- -----------------------------------------------------
-- Table `press`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `press` (
  `press_id` INT NOT NULL,
  `press_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`press_id`));

-- -----------------------------------------------------
-- Table `publications`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `publications` (
  `publications_id` INT NOT NULL,
  `press_id` INT NOT NULL,
  `isbn_11` VARCHAR(11) NULL,
  `isbn_13` VARCHAR(13) NULL,
  `title` VARCHAR(45) NOT NULL,
  `subtitle` VARCHAR(45) NULL,
  `edition` INT NOT NULL,
  `year` DATETIME NULL,
  PRIMARY KEY (`publications_id`),
  CONSTRAINT `editors_fk`
    FOREIGN KEY (`press_id`)
    REFERENCES `press` (`press_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);
CREATE INDEX `editors_fk_idx` ON `publications` (`press_id` ASC);
CREATE UNIQUE INDEX `isbn_11_UNIQUE` ON `publications` (`isbn_11` ASC);
CREATE UNIQUE INDEX `isbn_13_UNIQUE` ON `publications` (`isbn_13` ASC);

-- -----------------------------------------------------
-- Table `objects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `objects` (
  `objects_id` VARCHAR(40) NOT NULL,
  `publications_id` INT NOT NULL,
  `format` VARCHAR(8) NOT NULL,
  `file_path` VARCHAR(2048) NOT NULL,
  PRIMARY KEY (`objects_id`),
  CONSTRAINT `publications_fk1`
    FOREIGN KEY (`publications_id`)
    REFERENCES `publications` (`publications_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);
CREATE INDEX `publications_fk1_idx` ON `objects` (`publications_id` ASC);
CREATE UNIQUE INDEX `file_path_UNIQUE` ON `objects` (`file_path` ASC);
CREATE INDEX `publication_format_idx` ON `objects` (`publications_id` ASC, `format` ASC);

-- -----------------------------------------------------
-- Table `authors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `authors` (
  `authors_id` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `function` VARCHAR(45) NULL,
  PRIMARY KEY (`authors_id`));

-- -----------------------------------------------------
-- Table `authors_publications`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `authors_publications` (
  `authors_id` INT NOT NULL,
  `publications_id` INT NOT NULL,
  PRIMARY KEY (`authors_id`, `publications_id`),
  CONSTRAINT `authors_fk1`
    FOREIGN KEY (`authors_id`)
    REFERENCES `authors` (`authors_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `publications_fk2`
    FOREIGN KEY (`publications_id`)
    REFERENCES `publications` (`publications_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);
CREATE INDEX `publications_fk2_idx` ON `authors_publications` (`publications_id` ASC);
CREATE INDEX `authors_fk1_idx` ON `authors_publications` (`authors_id` ASC);

-- -----------------------------------------------------
-- Table `friends`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `friends` (
  `friend_id` INT NOT NULL,
  `friend_first_name` VARCHAR(45) NULL,
  `friend_last_name` VARCHAR(45) NULL,
  `social_media` VARCHAR(4) NULL COMMENT '(G+) - Google Plus, (FB) - Facebook, (TW) - Twitter',
  PRIMARY KEY (`friend_id`));
CREATE UNIQUE INDEX `friends_first_name_UNIQUE` ON `friends` (`friend_first_name` ASC);
CREATE UNIQUE INDEX `friend_last_name_UNIQUE` ON `friends` (`friend_last_name` ASC);

-- -----------------------------------------------------
-- Table `borrow`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `borrow` (
  `borrow_id` INT NOT NULL,
  `publications_id` INT NOT NULL,
  `friend_id` INT NOT NULL,
  `last_borrow` DATETIME NOT NULL,
  PRIMARY KEY (`borrow_id`),
  CONSTRAINT `publications_fk3`
    FOREIGN KEY (`publications_id`)
    REFERENCES `publications` (`publications_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `friends_fk1`
    FOREIGN KEY (`friend_id`)
    REFERENCES `friends` (`friend_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);
CREATE INDEX `publications_fk3_idx` ON `borrow` (`publications_id` ASC);
CREATE INDEX `friends_fk1_idx` ON `borrow` (`friend_id` ASC);
CREATE INDEX `borrow_idx` ON `borrow` (`publications_id` ASC, `friend_id` ASC);

