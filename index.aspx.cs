using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{
        //    //fillGrid();
        //    GridView1.Visible = true;
        //}
        //else
        //{
        //    GridView1.Visible = true;
        //}
    }

    protected void fillGrid()
    {
        DataTable dt = new DataTable();

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Connection"].ConnectionString);
        conn.Open();
        SqlCommand cmd = new SqlCommand("FillGrid2", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);

        ViewState["DataTable"] = dt;

        GridView1.DataSource = ds;
        GridView1.DataBind();
        conn.Close();
    }

    protected void btnClick_Click(object sender, EventArgs e)
    {
        try
        {
            string imgPath = "";
            string pdfPath = "";

            string imagesPath = Server.MapPath("~/Uploads/Images/");
            string pdfsPath = Server.MapPath("~/Uploads/PDFs/");

            if (!Directory.Exists(imagesPath))
            {
                Directory.CreateDirectory(imagesPath);
            }

            if (!Directory.Exists(pdfsPath))
            {
                Directory.CreateDirectory(pdfsPath);
            }

            if (imgFileUpload.HasFile)
            {
                string fileName = Path.GetFileNameWithoutExtension(imgFileUpload.FileName);
                string extension = Path.GetExtension(imgFileUpload.FileName);
                string randomFileName = fileName + "_" + Guid.NewGuid().ToString() + extension; 
                imgPath = "~/Uploads/Images/" + randomFileName;
                imgFileUpload.PostedFile.SaveAs(Server.MapPath(imgPath));
            }

            if (pdfFileUpload.HasFile)
            {
                string fileName = Path.GetFileNameWithoutExtension(pdfFileUpload.FileName);
                string extension = Path.GetExtension(pdfFileUpload.FileName);
                string randomFileName = fileName + "_" + Guid.NewGuid().ToString() + extension; 
                pdfPath = "~/Uploads/PDFs/" + randomFileName;
                pdfFileUpload.PostedFile.SaveAs(Server.MapPath(pdfPath));
            }

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Connection"].ConnectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("UserInfo2", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@FirstName", txtName.Text.Trim());
                cmd.Parameters.AddWithValue("@LastName", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@Addhar", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@Address", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@PAN", TextBox13.Text.Trim());
                cmd.Parameters.AddWithValue("@Phone", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@Category", ddl1.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", TextBox19.Text.Trim());
                cmd.Parameters.AddWithValue("@ImagePath", imgPath);
                cmd.Parameters.AddWithValue("@PDFPath", pdfPath);

                cmd.ExecuteNonQuery(); 
            }

            fillGrid();
            ClearFields();
        }
        catch (Exception ex)
        {
            lblMsg.Text = "Error: " + ex.Message;
        }
    }

    protected void ClearFields()
    {
        txtName.Text = string.Empty;
        TextBox4.Text = string.Empty;
        TextBox1.Text = string.Empty;
        TextBox2.Text = string.Empty;
        TextBox13.Text = string.Empty;
        TextBox3.Text = string.Empty;
        ddl1.SelectedIndex = 0; 
        imgFileUpload.Attributes.Clear();
        pdfFileUpload.Attributes.Clear(); 
        btnClick.Text = "Submit"; 
    }


    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        //GridViewRow row = (GridViewRow)((LinkButton)e.CommandSource).FindControl;
        GridViewRow row = (GridViewRow)((LinkButton)e.CommandSource).NamingContainer;


        if (e.CommandName == "Delete")
        {
            ViewState[ID] = e.CommandArgument;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Connection"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("USP_Deletedata", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserId", ViewState[ID].ToString());
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            ds.Clear();
            da.Fill(ds);
            conn.Close();
            fillGrid();
        }
        else if (e.CommandName == "Update")
        {

            Label lblFirstName = (Label)row.FindControl("lblFirstName");
            Label lblLastName = (Label)row.FindControl("lblLastName");
            Label lblEmail = (Label)row.FindControl("lblEmail");
            Label lblAddress = (Label)row.FindControl("lblAddress");
            Label lblPan = (Label)row.FindControl("lblPan");
            Label lblCategory = (Label)row.FindControl("lblCategory");

            txtName.Text = lblFirstName.Text;
            TextBox4.Text = lblLastName.Text;
            TextBox1.Text = lblEmail.Text;
            TextBox2.Text = lblAddress.Text;
            TextBox13.Text = lblPan.Text;
            ddl1.Text = lblCategory.Text;
            btnClick.Text = "Update";
            ViewState[ID] = e.CommandArgument;

        }

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }

    //private string SaveFile(FileUpload fileUpload, string folderPath)
    //{
    //    if (fileUpload.HasFile)
    //    {
    //        string fileName = Path.GetFileNameWithoutExtension(fileUpload.FileName);
    //        string extension = Path.GetExtension(fileUpload.FileName);
    //        string randomFileName = fileName + "_" + Guid.NewGuid().ToString() + extension;
    //        string filePath = folderPath + randomFileName;
    //        fileUpload.SaveAs(Server.MapPath(filePath));
    //        return filePath;
    //    }
    //    return string.Empty;
    //}
}