<%@ Page Language="VB" AutoEventWireup="false" CodeFile="IEMSTest.aspx.vb" Inherits="IEMSTest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Test...</title>
</head>
<body><CENTER><IMG style="WIDTH: 800px; HEIGHT: 150px" src="images/IEMSHDRSite.jpg"></CENTER>
  <form id="form1" runat="server"> 
  <div id="Div7" style="height: 120px; border: solid 1px black;">
<table style="font-family: Arial; font-size: 8pt; width: 100%; margin-top:3%">
<tr style="font-size:30pt">
<td> 

<center>  Welcome to Self Test Series</center>
</td>

</tr>

    <tr style="font-size: 30pt">
        <td align="center">
 <asp:DropDownList ID="DDListStandard" runat="server"   AutoPostBack="True" Width="189px" ToolTip="Select Standard">
            </asp:DropDownList></td>
    </tr>
    </table>
    </div>
   <br />
   <br />
      
    <div>
    <center>
   <asp:Panel ID="Panel1" runat="server" Height="600px" width="900px" ScrollBars="Auto"> 
     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  ForeColor="red" Style="left: 12px;
             top: 323px; size: 40px; color: white; border-top-style: groove; font-style: italic; border-right-style: groove; border-left-style: groove; background-color: maroon; border-bottom-style: groove;" Width="450px" PageSize="75" EmptyDataText="No Items Found" DataKeyNames="quizeid">
       <Columns>
       <asp:BoundField DataField="quizeid"  HeaderText="Quize ID" />
       <asp:BoundField DataField="quizedesc"   HeaderText="Quize Topics" />
        <asp:BoundField DataField="standard"   HeaderText="Standard" />
      <asp:TemplateField HeaderText="Click To Start Test" ItemStyle-HorizontalAlign="center">
      <ItemTemplate>
      
       <asp:Button ID="btnclick" runat="server" Text="Click" CommandName= '<%#Eval("quizeid")%>' CommandArgument='<%#ctype(container,gridviewrow).rowindex %>' />
       </ItemTemplate>
          </asp:TemplateField>
    <%--<asp:TemplateField HeaderText="Click To Start Test" ItemStyle-HorizontalAlign="center">
    
<ItemTemplate>
<asp:HyperLink ID="h1" runat="server" Text="Click"  ToolTip="Click To Open Document" NavigateUrl='<%#StartTest(Eval("quizeid")) %>' Target="_blank" >

</asp:HyperLink>
</ItemTemplate>

</asp:TemplateField> --%>       
                                  
       </Columns>
       
       </asp:GridView>
       </asp:Panel>
       </center> 
       
        </div>
        
    </form>
</body>
</html>
