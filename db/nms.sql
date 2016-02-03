SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `nms` DEFAULT CHARACTER SET utf8 ;
USE `nms` ;

-- -----------------------------------------------------
-- Table `nms`.`acct_user`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `nms`.`acct_user` (
  `id` VARCHAR(36) NOT NULL ,
  `nick_name` VARCHAR(36) NULL ,
  `telephone` VARCHAR(45) NULL ,
  `register_time` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = '用户列表' ;


-- -----------------------------------------------------
-- Table `nms`.`acct_role`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `nms`.`acct_role` (
  `id` VARCHAR(36) NOT NULL ,
  `name` VARCHAR(36) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci, 
COMMENT = '角色列表' ;


-- -----------------------------------------------------
-- Table `nms`.`acct_authority`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `nms`.`acct_authority` (
  `id` VARCHAR(36) NOT NULL ,
  `name` VARCHAR(36) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci, 
COMMENT = '权限列表' ;


-- -----------------------------------------------------
-- Table `nms`.`acct_group`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `nms`.`acct_group` (
  `id` VARCHAR(36) NOT NULL ,
  `name` VARCHAR(36) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci, 
COMMENT = '用户组' ;


-- -----------------------------------------------------
-- Table `nms`.`acct_user_group`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `nms`.`acct_user_group` (
  `group_id` VARCHAR(36) NOT NULL ,
  `user_id` VARCHAR(36) NOT NULL ,
  PRIMARY KEY (`group_id`, `user_id`) ,
  INDEX `fk_acct_user_group_acct_user1` (`user_id` ASC) ,
  CONSTRAINT `fk_acct_user_group_acct_group1`
    FOREIGN KEY (`group_id` )
    REFERENCES `nms`.`acct_group` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_acct_user_group_acct_user1`
    FOREIGN KEY (`user_id` )
    REFERENCES `nms`.`acct_user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci, 
COMMENT = '组' ;


-- -----------------------------------------------------
-- Table `nms`.`acct_user_role`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `nms`.`acct_user_role` (
  `user_id` VARCHAR(36) NOT NULL ,
  `role_id` VARCHAR(36) NOT NULL ,
  PRIMARY KEY (`user_id`, `role_id`) ,
  INDEX `fk_acct_user_role_acct_role1` (`role_id` ASC) ,
  CONSTRAINT `fk_acct_user_role_acct_user1`
    FOREIGN KEY (`user_id` )
    REFERENCES `nms`.`acct_user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_acct_user_role_acct_role1`
    FOREIGN KEY (`role_id` )
    REFERENCES `nms`.`acct_role` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci, 
COMMENT = '用户角色' ;


-- -----------------------------------------------------
-- Table `nms`.`acct_role_authority`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `nms`.`acct_role_authority` (
  `role_id` VARCHAR(36) NOT NULL ,
  `authority_id` VARCHAR(36) NOT NULL ,
  PRIMARY KEY (`role_id`, `authority_id`) ,
  INDEX `fk_acct_role_authority_acct_role1` (`role_id` ASC) ,
  INDEX `fk_acct_role_authority_acct_authority1` (`authority_id` ASC) ,
  CONSTRAINT `fk_acct_role_authority_acct_role1`
    FOREIGN KEY (`role_id` )
    REFERENCES `nms`.`acct_role` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_acct_role_authority_acct_authority1`
    FOREIGN KEY (`authority_id` )
    REFERENCES `nms`.`acct_authority` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
