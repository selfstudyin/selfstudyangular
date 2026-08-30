Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports System.Web.HttpContext
Partial Class IEMSSolution
    Inherits System.Web.UI.Page
    Private Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim DS As DataSet
        Dim DT, DTl As New DataTable
        Dim sqladp As SqlDataAdapter
        Dim sqlcon As SqlConnection
        Dim m_CreatedOn As DateTime = Now()
        sqlcon = New SqlConnection(ConfigurationManager.ConnectionStrings("IEMSCon").ToString)
        sqlcon.Open()
        Dim m_querystring, m_keydata, m_qyear As String
        m_querystring = Request.QueryString("Templateid")
        m_keydata = m_querystring.Split("_")(0)
        m_qyear = m_querystring.Split("_")(1)

        'm_groupname = m_querystring.Split("_")(2)
        Dim sqlq As String = "select subjectid,topicsid,subtopics,qyear,'gif/' + QURL filename "
        sqlq &= "   from qb "
        sqlq &= " where subjectid+topicsid= '" & m_keydata & "' and qyear = '" & m_qyear & "' order by qsrlno "


        DS = New DataSet
        sqladp = New SqlDataAdapter(sqlq, sqlcon)
        sqladp.Fill(DS)


        GridView1.DataSource = DS

        GridView1.DataBind()
        sqlcon.Close()
        sqlcon.Dispose()
    End Sub
End Class
