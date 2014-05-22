-- ----------------------------------------------------------------------------
-- MySQL Workbench Migration
-- Migrated Schemata: qualiexplorer
-- Source Schemata: qualiexplorer
-- Created: Fri May 16 12:06:35 2014
-- ----------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;;

-- ----------------------------------------------------------------------------
-- Schema qualiexplorer
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `qualiexplorer` ;
CREATE SCHEMA IF NOT EXISTS `qualiexplorer` ;

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.auth_group
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`auth_group` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `auth_group_name_key` (`name` ASC));

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.auth_group_permissions
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`auth_group_permissions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `group_id` INT NOT NULL,
  `permission_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `auth_group_permissions_group_id` (`group_id` ASC),
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_key` (`group_id` ASC, `permission_id` ASC),
  INDEX `auth_group_permissions_permission_id` (`permission_id` ASC),
  CONSTRAINT `auth_group_permissions_permission_id_fkey`
    FOREIGN KEY (`permission_id`)
    REFERENCES `qualiexplorer`.`auth_permission` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `group_id_refs_id_3cea63fe`
    FOREIGN KEY (`group_id`)
    REFERENCES `qualiexplorer`.`auth_group` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.auth_permission
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`auth_permission` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `content_type_id` INT NOT NULL,
  `codename` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `auth_permission_content_type_id` (`content_type_id` ASC),
  UNIQUE INDEX `auth_permission_content_type_id_codename_key` (`content_type_id` ASC, `codename` ASC),
  CONSTRAINT `content_type_id_refs_id_728de91f`
    FOREIGN KEY (`content_type_id`)
    REFERENCES `qualiexplorer`.`django_content_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.auth_user
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`auth_user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(30) NOT NULL,
  `first_name` VARCHAR(30) NOT NULL,
  `last_name` VARCHAR(30) NOT NULL,
  `email` VARCHAR(75) NOT NULL,
  `password` VARCHAR(128) NOT NULL,
  `is_staff` INT NOT NULL,
  `is_active` INT NOT NULL,
  `is_superuser` INT NOT NULL,
  `last_login` DATETIME NOT NULL,
  `date_joined` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `auth_user_username_key` (`username` ASC));

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.auth_user_groups
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`auth_user_groups` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `group_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `auth_user_groups_group_id` (`group_id` ASC),
  INDEX `auth_user_groups_user_id` (`user_id` ASC),
  UNIQUE INDEX `auth_user_groups_user_id_group_id_key` (`user_id` ASC, `group_id` ASC),
  CONSTRAINT `auth_user_groups_group_id_fkey`
    FOREIGN KEY (`group_id`)
    REFERENCES `qualiexplorer`.`auth_group` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `user_id_refs_id_831107f1`
    FOREIGN KEY (`user_id`)
    REFERENCES `qualiexplorer`.`auth_user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.auth_user_user_permissions
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`auth_user_user_permissions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `permission_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `auth_user_user_permissions_permission_id` (`permission_id` ASC),
  INDEX `auth_user_user_permissions_user_id` (`user_id` ASC),
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_key` (`user_id` ASC, `permission_id` ASC),
  CONSTRAINT `auth_user_user_permissions_permission_id_fkey`
    FOREIGN KEY (`permission_id`)
    REFERENCES `qualiexplorer`.`auth_permission` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `user_id_refs_id_f2045483`
    FOREIGN KEY (`user_id`)
    REFERENCES `qualiexplorer`.`auth_user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.django_admin_log
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`django_admin_log` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `action_time` DATETIME NOT NULL,
  `user_id` INT NOT NULL,
  `content_type_id` INT NULL,
  `object_id` LONGTEXT NULL,
  `object_repr` VARCHAR(200) NOT NULL,
  `action_flag` SMALLINT NOT NULL,
  `change_message` LONGTEXT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `django_admin_log_content_type_id` (`content_type_id` ASC),
  INDEX `django_admin_log_user_id` (`user_id` ASC),
  CONSTRAINT `django_admin_log_content_type_id_fkey`
    FOREIGN KEY (`content_type_id`)
    REFERENCES `qualiexplorer`.`django_content_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `django_admin_log_user_id_fkey`
    FOREIGN KEY (`user_id`)
    REFERENCES `qualiexplorer`.`auth_user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.django_content_type
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`django_content_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `app_label` VARCHAR(100) NOT NULL,
  `model` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `django_content_type_app_label_model_key` (`app_label` ASC, `model` ASC));

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.django_session
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`django_session` (
  `session_key` VARCHAR(40) NOT NULL,
  `session_data` LONGTEXT NOT NULL,
  `expire_date` DATETIME NOT NULL,
  PRIMARY KEY (`session_key`),
  INDEX `django_session_expire_date` (`expire_date` ASC));

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.django_site
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`django_site` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `domain` VARCHAR(100) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`));

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.glue_geo
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`glue_geo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `lat` DOUBLE NOT NULL,
  `lon` DOUBLE NOT NULL,
  `zoom` INT NOT NULL,
  `content` LONGTEXT NULL,
  PRIMARY KEY (`id`));

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.glue_page
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`glue_page` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `slug` VARCHAR(50) NOT NULL,
  `title` VARCHAR(160) NULL,
  `abstract` LONGTEXT NULL,
  `content` LONGTEXT NULL,
  `language` VARCHAR(2) NOT NULL,
  `sort` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `glue_page_slug` (`slug` ASC),
  UNIQUE INDEX `glue_page_slug_language_key` (`slug` ASC, `language` ASC),
  INDEX `glue_page_slug_like` (`slug` ASC));

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.glue_page_pins
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`glue_page_pins` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `page_id` INT NOT NULL,
  `pin_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `glue_page_pins_page_id` (`page_id` ASC),
  UNIQUE INDEX `glue_page_pins_page_id_pin_id_key` (`page_id` ASC, `pin_id` ASC),
  INDEX `glue_page_pins_pin_id` (`pin_id` ASC),
  CONSTRAINT `glue_page_pins_pin_id_fkey`
    FOREIGN KEY (`pin_id`)
    REFERENCES `qualiexplorer`.`glue_pin` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `page_id_refs_id_1f23420f`
    FOREIGN KEY (`page_id`)
    REFERENCES `qualiexplorer`.`glue_page` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.glue_pin
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`glue_pin` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `slug` VARCHAR(50) NOT NULL,
  `title` VARCHAR(160) NULL,
  `abstract` LONGTEXT NULL,
  `content` LONGTEXT NULL,
  `language` VARCHAR(2) NOT NULL,
  `mimetype` VARCHAR(255) NULL,
  `sort` INT NOT NULL,
  `date` DATE NULL,
  `date_last_modified` DATE NOT NULL,
  `local` VARCHAR(100) NULL,
  `permalink` LONGTEXT NULL,
  `parent_id` INT NULL,
  `status` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `glue_pin_parent_id` (`parent_id` ASC),
  INDEX `glue_pin_slug` (`slug` ASC),
  UNIQUE INDEX `glue_pin_slug_language_key` (`slug` ASC, `language` ASC),
  INDEX `glue_pin_slug_like` (`slug` ASC),
  CONSTRAINT `parent_id_refs_id_e967c58d`
    FOREIGN KEY (`parent_id`)
    REFERENCES `qualiexplorer`.`glue_pin` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.glue_pin_geos
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`glue_pin_geos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `pin_id` INT NOT NULL,
  `geo_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `glue_pin_geos_geo_id` (`geo_id` ASC),
  INDEX `glue_pin_geos_pin_id` (`pin_id` ASC),
  UNIQUE INDEX `glue_pin_geos_pin_id_geo_id_key` (`pin_id` ASC, `geo_id` ASC),
  CONSTRAINT `glue_pin_geos_geo_id_fkey`
    FOREIGN KEY (`geo_id`)
    REFERENCES `qualiexplorer`.`glue_geo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `pin_id_refs_id_2e8aa0b1`
    FOREIGN KEY (`pin_id`)
    REFERENCES `qualiexplorer`.`glue_pin` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.glue_pin_related
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`glue_pin_related` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `from_pin_id` INT NOT NULL,
  `to_pin_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `glue_pin_related_from_pin_id` (`from_pin_id` ASC),
  UNIQUE INDEX `glue_pin_related_from_pin_id_to_pin_id_key` (`from_pin_id` ASC, `to_pin_id` ASC),
  INDEX `glue_pin_related_to_pin_id` (`to_pin_id` ASC),
  CONSTRAINT `from_pin_id_refs_id_d7544a17`
    FOREIGN KEY (`from_pin_id`)
    REFERENCES `qualiexplorer`.`glue_pin` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `to_pin_id_refs_id_d7544a17`
    FOREIGN KEY (`to_pin_id`)
    REFERENCES `qualiexplorer`.`glue_pin` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.glue_pin_users
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`glue_pin_users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `pin_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `glue_pin_users_pin_id` (`pin_id` ASC),
  UNIQUE INDEX `glue_pin_users_pin_id_user_id_key` (`pin_id` ASC, `user_id` ASC),
  INDEX `glue_pin_users_user_id` (`user_id` ASC),
  CONSTRAINT `glue_pin_users_user_id_fkey`
    FOREIGN KEY (`user_id`)
    REFERENCES `qualiexplorer`.`auth_user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `pin_id_refs_id_39f47bde`
    FOREIGN KEY (`pin_id`)
    REFERENCES `qualiexplorer`.`glue_pin` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.glue_tag
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`glue_tag` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(128) NOT NULL,
  `slug` VARCHAR(128) NOT NULL,
  `type` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `glue_tag_slug` (`slug` ASC),
  INDEX `glue_tag_slug_like` (`slug` ASC),
  UNIQUE INDEX `glue_tag_type_slug_key` (`type` ASC, `slug` ASC));

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.outside_enquiry
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`outside_enquiry` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `slug` VARCHAR(50) NOT NULL,
  `title` VARCHAR(500) NULL,
  `abstract` LONGTEXT NULL,
  `content` LONGTEXT NULL,
  `language` VARCHAR(2) NOT NULL,
  `sort` INT NOT NULL,
  `enquete_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `outside_enquiry_enquete_id` (`enquete_id` ASC),
  UNIQUE INDEX `outside_enquiry_enquete_id_language_key` (`enquete_id` ASC, `language` ASC),
  INDEX `outside_enquiry_slug` (`slug` ASC),
  INDEX `outside_enquiry_slug_like` (`slug` ASC),
  CONSTRAINT `outside_enquiry_enquete_id_fkey`
    FOREIGN KEY (`enquete_id`)
    REFERENCES `qualiexplorer`.`reanalyseapp_enquete` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.outside_enquiry_pins
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`outside_enquiry_pins` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `enquiry_id` INT NOT NULL,
  `pin_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `outside_enquiry_pins_enquiry_id` (`enquiry_id` ASC),
  UNIQUE INDEX `outside_enquiry_pins_enquiry_id_pin_id_key` (`enquiry_id` ASC, `pin_id` ASC),
  INDEX `outside_enquiry_pins_pin_id` (`pin_id` ASC),
  CONSTRAINT `enquiry_id_refs_id_bb52cdb7`
    FOREIGN KEY (`enquiry_id`)
    REFERENCES `qualiexplorer`.`outside_enquiry` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `outside_enquiry_pins_pin_id_fkey`
    FOREIGN KEY (`pin_id`)
    REFERENCES `qualiexplorer`.`glue_pin` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.reanalyseapp_attribute
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`reanalyseapp_attribute` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `enquete_id` INT NOT NULL,
  `attributetype_id` INT NOT NULL,
  `name` LONGTEXT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `reanalyseapp_attribute_attributetype_id` (`attributetype_id` ASC),
  INDEX `reanalyseapp_attribute_enquete_id` (`enquete_id` ASC),
  CONSTRAINT `reanalyseapp_attribute_attributetype_id_fkey`
    FOREIGN KEY (`attributetype_id`)
    REFERENCES `qualiexplorer`.`reanalyseapp_attributetype` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `reanalyseapp_attribute_enquete_id_fkey`
    FOREIGN KEY (`enquete_id`)
    REFERENCES `qualiexplorer`.`reanalyseapp_enquete` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.reanalyseapp_attributetype
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`reanalyseapp_attributetype` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `enquete_id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `publicy` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `reanalyseapp_attributetype_enquete_id` (`enquete_id` ASC),
  CONSTRAINT `reanalyseapp_attributetype_enquete_id_fkey`
    FOREIGN KEY (`enquete_id`)
    REFERENCES `qualiexplorer`.`reanalyseapp_enquete` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.reanalyseapp_code
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`reanalyseapp_code` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `enquete_id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `reanalyseapp_code_enquete_id` (`enquete_id` ASC),
  CONSTRAINT `reanalyseapp_code_enquete_id_fkey`
    FOREIGN KEY (`enquete_id`)
    REFERENCES `qualiexplorer`.`reanalyseapp_enquete` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.reanalyseapp_code_textes
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`reanalyseapp_code_textes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `code_id` INT NOT NULL,
  `texte_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `reanalyseapp_code_textes_code_id` (`code_id` ASC),
  UNIQUE INDEX `reanalyseapp_code_textes_code_id_texte_id_key` (`code_id` ASC, `texte_id` ASC),
  INDEX `reanalyseapp_code_textes_texte_id` (`texte_id` ASC),
  CONSTRAINT `code_id_refs_id_37d097e6`
    FOREIGN KEY (`code_id`)
    REFERENCES `qualiexplorer`.`reanalyseapp_code` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `reanalyseapp_code_textes_texte_id_fkey`
    FOREIGN KEY (`texte_id`)
    REFERENCES `qualiexplorer`.`reanalyseapp_texte` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.reanalyseapp_enquete
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`reanalyseapp_enquete` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(250) NOT NULL,
  `uploadpath` VARCHAR(250) NOT NULL,
  `locationpath` VARCHAR(250) NOT NULL,
  `metadata` LONGTEXT NOT NULL,
  `ese` LONGTEXT NOT NULL,
  `status` VARCHAR(2) NOT NULL,
  `statuscomplete` BIGINT NOT NULL,
  `date` DATETIME NOT NULL,
  `ddi_id` VARCHAR(170) NOT NULL,
  PRIMARY KEY (`id`));

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.reanalyseapp_ngram
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`reanalyseapp_ngram` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `enquete_id` INT NOT NULL,
  `content` VARCHAR(255) NOT NULL,
  `df` DOUBLE NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `reanalyseapp_ngram_enquete_id` (`enquete_id` ASC),
  CONSTRAINT `reanalyseapp_ngram_enquete_id_fkey`
    FOREIGN KEY (`enquete_id`)
    REFERENCES `qualiexplorer`.`reanalyseapp_enquete` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.reanalyseapp_ngramspeaker
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`reanalyseapp_ngramspeaker` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `enquete_id` INT NOT NULL,
  `ngram_id` INT NOT NULL,
  `speaker_id` INT NOT NULL,
  `tf` DOUBLE NOT NULL,
  `tn` BIGINT NOT NULL,
  `tfidf` DOUBLE NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `reanalyseapp_ngramspeaker_enquete_id` (`enquete_id` ASC),
  INDEX `reanalyseapp_ngramspeaker_ngram_id` (`ngram_id` ASC),
  INDEX `reanalyseapp_ngramspeaker_speaker_id` (`speaker_id` ASC),
  CONSTRAINT `reanalyseapp_ngramspeaker_enquete_id_fkey`
    FOREIGN KEY (`enquete_id`)
    REFERENCES `qualiexplorer`.`reanalyseapp_enquete` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `reanalyseapp_ngramspeaker_ngram_id_fkey`
    FOREIGN KEY (`ngram_id`)
    REFERENCES `qualiexplorer`.`reanalyseapp_ngram` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `reanalyseapp_ngramspeaker_speaker_id_fkey`
    FOREIGN KEY (`speaker_id`)
    REFERENCES `qualiexplorer`.`reanalyseapp_speaker` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.reanalyseapp_sentence
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`reanalyseapp_sentence` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `enquete_id` INT NOT NULL,
  `texte_id` INT NOT NULL,
  `speaker_id` INT NOT NULL,
  `code_id` INT NOT NULL,
  `contenttxt` LONGTEXT NOT NULL,
  `contenthtml` LONGTEXT NOT NULL,
  `i` BIGINT NOT NULL,
  `o` BIGINT NOT NULL,
  `n` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `reanalyseapp_sentence_code_id` (`code_id` ASC),
  INDEX `reanalyseapp_sentence_enquete_id` (`enquete_id` ASC),
  INDEX `reanalyseapp_sentence_speaker_id` (`speaker_id` ASC),
  INDEX `reanalyseapp_sentence_texte_id` (`texte_id` ASC),
  CONSTRAINT `reanalyseapp_sentence_code_id_fkey`
    FOREIGN KEY (`code_id`)
    REFERENCES `qualiexplorer`.`reanalyseapp_code` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `reanalyseapp_sentence_enquete_id_fkey`
    FOREIGN KEY (`enquete_id`)
    REFERENCES `qualiexplorer`.`reanalyseapp_enquete` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `reanalyseapp_sentence_speaker_id_fkey`
    FOREIGN KEY (`speaker_id`)
    REFERENCES `qualiexplorer`.`reanalyseapp_speaker` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `reanalyseapp_sentence_texte_id_fkey`
    FOREIGN KEY (`texte_id`)
    REFERENCES `qualiexplorer`.`reanalyseapp_texte` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.reanalyseapp_sitecontent
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`reanalyseapp_sitecontent` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(400) NOT NULL,
  `lang` VARCHAR(2) NOT NULL,
  `contenthtml` LONGTEXT NOT NULL,
  PRIMARY KEY (`id`));

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.reanalyseapp_speaker
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`reanalyseapp_speaker` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `enquete_id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `ddi_id` VARCHAR(255) NOT NULL,
  `ddi_type` VARCHAR(255) NOT NULL,
  `public` INT NOT NULL,
  `color` VARCHAR(255) NOT NULL,
  `contenttxt` LONGTEXT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `reanalyseapp_speaker_enquete_id` (`enquete_id` ASC),
  CONSTRAINT `reanalyseapp_speaker_enquete_id_fkey`
    FOREIGN KEY (`enquete_id`)
    REFERENCES `qualiexplorer`.`reanalyseapp_enquete` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.reanalyseapp_speaker_attributes
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`reanalyseapp_speaker_attributes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `speaker_id` INT NOT NULL,
  `attribute_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `reanalyseapp_speaker_attributes_attribute_id` (`attribute_id` ASC),
  INDEX `reanalyseapp_speaker_attributes_speaker_id` (`speaker_id` ASC),
  UNIQUE INDEX `reanalyseapp_speaker_attributes_speaker_id_attribute_id_key` (`speaker_id` ASC, `attribute_id` ASC),
  CONSTRAINT `reanalyseapp_speaker_attributes_attribute_id_fkey`
    FOREIGN KEY (`attribute_id`)
    REFERENCES `qualiexplorer`.`reanalyseapp_attribute` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `speaker_id_refs_id_4a978a7c`
    FOREIGN KEY (`speaker_id`)
    REFERENCES `qualiexplorer`.`reanalyseapp_speaker` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.reanalyseapp_speaker_textes
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`reanalyseapp_speaker_textes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `speaker_id` INT NOT NULL,
  `texte_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `reanalyseapp_speaker_textes_speaker_id` (`speaker_id` ASC),
  UNIQUE INDEX `reanalyseapp_speaker_textes_speaker_id_texte_id_key` (`speaker_id` ASC, `texte_id` ASC),
  INDEX `reanalyseapp_speaker_textes_texte_id` (`texte_id` ASC),
  CONSTRAINT `reanalyseapp_speaker_textes_texte_id_fkey`
    FOREIGN KEY (`texte_id`)
    REFERENCES `qualiexplorer`.`reanalyseapp_texte` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `speaker_id_refs_id_f7f804b2`
    FOREIGN KEY (`speaker_id`)
    REFERENCES `qualiexplorer`.`reanalyseapp_speaker` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.reanalyseapp_speakerset
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`reanalyseapp_speakerset` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `enquete_id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `description` LONGTEXT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `reanalyseapp_speakerset_enquete_id` (`enquete_id` ASC),
  CONSTRAINT `reanalyseapp_speakerset_enquete_id_fkey`
    FOREIGN KEY (`enquete_id`)
    REFERENCES `qualiexplorer`.`reanalyseapp_enquete` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.reanalyseapp_speakerset_speakers
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`reanalyseapp_speakerset_speakers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `speakerset_id` INT NOT NULL,
  `speaker_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `reanalyseapp_speakerset_speakers_speaker_id` (`speaker_id` ASC),
  INDEX `reanalyseapp_speakerset_speakers_speakerset_id` (`speakerset_id` ASC),
  UNIQUE INDEX `reanalyseapp_speakerset_speakers_speakerset_id_speaker_id_key` (`speakerset_id` ASC, `speaker_id` ASC),
  CONSTRAINT `reanalyseapp_speakerset_speakers_speaker_id_fkey`
    FOREIGN KEY (`speaker_id`)
    REFERENCES `qualiexplorer`.`reanalyseapp_speaker` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `speakerset_id_refs_id_c3698e5f`
    FOREIGN KEY (`speakerset_id`)
    REFERENCES `qualiexplorer`.`reanalyseapp_speakerset` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.reanalyseapp_tag
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`reanalyseapp_tag` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(128) NOT NULL,
  `slug` VARCHAR(128) NOT NULL,
  `type` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `reanalyseapp_tag_slug` (`slug` ASC),
  INDEX `reanalyseapp_tag_slug_like` (`slug` ASC),
  UNIQUE INDEX `reanalyseapp_tag_type_slug_key` (`type` ASC, `slug` ASC));

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.reanalyseapp_texte
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`reanalyseapp_texte` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `enquete_id` INT NOT NULL,
  `locationpath` VARCHAR(500) NOT NULL,
  `filesize` BIGINT NOT NULL,
  `doctype` VARCHAR(4) NOT NULL,
  `doccat1` VARCHAR(25) NOT NULL,
  `doccat2` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `description` LONGTEXT NOT NULL,
  `date` DATE NOT NULL,
  `location` VARCHAR(255) NOT NULL,
  `locationgeo` VARCHAR(255) NULL,
  `public` INT NOT NULL,
  `status` VARCHAR(20) NOT NULL,
  `statuscomplete` BIGINT NOT NULL,
  `contenttxt` LONGTEXT NOT NULL,
  `contenthtml` LONGTEXT NOT NULL,
  `contentxml` LONGTEXT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `reanalyseapp_texte_enquete_id` (`enquete_id` ASC),
  CONSTRAINT `reanalyseapp_texte_enquete_id_fkey`
    FOREIGN KEY (`enquete_id`)
    REFERENCES `qualiexplorer`.`reanalyseapp_enquete` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.reanalyseapp_texte_tags
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`reanalyseapp_texte_tags` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `texte_id` INT NOT NULL,
  `tag_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `reanalyseapp_texte_tags_tag_id` (`tag_id` ASC),
  INDEX `reanalyseapp_texte_tags_texte_id` (`texte_id` ASC),
  UNIQUE INDEX `reanalyseapp_texte_tags_texte_id_tag_id_key` (`texte_id` ASC, `tag_id` ASC),
  CONSTRAINT `reanalyseapp_texte_tags_tag_id_fkey`
    FOREIGN KEY (`tag_id`)
    REFERENCES `qualiexplorer`.`reanalyseapp_tag` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `texte_id_refs_id_34a54a3e`
    FOREIGN KEY (`texte_id`)
    REFERENCES `qualiexplorer`.`reanalyseapp_texte` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.reanalyseapp_visualization
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`reanalyseapp_visualization` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `enquete_id` INT NOT NULL,
  `name` VARCHAR(200) NOT NULL,
  `locationpath` VARCHAR(250) NOT NULL,
  `description` LONGTEXT NOT NULL,
  `viztype` VARCHAR(50) NOT NULL,
  `status` VARCHAR(2) NOT NULL,
  `public` INT NOT NULL,
  `date` DATETIME NOT NULL,
  `contenthtml` LONGTEXT NOT NULL,
  `json` LONGTEXT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `reanalyseapp_visualization_enquete_id` (`enquete_id` ASC),
  CONSTRAINT `reanalyseapp_visualization_enquete_id_fkey`
    FOREIGN KEY (`enquete_id`)
    REFERENCES `qualiexplorer`.`reanalyseapp_enquete` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.reanalyseapp_visualization_speakers
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`reanalyseapp_visualization_speakers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `visualization_id` INT NOT NULL,
  `speaker_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `reanalyseapp_visualization_spea_visualization_id_speaker_id_key` (`visualization_id` ASC, `speaker_id` ASC),
  INDEX `reanalyseapp_visualization_speakers_speaker_id` (`speaker_id` ASC),
  INDEX `reanalyseapp_visualization_speakers_visualization_id` (`visualization_id` ASC),
  CONSTRAINT `speaker_id_refs_id_b6f691c4`
    FOREIGN KEY (`speaker_id`)
    REFERENCES `qualiexplorer`.`reanalyseapp_speaker` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `visualization_id_refs_id_6cb2be1d`
    FOREIGN KEY (`visualization_id`)
    REFERENCES `qualiexplorer`.`reanalyseapp_visualization` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.reanalyseapp_visualization_textes
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`reanalyseapp_visualization_textes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `visualization_id` INT NOT NULL,
  `texte_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `reanalyseapp_visualization_textes_texte_id` (`texte_id` ASC),
  INDEX `reanalyseapp_visualization_textes_visualization_id` (`visualization_id` ASC),
  UNIQUE INDEX `reanalyseapp_visualization_textes_visualization_id_texte_id_key` (`visualization_id` ASC, `texte_id` ASC),
  CONSTRAINT `texte_id_refs_id_8d4eda44`
    FOREIGN KEY (`texte_id`)
    REFERENCES `qualiexplorer`.`reanalyseapp_texte` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `visualization_id_refs_id_935874ea`
    FOREIGN KEY (`visualization_id`)
    REFERENCES `qualiexplorer`.`reanalyseapp_visualization` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.reanalyseapp_word
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`reanalyseapp_word` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `enquete_id` INT NOT NULL,
  `wordentityspeaker_id` INT NOT NULL,
  `sentence_id` INT NOT NULL,
  `speaker_id` INT NOT NULL,
  `n` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `reanalyseapp_word_enquete_id` (`enquete_id` ASC),
  INDEX `reanalyseapp_word_sentence_id` (`sentence_id` ASC),
  INDEX `reanalyseapp_word_speaker_id` (`speaker_id` ASC),
  INDEX `reanalyseapp_word_wordentityspeaker_id` (`wordentityspeaker_id` ASC),
  CONSTRAINT `reanalyseapp_word_enquete_id_fkey`
    FOREIGN KEY (`enquete_id`)
    REFERENCES `qualiexplorer`.`reanalyseapp_enquete` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `reanalyseapp_word_sentence_id_fkey`
    FOREIGN KEY (`sentence_id`)
    REFERENCES `qualiexplorer`.`reanalyseapp_sentence` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `reanalyseapp_word_speaker_id_fkey`
    FOREIGN KEY (`speaker_id`)
    REFERENCES `qualiexplorer`.`reanalyseapp_speaker` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `reanalyseapp_word_wordentityspeaker_id_fkey`
    FOREIGN KEY (`wordentityspeaker_id`)
    REFERENCES `qualiexplorer`.`reanalyseapp_wordentityspeaker` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.reanalyseapp_wordentity
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`reanalyseapp_wordentity` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `enquete_id` INT NOT NULL,
  `code_id` INT NOT NULL,
  `content` VARCHAR(255) NOT NULL,
  `description` LONGTEXT NOT NULL,
  `df` DOUBLE NOT NULL,
  `maxtfidf` DOUBLE NOT NULL,
  `maxspeakerid` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `reanalyseapp_wordentity_code_id` (`code_id` ASC),
  INDEX `reanalyseapp_wordentity_enquete_id` (`enquete_id` ASC),
  CONSTRAINT `reanalyseapp_wordentity_code_id_fkey`
    FOREIGN KEY (`code_id`)
    REFERENCES `qualiexplorer`.`reanalyseapp_code` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `reanalyseapp_wordentity_enquete_id_fkey`
    FOREIGN KEY (`enquete_id`)
    REFERENCES `qualiexplorer`.`reanalyseapp_enquete` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.reanalyseapp_wordentity_textes
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`reanalyseapp_wordentity_textes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `wordentity_id` INT NOT NULL,
  `texte_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `reanalyseapp_wordentity_textes_texte_id` (`texte_id` ASC),
  INDEX `reanalyseapp_wordentity_textes_wordentity_id` (`wordentity_id` ASC),
  UNIQUE INDEX `reanalyseapp_wordentity_textes_wordentity_id_texte_id_key` (`wordentity_id` ASC, `texte_id` ASC),
  CONSTRAINT `reanalyseapp_wordentity_textes_texte_id_fkey`
    FOREIGN KEY (`texte_id`)
    REFERENCES `qualiexplorer`.`reanalyseapp_texte` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `wordentity_id_refs_id_959244b6`
    FOREIGN KEY (`wordentity_id`)
    REFERENCES `qualiexplorer`.`reanalyseapp_wordentity` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.reanalyseapp_wordentityspeaker
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`reanalyseapp_wordentityspeaker` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `speaker_id` INT NOT NULL,
  `wordentity_id` INT NOT NULL,
  `tf` DOUBLE NOT NULL,
  `tfidf` DOUBLE NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `reanalyseapp_wordentityspeaker_speaker_id` (`speaker_id` ASC),
  INDEX `reanalyseapp_wordentityspeaker_wordentity_id` (`wordentity_id` ASC),
  CONSTRAINT `reanalyseapp_wordentityspeaker_speaker_id_fkey`
    FOREIGN KEY (`speaker_id`)
    REFERENCES `qualiexplorer`.`reanalyseapp_speaker` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `reanalyseapp_wordentityspeaker_wordentity_id_fkey`
    FOREIGN KEY (`wordentity_id`)
    REFERENCES `qualiexplorer`.`reanalyseapp_wordentity` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.reanalyseapp_wordentityspeaker_textes
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`reanalyseapp_wordentityspeaker_textes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `wordentityspeaker_id` INT NOT NULL,
  `texte_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `reanalyseapp_wordentityspeake_wordentityspeaker_id_texte_id_key` (`wordentityspeaker_id` ASC, `texte_id` ASC),
  INDEX `reanalyseapp_wordentityspeaker_textes_texte_id` (`texte_id` ASC),
  INDEX `reanalyseapp_wordentityspeaker_textes_wordentityspeaker_id` (`wordentityspeaker_id` ASC),
  CONSTRAINT `reanalyseapp_wordentityspeaker_textes_texte_id_fkey`
    FOREIGN KEY (`texte_id`)
    REFERENCES `qualiexplorer`.`reanalyseapp_texte` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `wordentityspeaker_id_refs_id_28009b0a`
    FOREIGN KEY (`wordentityspeaker_id`)
    REFERENCES `qualiexplorer`.`reanalyseapp_wordentityspeaker` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table qualiexplorer.south_migrationhistory
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualiexplorer`.`south_migrationhistory` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `app_name` VARCHAR(255) NOT NULL,
  `migration` VARCHAR(255) NOT NULL,
  `applied` DATETIME NOT NULL,
  PRIMARY KEY (`id`));
SET FOREIGN_KEY_CHECKS = 1;;
