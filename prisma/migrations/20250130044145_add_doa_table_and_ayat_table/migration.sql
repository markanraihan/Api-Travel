-- CreateTable
CREATE TABLE `Doa` (
    `doaid` VARCHAR(191) NOT NULL,
    `judul_doa` VARCHAR(191) NOT NULL,
    `perjalananid` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`doaid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Ayat` (
    `ayatid` VARCHAR(191) NOT NULL,
    `teks_ayat` VARCHAR(191) NOT NULL,
    `terjemahan` VARCHAR(191) NULL,
    `urutan_ayat` INTEGER NOT NULL,
    `doaid` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`ayatid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Doa` ADD CONSTRAINT `Doa_perjalananid_fkey` FOREIGN KEY (`perjalananid`) REFERENCES `Perjalanan`(`perjalananid`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Ayat` ADD CONSTRAINT `Ayat_doaid_fkey` FOREIGN KEY (`doaid`) REFERENCES `Doa`(`doaid`) ON DELETE RESTRICT ON UPDATE CASCADE;
