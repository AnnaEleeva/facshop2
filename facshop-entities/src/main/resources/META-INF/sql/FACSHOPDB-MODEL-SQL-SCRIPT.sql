-- MySQL Script generated by MySQL Workbench
-- 05/14/15 02:50:54
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema FACSHOPDB
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `FACSHOPDB` ;

-- -----------------------------------------------------
-- Schema FACSHOPDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `FACSHOPDB` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `FACSHOPDB` ;

-- -----------------------------------------------------
-- Table `FACSHOPDB`.`CATEGORY`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FACSHOPDB`.`CATEGORY` ;

CREATE TABLE IF NOT EXISTS `FACSHOPDB`.`CATEGORY` (
  `ID` INT NOT NULL,
  `NAME` VARCHAR(45) NOT NULL,
  `TAGS` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`));

CREATE UNIQUE INDEX `SQL_CATEGORY_ID_INDEX` ON `FACSHOPDB`.`CATEGORY` (`ID` ASC);


-- -----------------------------------------------------
-- Table `FACSHOPDB`.`PERSON`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FACSHOPDB`.`PERSON` ;

CREATE TABLE IF NOT EXISTS `FACSHOPDB`.`PERSON` (
  `ID` INT NOT NULL,
  `FIRSTNAME` VARCHAR(50) NOT NULL,
  `LASTNAME` VARCHAR(100) NOT NULL,
  `EMAIL` VARCHAR(45) NOT NULL,
  `ADDRESS` VARCHAR(45) NOT NULL,
  `CITY` VARCHAR(45) NOT NULL,
  `PASSWORD` VARCHAR(100) NULL DEFAULT NULL,
  `DTYPE` VARCHAR(31) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`));

CREATE UNIQUE INDEX `SQL_PERSON_ID_INDEX` ON `FACSHOPDB`.`PERSON` (`ID` ASC);

CREATE UNIQUE INDEX `SQL_PERSON_EMAIL_INDEX` ON `FACSHOPDB`.`PERSON` (`EMAIL` ASC);


-- -----------------------------------------------------
-- Table `FACSHOPDB`.`GROUPS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FACSHOPDB`.`GROUPS` ;

CREATE TABLE IF NOT EXISTS `FACSHOPDB`.`GROUPS` (
  `ID` INT NOT NULL,
  `NAME` VARCHAR(45) NOT NULL,
  `DESCRIPTION` VARCHAR(300) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`));

CREATE UNIQUE INDEX `SQL_GROUPS_NAME_INDEX` ON `FACSHOPDB`.`GROUPS` (`NAME` ASC);


-- -----------------------------------------------------
-- Table `FACSHOPDB`.`PERSON_GROUPS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FACSHOPDB`.`PERSON_GROUPS` ;

CREATE TABLE IF NOT EXISTS `FACSHOPDB`.`PERSON_GROUPS` (
  `GROUPS_NAME` VARCHAR(45) NOT NULL,
  `PERSON_EMAIL` VARCHAR(45) NOT NULL,
  CONSTRAINT `FK_PERSON_GROUPS_PERSON`
    FOREIGN KEY (`PERSON_EMAIL`)
    REFERENCES `FACSHOPDB`.`PERSON` (`EMAIL`),
  CONSTRAINT `FK_PERSON_GROUPS_GROUPS`
    FOREIGN KEY (`GROUPS_NAME`)
    REFERENCES `FACSHOPDB`.`GROUPS` (`NAME`));

CREATE INDEX `SQL_PERSONGROUPS_EMAIL_INDEX` ON `FACSHOPDB`.`PERSON_GROUPS` (`PERSON_EMAIL` ASC);

CREATE INDEX `SQL_PERSONGROUPS_NAME_INDEX` ON `FACSHOPDB`.`PERSON_GROUPS` (`GROUPS_NAME` ASC);


-- -----------------------------------------------------
-- Table `FACSHOPDB`.`ORDER_STATUS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FACSHOPDB`.`ORDER_STATUS` ;

CREATE TABLE IF NOT EXISTS `FACSHOPDB`.`ORDER_STATUS` (
  `ID` INT NOT NULL,
  `STATUS` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`));

CREATE UNIQUE INDEX `SQL_ORDERSTATUS_ID_INDEX` ON `FACSHOPDB`.`ORDER_STATUS` (`ID` ASC);


