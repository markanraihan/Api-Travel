-- CreateTable
CREATE TABLE `Grup` (
    `grupid` VARCHAR(36) NOT NULL,
    `nama_grup` VARCHAR(36) NOT NULL,
    `created_by` VARCHAR(36) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `finish_at` DATETIME(3) NULL,
    `open_user` INTEGER NOT NULL,
    `status` VARCHAR(50) NOT NULL,
    `userId` VARCHAR(36) NOT NULL,
    `roomid` VARCHAR(191) NULL,

    UNIQUE INDEX `Grup_roomid_key`(`roomid`),
    INDEX `Grup_userId_idx`(`userId`),
    PRIMARY KEY (`grupid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Peserta_Grup` (
    `peserta_grupid` VARCHAR(36) NOT NULL,
    `grupid` VARCHAR(36) NOT NULL,
    `userId` VARCHAR(36) NOT NULL,
    `roomid` VARCHAR(191) NULL,
    `joinedAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `online` VARCHAR(10) NOT NULL,
    `usersGoogleId` VARCHAR(36) NULL,

    UNIQUE INDEX `Peserta_Grup_roomid_key`(`roomid`),
    UNIQUE INDEX `Peserta_Grup_grupid_userId_key`(`grupid`, `userId`),
    PRIMARY KEY (`peserta_grupid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Progress` (
    `progressid` VARCHAR(36) NOT NULL,
    `grupid` VARCHAR(36) NOT NULL,
    `jenis_perjalanan` VARCHAR(20) NOT NULL,
    `live` INTEGER NOT NULL,
    `status` BOOLEAN NOT NULL,

    PRIMARY KEY (`progressid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Progress_perjalanan` (
    `progress_perjalananid` VARCHAR(36) NOT NULL,
    `progressid` VARCHAR(36) NOT NULL,
    `userId` VARCHAR(36) NOT NULL,
    `perjalananid` VARCHAR(36) NOT NULL,
    `waktu_mulai` DATETIME(3) NOT NULL,
    `time_selesai` DATETIME(3) NULL,
    `usersGoogleId` VARCHAR(36) NULL,

    PRIMARY KEY (`progress_perjalananid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Perjalanan` (
    `perjalananid` VARCHAR(36) NOT NULL,
    `nama_perjalanan` VARCHAR(100) NOT NULL,

    PRIMARY KEY (`perjalananid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Profiles` (
    `profileid` VARCHAR(36) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `whatsapp` VARCHAR(191) NOT NULL,
    `photo` VARCHAR(255) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `userId` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Profiles_userId_key`(`userId`),
    PRIMARY KEY (`profileid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Room` (
    `id` VARCHAR(36) NOT NULL,
    `nama_room` VARCHAR(100) NOT NULL,
    `token_speaker` VARCHAR(1000) NOT NULL,
    `token_listener` VARCHAR(1000) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Users` (
    `id` VARCHAR(36) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `whatsapp` VARCHAR(255) NOT NULL,
    `role` ENUM('user', 'ustadz', 'admin') NULL DEFAULT 'user',
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `lastLogin` DATETIME(3) NULL,
    `status_login` BOOLEAN NOT NULL DEFAULT false,
    `currentToken` TEXT NULL,

    UNIQUE INDEX `Users_email_key`(`email`),
    UNIQUE INDEX `Users_whatsapp_key`(`whatsapp`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `UsersGoogle` (
    `id` VARCHAR(36) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `whatsapp` VARCHAR(255) NOT NULL,
    `role` ENUM('user', 'ustadz', 'admin') NULL DEFAULT 'user',
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `lastLogin` DATETIME(3) NULL,
    `status_login` BOOLEAN NOT NULL DEFAULT false,
    `grupGrupid` VARCHAR(36) NULL,
    `profilesProfileid` VARCHAR(36) NULL,

    UNIQUE INDEX `UsersGoogle_name_key`(`name`),
    UNIQUE INDEX `UsersGoogle_email_key`(`email`),
    UNIQUE INDEX `UsersGoogle_whatsapp_key`(`whatsapp`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_GrupToPeserta_Grup` (
    `A` VARCHAR(36) NOT NULL,
    `B` VARCHAR(36) NOT NULL,

    UNIQUE INDEX `_GrupToPeserta_Grup_AB_unique`(`A`, `B`),
    INDEX `_GrupToPeserta_Grup_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Grup` ADD CONSTRAINT `Grup_roomid_fkey` FOREIGN KEY (`roomid`) REFERENCES `Room`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Grup` ADD CONSTRAINT `Grup_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `Users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Peserta_Grup` ADD CONSTRAINT `Peserta_Grup_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `Users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Peserta_Grup` ADD CONSTRAINT `Peserta_Grup_roomid_fkey` FOREIGN KEY (`roomid`) REFERENCES `Room`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Peserta_Grup` ADD CONSTRAINT `Peserta_Grup_usersGoogleId_fkey` FOREIGN KEY (`usersGoogleId`) REFERENCES `UsersGoogle`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Progress` ADD CONSTRAINT `Progress_grupid_fkey` FOREIGN KEY (`grupid`) REFERENCES `Grup`(`grupid`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Progress_perjalanan` ADD CONSTRAINT `Progress_perjalanan_progressid_fkey` FOREIGN KEY (`progressid`) REFERENCES `Progress`(`progressid`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Progress_perjalanan` ADD CONSTRAINT `Progress_perjalanan_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `Users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Progress_perjalanan` ADD CONSTRAINT `Progress_perjalanan_perjalananid_fkey` FOREIGN KEY (`perjalananid`) REFERENCES `Perjalanan`(`perjalananid`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Progress_perjalanan` ADD CONSTRAINT `Progress_perjalanan_usersGoogleId_fkey` FOREIGN KEY (`usersGoogleId`) REFERENCES `UsersGoogle`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Profiles` ADD CONSTRAINT `Profiles_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `Users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UsersGoogle` ADD CONSTRAINT `UsersGoogle_profilesProfileid_fkey` FOREIGN KEY (`profilesProfileid`) REFERENCES `Profiles`(`profileid`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UsersGoogle` ADD CONSTRAINT `UsersGoogle_grupGrupid_fkey` FOREIGN KEY (`grupGrupid`) REFERENCES `Grup`(`grupid`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_GrupToPeserta_Grup` ADD CONSTRAINT `_GrupToPeserta_Grup_A_fkey` FOREIGN KEY (`A`) REFERENCES `Grup`(`grupid`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_GrupToPeserta_Grup` ADD CONSTRAINT `_GrupToPeserta_Grup_B_fkey` FOREIGN KEY (`B`) REFERENCES `Peserta_Grup`(`peserta_grupid`) ON DELETE CASCADE ON UPDATE CASCADE;
