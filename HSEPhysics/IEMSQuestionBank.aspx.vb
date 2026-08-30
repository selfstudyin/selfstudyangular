Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Partial Class IEMSQuestionBank
    Inherits System.Web.UI.Page
    Dim sqlcon As SqlConnection
    Dim DS, DS1 As DataSet
    Dim DT, DTl As New DataTable
    Dim sqladp, sqladpl As SqlDataAdapter
    Dim m_CreatedOn As DateTime = Now()
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("SLoginID") = "" Then
            Response.Redirect("http://selfstudy.in")

            Exit Sub

        End If

        If Not IsPostBack = "True" Then


            Dim sqlstring As String = "SELECT  SubjectDesc SubjectID, SubjectDesc "
            sqlstring &= " FROM IEMSSubjectMaster where active='Y' "
            Dim ddlistitem As ListItem
            ddlistitem = New ListItem("0", "Select")
            DDListSubject.Items.Add(ddlistitem)


            sqlcon = New SqlConnection(ConfigurationManager.ConnectionStrings("IEMSCon").ToString)
            sqlcon.Open()
            DS1 = New DataSet
            sqladp = New SqlDataAdapter(sqlstring, sqlcon)
            sqladp.Fill(DS1)

            DDListSubject.DataValueField = "SubjectID"
            DDListSubject.DataTextField = "SubjectDesc"
            DDListSubject.DataSource = DS1
            DDListSubject.DataBind()



            Dim sqlq As String = "Select distinct  SubjectID + topicsid  keydata ,subjectid  Templateid, topicsid Module "
            sqlq &= " from qb where subjectid = '" & DDListSubject.SelectedValue.ToString & "'  order by topicsid "

           
            DS = New DataSet
            sqladp = New SqlDataAdapter(sqlq, sqlcon)
            sqladp.Fill(DS)
            Dim dt As DataTable = DS.Tables.Item(0)
            dt = addcolumn(dt)
            GridView1.DataSource = dt
            GridView1.DataBind()



            sqlcon.Close()
            sqlcon.Dispose()

        End If
    End Sub

    Protected Sub GrldViewl_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridView1.RowCommand

        Dim s_referenceno As String
        Dim s_filename As String
        If e.CommandName = "OpenDocument" Then
            s_referenceno = GridView1.DataKeys(e.CommandArgument).Values.Item(1)
            s_filename = GridView1.DataKeys(e.CommandArgument).Values.Item(0)
            If File.Exists(System.Web.HttpContext.Current.Server.MapPath("./gif/" & s_filename & "")) Then
                Dim StrFileInfo As New FileInfo(System.Web.HttpContext.Current.Server.MapPath("./gif/" & s_filename & ""))
            End If
            MsgBox("Entry to click")
        End If
    End Sub

    Function RetURL(ByVal strtemplateId As String, ByVal qyear As String, ByVal groupname As Integer)
        Return "IEMSSolution.aspx?TemplateID=" & strtemplateId & "_" & qyear & "_" & groupname
    End Function

    Function RetURLFB(ByVal strtemplateId As String)
        Return "fb.aspx?TemplateID=" & strtemplateId
    End Function



    Function addcolumn(ByVal dt As DataTable) As DataTable
        Dim dtnew As New DataTable
        dtnew.Columns.Add("keydata")
        dtnew.Columns.Add("Templateid")
        dtnew.Columns.Add("Module")
        dtnew = dt.DefaultView.ToTable(True, "keydata", "Templateid", "Module")
        dtnew.Columns.Add("IIT2013")
        dtnew.Columns.Add("IIT2012")
        dtnew.Columns.Add("IIT2011")
        dtnew.Columns.Add("IIT2010")
        dtnew.Columns.Add("IIT2009")
        dtnew.Columns.Add("IIT2008")
        dtnew.Columns.Add("IIT2007")
        dtnew.Columns.Add("IIT2006")
        dtnew.Columns.Add("IIT2005")

        For i As Integer = 0 To dtnew.Rows.Count - 1


            dtnew.Rows(i)("IIT2013") = get_yeargroupwise_count(dt, dtnew.Rows(i)("Module"), "2013")
            dtnew.Rows(i)("IIT2012") = get_yeargroupwise_count(dt, dtnew.Rows(i)("Module"), "2012")
            dtnew.Rows(i)("IIT2011") = get_yeargroupwise_count(dt, dtnew.Rows(i)("Module"), "2011")
            dtnew.Rows(i)("IIT2010") = get_yeargroupwise_count(dt, dtnew.Rows(i)("Module"), "2010")
            dtnew.Rows(i)("IIT2009") = get_yeargroupwise_count(dt, dtnew.Rows(i)("Module"), "2009")
            dtnew.Rows(i)("IIT2008") = get_yeargroupwise_count(dt, dtnew.Rows(i)("Module"), "2008")
            dtnew.Rows(i)("IIT2007") = get_yeargroupwise_count(dt, dtnew.Rows(i)("Module"), "2007")
            dtnew.Rows(i)("IIT2006") = get_yeargroupwise_count(dt, dtnew.Rows(i)("Module"), "2006")
            dtnew.Rows(i)("IIT2005") = get_yeargroupwise_count(dt, dtnew.Rows(i)("Module"), "2005")

        Next
        dtnew.AcceptChanges()
        Return dtnew
    End Function




    Function get_yeargroupwise_count(ByVal dst As DataTable, ByVal m_module As String, ByVal year As String) As Integer
        Dim sqlcount As String
        Dim ds As DataSet
        Dim sqladp As SqlDataAdapter
        Dim sqlcon As SqlConnection

        sqlcount = " select  count(*) from qb where topicsid = '" & m_module & "' and qyear ='" & year & "'"

        sqlcon = New SqlConnection(ConfigurationManager.ConnectionStrings("IEMSCon").ToString)
        sqlcon.Open()
        ds = New DataSet
        sqladp = New SqlDataAdapter(sqlcount, sqlcon)
        sqladp.Fill(ds)
        Dim dt As DataTable = ds.Tables.Item(0)
        sqlcon.Close()
        If dt.Rows(0).Item(0) = 0 Then
            Return 0
        Else
            Return dt.Rows(0).Item(0).ToString

        End If

    End Function

    Protected Sub DDListSubject_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDListSubject.SelectedIndexChanged
      

        Dim sqlq As String = "Select distinct  SubjectID + topicsid  keydata ,subjectid  Templateid, topicsid Module "
        sqlq &= " from qb  where subjectid = '" & DDListSubject.SelectedValue.ToString & "'  order by topicsid "

      
        sqlcon = New SqlConnection(ConfigurationManager.ConnectionStrings("IEMSCon").ToString)
        sqlcon.Open()
        DS = New DataSet
        sqladp = New SqlDataAdapter(sqlq, sqlcon)
        sqladp.Fill(DS)
        Dim dt As DataTable = DS.Tables.Item(0)
        dt = addcolumn(dt)
        GridView1.DataSource = dt
        GridView1.DataBind()



        sqlcon.Close()
        sqlcon.Dispose()





    End Sub
End Class
