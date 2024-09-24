USE connect_visual2;

CREATE PROC UserInfo2
  @FirstName VARCHAR(50),
  @LastName VARCHAR(50),   
  @Email VARCHAR(50),
  @Addhar VARCHAR(50),
  @Address VARCHAR(50),
  @PAN VARCHAR(50),
  @Phone VARCHAR(50),
  @Category VARCHAR(20),
  @Password VARCHAR(50)

  AS                                                                                                                                                                                                                                                                                                         
  BEGIN
  
  INSERT INTO newUserData (FirstName, LastName, Email, Addhar, Address, PAN, Phone, Category, Password)
  VALUES (@FirstName, @LastName, @Email, @Addhar, @Address, @PAN, @Phone, @Category, @Password)

  END;