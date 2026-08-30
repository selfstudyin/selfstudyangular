<%@ Page Language="VB" AutoEventWireup="false" CodeFile="IEMSSolution.aspx.vb" Inherits="IEMSSolution" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1"  runat="server">
<title> IEMS Solutions</title>
</head>
<body>
<form id="forml" runat="server">
 <div id="Div7" style="height: 350px; border: solid lpx black;">
<table style="font-family: Arial; font-size: 12pt; width: 100%; margin-top: 3%">
<tr style="font-size:40pt">
<td> 

<center>  IIT Solutions</center>
</td>

</tr>
<tr>
<td align="center" style="width: 40%; border: solid lpx red;">
<asp:Panel ID="Panell" runat="server" Height="300px" Width="550px" ScrollBars="Auto">

<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="FALSE" ForeColor="blue" Style="left: l2px; font-size=12; top: l23px" Width="540px" PageSize="75" EmptyDataText="No Items"  DataKeyNames="filename">

<Columns>


<asp:BoundField DataField="subjectid"  HeaderText="Subject" />

<asp:TemplateField HeaderText="Chapter">

<ItemTemplate>

<asp:Label ID="lbldesc" runat="server" Text='<%#Eval("topicsid")%>'></asp:Label>

</ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="subtopics"  HeaderText="Subtopics" />
<asp:BoundField DataField="qyear"  HeaderText="Year" />


<asp:Templatefield HeaderText ="Click To Open" ItemStyle-HorizontalAlign="center">
<ItemTemplate>
<asp:HyperLink ID="h2" runat="server" ToolTip="Click To Open Document" NavigateUrl='<%#Eval("filename")%>' Target="_blank">Click Here

</asp:HyperLink>


</ItemTemplate>


</asp:Templatefield>
</Columns>
</asp:GridView>


</asp:Panel>

</td>
</tr>
</table>
</div>


</form>
</body>
</html>