-- -----------------------------------------------------
-- Schema Group_15_Project_CRM
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Group_15_Project_CRM` DEFAULT CHARACTER SET utf8 ;
USE `Group_15_Project_CRM` ;

-- -----------------------------------------------------
-- Table `Group_15_Project_CRM`.`Employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Group_15_Project_CRM`.`Employee` ;

CREATE TABLE IF NOT EXISTS `Group_15_Project_CRM`.`Employee` (
  `Fname` VARCHAR(45) NOT NULL,
  `Mname` VARCHAR(45) NOT NULL,
  `Lname` VARCHAR(45) NOT NULL,
  `SSN` INT NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Manager_SSN` INT NULL,
  PRIMARY KEY (`SSN`),
  INDEX `Manager_SSN_idx` (`Manager_SSN` ASC) VISIBLE,
  CONSTRAINT `Manager_SSN`
    FOREIGN KEY (`Manager_SSN`)
    REFERENCES `Group_15_Project_CRM`.`Employee` (`SSN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Group_15_Project_CRM`.`Employee_Phone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Group_15_Project_CRM`.`Employee_Phone` ;

CREATE TABLE IF NOT EXISTS `Group_15_Project_CRM`.`Employee_Phone` (
  `SSN` INT NOT NULL,
  `Phone_Number` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`SSN`, `Phone_Number`),
  CONSTRAINT `SSN`
    FOREIGN KEY (`SSN`)
    REFERENCES `Group_15_Project_CRM`.`Employee` (`SSN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Group_15_Project_CRM`.`Contact`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Group_15_Project_CRM`.`Contact` ;

CREATE TABLE IF NOT EXISTS `Group_15_Project_CRM`.`Contact` (
  `idContact` INT NOT NULL AUTO_INCREMENT,
  `Fname` VARCHAR(45) NULL,
  `Mname` VARCHAR(45) NULL,
  `Lname` VARCHAR(45) NULL,
  `Works_at` INT NULL,
  PRIMARY KEY (`idContact`),
  INDEX `Works_at_idx` (`Works_at` ASC) VISIBLE,
  CONSTRAINT `Works_at`
    FOREIGN KEY (`Works_at`)
    REFERENCES `Group_15_Project_CRM`.`Client_Company` (`Tax_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Group_15_Project_CRM`.`Client_Company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Group_15_Project_CRM`.`Client_Company` ;

CREATE TABLE IF NOT EXISTS `Group_15_Project_CRM`.`Client_Company` (
  `Tax_ID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `Primary_Contact_ID` INT NULL,
  PRIMARY KEY (`Tax_ID`),
  INDEX `Primary_Contact_idx` (`Primary_Contact_ID` ASC) VISIBLE,
  CONSTRAINT `idContact`
    FOREIGN KEY (`Primary_Contact_ID`)
    REFERENCES `Group_15_Project_CRM`.`Contact` (`idContact`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Group_15_Project_CRM`.`Contact_Email`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Group_15_Project_CRM`.`Contact_Email` ;

CREATE TABLE IF NOT EXISTS `Group_15_Project_CRM`.`Contact_Email` (
  `Contact_id` INT NULL,
  `Email` VARCHAR(45) NULL,
  INDEX `contact_id_idx` (`Contact_id` ASC) VISIBLE,
  CONSTRAINT `contact_id`
    FOREIGN KEY (`Contact_id`)
    REFERENCES `Group_15_Project_CRM`.`Contact` (`idContact`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Group_15_Project_CRM`.`Contact_Phone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Group_15_Project_CRM`.`Contact_Phone` ;

CREATE TABLE IF NOT EXISTS `Group_15_Project_CRM`.`Contact_Phone` (
  `contact_id` INT NOT NULL,
  `Phone` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`contact_id`, `Phone`),
  FOREIGN KEY (`contact_id`)
  REFERENCES `Group_15_Project_CRM`.`Contact` (`idContact`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Group_15_Project_CRM`.`Account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Group_15_Project_CRM`.`Account` ;

CREATE TABLE IF NOT EXISTS `Group_15_Project_CRM`.`Account` (
  `Relationship_Type` VARCHAR(45) NOT NULL,
  `Client_Company_Tax_ID` INT NOT NULL,
  `Account_Mgr_SSN` INT NOT NULL,
  PRIMARY KEY (`Client_Company_Tax_ID`, `Account_Mgr_SSN`),
  INDEX `Account_Mgr_idx` (`Account_Mgr_SSN` ASC) VISIBLE,
  INDEX `Company_idx` (`Client_Company_Tax_ID` ASC) VISIBLE,
  CONSTRAINT `Account_Mgr`
    FOREIGN KEY (`Account_Mgr_SSN`)
    REFERENCES `Group_15_Project_CRM`.`Employee` (`SSN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Company`
    FOREIGN KEY (`Client_Company_Tax_ID`)
    REFERENCES `Group_15_Project_CRM`.`Client_Company` (`Tax_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Group_15_Project_CRM`.`Request_for_proposal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Group_15_Project_CRM`.`Request_for_proposal` ;

CREATE TABLE IF NOT EXISTS `Group_15_Project_CRM`.`Request_for_proposal` (
  `Client_Company_Tax_ID` INT NOT NULL,
  `Request_Number` INT NOT NULL,
  PRIMARY KEY (`Request_Number`),
  CONSTRAINT `Client_Company`
    FOREIGN KEY (`Client_Company_Tax_ID`)
    REFERENCES `Group_15_Project_CRM`.`Client_Company` (`Tax_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Group_15_Project_CRM`.`Opportunity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Group_15_Project_CRM`.`Opportunity` ;

CREATE TABLE IF NOT EXISTS `Group_15_Project_CRM`.`Opportunity` (
  `Salesman_SSN` INT NULL,
  `Request_Number` INT NULL,
  `Type` VARCHAR(45) NULL,
  `Opportunity_Number` INT NOT NULL,
  `Requirements` VARCHAR(255) NULL,
  PRIMARY KEY (`Opportunity_Number`),
  INDEX `Request_Number_idx` (`Request_Number` ASC) VISIBLE,
  INDEX `SalesMan_idx` (`Salesman_SSN` ASC) VISIBLE,
  CONSTRAINT `Request_Number`
    FOREIGN KEY (`Request_Number`)
    REFERENCES `Group_15_Project_CRM`.`Request_for_proposal` (`Request_Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `SalesMan`
    FOREIGN KEY (`Salesman_SSN`)
    REFERENCES `Group_15_Project_CRM`.`Employee` (`SSN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Group_15_Project_CRM`.`Quote`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Group_15_Project_CRM`.`Quote` ;

CREATE TABLE IF NOT EXISTS `Group_15_Project_CRM`.`Quote` (
  `Oportunity_Number` INT NULL,
  `Amount` VARCHAR(45) NULL,
  `Quote_Number` INT NOT NULL,
  PRIMARY KEY (`Quote_Number`),
  INDEX `Opportunity_idx` (`Oportunity_Number` ASC) VISIBLE,
  CONSTRAINT `Opportunity`
    FOREIGN KEY (`Oportunity_Number`)
    REFERENCES `Group_15_Project_CRM`.`Opportunity` (`Opportunity_Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Group_15_Project_CRM`.`Item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Group_15_Project_CRM`.`Item` ;

CREATE TABLE IF NOT EXISTS `Group_15_Project_CRM`.`Item` (
  `Quote_Number` INT NOT NULL,
  `Item_Description` VARCHAR(255) NULL,
  PRIMARY KEY (`Quote_Number`),
  CONSTRAINT `Quote_Number`
    FOREIGN KEY (`Quote_Number`)
    REFERENCES `Group_15_Project_CRM`.`Quote` (`Quote_Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
