/*UPDATED UPDATED VERSION*/
/*User*/
CREATE TABLE `User` (
  `Username` varchar(255) NOT NULL,
  `FullName` varchar(255) DEFAULT NULL,
  `UserPW` varchar(255) DEFAULT NULL,
  `UserPhone` varchar(255) DEFAULT NULL,
  `UserAddress` varchar(255) DEFAULT NULL,
  `UserEmail` varchar(255) DEFAULT NULL,
  `UserType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

INSERT INTO `fypdatabase`.`User` (`Username`, `FullName`, `UserPW`, `UserPhone`, `UserAddress`, `UserEmail`, `UserType`) VALUES ('admin', 'Admin User', 'admin', '999', 'Woodlands Ave 10', 'AdminTan@gmail.com', 'Admin');
INSERT INTO `fypdatabase`.`User` (`Username`, `FullName`, `UserPW`, `UserPhone`, `UserAddress`, `UserEmail`, `UserType`) VALUES ('staff', 'staff name', 'staff', '888', 'Jurong ave 10', 'StaffTan@gmail.com', 'Staff');

/*Supplier*/
CREATE TABLE `Supplier` (
  `SupplierCode` varchar(255) NOT NULL,
  `SupplierName` varchar(255) DEFAULT NULL,
  `SupplierPhone` varchar(255) DEFAULT NULL,
  `SupplierAddress` varchar(255) DEFAULT NULL,
  `SupplierPassword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SupplierCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

INSERT INTO `fypdatabase`.`Supplier` (`SupplierCode`, `SupplierName`, `SupplierPhone`, `SupplierAddress`, `SupplierPassword`) VALUES ('supplier', 'TestSupplier', '123', 'Defu Lane St 1', 'supplier');

/*Store*/
CREATE TABLE `Store` (
  `StoreCode` varchar(255) NOT NULL,
  `StoreName` varchar(255) NOT NULL,
  `Location` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`StoreCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
INSERT INTO `fypdatabase`.`Store` (`StoreCode`, `StoreName`, `Location`, `Address`) VALUES ('001', 'Test Store', 'Tampines Mall', 'Tampines Ave 1');

/*Stock*/
CREATE TABLE `Stock` (
  `StockSKU` varchar(255) NOT NULL,
  `ProductSKU` varchar(255) DEFAULT NULL,
  `SupplierCode` varchar(255) DEFAULT NULL,
  `CurrentQuantity` int DEFAULT NULL,
  PRIMARY KEY (`StockSKU`),
  KEY `ProductSKU` (`ProductSKU`),
  KEY `SupplierCode` (`SupplierCode`),
  CONSTRAINT `ProductSKU` FOREIGN KEY (`ProductSKU`) REFERENCES `Product` (`ProductSKU`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SupplierCode` FOREIGN KEY (`SupplierCode`) REFERENCES `Supplier` (`SupplierCode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

/*Product*/
CREATE TABLE `Product` (
  `ProductSKU` varchar(255) NOT NULL,
  `SupplierCode` varchar(255) DEFAULT NULL,
  `ProductName` varchar(255) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `Color` varchar(255) DEFAULT NULL,
  `Size` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ProductSKU`),
  KEY `SupCode` (`SupplierCode`),
  CONSTRAINT `SupCode` FOREIGN KEY (`SupplierCode`) REFERENCES `Supplier` (`SupplierCode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `KafkaLog` (
  `User` varchar(255) DEFAULT NULL,
  `Activity` varchar(255) DEFAULT NULL,
  `TopicName` varchar(255) DEFAULT NULL,
  `DateTime` datetime DEFAULT NULL,
  `StockName` varchar(255) DEFAULT NULL,
  `Remark` varchar(255) DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  UNIQUE KEY `DateTime_topic_UNIQUE` (`TopicName`,`DateTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


