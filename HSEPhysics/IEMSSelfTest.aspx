<%@ Page Language="VB" AutoEventWireup="false" CodeFile="IEMSSelfTest.aspx.vb" Inherits="IEMSSelfTest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Self Test</title>
 <script type="text/javascript">
 window.onload = function()
 {
 doTimer();
 }
 
 var c=0;
 var t;
 var timer_is_on=0;
 
function timedCount()
 {
 document.getElementById('txt').value=c;
 c=c+1;
 t=setTimeout("timedCount()",1000);
 }
 
function doTimer()
 {
 if (!timer_is_on)
   {
   timer_is_on=1;
   timedCount();
   }
 }
 
function stopCount()
 {
 clearTimeout(t);
 timer_is_on=0;
 }
 </script>
 </head>
<body>
    <form id="form1" runat="server">
    <div>
    <input type="text" id="txt"  runat="server" />
    <input type="button"   value="Start count !" onclick="doTimer()" />
    <input type="button"   value="Stop count !" onclick="stopCount()" />
    <asp:TextBox ID="TextBox1"   runat="server"> </asp:TextBox>
    <br />
    <br />
    
    <asp:Label ID="lbltemplatedesc" runat="server" Text="Label" Font-Bold="True" Font-Italic="True" Font-Size="XX-Large" Font-Underline="True" ForeColor="#0000C0"></asp:Label>    
    </div>
    
    
    <div>
        <asp:Repeater ID="Repeater1"  runat="server" >
        <ItemTemplate>
        <table>
        <tr>
        <td>
        <asp:Label ID="Label2" runat="server" Font-Size="XX-Large" Text='<%#EVAL("serialno") %>'></asp:Label>
        <asp:Label ID="LabelQr" runat="server" visible ="false" Text='<%#EVAL("qid") %>'></asp:Label>
       <asp:Label ID="Label1" visible ="false" runat="server" Text='<%#EVAL("templateid") %>'></asp:Label> 
        <asp:Label ID="QuestionText" runat="server" Font-Size="Larger"  Text='<%#EVAL("qtext") %>'></asp:Label>
        <asp:Label ID="Lbl1" runat="server" visible ="false" Text='<%#EVAL("qid") %>'></asp:Label>
        
        <asp:CheckBoxList ID="CBL1" runat="server" Font-Size="Larger">
       
       
       
       
          </asp:CheckBoxList>
        
        <asp:Label ID="lblsrn" runat="server"  visible ="false" Text='<%#EVAL("srlno") %>'></asp:Label>
        
        </td>
        
        <td>
 <asp:Image ID= "Image1" runat="server" style="float:right;height:200px;width:200px" ImageUrl='<%#EVAL("imgurl") %>' />
 
   </td>
        </tr>
        
        </table>
        
        </ItemTemplate>
         </asp:Repeater>
    
    </div>
    <div>
    <asp:Button ID="BtnSave" runat="server" Text="Submit" />
    
    <asp:GridView ID="GridViewResult" runat="server" RowStyle-Height="50" Font-Size="12" AutoGenerateColumns="False" ForeColor ="Blue" Style="left: 12px; top: 123px" Width="940px" PageSize="75" EmptyDataText="No Item Found" DataKeyNames="qid,qurl">
    <Columns>
    <asp:BoundField Datafield="QuizeID" visible="false" HeaderText="TemplateID" ReadOnly="true" />
    <asp:BoundField Datafield="DisplayQID" HeaderText="Question No." ReadOnly="true" /> 
    <asp:BoundField Datafield="qid"  visible="false"  HeaderText="Question ID" ReadOnly="true" />
     <asp:BoundField Datafield="qtext" HeaderText="Question" ReadOnly="true" />
    <asp:BoundField Datafield="ActualAnsF"  visible="false"  HeaderText="Correct Option" ReadOnly="true" />
     <asp:BoundField Datafield="UserAnsF"  visible="false"  HeaderText="Selected Answer" ReadOnly="true" />
     <asp:BoundField Datafield="DisplayAidText"  visible="false"  HeaderText="Selected Ans Text" ReadOnly="true" />
     <asp:BoundField Datafield="CorrectAidText" HeaderText="Correct Answer" ReadOnly="true" />
    <asp:BoundField DataField="ResultF" HeaderText="Result" ReadOnly="True" />
    </Columns>
    </asp:GridView>
    
    <asp:Label ID="Result" runat="server" Text=""></asp:Label> 
    
    
    </div>
    </form>
</body>
</html>
