Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.HttpContext
Imports System.IO

Partial Class IEMSTest
    Inherits System.Web.UI.Page
    Dim sqlcon As SqlConnection
    Dim todate As DateTime
    Dim DS, DS1 As DataSet
    Dim sqladp, sqladp1 As SqlDataAdapter

    Protected Sub form1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles form1.Load
        If Session("SLoginID") = "" Then
            Response.Redirect("http://selfstudy.in")

            Exit Sub

        End If


        If Not IsPostBack Then


            Dim sqlstring As String = "SELECT  distinct  Standard SubjectID, 'Standard :' +  Standard As Standard "
            sqlstring &= " FROM IEMS_Quizehdr where active='Y' order by standard desc "
            Dim ddlistitem As ListItem
            ddlistitem = New ListItem("0", "Select")
            DDListStandard.Items.Add(ddlistitem)


            sqlcon = New SqlConnection(ConfigurationManager.ConnectionStrings("IEMSCon").ToString)
            sqlcon.Open()
            DS1 = New DataSet
            sqladp1 = New SqlDataAdapter(sqlstring, sqlcon)
            sqladp1.Fill(DS1)

            DDListStandard.DataValueField = "SubjectID"
            DDListStandard.DataTextField = "Standard"
            DDListStandard.DataSource = DS1
            DDListStandard.DataBind()



            Dim IEMSTest As DataSet
            Dim SqlAdp As SqlDataAdapter
            Dim StrQuery As String
            'sqlcon = New SqlConnection(ConfigurationManager.ConnectionStrings("IEMSCon").ToString)
            'sqlcon.Open()
            StrQuery = "Select quizeid,quizedesc,standard  from IEMS_Quizehdr "
            StrQuery &= " where standard = '" & DDListStandard.SelectedValue.ToString & "' "
            StrQuery &= " order by quizeid "
            IEMSTest = New DataSet
            SqlAdp = New SqlDataAdapter(StrQuery, sqlcon)

            IEMSTest.Clear()
            SqlAdp.Fill(IEMSTest)
            GridView1.DataSource = IEMSTest
            GridView1.DataBind()

            sqlcon.Close()
            sqlcon.Dispose()
        End If
    End Sub
    Function StartTest(ByVal strquizeid As String)
        Session("UserID") = "Admin@selfstudy.in"
        Session("QuizeID") = strquizeid


        If strquizeid = "" Then
            MsgBox("No ID selected")
        Else


            ' Response.Redirect("IEMSSelfTest.aspx")
        End If
        Return "IEMSErrorPage.aspx"



    End Function

    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridView1.RowCommand
        Session("UserID") = "Admin@selfstudy.in"
        Session("QuizeID") = e.CommandName.ToString
        Response.Redirect("IEMSSelfTest.aspx")
        'MsgBox(e.CommandName.ToString)


    End Sub

    Protected Sub DDListStandard_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDListStandard.SelectedIndexChanged
        Dim IEMSTest As DataSet
        Dim SqlAdp As SqlDataAdapter
        Dim StrQuery As String
        sqlcon = New SqlConnection(ConfigurationManager.ConnectionStrings("IEMSCon").ToString)
        sqlcon.Open()
        StrQuery = "Select quizeid,quizedesc,standard  from IEMS_Quizehdr "
        StrQuery &= " where standard = '" & DDListStandard.SelectedValue.ToString & "' "
        StrQuery &= " order by quizeid "
        IEMSTest = New DataSet
        SqlAdp = New SqlDataAdapter(StrQuery, sqlcon)

        IEMSTest.Clear()
        SqlAdp.Fill(IEMSTest)
        GridView1.DataSource = IEMSTest
        GridView1.DataBind()

        sqlcon.Close()
        sqlcon.Dispose()
    End Sub
End Class
