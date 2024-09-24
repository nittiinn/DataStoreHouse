<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Registration Form</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
    <link href="style.css" rel="stylesheet" />

    <style>
        /* The Modal (background) */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.9);
            padding-top: 60px;
        }

        /* Modal Content (Image) */
        .modal-content {
            margin: auto;
            display: block;
            width: 80%;
            max-width: 700px;
        }

        /* Close Button */
        .close {
            position: absolute;
            top: 15px;
            right: 35px;
            color: white;
            font-size: 40px;
            font-weight: bold;
        }

            .close:hover,
            .close:focus {
                color: #bbb;
                text-decoration: none;
                cursor: pointer;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <asp:Label ID="lblMsg" runat="server" CssClass="text-center text-danger" />
            <div class="text-center d-flex  mb-2">
                <img src="registerlogo.png" height="50px" alt="logo" />
                <h1>Registration Form</h1>
            </div>
            <div class="row containermain">
                <div class="col-md-6 mt-4">
                    <label for="txtName">First Name:<span class="text-danger">*</span></label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control " AutoComplete="true" required="true" placeholder="Enter your first name"></asp:TextBox>

                    <label for="TextBox1">Email:<span class="text-danger">*</span></label>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" AutoComplete="true" placeholder="Enter your email"></asp:TextBox>

                    <label for="TextBox2">Address:</label>
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" AutoComplete="true" placeholder="Enter your address"></asp:TextBox>

                    <label for="TextBox3">Phone:<span class="text-danger">*</span></label>
                    <asp:TextBox ID="TextBox3" MaxLength="10" runat="server" CssClass="form-control" AutoComplete="true" placeholder="Enter your phone number"></asp:TextBox>

                    <label for="pdfFile">Upload PDF:<span class="text-danger">*</span></label>
                    <asp:FileUpload ID="pdfFileUpload" runat="server" CssClass="form-control" />

                    <label for="TextBox19">Password:<span class="text-danger">*</span></label>
                    <asp:TextBox CssClass="form-control" TextMode="Password" ID="TextBox19" AutoComplete="true" placeholder="Enter your password" runat="server"></asp:TextBox>
                </div>

                <div class="col-md-6 mt-4">
                    <label for="TextBox4">Last Name:</label>
                    <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" AutoComplete="true" placeholder="Enter your last name"></asp:TextBox>

                    <label for="TextBox5">Aadhar:<span class="text-danger">*</span></label>
                    <asp:TextBox ID="TextBox5" MaxLength="12" runat="server" CssClass="form-control" AutoComplete="true" placeholder="Enter your Aadhar number"></asp:TextBox>

                    <label for="TextBox13">PAN No.:</label>
                    <asp:TextBox ID="TextBox13" runat="server" MaxLength="10" CssClass="form-control" AutoComplete="true" placeholder="Enter your PAN number"></asp:TextBox>

                    <label for="ddl1">Category:<span class="text-danger">*</span></label>
                    <asp:DropDownList ID="ddl1" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Select your category-" Value=""></asp:ListItem>
                        <asp:ListItem Text="General" Value="General"></asp:ListItem>
                        <asp:ListItem Text="OBC" Value="OBC"></asp:ListItem>
                        <asp:ListItem Text="SC" Value="SC"></asp:ListItem>
                        <asp:ListItem Text="ST" Value="ST"></asp:ListItem>
                    </asp:DropDownList>

                    <label for="TextBox20">Upload Image:<span class="text-danger">*</span></label>
                    <asp:FileUpload ID="imgFileUpload" CssClass="form-control" runat="server" />

                    <label for="TextBox20">Confirm Password:<span class="text-danger">*</span></label>
                    <asp:TextBox CssClass="form-control" TextMode="Password" ID="TextBox20" placeholder="Confirm your password" runat="server"></asp:TextBox>

                </div>
            </div>
            <div class="text-center mt-4">
                <asp:Button CssClass="btn btn-primary w-50" Text="Submit" ID="btnClick" OnClick="btnClick_Click" runat="server" />
            </div>
            <hr />

            <div class="table-responsive mt-4">
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-striped text-center" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting" AutoGenerateColumns="false" OnRowCommand="GridView1_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="First Name">
                            <ItemTemplate>
                                <asp:Label ID="lblFirstName" Text='<%# Eval("FirstName") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Last Name">
                            <ItemTemplate>
                                <asp:Label ID="lblLastName" Text='<%# Eval("LastName") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <asp:Label ID="lblEmail" Text='<%# Eval("Email") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Address">
                            <ItemTemplate>
                                <asp:Label ID="lblAddress" Text='<%# Eval("Address") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="PAN">
                            <ItemTemplate>
                                <asp:Label ID="lblPan" Text='<%# Eval("PAN") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Category">
                            <ItemTemplate>
                                <asp:Label ID="lblCategory" Text='<%# Eval("Category") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <asp:ImageButton ID="imgUser" runat="server" ImageUrl='<%# Eval("ImagePath") %>'
                                    OnClientClick='<%# "showImageModal(\"" + Eval("ImagePath") + "\"); return false;" %>'
                                    Width="80px" Height="50px" CssClass="clickable-image" />
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="PDF">
                            <ItemTemplate>
                                <asp:HyperLink ID="lnkPDF" runat="server" NavigateUrl='<%# Eval("PDFPath") %>' Target="_blank" CssClass="custom-button btn btn-primary text-white" Text="View PDF" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delete">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkbtnbutton" runat="server" CssClass="custom-button btn btn-danger text-white" CommandArgument='<%# Eval("UserId") %>' OnClientClick="return confirm('Are you sure you want to delete this item?');" CommandName="Delete" Text="Delete"> <i class="fa-solid fa-trash"></i> Delete</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Update">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnk" runat="server" CssClass="custom-button btn btn-warning text-white" Text="Update" CommandName="Update" CommandArgument='<%# Eval("UserId") %>'><i class="fa-solid fa-wrench"></i> Update</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>  


            <div id="imageModal" class="modal" style="display: none;">
                <span onclick="closeModal()" class="close" style="cursor: pointer;">&times;</span>
                <img class="modal-content" id="modalImage" style="width: 100%; max-width: 600px;" />
                <div id="caption"></div>
            </div>
    </form>



    <script type="text/javascript">
        function showImageModal(imageUrl) {
            var modalImage = document.getElementById('modalImage');
            modalImage.src = imageUrl; // Set the source of the modal image
            var modal = document.getElementById('imageModal');
            modal.style.display = "block"; // Show the modal
        }

        function closeModal() {
            var modal = document.getElementById('imageModal');
            modal.style.display = "none"; // Hide the modal
        }
</script>


</body>
</html>
