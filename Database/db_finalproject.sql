-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 03, 2021 at 05:19 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_finalproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `aspnetroleclaims`
--

CREATE TABLE `aspnetroleclaims` (
  `Id` int(11) NOT NULL,
  `RoleId` varchar(85) NOT NULL,
  `ClaimType` longtext DEFAULT NULL,
  `ClaimValue` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `aspnetroles`
--

CREATE TABLE `aspnetroles` (
  `Id` varchar(85) NOT NULL,
  `Name` varchar(256) DEFAULT NULL,
  `NormalizedName` varchar(85) DEFAULT NULL,
  `ConcurrencyStamp` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `aspnetuserclaims`
--

CREATE TABLE `aspnetuserclaims` (
  `Id` int(11) NOT NULL,
  `UserId` varchar(85) NOT NULL,
  `ClaimType` longtext DEFAULT NULL,
  `ClaimValue` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `aspnetuserlogins`
--

CREATE TABLE `aspnetuserlogins` (
  `LoginProvider` varchar(85) NOT NULL,
  `ProviderKey` varchar(85) NOT NULL,
  `ProviderDisplayName` longtext DEFAULT NULL,
  `UserId` varchar(85) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `aspnetuserroles`
--

CREATE TABLE `aspnetuserroles` (
  `UserId` varchar(85) NOT NULL,
  `RoleId` varchar(85) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `aspnetusers`
--

CREATE TABLE `aspnetusers` (
  `Id` varchar(85) NOT NULL,
  `UserName` varchar(256) DEFAULT NULL,
  `NormalizedUserName` varchar(85) DEFAULT NULL,
  `Email` varchar(256) DEFAULT NULL,
  `NormalizedEmail` varchar(85) DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext DEFAULT NULL,
  `SecurityStamp` longtext DEFAULT NULL,
  `ConcurrencyStamp` longtext DEFAULT NULL,
  `PhoneNumber` longtext DEFAULT NULL,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEnd` datetime(6) DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `aspnetusers`
--

INSERT INTO `aspnetusers` (`Id`, `UserName`, `NormalizedUserName`, `Email`, `NormalizedEmail`, `EmailConfirmed`, `PasswordHash`, `SecurityStamp`, `ConcurrencyStamp`, `PhoneNumber`, `PhoneNumberConfirmed`, `TwoFactorEnabled`, `LockoutEnd`, `LockoutEnabled`, `AccessFailedCount`) VALUES
('0ae192db-be6d-42f9-b78e-2ded6cca74e4', 'coba111', 'COBA111', 'coba111@gmail.com', 'COBA111@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAENNaaJqhmTgZZDisNsV1QyirxMX3yVaBfN1Eg656yxQMQltFIAh9GoI6iUcHqzHAVg==', 'QULJKTMSIECE7FNAB7ATZWU5Z43MCYS4', '9f84886c-7583-4dbe-839e-7cc084c2ca7a', NULL, 0, 0, NULL, 1, 0),
('0f848fc9-14b8-48b0-a992-6d982e303413', 'kuycoba', 'KUYCOBA', 'kuycoba@gmail.com', 'KUYCOBA@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAECf8cTu6k9TIDDPHnEeIP+E3l1oAOfycCI+fczPrAKHRWGoFZjlOdFag+1i6zHCPxQ==', 'XZTVTUWSP6LL43UU5LXTXPHYY5OVYCWU', '838013df-28c2-46e0-ac8d-4ca9aadb5463', NULL, 0, 0, NULL, 1, 0),
('13f2893e-8065-41c8-af8e-3b14b7b77f42', 's', 'S', 's@gmail.com', 'S@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAELbnP3d23MZY6CzTphucRgv5gWRsuUyE6YSiLCrXrhGNSA9wvNq5ao9aGt1FC1tQKA==', 'FX2XSKNU6IFZAY3EXUGII7ZGNKAPXVWU', 'ce3a3a18-52c0-4817-be61-346c2ddb39b9', NULL, 0, 0, NULL, 1, 0),
('2f85c0e9-ac5e-4b30-9fde-9c49b463ee98', 'bayu3', 'BAYU3', 'bayu3@gmail.com', 'BAYU3@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEG6yFo9kr9gar+jq0r0NCmLg0SMWQkaLIu3tRAAdDYJpRzkAW9MBZBHam0IwVNEDVA==', '2PDWP7O6RGRYMSJEHH62QVFRJG3743AD', '8edbabfa-c6ff-406b-a8f7-e218a4f36ea2', NULL, 0, 0, NULL, 1, 0),
('2f86f268-3509-4020-ac15-014dd018470e', 'c', 'C', 'c', 'C', 0, 'AQAAAAEAACcQAAAAEL+uYhoL2SJ4qwHdoOlf21A4Y2KXoF92DndOYpxuXx9MXZs1RZY0k5J6kNOSj/xU2A==', 'OST73HQKL6LLKRWPTLWHPSKLZ5RIASHB', 'b8e0535a-c831-4260-a3bc-207559466d4b', NULL, 0, 0, NULL, 1, 0),
('6032f312-20bf-4dcf-ba6b-860802d7648a', 'bayuaji', 'BAYUAJI', 'bayuaji@gmail.com', 'BAYUAJI@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEEJvBKo9mIqofHKJpb3587/3GdpfbOVZg/77ei7q//D4Djivnwhn6ywts+QmTWZ+cA==', '27YFOON5HX7IPWKBHWUCT2SAI65WU52F', '18c773cc-1172-47c9-bd04-86f291054589', NULL, 0, 0, NULL, 1, 0),
('893bdf0d-a6b4-44ad-941d-d514b25bbf29', 'coba', 'COBA', 'coba@gmail.com', 'COBA@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEOO7tmWhYB0LGZGVXnxA//sFld/j2OPq1DPFVClWfBYzXVp9BpwFG3P0eeQcyUK42A==', '7APTHNRBC36JA7MOJLSPEWM2TMWKYSPI', '650107ca-df4f-4cf3-8084-51184e7fceee', NULL, 0, 0, NULL, 1, 0),
('89e3b0c7-5fc7-458c-ad9c-3d69957e0489', 'coba5', 'COBA5', 'coba5@gmail.com', 'COBA5@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEIVZRib63qJZLshS2TwO465RvrHiqURQC5l36YZysn/tINczHr3fjE3YpSDLEVYDGg==', 'V4XHD4T7XML7MWD6QA7RHT752KJU76M3', '33df88cc-65e7-46dc-a765-b3b10412fc35', NULL, 0, 0, NULL, 1, 0),
('af0e312f-26fa-415d-85a4-01f8ddaa860c', 'bayu1', 'BAYU1', 'bayu1@gmail.com', 'BAYU1@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAECaIPrPa7qzeIOOFYf90QU26M/LswbCqAGxHZq2TtIJpPn+UK3MZ1E2P7sCfPXW2ig==', 'LNBJE3XLKKWNDDFCOOSAPN5XUUGHXAQG', '0f0423a2-7bc2-4519-86d6-ecb16e2809bf', NULL, 0, 0, NULL, 1, 0),
('be81e5f9-2302-425c-87d6-18ac847be937', 'bayu2', 'BAYU2', 'bayu2@gmail.com', 'BAYU2@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEIetZKesGyCUzhTtJYK3/48wbHjo5uXn5ilvYto+TVTmu6lsOnbGRQ+H9dnV9Qy+Ww==', 'PCHMCZO35U7E6RKHN5VGPOEGP5RRBG6R', '6538c431-4bf9-4eeb-938f-5f34b3514599', NULL, 0, 0, NULL, 1, 0),
('d0a02420-16cb-49c9-9a32-7ad4dda8e479', 'bayu', 'BAYU', 'bayu@gmail.com', 'BAYU@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEPn3ij5eTUPKeAvazyWL+bdALR3qOEpmSu97ffeTEI/cJbnUrmz62+CQtqUXUE5fDQ==', 'OXFSXQEKXJ3IFICTKZ3QW36BCGZJPMJ5', 'd7eb9969-6c68-4372-9bdd-adfa10d0883a', NULL, 0, 0, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `aspnetusertokens`
--

CREATE TABLE `aspnetusertokens` (
  `UserId` varchar(85) NOT NULL,
  `LoginProvider` varchar(85) NOT NULL,
  `Name` varchar(85) NOT NULL,
  `Value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ownerdetails`
--

CREATE TABLE `ownerdetails` (
  `ownerId` int(11) NOT NULL,
  `ownerCardNumber` longtext NOT NULL,
  `ownerName` longtext NOT NULL,
  `ownerAddress` longtext NOT NULL,
  `status` longtext NOT NULL,
  `createdDate` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ownerdetails`
--

INSERT INTO `ownerdetails` (`ownerId`, `ownerCardNumber`, `ownerName`, `ownerAddress`, `status`, `createdDate`) VALUES
(1, '1234-5678-9-0', 'Bayu Aji Nurmansah', 'Medan', 'active', '2021-10-21 16:27:57.553000'),
(2, '1234-5678-9-1', 'Jonn Snow', 'Winterfell', 'active', '2021-10-21 16:27:57.553000'),
(4, '1234-5678-9-2', 'Robert Baratheon', 'King\'s Landing', 'active', '2021-11-03 00:00:00.000000'),
(9, '1234-5678-9-3', 'Keqin', 'Riau', 'active', '2021-11-03 00:00:00.000000');

-- --------------------------------------------------------

--
-- Table structure for table `paymentdetails`
--

CREATE TABLE `paymentdetails` (
  `paymentDetailId` int(11) NOT NULL,
  `cardOwnerName` longtext NOT NULL,
  `cardNumber` longtext NOT NULL,
  `expirationDate` datetime(6) NOT NULL,
  `securityCode` longtext NOT NULL,
  `totalTransactions` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `paymentdetails`
--

INSERT INTO `paymentdetails` (`paymentDetailId`, `cardOwnerName`, `cardNumber`, `expirationDate`, `securityCode`, `totalTransactions`) VALUES
(1, 'Bayu Aji Nurmansah', '1234-5678-9-0', '2021-12-23 00:00:00.000000', '1234', 15023),
(6, 'Jonn Snow', '1234-5678-9-1', '2021-10-24 04:51:50.784000', '123456', 30000),
(7, 'Jonn Snow', '1234-5678-9-1', '2021-10-24 04:51:50.784000', '123456', 30000),
(8, 'Bayu Aji Nurmansah', '1234-5678-9-0', '2021-10-21 00:00:00.000000', '1234', 1505001),
(15, 'Bayu Aji Nurmansah', '1234-5678-9-0', '2021-11-18 00:00:00.000000', '1234', 123456),
(17, 'Jonn Snow', '1234-5678-9-1', '2021-11-17 00:00:00.000000', '1234', 5000),
(18, 'Bayu Aji Nurmansah', '1234-5678-9-0', '2021-11-09 00:00:00.000000', '1234', 12345),
(21, 'Jonn Snow', '1234-5678-9-1', '2021-11-12 00:00:00.000000', '1234', 21000),
(22, 'Jonn Snow', '1234-5678-9-1', '2021-11-04 00:00:00.000000', '1234', 15001);

-- --------------------------------------------------------

--
-- Table structure for table `refreshtokens`
--

CREATE TABLE `refreshtokens` (
  `Id` int(11) NOT NULL,
  `UserId` varchar(85) DEFAULT NULL,
  `Token` longtext DEFAULT NULL,
  `JwtId` longtext DEFAULT NULL,
  `IsUsed` tinyint(1) NOT NULL,
  `IsRevorked` tinyint(1) NOT NULL,
  `AddedDate` datetime(6) NOT NULL,
  `ExpiryDate` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `refreshtokens`
--

INSERT INTO `refreshtokens` (`Id`, `UserId`, `Token`, `JwtId`, `IsUsed`, `IsRevorked`, `AddedDate`, `ExpiryDate`) VALUES
(1, 'd0a02420-16cb-49c9-9a32-7ad4dda8e479', '7Q71CCCBI7YNIADLHESEGRRX2V764BCW24K762985dc-8e8e-432e-a2da-b327a14e0c7d', 'a928c08e-1e71-4bac-87f8-b21afac26adc', 0, 0, '2021-10-21 16:26:57.290891', '2022-04-21 16:26:57.290940'),
(2, 'd0a02420-16cb-49c9-9a32-7ad4dda8e479', 'WX2Q675EN7KQT39KCV7JCAF4V407D96DGKR66c53f9f-3545-4ee7-8f5a-87c47b327dd5', '6efda607-467d-4f90-adf9-38443c24c7cb', 0, 0, '2021-10-21 16:27:14.389656', '2022-04-21 16:27:14.389657'),
(3, 'af0e312f-26fa-415d-85a4-01f8ddaa860c', 'AUPIHIYQELN3YCQRCX15SO4WL6FCAOQ1X962156c7be-d0e4-4747-a01c-9b1d025b20a3', 'b95b6d49-9584-410c-9f95-71894af27fd8', 0, 0, '2021-10-21 16:51:03.876535', '2022-04-21 16:51:03.876536'),
(4, 'be81e5f9-2302-425c-87d6-18ac847be937', 'MLLXU4XGLQD4KLPC2LA57QYX1NMVROLOV01f9c70071-8f72-4470-8b64-4b90ff862b17', 'a9124652-2daa-4200-a716-a5b531081cc9', 0, 0, '2021-10-21 16:51:38.477381', '2022-04-21 16:51:38.477381'),
(5, '2f85c0e9-ac5e-4b30-9fde-9c49b463ee98', 'CVDFL4LCGW8DE4PCWD7EGGJ5OWP1VSDP9CN7f5351c5-fd4c-4a27-9dd0-759c600fe81d', 'feaba578-30a3-4774-b6da-3be0725df8f5', 0, 0, '2021-10-21 16:52:35.672557', '2022-04-21 16:52:35.672557'),
(6, '893bdf0d-a6b4-44ad-941d-d514b25bbf29', 'M9XSX2QOI92L3MW0X2Z9MCICBI4HXM2ZXQ6cb208cc8-532d-4d99-8998-4bc2f26689c4', 'c2f3655f-9391-45ac-9564-ea1d87b0ff1a', 0, 0, '2021-10-21 16:58:52.643751', '2022-04-21 16:58:52.643751'),
(7, '893bdf0d-a6b4-44ad-941d-d514b25bbf29', 'VQZ50TDHTKSDMRA7WZF40HAG9HJ6VX22J3Naa183b76-a46d-427a-9eb5-b01956e96dae', '7c4dd4a1-9009-4729-aff6-fa1b8d274d27', 0, 0, '2021-10-21 17:00:21.947453', '2022-04-21 17:00:21.947453'),
(8, 'd0a02420-16cb-49c9-9a32-7ad4dda8e479', 'W9F5N62KFNVZKQ84Z27TB2AM5ABTY2PYEXU5a81de2b-d2d5-408e-aadc-83b9ffa135ec', '4eb3af4e-7c30-4006-89dc-853f2b761d2c', 0, 0, '2021-10-21 22:18:08.251280', '2022-04-21 22:18:08.251327'),
(9, 'd0a02420-16cb-49c9-9a32-7ad4dda8e479', 'OR81LIAHM4A7152WV5SKA9YOBL47AQA3HDG3f85fcc1-8193-4f03-9777-c7216fdc54a2', '2a3c87c5-9a9b-4847-8e7f-24929cb110b8', 0, 0, '2021-10-21 23:29:27.894281', '2022-04-21 23:29:27.894332'),
(10, 'd0a02420-16cb-49c9-9a32-7ad4dda8e479', '3ZK88I831KQTDSEUNTA78LDYK8Y1X77SCQHe6df6ee1-6723-4ea6-9f56-3994be5255f3', '48c1c404-41ee-46ef-bfeb-a18744020f32', 0, 0, '2021-10-22 02:05:29.108547', '2022-04-22 02:05:29.108595'),
(11, '2f86f268-3509-4020-ac15-014dd018470e', '279776LSS8Z2H33979S0HWIOPQRBHM17DSG02a17f89-d34b-45ce-b659-b0bd189dcec8', 'dc9e817c-f014-4f78-b186-87b0bd7506b6', 0, 0, '2021-10-22 02:47:42.069836', '2022-04-22 02:47:42.069837'),
(12, 'd0a02420-16cb-49c9-9a32-7ad4dda8e479', 'OWIWP88B4QIJXT7URZGKKWT1CJ3XY08FYD3d047c3b9-cec7-4e13-b9f8-cd0d2c525476', 'abd75998-136e-4025-94e5-6ce6d631d0cd', 0, 0, '2021-10-22 03:15:24.229182', '2022-04-22 03:15:24.229236'),
(13, '89e3b0c7-5fc7-458c-ad9c-3d69957e0489', 'XN2TVD50V8OC4UIGD7ZL4OGSWDPX7UXV3AZ5cb6c42f-5d4e-427c-9a75-94360a21a16a', '5a05d60c-bdcf-4e1a-b49a-8190d4c9a532', 0, 0, '2021-10-22 04:04:51.228931', '2022-04-22 04:04:51.228932'),
(14, '89e3b0c7-5fc7-458c-ad9c-3d69957e0489', '7ND7RL7RJ77NIW5ZVUAZRVXH7IGVU3S8DG98551ea67-0f70-427e-9f07-eaa3d4a4649b', '08077655-e322-4f8d-be79-6e64a98cc728', 0, 0, '2021-10-22 04:05:13.879071', '2022-04-22 04:05:13.879072'),
(15, 'd0a02420-16cb-49c9-9a32-7ad4dda8e479', 'AEPJH7XRKIF6477XIHM3090YO7YDW7N1WASde2931e1-6664-4023-8edf-6db098cf147a', 'b1469d10-3c28-4574-b0e3-415719fdfb5f', 0, 0, '2021-10-22 06:45:11.002960', '2022-04-22 06:45:11.003010'),
(16, 'd0a02420-16cb-49c9-9a32-7ad4dda8e479', '6WKL5NS65L07VQQQF79F1Q5MJFS2UQCH9IKfe3d11bc-2f10-4e99-a89f-bcad0d2c4e21', '076312a5-4bd8-4be5-b390-82f2d0ac2481', 0, 0, '2021-10-22 06:51:32.177938', '2022-04-22 06:51:32.177939'),
(17, 'd0a02420-16cb-49c9-9a32-7ad4dda8e479', 'ZJ5OMIPLOKHX0X87Y78RUEFVRGEJG30N6C7d3149c0a-b5f0-4378-a357-65ba299227b1', 'b6c69c76-34ef-4c6a-b478-812cdaae007e', 0, 0, '2021-10-22 14:29:55.418364', '2022-04-22 14:29:55.418418'),
(18, 'd0a02420-16cb-49c9-9a32-7ad4dda8e479', 'IBHU4UL1E3AWJ7TSM474C9K7H70CE9U98SG7b5064cd-f29b-47d5-a43c-e0c08d1f9689', '41f413b5-7fe7-4e79-a5ef-eceb0076aaa9', 0, 0, '2021-10-24 04:50:49.297804', '2022-04-24 04:50:49.297853');

-- --------------------------------------------------------

--
-- Table structure for table `__efmigrationshistory`
--

CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `__efmigrationshistory`
--

INSERT INTO `__efmigrationshistory` (`MigrationId`, `ProductVersion`) VALUES
('20211021161409_Final Project with MySql', '5.0.11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aspnetroleclaims`
--
ALTER TABLE `aspnetroleclaims`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_AspNetRoleClaims_RoleId` (`RoleId`);

--
-- Indexes for table `aspnetroles`
--
ALTER TABLE `aspnetroles`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `RoleNameIndex` (`NormalizedName`);

--
-- Indexes for table `aspnetuserclaims`
--
ALTER TABLE `aspnetuserclaims`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_AspNetUserClaims_UserId` (`UserId`);

--
-- Indexes for table `aspnetuserlogins`
--
ALTER TABLE `aspnetuserlogins`
  ADD PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  ADD KEY `IX_AspNetUserLogins_UserId` (`UserId`);

--
-- Indexes for table `aspnetuserroles`
--
ALTER TABLE `aspnetuserroles`
  ADD PRIMARY KEY (`UserId`,`RoleId`),
  ADD KEY `IX_AspNetUserRoles_RoleId` (`RoleId`);

--
-- Indexes for table `aspnetusers`
--
ALTER TABLE `aspnetusers`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `UserNameIndex` (`NormalizedUserName`),
  ADD KEY `EmailIndex` (`NormalizedEmail`);

--
-- Indexes for table `aspnetusertokens`
--
ALTER TABLE `aspnetusertokens`
  ADD PRIMARY KEY (`UserId`,`LoginProvider`,`Name`);

--
-- Indexes for table `ownerdetails`
--
ALTER TABLE `ownerdetails`
  ADD PRIMARY KEY (`ownerId`);

--
-- Indexes for table `paymentdetails`
--
ALTER TABLE `paymentdetails`
  ADD PRIMARY KEY (`paymentDetailId`);

--
-- Indexes for table `refreshtokens`
--
ALTER TABLE `refreshtokens`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_RefreshTokens_UserId` (`UserId`);

--
-- Indexes for table `__efmigrationshistory`
--
ALTER TABLE `__efmigrationshistory`
  ADD PRIMARY KEY (`MigrationId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aspnetroleclaims`
--
ALTER TABLE `aspnetroleclaims`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aspnetuserclaims`
--
ALTER TABLE `aspnetuserclaims`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ownerdetails`
--
ALTER TABLE `ownerdetails`
  MODIFY `ownerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `paymentdetails`
--
ALTER TABLE `paymentdetails`
  MODIFY `paymentDetailId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `refreshtokens`
--
ALTER TABLE `refreshtokens`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aspnetroleclaims`
--
ALTER TABLE `aspnetroleclaims`
  ADD CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `aspnetuserclaims`
--
ALTER TABLE `aspnetuserclaims`
  ADD CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `aspnetuserlogins`
--
ALTER TABLE `aspnetuserlogins`
  ADD CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `aspnetuserroles`
--
ALTER TABLE `aspnetuserroles`
  ADD CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `aspnetusertokens`
--
ALTER TABLE `aspnetusertokens`
  ADD CONSTRAINT `FK_AspNetUserTokens_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `refreshtokens`
--
ALTER TABLE `refreshtokens`
  ADD CONSTRAINT `FK_RefreshTokens_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
