-- DropForeignKey
ALTER TABLE `ayat` DROP FOREIGN KEY `Ayat_doaid_fkey`;

-- CreateTable
CREATE TABLE `Video` (
    `videoid` VARCHAR(191) NOT NULL,
    `judul_vid` VARCHAR(191) NOT NULL,
    `deskripsi` VARCHAR(191) NOT NULL,
    `link_vid` VARCHAR(191) NOT NULL,
    `thumbnail` VARCHAR(191) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`videoid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Ayat` ADD CONSTRAINT `Ayat_doaid_fkey` FOREIGN KEY (`doaid`) REFERENCES `Doa`(`doaid`) ON DELETE CASCADE ON UPDATE CASCADE;
