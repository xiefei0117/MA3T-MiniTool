using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace MA3T_test1
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void storeInformation()
        {
            OleDbConnection sqlConn = new OleDbConnection(System.Configuration.ConfigurationManager.ConnectionStrings["contact"].ConnectionString);
            sqlConn.Open();
            string sql = "INSERT INTO contact (ContactTime, ContactName, Email, Subject, Comments)" + " VALUES (@ContactTime, @ContactName, @Email, @Subject, @Comments)";

            OleDbCommand commandStatement = new OleDbCommand(sql, sqlConn);
            commandStatement.Parameters.Add("@ContactTime", OleDbType.VarWChar, 40).Value = DateTime.Now.ToShortDateString();
            commandStatement.Parameters.Add("@ContactName", OleDbType.VarWChar, 40).Value = YourName.Text;
            commandStatement.Parameters.Add("@Email", OleDbType.VarWChar, 40).Value = YourEmail.Text;
            commandStatement.Parameters.Add("@Subject", OleDbType.VarWChar, 100).Value = YourSubject.Text;
            commandStatement.Parameters.Add("@Comments", OleDbType.VarWChar, 400).Value = Comments.Text;
            try {
                sqlConn.Close();         
                sqlConn.Open();
                commandStatement.ExecuteNonQuery();

                DisplayMessage.Text = "Thank you! We will contact you soon!";
                DisplayMessage.Visible = true;
                YourSubject.Text = "";
                YourEmail.Text = "";
                YourName.Text = "";
                Comments.Text = "";
            }
            catch (Exception e2)
                { DisplayMessage.Visible = true; DisplayMessage.Text = "Not successful!" + e2.Message; }
            finally
            {
                sqlConn.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

                //here on button click what will done 
                storeInformation();
           

        }
    }
}
