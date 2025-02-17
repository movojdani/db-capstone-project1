-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Customer` (
  `CustomerID` INT NOT NULL AUTO_INCREMENT,
  `CustomerName` VARCHAR(45) NULL,
  `CustomerNumber` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Bookings` (
  `BookingID` INT NOT NULL AUTO_INCREMENT,
  `BookingDate` DATE NULL,
  `TableNumber` INT NULL,
  `Customer_CustomerID` INT NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `fk_Bookings_Customer_idx` (`Customer_CustomerID` ASC) VISIBLE,
  CONSTRAINT `fk_Bookings_Customer`
    FOREIGN KEY (`Customer_CustomerID`)
    REFERENCES `LittleLemonDB`.`Customer` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menu` (
  `MenuID` INT NOT NULL AUTO_INCREMENT,
  `Type` VARCHAR(45) NULL,
  `MenuItem` VARCHAR(45) NULL,
  `Price` DECIMAL(8,2) NULL,
  PRIMARY KEY (`MenuID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Employees` (
  `EmployeeID` INT NOT NULL AUTO_INCREMENT,
  `EmployeeName` VARCHAR(45) NULL,
  `Role` VARCHAR(45) NULL,
  `Salary` DECIMAL(8,2) NULL,
  PRIMARY KEY (`EmployeeID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Delivery_Status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Delivery_Status` (
  `DeliveryID` INT NOT NULL AUTO_INCREMENT,
  `DeliveryDate` DATE NULL,
  `DeliveryStatus` VARCHAR(45) NULL,
  `Bookings_BookingID` INT NOT NULL,
  `Employees_EmployeeID` INT NOT NULL,
  PRIMARY KEY (`DeliveryID`),
  INDEX `fk_Delivery_Status_Bookings1_idx` (`Bookings_BookingID` ASC) VISIBLE,
  INDEX `fk_Delivery_Status_Employees1_idx` (`Employees_EmployeeID` ASC) VISIBLE,
  CONSTRAINT `fk_Delivery_Status_Bookings1`
    FOREIGN KEY (`Bookings_BookingID`)
    REFERENCES `LittleLemonDB`.`Bookings` (`BookingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Delivery_Status_Employees1`
    FOREIGN KEY (`Employees_EmployeeID`)
    REFERENCES `LittleLemonDB`.`Employees` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `OrderID` INT NOT NULL AUTO_INCREMENT,
  `OrderDate` DATE NULL,
  `Quantity` INT NULL,
  `TotalCost` DECIMAL(8,2) NULL,
  `Menu_MenuID` INT NOT NULL,
  `Delivery_Status_DeliveryID` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `fk_Orders_Menu1_idx` (`Menu_MenuID` ASC) VISIBLE,
  INDEX `fk_Orders_Delivery_Status1_idx` (`Delivery_Status_DeliveryID` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_Menu1`
    FOREIGN KEY (`Menu_MenuID`)
    REFERENCES `LittleLemonDB`.`Menu` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Delivery_Status1`
    FOREIGN KEY (`Delivery_Status_DeliveryID`)
    REFERENCES `LittleLemonDB`.`Delivery_Status` (`DeliveryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
