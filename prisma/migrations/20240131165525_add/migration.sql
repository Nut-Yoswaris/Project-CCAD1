-- CreateTable
CREATE TABLE `User` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `gender` VARCHAR(191) NOT NULL,
    `passwrod` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `User_Address` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `number` VARCHAR(191) NULL,
    `village` VARCHAR(191) NULL,
    `alley` VARCHAR(191) NULL,
    `road` VARCHAR(191) NULL,
    `distrct` VARCHAR(191) NULL,
    `provincr` VARCHAR(191) NOT NULL,
    `postal_Code` VARCHAR(191) NOT NULL,
    `detail` VARCHAR(191) NULL,
    `user_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Search_localtion` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `distance` VARCHAR(191) NOT NULL,
    `user_address_id` INTEGER NOT NULL,
    `restaurants_address_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Restaurants_Address` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `number` VARCHAR(191) NULL,
    `village` VARCHAR(191) NULL,
    `alley` VARCHAR(191) NULL,
    `road` VARCHAR(191) NULL,
    `distrct` VARCHAR(191) NULL,
    `provincr` VARCHAR(191) NOT NULL,
    `postal_Code` VARCHAR(191) NOT NULL,
    `detail` VARCHAR(191) NULL,
    `restaurants_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Review_reataurants` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(191) NOT NULL,
    `comment` VARCHAR(191) NOT NULL,
    `image_review` VARCHAR(191) NOT NULL,
    `rating` VARCHAR(191) NULL,
    `user_id` INTEGER NOT NULL,
    `restaurant_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Restaurants` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `type` VARCHAR(191) NOT NULL,
    `detail` VARCHAR(191) NULL,
    `tal` VARCHAR(191) NOT NULL,
    `open_day` VARCHAR(191) NULL,
    `close_day` VARCHAR(191) NULL,
    `open_time` VARCHAR(191) NULL,
    `close_time` VARCHAR(191) NULL,
    `status` VARCHAR(191) NOT NULL,
    `user_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Menu` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `image_food` VARCHAR(191) NOT NULL,
    `price` VARCHAR(191) NOT NULL,
    `detail` VARCHAR(191) NULL,
    `restaurnats_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Image_restaurants` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `detail` VARCHAR(191) NOT NULL,
    `restaurants_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `User_Address` ADD CONSTRAINT `User_Address_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Search_localtion` ADD CONSTRAINT `Search_localtion_user_address_id_fkey` FOREIGN KEY (`user_address_id`) REFERENCES `User_Address`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Search_localtion` ADD CONSTRAINT `Search_localtion_restaurants_address_id_fkey` FOREIGN KEY (`restaurants_address_id`) REFERENCES `Restaurants_Address`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Restaurants_Address` ADD CONSTRAINT `Restaurants_Address_restaurants_id_fkey` FOREIGN KEY (`restaurants_id`) REFERENCES `Restaurants`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Review_reataurants` ADD CONSTRAINT `Review_reataurants_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Review_reataurants` ADD CONSTRAINT `Review_reataurants_restaurant_id_fkey` FOREIGN KEY (`restaurant_id`) REFERENCES `Restaurants`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Restaurants` ADD CONSTRAINT `Restaurants_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Menu` ADD CONSTRAINT `Menu_restaurnats_id_fkey` FOREIGN KEY (`restaurnats_id`) REFERENCES `Restaurants`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Image_restaurants` ADD CONSTRAINT `Image_restaurants_restaurants_id_fkey` FOREIGN KEY (`restaurants_id`) REFERENCES `Restaurants`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
