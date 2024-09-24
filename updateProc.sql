USE connect_visual2;

CREATE PROCEDURE USP_UpdateData1
  @UserId INT,
 @FirstName VARCHAR(50),
  @LastName VARCHAR(50),   
  --@Email VARCHAR(50),
  --@Addhar VARCHAR(50),
  --@Address VARCHAR(50),
  --@PAN VARCHAR(50),
  --@Phone VARCHAR(50),
  --@Category VARCHAR(20),
  --@Password VARCHAR(50)
AS
BEGIN
  UPDATE newUserData
  SET
    FirstName = @FirstName,
    LastName = @LastName,
    Email = @Email,
    Addhar = @Addhar,
    Address = @Address,
    PAN = @PAN,
    Phone = @Phone,
    Category = @Category,
    Password = @Password
  WHERE UserId = @UserId;

  IF @@ROWCOUNT = 0
  BEGIN
  
    PRINT 'No rows updated. Check if UserId exists.';

  END
END;

SELECT * FROM newUserData