Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.HttpContext
Imports System.IO
Imports System.Net.Mail


Partial Class IEMSSelfTest
    Inherits System.Web.UI.Page
    Dim sqlcon As SqlConnection
    Dim todate As DateTime
    Dim DS As DataSet
    Dim sqladp As SqlDataAdapter
    Dim sqladpu As SqlDataAdapter
    Dim sqlcmd, sqlcmdd As SqlCommand
    Dim Qrcnt As Integer


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Session("UserID") = "Admin@selfstudy.in"
        'Session("QuizeID") = "1001010"



        deleterecord()
        Qrcnt = questioncount()



        If Page.IsPostBack = False Then
            PrintHeader()


            Dim StrQuery As String
            todate = Now()
            StrQuery = "Select distinct QuizeID templateid, QID qid,isnull(qtext,imgurl) qtext, isnull(imgurl,'images\blank.jpg') Imgurl, "
            StrQuery &= " ROUND(((" & Qrcnt & "  - 1 - QID )*RAND() + 1), 0) srlno"
            StrQuery &= " from IEMS_QuizeQrs "
            StrQuery &= " Where   QuizeID =" & Session("QuizeID")
            StrQuery &= " order by ROUND(((" & Qrcnt & " - 1 - QID )*RAND() + 1), 0)  "
         

            sqlcon = New SqlConnection(ConfigurationManager.ConnectionStrings("IEMSCon").ToString)
            sqlcon.Open()
            DS = New DataSet
            sqladp = New SqlDataAdapter(StrQuery, sqlcon)
            sqladp.Fill(DS)
            Repeater1.DataSource = DS
            DS.Tables(0).Columns.Add("SerialNo")

            For k As Integer = 0 To DS.Tables(0).Rows.Count - 1
                DS.Tables(0).Rows(k)("SerialNo") = k + 1

            Next
            Repeater1.DataBind()
            sqlcon.Close()
        End If
    End Sub
    Function questioncount()
        Dim StrQrcnt As String

        sqlcon = New SqlConnection(ConfigurationManager.ConnectionStrings("IEMSCon").ToString)
        sqlcon.Open()

        StrQrcnt = "Select count(*) from IEMS_QuizeQrs where Quizeid = " & Session("QuizeID")
        sqlcon = New SqlConnection(ConfigurationManager.ConnectionStrings("IEMSCon").ToString)
        sqlcon.Open()
        DS = New DataSet
        sqladp = New SqlDataAdapter(StrQrcnt, sqlcon)
        sqladp.Fill(DS)
        sqlcon.Close()
        Return (DS.Tables(0).Rows(0).Item(0).ToString)


    End Function

    Protected Sub Repeater1_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.RepeaterItemEventArgs) Handles Repeater1.ItemDataBound
        If e.Item.ItemType = ListItemType.AlternatingItem Or e.Item.ItemType = ListItemType.Item Or e.Item.ItemType = ListItemType.SelectedItem Then
            Dim CBL1 As CheckBoxList = CType(e.Item.FindControl("CBL1"), CheckBoxList)
            Dim lblsrno As Label = CType(e.Item.FindControl("lblsrn"), Label)
            Dim SqlQuery2 As String = "Select aid ANSID,cast(aid as varchar(10)) + '.' + atext anstext1,atext anstext, atext AT, "
            SqlQuery2 &= " Round(((4 -1 -aid) *Rand() + 1),0) srlno "
            SqlQuery2 &= " from IEMS_QuizeAns "
            SqlQuery2 &= " where qid = '" & e.Item.DataItem("QID") & "' and QuizeID = " & Session("QuizeID")
            SqlQuery2 &= " order by Round(((4 - 1 - Aid) * Rand() + 1),0 ) "

            sqlcon = New SqlConnection(ConfigurationManager.ConnectionStrings("IEMSCon").ToString)
            sqlcon.Open()
            DS = New DataSet
            sqladp = New SqlDataAdapter(SqlQuery2, sqlcon)
            sqladp.Fill(DS)
            CBL1.DataSource = DS
            CBL1.DataTextField = "ANSTEXT"
            CBL1.DataValueField = "ANSID"
            CBL1.DataBind()

            For chbli As Integer = 0 To CBL1.Items.Count - 1
                Dim anstext As String = CBL1.Items(chbli).Text
                CBL1.Items(chbli).Text = chbli + 1 & "." & anstext
                'CBL1.Items(chbli).Text = anstext

            Next
            sqlcon.Close()
        End If
    End Sub


    Protected Sub BtnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnSave.Click
        Dim m_result As String
        Dim sqlinsert As String
        Dim m_correct As Integer = 0, m_wrong As Integer = 0, m_score As Integer = 0
        sqlcon = New SqlConnection(ConfigurationManager.ConnectionStrings("IEMSCon").ToString)

        Dim sqlcmd As SqlCommand
        For Each item As RepeaterItem In Repeater1.Items
            Dim cbl1 As CheckBoxList = CType(item.FindControl("CBL1"), CheckBoxList)
            Dim qrid As String = CType(item.FindControl("Lbl1"), Label).Text
            Dim m_displayqid As String = CType(item.FindControl("Label2"), Label).Text

            For i As Integer = 0 To cbl1.Items.Count - 1
                Dim qid As String = cbl1.Items(i).Value



                If cbl1.Items(i).Selected = "True" Then
                    sqlcon.Open()
                    sqlinsert = "Insert into IEMS_QuizeUserAns(QuizeID,qid,aid,userid,displayqid,displayansid,selectedbyuser)"
                    sqlinsert &= " values(" & Session("QuizeID") & ",'" & qrid & "'," & cbl1.Items(i).Value & ",'" & Session("UserID") & "'," & m_displayqid & "," & cbl1.Items(i).Text.Substring(0, InStr(cbl1.Items(i).Text, ".") - 1) & ",'Y')"
                    sqlcmd = New SqlCommand(sqlinsert, sqlcon)
                    sqlcmd.ExecuteNonQuery()
                    sqlcon.Close()
                Else
                    sqlcon.Open()
                    sqlinsert = "Insert into IEMS_QuizeUserAns(QuizeID,qid,aid,userid,displayqid,displayansid,selectedbyuser)"
                    sqlinsert &= " values(" & Session("QuizeID") & ",'" & qrid & "'," & cbl1.Items(i).Value & ",'" & Session("UserID") & "'," & m_displayqid & "," & cbl1.Items(i).Text.Substring(0, InStr(cbl1.Items(i).Text, ".") - 1) & ",'N')"
                    sqlcmd = New SqlCommand(sqlinsert, sqlcon)
                    sqlcmd.ExecuteNonQuery()
                    sqlcon.Close()

                End If

            Next
        Next


        If allqrattempted(Session("QuizeID")) = "N" Then
            Result.Text = "You have not attempted all Questions.. Please try again..."
            BtnSave.Visible = "False"
            Exit Sub

        End If

        Dim StrQuery As String
        Dim m_qid As Integer
        Dim m_mailbody As String

        todate = Now()
        StrQuery = "Select distinct a.quizeID QuizeID, a.qid,b.displayqid, a.qtext,a.imgurl qurl "
        StrQuery &= " from IEMS_QuizeQrs a, IEMS_QuizeUserAns b where a.QuizeID = b.QuizeID and a.qid = b.qid and a.QuizeID = " & Session("QuizeID") & " Order by b.displayqid "
        sqlcon = New SqlConnection(ConfigurationManager.ConnectionStrings("IEMSCon").ToString)
        sqlcon.Open()
        DS = New DataSet
        sqladp = New SqlDataAdapter(StrQuery, sqlcon)
        sqladp.Fill(DS)
        DS.Tables(0).Columns.Add("ActualAnsF")
        DS.Tables(0).Columns.Add("UserAnsF")
        DS.Tables(0).Columns.Add("ResultF")
        DS.Tables(0).Columns.Add("DisplayAid")
        DS.Tables(0).Columns.Add("DisplayAidText")
        DS.Tables(0).Columns.Add("CorrectAidText")

        m_mailbody = "<table boarder=solid cellspacing=0>"

        m_mailbody &= "<td style=text-align:center;><b>Question No.</b><td/>"
        m_mailbody &= "<td style=text-align:center;><b>Question</b><td/>"
        m_mailbody &= "<td style=text-align:center;><b>Correct Option</b><td/>"
        m_mailbody &= "<td style=text-align:center;><b>Result</b><td/><tr/>"

        For k As Integer = 0 To DS.Tables(0).Rows.Count - 1
            If m_qid = DS.Tables(0).Rows(k).Item(1).ToString Then
            Else

                m_mailbody &= "<tr><td style=text-align:center;>" & DS.Tables(0).Rows(k).Item(1).ToString & "<td/>"
                m_mailbody &= "<td style=text-align:center;>" & DS.Tables(0).Rows(k).Item(3).ToString & "<td/>"
                m_mailbody &= "<td style=text-align:center;>" & CorrectAnsText(Session("QuizeID"), DS.Tables(0).Rows(k).Item(1).ToString) & "<td/>"
               

                DS.Tables(0).Rows(k)("ActualAnsF") = ActualAns(Session("QuizeID"), DS.Tables(0).Rows(k).Item(1).ToString)
                DS.Tables(0).Rows(k)("UserAnsF") = UserAns(Session("QuizeID"), DS.Tables(0).Rows(k).Item(1).ToString)
                DS.Tables(0).Rows(k)("DisplayAid") = DisplayedAid(Session("QuizeID"), DS.Tables(0).Rows(k).Item(1).ToString)
                DS.Tables(0).Rows(k)("DisplayAidText") = displayedAnsTextSelected(Session("QuizeID"), DS.Tables(0).Rows(k).Item(1).ToString)

                DS.Tables(0).Rows(k)("CorrectAidText") = CorrectAnsText(Session("QuizeID"), DS.Tables(0).Rows(k).Item(1).ToString)

                If ActualAns(Session("QuizeID"), DS.Tables(0).Rows(k).Item(1).ToString) = UserAns(Session("QuizeID"), DS.Tables(0).Rows(k).Item(1).ToString) Then
                    DS.Tables(0).Rows(k)("ResultF") = "Correct"
                    m_correct = m_correct + 1
                    m_mailbody &= "<td style=text-align:center;>" & DS.Tables(0).Rows(k)("ResultF") & "<td/><tr/>"

                Else
                    DS.Tables(0).Rows(k)("ResultF") = "Wrong"
                    m_wrong = m_wrong + 1
                    m_mailbody &= "<td style=text-align:center;>" & DS.Tables(0).Rows(k)("ResultF") & "<td/><tr/>"
                End If
            End If

            m_qid = DS.Tables(0).Rows(k).Item(1).ToString


        Next
        m_score = (m_correct * 100) / (m_correct + m_wrong)

        If m_score > 60 Then

            Result.Text &= " Score : " & m_score & "% Passed ( > 60% ) and Time Taken " & TextBox1.Text & " Seconds "
            m_result = "Pass"
        Else

            Result.Text &= " Score : " & m_score & "% Failed ( < 60% ) and Time Taken " & TextBox1.Text & " Seconds "
            m_result = "Fail"
        End If
        sqlcon.Close()
        GridViewResult.DataSource = DS
        GridViewResult.DataBind()
        sqlcon.Open()
        Dim SqlinsertP As String = " insert into IEMS_SelfTestResult (loginID,dop,QuizeID,percentage,result) "
        SqlinsertP &= " values('" & Session("UserID") & "','" & todate & "'," & Session("QuizeID") & "," & m_score & ",'" & m_result & "')"

        sqlcmd = New SqlCommand(SqlinsertP, sqlcon)
        sqlcmd.ExecuteNonQuery()
        sqlcmd.Connection.Close()

        sqlcon.Close()


        ' Mail sending code
        Dim useremail As String
        ' useremail = "talk2mou2009@gmail.com"
        useremail = Session("UserID") & ",talk2mou2009@gmail.com"

        'Dim Email As New System.Net.Mail.MailMessage( _
        '   "Admin@selfstudy.in", "talk2mou2009@gmail.com")
        Dim Email As New System.Net.Mail.MailMessage( _
          "Admin@selfstudy.in", "" & useremail & "")
        Email.Subject = "Result :  " & m_result
        Email.Subject = " Quize For " & lbltemplatedesc.Text
        Email.IsBodyHtml = True
        Email.Body = m_mailbody
        Email.Body &= "</table><br/><br/>"
        Email.Body &= "Score Card : " & Result.Text
        Dim mailClient As New System.Net.Mail.SmtpClient()
        'This object stores the authentication values
        Dim basicAuthenticationInfo As _
           New System.Net.NetworkCredential("Admin@selfstudy.in", "OmKrishna05")
        'Put your own, or your ISPs, mail server name onthis next line
        mailClient.Host = "mail.selfstudy.in"
        mailClient.UseDefaultCredentials = False
        mailClient.Credentials = basicAuthenticationInfo
        mailClient.Send(Email)

    End Sub

    Function m_result(ByVal m_actans As String, ByVal m_userans As String)

        If m_actans = m_userans Then
            Return "Correct"
        Else
            Return "Wrong"

        End If
    End Function


    Protected Sub PrintHeader()
        Dim StrQuery As String
        todate = Now()
        StrQuery = "Select QuizeDesc from IEMS_QuizeHDR where Quizeid = " & Session("QuizeID")
        sqlcon = New SqlConnection(ConfigurationManager.ConnectionStrings("IEMSCon").ToString)
        sqlcon.Open()
        DS = New DataSet
        sqladp = New SqlDataAdapter(StrQuery, sqlcon)
        sqladp.Fill(DS)
        lbltemplatedesc.Text = DS.Tables(0).Rows(0).Item(0).ToString
        sqlcon.Close()

    End Sub

    Function ActualAns(ByVal m_templateid As Integer, ByVal m_qid As Integer)
        Dim dst As New DataSet
        Dim sqlq As String = "Select qid,aid,flag from IEMS_QuizeAns where flag = 'Y' and QuizeID = " & m_templateid & " and qid = " & m_qid & " Order by aid "
        sqlcon = New SqlConnection(ConfigurationManager.ConnectionStrings("IEMSCon").ToString)
        sqlcon.Open()
        dst = New DataSet
        sqladp = New SqlDataAdapter(sqlq, sqlcon)
        sqladp.Fill(dst)
        sqlcon.Close()
        Dim m_actualans As String = " "


        If dst.Tables(0).Rows.Count > 0 Then

            For k As Integer = 0 To dst.Tables(0).Rows.Count - 1

                If k = 0 Then
                    m_actualans = dst.Tables(0).Rows(k).Item(1).ToString
                Else
                    m_actualans &= "," & dst.Tables(0).Rows(k).Item(1).ToString

                End If
            Next
        End If
        Try
            Return m_actualans

        Catch ex As Exception
            Return ""

        End Try

    End Function

    Sub deleterecord()

        sqlcon = New SqlConnection(ConfigurationManager.ConnectionStrings("IEMSCon").ToString)
        sqlcon.Open()
        Dim sqlcmdd As SqlCommand
        TextBox1.Text = txt.value
        Dim Sqldelete As String = " delete from IEMS_QuizeUserAns where userid = '" & Session("UserID") & "' and QuizeID = " & Session("QuizeID")

        sqlcmdd = New SqlCommand(Sqldelete, sqlcon)
        sqlcmdd.ExecuteNonQuery()
        sqlcon.Close()

    End Sub


    Function UserAns(ByVal m_templateid As Integer, ByVal m_qid As Integer)
        Dim dst As New DataSet
        Dim sqlq As String = "Select qid,aid from IEMS_QuizeUserAns where  selectedbyuser = 'Y' and QuizeID = " & m_templateid & " and qid = " & m_qid & " order by aid "
        sqlcon = New SqlConnection(ConfigurationManager.ConnectionStrings("IEMSCon").ToString)
        sqlcon.Open()
        dst = New DataSet
        sqladp = New SqlDataAdapter(sqlq, sqlcon)
        sqladp.Fill(dst)
        sqlcon.Close()

        Dim m_actualans As String = " "

        If dst.Tables(0).Rows.Count > 0 Then

            For k As Integer = 0 To dst.Tables(0).Rows.Count - 1
                If k = 0 Then
                    m_actualans = dst.Tables(0).Rows(k).Item(1).ToString
                Else
                    m_actualans &= "," & dst.Tables(0).Rows(k).Item(1).ToString

                End If
            Next
        End If

        Try
            Return m_actualans

        Catch ex As Exception
            Return ""

        End Try

    End Function

    Function DisplayedAid(ByVal m_templateid As Integer, ByVal m_qid As Integer)

        Dim dst As New DataSet
        Dim sqlq As String = "select qid,displayansid from IEMS_QuizeUserAns "
        sqlq &= " where QuizeID = " & Session("QuizeID")
        sqlq &= " and  selectedbyuser = 'Y' "
        sqlq &= " and qid = " & m_qid & " order by Displayansid "

        sqlcon = New SqlConnection(ConfigurationManager.ConnectionStrings("IEMSCon").ToString)
        sqlcon.Open()
        dst = New DataSet
        sqladp = New SqlDataAdapter(sqlq, sqlcon)
        sqladp.Fill(dst)
        sqlcon.Close()

        Dim m_displayansid As String = " "
        If dst.Tables(0).Rows.Count > 0 Then
            For k As Integer = 0 To dst.Tables(0).Rows.Count - 1
                If k = 0 Then
                    m_displayansid = dst.Tables(0).Rows(k).Item(1).ToString
                Else
                    m_displayansid &= "," & dst.Tables(0).Rows(k).Item(1).ToString

                End If
            Next
        End If
        Try
            Return m_displayansid

        Catch ex As Exception
            Return ""

        End Try
    End Function

    Function allqrattempted(ByVal m_templateid As Integer)

        Dim dstm, dstu As New DataSet
        Dim sqlqrmaster, sqlqruser As String
        sqlqrmaster = " select count(distinct qid ) totalqid from IEMS_QuizeQrs where QuizeID = " & m_templateid
        sqlqruser = " select count(distinct qid ) totalqidans from IEMS_QuizeUserAns where QuizeID = " & m_templateid & " and userid = '" & Session("UserID") & "'"

        sqlcon = New SqlConnection(ConfigurationManager.ConnectionStrings("IEMSCon").ToString)
        sqlcon.Open()

        dstm = New DataSet
        dstu = New DataSet

        sqladp = New SqlDataAdapter(sqlqrmaster, sqlcon)
        sqladp.Fill(dstm)
        sqladpu = New SqlDataAdapter(sqlqruser, sqlcon)
        sqladpu.Fill(dstu)
        sqlcon.Close()
        sqlcon.Dispose()

        If (dstm.Tables(0).Rows(0).Item("totalqid") = dstu.Tables(0).Rows(0).Item("totalqidans")) Then
            Return "Y"
        Else
            Return "N"
        End If

    End Function

    Function displayedAnsTextSelected(ByVal m_templateid As Integer, ByVal m_qid As Integer)
        Dim dst As New DataSet
        Dim sqlq As String = " Select displayansid displayedansid,a.qid, '(' + displayansid + '). ' + b.atext anstext, a.aid actualansid, b.flag "
        sqlq &= " from IEMS_QuizeUserAns a, IEMS_QuizeAns b "
        sqlq &= " where a.QuizeID = b.QuizeID "
        sqlq &= " and a.qid = b.qid "
        sqlq &= " and a.aid = b.aid "
        sqlq &= " and a.selectedbyuser = 'Y' "
        sqlq &= " and a.QuizeID = " & m_templateid
        sqlq &= " and a.qid = " & m_qid
        sqlq &= " order by a.qid,displayansid "

        sqlcon = New SqlConnection(ConfigurationManager.ConnectionStrings("IEMSCon").ToString)
        sqlcon.Open()
        dst = New DataSet
        sqladp = New SqlDataAdapter(sqlq, sqlcon)
        sqladp.Fill(dst)
        sqlcon.Close()

        Dim m_displayansidText As String = " "

        If dst.Tables(0).Rows.Count > 0 Then

            For k As Integer = 0 To dst.Tables(0).Rows.Count - 1
                If k = 0 Then
                    m_displayansidText = dst.Tables(0).Rows(k).Item(2).ToString
                Else
                    m_displayansidText &= "," & dst.Tables(0).Rows(k).Item(2).ToString
                End If
            Next
        End If
        Try
            Return m_displayansidText

        Catch ex As Exception
            Return ""

        End Try
    End Function


    Function ActualAnsText(ByVal m_templateid As Integer, ByVal m_qid As Integer)
        Dim dst As New DataSet
        Dim sqlq As String = " Select qid, aid,flag from IEMS_QuizeAns "
        sqlq &= " where flag = 'Y' and QuizeID = " & m_templateid & " and qid = " & m_qid & " order by aid "
        sqlcon = New SqlConnection(ConfigurationManager.ConnectionStrings("IEMSCon").ToString)
        sqlcon.Open()
        dst = New DataSet
        sqladp = New SqlDataAdapter(sqlq, sqlcon)
        sqladp.Fill(dst)
        sqlcon.Close()

        Dim m_actualans As String = " "

        If dst.Tables(0).Rows.Count > 0 Then

            For k As Integer = 0 To dst.Tables(0).Rows.Count - 1
                If k = 0 Then
                    m_actualans = dst.Tables(0).Rows(k).Item(1).ToString
                Else
                    m_actualans &= "," & dst.Tables(0).Rows(k).Item(1).ToString

                End If

            Next
        End If
        Try
            Return m_actualans

        Catch ex As Exception
            Return ""

        End Try

    End Function

    Function CorrectAnsText(ByVal m_templateid As Integer, ByVal m_qid As Integer)
        Dim dst As New DataSet
        Dim sqlq As String = " select a.displayansid, '(' + a.displayansid + ').' + b.atext anstext, a.aid "
        sqlq &= " From IEMS_QuizeUserAns a, IEMS_QuizeAns b "
        sqlq &= " where a.qid = b.qid "
        sqlq &= " and a.aid = b.aid "
        sqlq &= " and a.QuizeID = b.QuizeID "
        sqlq &= " and a.qid = b.qid "
        sqlq &= " and  a.QuizeID = " & m_templateid
        sqlq &= " and  a.qid = " & m_qid
        sqlq &= " and  b.flag = 'Y' "
        sqlq &= " order by a.displayansid "

        sqlcon = New SqlConnection(ConfigurationManager.ConnectionStrings("IEMSCon").ToString)
        sqlcon.Open()

        dst = New DataSet
        sqladp = New SqlDataAdapter(sqlq, sqlcon)
        sqladp.Fill(dst)
        sqlcon.Close()

        Dim m_correctanstext As String = " "

        If dst.Tables(0).Rows.Count > 0 Then

            For k As Integer = 0 To dst.Tables(0).Rows.Count - 1

                If k = 0 Then
                    m_correctanstext = dst.Tables(0).Rows(k).Item(1).ToString
                Else
                    m_correctanstext &= "," & dst.Tables(0).Rows(k).Item(1).ToString

                End If
            Next
        End If

        Try
            Return m_correctanstext

        Catch ex As Exception
            Return ""

        End Try
    End Function
End Class
