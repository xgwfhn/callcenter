set session unique_checks=off; --关闭唯一校验
set session autocommit=off;   --关闭自动提交    关闭这俩项 为了提高插入效率
DROP PROCEDURE IF EXISTS batch_insert;
CREATE PROCEDURE batch_insert(IN orderId INT, IN loop_times INT)  
 BEGIN
     DECLARE num INT;  
     DECLARE order_id INT;
	 DECLARE order_no VARCHAR(40);
     SET num = 0;  
     SET order_id = orderId;
	 START TRANSACTION;
     WHILE num < loop_times DO
			 IF MOD(num,2)=0 THEN 
					SET order_no=CONCAT(DATE_FORMAT(NOW(), '%Y%m%d%H%i%s'),ROUND(RAND()*1000000000),'A');
			 ELSE
					SET order_no=CONCAT(DATE_FORMAT(NOW(), '%Y%m%d%H%i%s'),ROUND(RAND()*1000000000),'B');
			 END IF;
			 INSERT INTO ss_order VALUES (order_id, NULL, SYSDATE(), 'gg', NULL, 1, order_no, 1, 1, NULL, NULL);
			 SET order_id = order_id + 1;  
			 SET num = num + 1;
			 IF MOD(num,50000)=0 THEN
          		SELECT SLEEP(2);
      		 END IF;
     END WHILE;
	 COMMIT;
 END
