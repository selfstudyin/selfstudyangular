<%@ Page Language="VB" AutoEventWireup="false" CodeFile="IEMSQuestionBank.aspx.vb" Inherits="IEMSQuestionBank" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
   
    <style type="text/css">

.GVFixedHeader { font-weight:bold; background-color: maroon; top:expression(this.parentNode.parentNode.scrollTop=2);)
.GVFidexFooter{ font-weight:bold; background-color: maroon; position:relative; bottom:expression
(getScrollBottom.parentNode.parentNode.parentNode));}
</style>
 <title>MIS</title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="Div7" style="height: 600px; border: solid 1px black;">
<table style="font-family: Arial; font-size: 8pt; width: 100%; margin-top:3%">
<tr style="font-size:40pt">
<td> 

<center>  IIT Questions</center>
</td>

</tr>
    <tr style="font-size: 40pt">
        <td align="center">
            <asp:DropDownList ID="DDListSubject" runat="server"   AutoPostBack="True" 
 Width="189px">
            </asp:DropDownList></td>
    </tr>
<tr>
<td align="center" style="width: 90%; border: solid 1px black;">
<%--<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="true"></asp:GridView>--%><asp:Panel ID="Panel1" runat="server" Height="600px" width="900px" ScrollBars="Auto"><asp:GridView ID="GridView1" runat="server" BackColor="white"  AutoGeneratecolumns="False"  RowStyle-Height="25" Forecolor="blue" Font-Size="12" Style="left: 12px; top: 123px" Width="600px"   EmptyDataText="No Items Found" DataKeyNames="keydata,Templateid">



<Columns>

<asp:TemplateField HeaderText="Subject">
<ItemTemplate>
<asp:Label ID="lbldesc" runat="server" Text='<%#Eval("Templateid")%>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>
    
<asp:BoundField DataField="Module" HeaderText="Chapter" ReadOnly="true" />

<asp:TemplateField  Visible="false" HeaderText="Chapter">

<HeaderTemplate>
<asp:HyperLink ID="h2" runat="server" ToolTip="Click To Open Document" NavigateUrl="~/test/Jun2011.pdf" Target="_blank">Header</asp:HyperLink>
</HeaderTemplate>
<ItemTemplate>
<%--<asp:HyperLink ID="h2" runat="server" ToolTip="Click To Open Document" Target="_blank"><%#Eval("2011group1") %>' Target="_blank"><%#Eval("Module") %></asp:HyperLink>--%>
<asp:HyperLink ID="HyperLink1" runat="server" ToolTip="Click To Open" NavigateUrl='<%#RetURL(Eval("keydata"),"2012",1) %>' Target="_blank"><%#Eval("Module") %> </asp:HyperLink>
</ItemTemplate>

</asp:TemplateField>

<asp:TemplateField HeaderText="2013">


<ItemTemplate>
<asp:HyperLink ID="h2" runat="server" ToolTip="Click To Open" NavigateUrl='<%#RetURL(Eval("keydata"),"2013",1) %>' Target="_blank">
<%#Eval("IIT2013")%> </asp:HyperLink>
</ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="2012">
<ItemTemplate>
<asp:HyperLink ID="h2" runat="server" ToolTip="Click To Open" NavigateUrl='<%#RetURL(Eval("keydata"),"2012",1) %>' Target="_blank">
<%#Eval("IIT2012")%> </asp:HyperLink>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="2011">
<ItemTemplate>
<asp:HyperLink ID="h2" runat="server" ToolTip="Click To Open" NavigateUrl='<%#RetURL(Eval("keydata"),"2011",1) %>' Target="_blank">
<%#Eval("IIT2011")%> </asp:HyperLink>
</ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="2010">
<ItemTemplate>

<asp:HyperLink ID="h2" runat="server" ToolTip="Click To Open" NavigateUrl='<%#RetURL(Eval("keydata"),"2010",1) %>' Target="_blank">
<%#Eval("IIT2010")%> </asp:HyperLink>
</ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="2009">
<ItemTemplate>
<asp:HyperLink ID="h2" runat="server" ToolTip="Click To Open" NavigateUrl='<%#RetURL(Eval("keydata"),"2009",1) %>' Target="_blank">
<%#Eval("IIT2009")%> </asp:HyperLink>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="2008">
<ItemTemplate>
<asp:HyperLink ID="h2" runat="server" ToolTip="Click To Open" NavigateUrl='<%#RetURL(Eval("keydata"),"2008",1) %>' Target="_blank">
<%#Eval("IIT2008")%> </asp:HyperLink>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="2007">
<ItemTemplate>
<asp:HyperLink ID="h2" runat="server" ToolTip="Click To Open" NavigateUrl='<%#RetURL(Eval("keydata"),"2007",1) %>' Target="_blank">
<%#Eval("IIT2007")%> </asp:HyperLink>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="2006">
<ItemTemplate>
<asp:HyperLink ID="h2" runat="server" ToolTip="Click To Open" NavigateUrl='<%#RetURL(Eval("keydata"),"2006",1) %>' Target="_blank">
<%#Eval("IIT2006")%> </asp:HyperLink>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="2005">
<ItemTemplate>
<asp:HyperLink ID="h2" runat="server" ToolTip="Click To Open" NavigateUrl='<%#RetURL(Eval("keydata"),"2005",1) %>' Target="_blank">
<%#Eval("IIT2005")%> </asp:HyperLink>
</ItemTemplate>
</asp:TemplateField>

    
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
