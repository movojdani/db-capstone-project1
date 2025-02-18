-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Little_Lemon_DB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Little_Lemon_DB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Little_Lemon_DB` DEFAULT CHARACTER SET utf8 ;
USE `Little_Lemon_DB` ;

-- -----------------------------------------------------
-- Table `Customers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Customers` ;

CREATE TABLE IF NOT EXISTS `Customers` (
  `CustomerID` INT NOT NULL AUTO_INCREMENT,
  `CustomerName` VARCHAR(45) NULL,
  `CustomerNumber` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Bookings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Bookings` ;

CREATE TABLE IF NOT EXISTS `Bookings` (
  `BookingID` INT NOT NULL AUTO_INCREMENT,
  `BookingDate` DATE NULL,
  `TableNumber` INT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `fk_Bookings_Customer_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `fk_Bookings_Customer`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Employees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Employees` ;

CREATE TABLE IF NOT EXISTS `Employees` (
  `EmployeeID` INT NOT NULL AUTO_INCREMENT,
  `EmployeeName` VARCHAR(45) NULL,
  `Role` VARCHAR(45) NULL,
  `Salary` DECIMAL(8,2) NULL,
  PRIMARY KEY (`EmployeeID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Delivery_Status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Delivery_Status` ;

CREATE TABLE IF NOT EXISTS `Delivery_Status` (
  `DeliveryID` INT NOT NULL AUTO_INCREMENT,
  `DeliveryDate` DATE NULL,
  `DeliveryStatus` VARCHAR(45) NULL,
  `BookingID` INT NOT NULL,
  `EmployeeID` INT NOT NULL,
  PRIMARY KEY (`DeliveryID`),
  INDEX `fk_Delivery_Status_Bookings1_idx` (`BookingID` ASC) VISIBLE,
  INDEX `fk_Delivery_Status_Employees1_idx` (`EmployeeID` ASC) VISIBLE,
  CONSTRAINT `fk_Delivery_Status_Bookings1`
    FOREIGN KEY (`BookingID`)
    REFERENCES `Bookings` (`BookingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Delivery_Status_Employees1`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `Employees` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Menu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Menu` ;

CREATE TABLE IF NOT EXISTS `Menu` (
  `MenuID` INT NOT NULL AUTO_INCREMENT,
  `Type` VARCHAR(45) NULL,
  `MenuName` VARCHAR(45) NULL,
  PRIMARY KEY (`MenuID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MenuItems`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MenuItems` ;

CREATE TABLE IF NOT EXISTS `MenuItems` (
  `MenuItemID` INT NOT NULL AUTO_INCREMENT,
  `CourseName` VARCHAR(45) NULL,
  `StarterName` VARCHAR(45) NULL,
  `Price` DECIMAL(8,2) NULL,
  `MenuID` INT NOT NULL,
  PRIMARY KEY (`MenuItemID`),
  INDEX `fk_MenuItems_Menu1_idx` (`MenuID` ASC) VISIBLE,
  CONSTRAINT `fk_MenuItems_Menu1`
    FOREIGN KEY (`MenuID`)
    REFERENCES `Menu` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Orders` ;

CREATE TABLE IF NOT EXISTS `Orders` (
  `OrderID` INT NOT NULL AUTO_INCREMENT,
  `OrderDate` DATE NULL,
  `Quantity` INT NULL,
  `TotalCost` DECIMAL(8,2) NULL,
  `DeliveryID` INT NOT NULL,
  `MenuItemID` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `fk_Orders_Delivery_Status1_idx` (`DeliveryID` ASC) VISIBLE,
  INDEX `fk_Orders_MenuItems1_idx` (`MenuItemID` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_Delivery_Status1`
    FOREIGN KEY (`DeliveryID`)
    REFERENCES `Delivery_Status` (`DeliveryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_MenuItems1`
    FOREIGN KEY (`MenuItemID`)
    REFERENCES `MenuItems` (`MenuItemID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
