/*
  Warnings:

  - The primary key for the `doa` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `doaid` on the `doa` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `VarChar(36)`.

*/
-- AlterTable
ALTER TABLE `doa` DROP PRIMARY KEY,
    MODIFY `doaid` VARCHAR(36) NOT NULL,
    ADD PRIMARY KEY (`doaid`);

-- AlterTable
ALTER TABLE `progress` ADD COLUMN `is_finished` BOOLEAN NOT NULL DEFAULT false,
    ADD COLUMN `waktu_mulai` DATETIME(3) NULL;

-- CreateTable
CREATE TABLE `Progress_Doa` (
    `progress_doaid` VARCHAR(36) NOT NULL,
    `progressid` VARCHAR(36) NOT NULL,
    `doaid` VARCHAR(36) NOT NULL,
    `doa_mulai` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `doa_selesai` DATETIME(3) NULL,
    `durasi_doa` INTEGER NULL,
    `cek_doa` BOOLEAN NOT NULL DEFAULT false,

    UNIQUE INDEX `Progress_Doa_progressid_doaid_key`(`progressid`, `doaid`),
    PRIMARY KEY (`progress_doaid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Progress_Doa` ADD CONSTRAINT `Progress_Doa_progressid_fkey` FOREIGN KEY (`progressid`) REFERENCES `Progress`(`progressid`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Progress_Doa` ADD CONSTRAINT `Progress_Doa_doaid_fkey` FOREIGN KEY (`doaid`) REFERENCES `Doa`(`doaid`) ON DELETE RESTRICT ON UPDATE CASCADE;