-- -----------------------------------------------------
-- Table `FACSHOPDB`.`CUSTOMER_ORDER`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FACSHOPDB`.`CUSTOMER_ORDER` ;

CREATE TABLE IF NOT EXISTS `FACSHOPDB`.`CUSTOMER_ORDER` (
  `ID` INT NOT NULL,
  `AMOUNT` FLOAT(52) NOT NULL,
  `DATE_CREATED` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CUSTOMER_ID` INT NOT NULL,
  `STATUS_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `FK_CUSTOMER_ORDER_ORDER_STATUS1`
    FOREIGN KEY (`STATUS_ID`)
    REFERENCES `FACSHOPDB`.`ORDER_STATUS` (`ID`),
  CONSTRAINT `FK_CUSTOMER_ORDER_CUSTOMER1`
    FOREIGN KEY (`CUSTOMER_ID`)
    REFERENCES `FACSHOPDB`.`PERSON` (`ID`));

CREATE INDEX `SQL_ORDER_STATUS_ID_INDEX` ON `FACSHOPDB`.`CUSTOMER_ORDER` (`STATUS_ID` ASC);

CREATE INDEX `SQL_ORDER_CUSTOMER_ID_INDEX` ON `FACSHOPDB`.`CUSTOMER_ORDER` (`CUSTOMER_ID` ASC);

CREATE UNIQUE INDEX `SQL_ORDER_ID_INDEX` ON `FACSHOPDB`.`CUSTOMER_ORDER` (`ID` ASC);


-- -----------------------------------------------------
-- Table `FACSHOPDB`.`PRODUCT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FACSHOPDB`.`PRODUCT` ;

CREATE TABLE IF NOT EXISTS `FACSHOPDB`.`PRODUCT` (
  `ID` INT NOT NULL,
  `NAME` VARCHAR(45) NOT NULL,
  `PRICE` DECIMAL(10,2) NOT NULL,
  `DESCRIPTION` VARCHAR(45) NOT NULL,
  `IMG` VARCHAR(45) NULL DEFAULT NULL,
  `CATEGORY_ID` INT NOT NULL,
  `IMG_SRC` BLOB(1073741823) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `FK_PRODUCT_CATEGORY`
    FOREIGN KEY (`CATEGORY_ID`)
    REFERENCES `FACSHOPDB`.`CATEGORY` (`ID`));

CREATE UNIQUE INDEX `SQL_PRODUCT_ID_INDEX` ON `FACSHOPDB`.`PRODUCT` (`ID` ASC);

CREATE INDEX `SQL_PRODUCT_CATEGORY` ON `FACSHOPDB`.`PRODUCT` (`CATEGORY_ID` ASC);


-- -----------------------------------------------------
-- Table `FACSHOPDB`.`ORDER_DETAIL`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FACSHOPDB`.`ORDER_DETAIL` ;

CREATE TABLE IF NOT EXISTS `FACSHOPDB`.`ORDER_DETAIL` (
  `ORDER_ID` INT NOT NULL,
  `PRODUCT_ID` INT NOT NULL,
  `QTY` INT NOT NULL,
  PRIMARY KEY (`ORDER_ID`, `PRODUCT_ID`),
  CONSTRAINT `FK_ORDER_DETAIL_PRODUCT`
    FOREIGN KEY (`PRODUCT_ID`)
    REFERENCES `FACSHOPDB`.`PRODUCT` (`ID`),
  CONSTRAINT `FK_ORDER_DETAIL_ORDER`
    FOREIGN KEY (`ORDER_ID`)
    REFERENCES `FACSHOPDB`.`CUSTOMER_ORDER` (`ID`));

CREATE UNIQUE INDEX `SQL_ORDER_DETAIL_INDEX` ON `FACSHOPDB`.`ORDER_DETAIL` (`ORDER_ID` ASC, `PRODUCT_ID` ASC);

CREATE INDEX `SQL_ORDER_PRODUCT_ID_INDEX` ON `FACSHOPDB`.`ORDER_DETAIL` (`PRODUCT_ID` ASC);

CREATE INDEX `SQL_ORDER_DETAIL_ID_INDEX` ON `FACSHOPDB`.`ORDER_DETAIL` (`ORDER_ID` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
