CREATE DATABASE connect_visual2;

USE connect_visual2;

CREATE TABLE newUserData (
 UserId INT PRIMARY KEY IDENTITY(1,1),
 FirstName VARCHAR(50),
 LastName VARCHAR(50),
 Email VARCHAR(50),
 Addhar VARCHAR(50),
 Address VARCHAR(50),
 PAN VARCHAR(50),
 Phone VARCHAR(50),
 Category VARCHAR(50),
 Password VARCHAR(50)
 );

  
 --select * from  newUserData


 alter proc USP_Deletedata
 @UserId int 
 as begin 
 delete from newUserData
 where UserId=@UserId
 end 


 

 EXEC "USP_UpdateData";

 