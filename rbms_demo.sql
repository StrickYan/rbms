-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.6.26-log - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win32
-- HeidiSQL 版本:                  8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 rbms 的数据库结构
CREATE DATABASE IF NOT EXISTS `rbms` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `rbms`;


-- 导出  表 rbms.customers 结构
CREATE TABLE IF NOT EXISTS `customers` (
  `cid` varchar(4) NOT NULL,
  `cname` varchar(15) DEFAULT NULL,
  `city` varchar(15) DEFAULT NULL,
  `visits_made` int(5) DEFAULT NULL,
  `last_visit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  rbms.customers 的数据：~5 rows (大约)
DELETE FROM `customers`;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` (`cid`, `cname`, `city`, `visits_made`, `last_visit_time`) VALUES
	('c000', 'Kathy', 'Vestal', 2, '2013-11-28 10:25:32'),
	('c001', 'Brown', 'Binghamton', 1, '2013-12-05 09:12:30'),
	('c002', 'Anne', 'Vestal', 1, '2013-11-29 14:30:00'),
	('c003', 'Jack', 'Vestal', 1, '2013-12-04 16:48:02'),
	('c004', 'Mike', 'Binghamton', 1, '2013-11-30 11:52:16');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;


-- 导出  表 rbms.employees 结构
CREATE TABLE IF NOT EXISTS `employees` (
  `eid` varchar(3) NOT NULL,
  `ename` varchar(15) DEFAULT NULL,
  `city` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  rbms.employees 的数据：~5 rows (大约)
DELETE FROM `employees`;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` (`eid`, `ename`, `city`) VALUES
	('e00', 'Amy', 'Vestal'),
	('e01', 'Bob', 'Binghamton'),
	('e02', 'John', 'Binghamton'),
	('e03', 'Lisa', 'Binghamton'),
	('e04', 'Matt', 'Vestal');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;


-- 导出  表 rbms.logs 结构
CREATE TABLE IF NOT EXISTS `logs` (
  `logid` int(5) NOT NULL AUTO_INCREMENT,
  `who` varchar(10) NOT NULL,
  `time` datetime NOT NULL,
  `table_name` varchar(20) NOT NULL,
  `operation` varchar(6) NOT NULL,
  `key_value` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`logid`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8;

-- 正在导出表  rbms.logs 的数据：~0 rows (大约)
DELETE FROM `logs`;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;


-- 导出  表 rbms.products 结构
CREATE TABLE IF NOT EXISTS `products` (
  `pid` varchar(4) NOT NULL,
  `pname` varchar(15) NOT NULL,
  `qoh` int(5) NOT NULL,
  `qoh_threshold` int(5) DEFAULT NULL,
  `original_price` decimal(6,2) DEFAULT NULL,
  `discnt_rate` decimal(3,2) DEFAULT NULL,
  `sid` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `sid` (`sid`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `suppliers` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  rbms.products 的数据：~6 rows (大约)
DELETE FROM `products`;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`pid`, `pname`, `qoh`, `qoh_threshold`, `original_price`, `discnt_rate`, `sid`) VALUES
	('pr00', 'Milk', 12, 10, 2.40, 0.10, 's0'),
	('pr01', 'Egg', 20, 10, 1.50, 0.20, 's1'),
	('pr02', 'Bread', 15, 10, 1.20, 0.10, 's0'),
	('pr03', 'Pineapple', 6, 5, 2.00, 0.30, 's0'),
	('pr04', 'Knife', 10, 8, 2.50, 0.20, 's1'),
	('pr05', 'Shovel', 5, 5, 7.99, 0.10, 's0');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;


-- 导出  表 rbms.purchases 结构
CREATE TABLE IF NOT EXISTS `purchases` (
  `pur` varchar(4) NOT NULL,
  `cid` varchar(4) NOT NULL,
  `eid` varchar(3) NOT NULL,
  `pid` varchar(4) NOT NULL,
  `qty` int(5) DEFAULT NULL,
  `ptime` datetime DEFAULT NULL,
  `total_price` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`pur`),
  KEY `cid` (`cid`),
  KEY `eid` (`eid`),
  KEY `pid` (`pid`),
  CONSTRAINT `purchases_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `customers` (`cid`),
  CONSTRAINT `purchases_ibfk_2` FOREIGN KEY (`eid`) REFERENCES `employees` (`eid`),
  CONSTRAINT `purchases_ibfk_3` FOREIGN KEY (`pid`) REFERENCES `products` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  rbms.purchases 的数据：~6 rows (大约)
DELETE FROM `purchases`;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
INSERT INTO `purchases` (`pur`, `cid`, `eid`, `pid`, `qty`, `ptime`, `total_price`) VALUES
	('p000', 'c000', 'e00', 'pr00', 1, '2013-11-26 12:34:22', 2.16),
	('p001', 'c001', 'e03', 'pr03', 2, '2013-12-05 09:12:30', 2.80),
	('p002', 'c002', 'e03', 'pr00', 1, '2013-11-29 14:30:00', 2.16),
	('p003', 'c000', 'e01', 'pr01', 5, '2013-11-28 10:25:32', 6.00),
	('p004', 'c004', 'e04', 'pr02', 3, '2013-11-30 11:52:16', 3.24),
	('p005', 'c003', 'e02', 'pr05', 1, '2013-12-04 16:48:02', 7.19);
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;


-- 导出  表 rbms.suppliers 结构
CREATE TABLE IF NOT EXISTS `suppliers` (
  `sid` varchar(2) NOT NULL,
  `sname` varchar(15) NOT NULL,
  `city` varchar(15) DEFAULT NULL,
  `telephone_no` char(10) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  UNIQUE KEY `sname` (`sname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  rbms.suppliers 的数据：~2 rows (大约)
DELETE FROM `suppliers`;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` (`sid`, `sname`, `city`, `telephone_no`) VALUES
	('s0', 'Supplier 1', 'Binghamton', '6075555431'),
	('s1', 'Supplier 2', 'NYC', '6075555432');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;


-- 导出  过程 rbms.add_customers 结构
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_customers`(IN `c_id` VARCHAR(4), IN `c_name` VARCHAR(15), IN `c_city` VARCHAR(15), OUT `message` VARCHAR(50))
begin
   set @sqlcmd = 'select count(*) into @C from customers where cid=?';  
	prepare stmt from @sqlcmd;  
	set @a=c_id;
	execute stmt using @a; 
	deallocate prepare stmt; 
   
   set @sqlcmd = 'select is_number(?) into @N';  
	prepare stmt from @sqlcmd;  
	set @a=c_id;
	execute stmt using @a; 
	deallocate prepare stmt; 
     
   #if @C>0 or @N<1 then
   if @C>0 then
     	set message="Illegal cid in employees.";
   else
      set @sqlcmd = 'insert into customers values(?,?,?,0,null)';  
		prepare stmt from @sqlcmd;  
		set @a=c_id;
		set @b=c_name;
		set @c=c_city;
		execute stmt using @a,@b,@c; 
		deallocate prepare stmt; 
      set message="Insert sucessed.";
   end if; 
end//
DELIMITER ;


-- 导出  过程 rbms.add_employees 结构
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_employees`(IN `e_id` VARCHAR(3), IN `e_name` VARCHAR(15), IN `e_city` VARCHAR(15), OUT `message` VARCHAR(50))
begin
   set @sqlcmd = 'select count(*) into @E from employees where eid=?';  
	prepare stmt from @sqlcmd;  
	set @a=e_id;
	execute stmt using @a; 
	deallocate prepare stmt; 
	
   set @sqlcmd = 'select is_number(?) into @N';  
	prepare stmt from @sqlcmd;  
	set @a=e_id;
	execute stmt using @a; 
	deallocate prepare stmt; 
    
   #if @E>0 or @N<1 then
   if @E>0 then
        set message="Illegal eid in employees.";
   else
      set @sqlcmd = 'insert into employees values(?,?,?)';  
		prepare stmt from @sqlcmd;  
		set @a=e_id;
		set @b=e_name;
		set @c=e_city;
		execute stmt using @a,@b,@c; 
		deallocate prepare stmt; 
      set message="Insert sucessed.";
   end if;    
end//
DELIMITER ;


-- 导出  过程 rbms.add_product 结构
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_product`(IN `p_id` VARCHAR(4), IN `p_name` VARCHAR(15), IN `prod_qoh` INT, IN `prod_qoh_threshold` INT, IN `prod_original_price` DECIMAL(6,2), IN `prod_discnt_rate` DECIMAL(3,2), IN `s_id` VARCHAR(2), OUT `message` VARCHAR(50))
begin
   set @sqlcmd = 'select count(*) into @P from products where pid=?';  
	prepare stmt from @sqlcmd;  
	set @a=p_id;
	execute stmt using @a; 
	deallocate prepare stmt; 

   set @sqlcmd = 'select count(*) into @S from suppliers where sid=?';  
	prepare stmt from @sqlcmd;  
	set @a=s_id;
	execute stmt using @a; 
	deallocate prepare stmt; 
	
   if @P>0 then
        set message="Existing pid.";
   #elseif !is_number(p_id) then
    #    set message="Illegle pid in products.";
   elseif char_length(p_name)<1 then
        set message="Need pname in products.";
   elseif !is_number(prod_qoh) then
        set message="Illegle qoh in products.";
   elseif (char_length(prod_qoh_threshold)>0 and !is_number(prod_qoh_threshold)) or (prod_qoh_threshold > prod_qoh) then
        set message="Illegle qoh_threshold in products.";
   elseif char_length(s_id)=0 then
        set message="Need sid in products.";
   elseif @S=0 then
        set message="No such sid in suppliers.";
   else
      set @sqlcmd = 'insert into products values(?,?,?,?,?,?,?)';  
		prepare stmt from @sqlcmd;  
		set @a=p_id;
		set @b=p_name;
		set @c=prod_qoh;
		set @d=prod_qoh_threshold;
		set @e=prod_original_price;
		set @f=prod_discnt_rate;
		set @g=s_id;
		execute stmt using @a,@b,@c,@d,@e,@f,@g; 
		deallocate prepare stmt; 
      set message="Insert sucessed.";
   end if;
end//
DELIMITER ;


-- 导出  过程 rbms.add_purchase 结构
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_purchase`(IN `pur_no` VARCHAR(4), IN `c_id` VARCHAR(4), IN `e_id` VARCHAR(3), IN `p_id` VARCHAR(4), IN `pur_qty` INT, OUT `message` VARCHAR(50), OUT `price` DECIMAL(6,2))
begin
   set @sqlcmd = 'select count(*) into @PR from purchases where pur=?';  
	prepare stmt from @sqlcmd;  
	set @a=pur_no;
	execute stmt using @a; 
	deallocate prepare stmt;  
	
   set @sqlcmd = 'select count(*) into @C from customers where cid=?';  
	prepare stmt from @sqlcmd;  
	set @a=c_id;
	execute stmt using @a; 
	deallocate prepare stmt; 

   set @sqlcmd = 'select count(*) into @E from employees where eid=?';  
	prepare stmt from @sqlcmd;  
	set @a=e_id;
	execute stmt using @a; 
	deallocate prepare stmt; 

   set @sqlcmd = 'select count(*) into @P from products where pid=?';  
	prepare stmt from @sqlcmd;  
	set @a=p_id;
	execute stmt using @a; 
	deallocate prepare stmt; 
    
   #if char_length(pur_no)=0 or !is_number(pur_no) or @PR>0 then
   if char_length(pur_no)=0 or @PR>0 then
        set message="Illegle pur in purchases.";
   elseif @C<1 then
        set message="No such cid in customers.";
   elseif @E<1 then
        set message="No such eid in employees.";
   elseif @P<1 then
        set message="No such pid in products.";
   else
      set @sqlcmd = 'select original_price,discnt_rate,qoh into @ori_price,@dis_rate,@prod_qoh from products where pid=?';  
		prepare stmt from @sqlcmd;  
		set @a=p_id;
		execute stmt using @a; 
		deallocate prepare stmt;  
        
		if pur_qty <= @prod_qoh then
            set price=round(@ori_price*(1-@dis_rate)*pur_qty,2); 
            set @sqlcmd = 'insert into purchases values(?,?,?,?,?,?,?)';  
				prepare stmt from @sqlcmd;  
				set @a=pur_no;
				set @b=c_id;
				set @c=e_id;
				set @d=p_id;
				set @e=pur_qty;
				set @f=now();
				set @g=price;
				execute stmt using @a,@b,@c,@d,@e,@f,@g; 
				deallocate prepare stmt;  
            set message="Insert sucessed.";
       else
            set message="Insufficient quantity in stock.";
       end if;
   end if;
end//
DELIMITER ;


-- 导出  过程 rbms.add_suppliers 结构
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_suppliers`(IN `s_id` VARCHAR(2), IN `s_name` VARCHAR(15), IN `s_city` VARCHAR(15), IN `s_tel` VARCHAR(10), OUT `message` VARCHAR(50))
begin
	set @sqlcmd = 'select count(*) into @S from suppliers where sid=?';  
	prepare stmt from @sqlcmd;  
	set @a=s_id;
	execute stmt using @a; 
	deallocate prepare stmt;  
   
	if @S>0 then
        set message="Existing sid.";
   #elseif !is_number(s_id) then
    #  set message="Illegal sid in employees.";
   else
      set @sqlcmd1 = 'select count(*) into @SN from suppliers where sname=?';  
		prepare stmt1 from @sqlcmd1;  
		set @a1=s_name;
		execute stmt1 using @a1; 
		deallocate prepare stmt1;  
      if @SN>0 then
         set message="Existing sname.";
      elseif char_length(s_tel)>0 and !is_number(s_tel) then
         set message="Illegal telephone_no in suppliers.";
      else
         set @sqlcmd2 = 'insert into suppliers values(?,?,?,?)';  
			prepare stmt2 from @sqlcmd2;  
			set @a2=s_id;
			set @b2=s_name;
			set @c2=s_city;
			set @d2=s_tel;
			execute stmt2 using @a2,@b2,@c2,@d2; 
			deallocate prepare stmt2;  
         set message="Insert sucessed.";
      end if;
   end if;
end//
DELIMITER ;


-- 导出  过程 rbms.default_sales 结构
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `default_sales`()
begin
	select pid,pname,original_price,discnt_rate from products;
end//
DELIMITER ;


-- 导出  过程 rbms.most_sales 结构
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `most_sales`()
begin
	select products.pid,products.pname,products.original_price,products.discnt_rate,sum(purchases.qty) 
		from products,purchases 
			where purchases.pid=products.pid 
				group by purchases.pid 
					order by sum(purchases.qty) desc;
end//
DELIMITER ;


-- 导出  过程 rbms.newest_sales 结构
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `newest_sales`()
begin
	select pid,pname,original_price,discnt_rate from products order by pid desc;
end//
DELIMITER ;


-- 导出  过程 rbms.report_monthly_sale 结构
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `report_monthly_sale`(IN `prod_id` varchar(4))
begin
	set @sqlcmd = 'select pname,sum(qty),sum(total_price),round(sum(total_price)/sum(qty),2),DATE_FORMAT(ptime,\'%b\'),year(ptime) 
        					from products,purchases 
            				where purchases.pid=? and purchases.pid=products.pid 
               	 			group by month(ptime),year(ptime)
                    				order by year(ptime),month(ptime) desc';  
	prepare stmt from @sqlcmd;  
	set @a=prod_id;
	execute stmt using @a; 
	deallocate prepare stmt;  
end//
DELIMITER ;


-- 导出  过程 rbms.show_product 结构
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_product`(IN `p_id` VARCHAR(4))
begin
	set @sqlcmd = 'select pid,pname,qoh,qoh_threshold,original_price,discnt_rate,sname 
    						from products,suppliers 
            				where pid=? and products.sid=suppliers.sid';  
	prepare stmt from @sqlcmd;  
	set @a=p_id;
	execute stmt using @a; 
	deallocate prepare stmt;  
end//
DELIMITER ;


-- 导出  过程 rbms.show_table 结构
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_table`(in table_name varchar(10))
begin
set @sqlcmd = concat('select * from ', table_name);  
prepare stmt from @sqlcmd;  
execute stmt; 
deallocate prepare stmt;  
end//
DELIMITER ;


-- 导出  函数 rbms.is_number 结构
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `is_number`(`str` VARCHAR(25)) RETURNS int(11)
BEGIN 
    DECLARE res INT DEFAULT 0; 
    SELECT str REGEXP '^[0-9]+$' INTO res; 
    IF res = 1 THEN 
        RETURN 1;
    ELSE 
        RETURN 0; 
    END IF; 
END//
DELIMITER ;


-- 导出  触发器 rbms.add_logs_customers 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `add_logs_customers` AFTER UPDATE ON `customers` FOR EACH ROW begin
	if (old.visits_made is null and new.visits_made is not null) or new.visits_made!=old.visits_made then
		insert into logs values(null,new.cid,current_timestamp,'customers','update',old.cid);
	end if;
end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- 导出  触发器 rbms.add_logs_products 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='';
DELIMITER //
CREATE TRIGGER `add_logs_products` AFTER UPDATE ON `products` FOR EACH ROW begin
	if new.qoh!=old.qoh then
		insert into logs values(null,new.sid,current_timestamp,'products','update',old.pid);
	end if;
end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- 导出  触发器 rbms.after_purchases 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `after_purchases` AFTER INSERT ON `purchases` FOR EACH ROW begin

    declare old_qoh int(5);
    declare qoh_th int(5);
    
    insert into logs values
    (null,new.eid,new.ptime,'purchases','insert',new.pur);
    
   update customers
    set visits_made=visits_made+1, last_visit_time=new.ptime where cid=new.cid;
    
   select qoh,qoh_threshold into old_qoh,qoh_th 
    from products where pid=new.pid;
   
   update products set qoh=qoh-new.qty where pid=new.pid;
   if old_qoh-new.qty < qoh_th then
       update products set qoh=old_qoh*2 where pid=new.pid;
       select concat("After pur:",new.pur,",the current quantity on hand of pid: ",new.pid," is ",old_qoh-new.qty) into @cur_qoh_msg;
       select concat("The quantity on hand of the product pid: ",new.pid," has been increased by ",old_qoh+new.qty) into @inc_qoh_msg;
   end if;
   
end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
