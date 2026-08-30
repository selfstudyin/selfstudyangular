<%@ Page Language="VB" AutoEventWireup="false" CodeFile="IEMSIUPACName.aspx.vb" Inherits="IEMSIUPACName" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>IEMS Selfstudy.in - Organic Chemistry - IUPAC Name </title>

<style type="text/css">
.tooloff
{
text-decoration:none;
color:maroon;
background-color:white;
padding:0px 10px 0px 10px;
visibility: visible;
border:solid 1px maroon;
font-weight:bold;
}
a.tool:hover
{
text-decoration:none;
color:white;
width:50px;
background-color:Maroon;
}
a.toolon
{
text-decoration:none;
color:white;
padding:0 10px 0 10px;
background-color:blue;
font-weight:bold;
border:solid 2px maroon;
}
</style>
<script type="text/javascript" language="javascript">


var lastsel = 0;
	function SelectImage(id) 
	{
	if (lastsel > 0) 
	{
		document.getElementById(lastsel).className = "normal";
	}
	document.getElementById(id).className = "sel";
	var srcnam = document.getElementById(id).src;
	document.getElementById(0).src = srcnam;
	lastsel = id;
	}
	function LoadTrigger()
	{
		SelectImage(1);
	}
	//window.onload = LoadTrigger;

window.onload = function()
{
LoadTrigger();
//alert("on load");
var activeLink = document.getElementById('hiddentab').value;
if (activeLink)
{
document.getElementById(activeLink).className ='toolon';
}
var divsn = document.getElementById("div" + activeLink);
if(divsn)
{
divsn.style.display="block";
}
}

function jvtab(activlink,activtab,passvtab,passv2,divnew,Menu5,Menu6)
{
//alert("1")
var existing=document.getElementById('hiddentab').value;

if (existing)
{
document.getElementById(existing).className='tooloff';
}
document.getElementById('hiddentab').value=activlink;
document.getElementById(activtab).style.display="block"
document.getElementById(passvtab).style.display="none";
document.getElementById(passv2).style.display="none";
document.getElementById(divnew).style.display="none";
document.getElementById(Menu5).style.display="none";
document.getElementById(Menu6).style.display="none";
}
</script>
</head>
<body><center><img style="WIDTH: 800px; HEIGHT: 150px" src="images/IEMSHDRSite.jpg" alt ="Image not found" />
</center>
<form id="form1" runat="server">
<div>
<input id="hiddentab" runat="server" type="hidden" value="user" />
<div style="padding-top:5px">
<a id="user" href="javascript:void(0);" class="tooloff" 
 onclick ="javascript:jvtab(this.id,'divuser','divmenu','divthird','divnew','Menu5','Menu6')">IUPAC</a>

<a id="menu" href="javascript:void(0);" class="tooloff" 
 onclick="javascript:jvtab(this.id,'divmenu','divthird','divuser','divnew','Menu5','Menu6')">Alkane</a>

<a id="third" href="javascript:void(0);" class="tooloff" 
 onclick="javascript:jvtab(this.id,'divthird','divuser','divmenu','divnew','Menu5','Menu6')">Alkenes</a>
 

<a id="forthmenu" href="javascript:void(0);" class="tooloff" 
 onclick="javascript:jvtab(this.id,'divnew','divthird','divuser','divmenu','Menu5','Menu6')">Alkynes</a>

<a id="fifthMenuID" href="javascript:void(0);" class="tooloff" 
 onclick="javascript:jvtab(this.id,'Menu5','divnew','divthird','divuser','divmenu','Menu6')">Alkyl Halides</a>

<%--
<a id="sixthMenuID" href="javascript:void(0);" class="tooloff" 
 onclick="javascript:jvtab(this.id,'Menu6','Menu5','divnew','divthird','divuser','divmenu')">IIT</a>--%>

</div>
<div id="divuser" style="display :none">
<table border="1">
<tr>
<th> <asp:Image ID="Image1" runat="server" ImageUrl="~/images/IUPACf.jpg" />
   </th>
</tr>
</table>
</div>
<div id="divmenu" style="display :none">
<table border = "1">
<tr>
<th> 

<table border=0 align=center>
    <tr>
    <td style="width: 106px; height: 65px; border-right: red thin solid; border-top: red thin solid; border-left: red thin solid; border-bottom: red thin solid;" valign="top">
            &nbsp; &nbsp; &nbsp; &nbsp;
   <img id=8 class="normal" src="IUPACf.jpg" onclick="SelectImage(8)" style="width: 83px; height: 70px"><br/>
            IUPAC</td>
        <td style="width: 106px; height: 65px; border-right: red thin solid; border-top: red thin solid; border-left: red thin solid; border-bottom: red thin solid;" valign="top">
            &nbsp; &nbsp; &nbsp; &nbsp;
            <img id=9 class="normal" src="IUPACAlkaneRulesflash.jpg" onclick="SelectImage(9)" style="width: 83px; height: 70px"><br />
            IUPAC Rules</td>
        <td style="width: 106px; height: 65px; border-right: red thin solid; border-top: red thin solid; border-left: red thin solid; border-bottom: red thin solid;">
            <img id=2 class="normal" src="IUPACLongestChain.gif" onclick="SelectImage(2)" style="width: 83px; height: 70px">&nbsp;<br />
            <br />
            Rule-1</td>
        <td style="width: 106px; height: 65px; border-right: red thin solid; border-top: red thin solid; border-left: red thin solid; border-bottom: red thin solid;" valign="top">
            &nbsp;<img id=1 class="normal" src="IUPACAlkaneLocateGroup.gif" onclick="SelectImage(1)" style="width: 83px; height: 70px"><br />
            <br />
             Rule-2</td>
        <td style="width: 106px; height: 65px; border-right: red thin solid; border-top: red thin solid; border-left: red thin solid; border-bottom: red thin solid;" valign="top">
            <img id=3 class="normal" src="IUPACCarbonNumbering.gif" onclick="SelectImage(3)" style="width: 83px; height: 70px"><br />
            <br />
             Rule-3&nbsp;
        </td>
        <td style="width: 106px; height: 65px; border-right: red thin solid; border-top: red thin solid; border-left: red thin solid; border-bottom: red thin solid;" valign="top">
            <img id=7 class="normal" src="IUPACAlkaneIdentifySubstituent.gif" onclick="SelectImage(7)" style="width: 83px; height: 70px"><br />
            <br />
           Rule-4</td>
        <td style="width: 106px; height: 65px; border-right: red thin solid; border-top: red thin solid; border-left: red thin solid; border-bottom: red thin solid;" valign="top">
            <img id=6 class="normal" src="IUPACNameAlkane.gif" onclick="SelectImage(6)" style="width: 83px; height: 70px"><br />
            <br />
             Rule-5</td>
        <td style="width: 106px; height: 65px; border-right: red thin solid; border-top: red thin solid; border-left: red thin solid; border-bottom: red thin solid;" valign="top">
            <img id=4 class="normal" src="IUPACAlkanePrefixPosition.gif" onclick="SelectImage(4)" style="width: 83px; height: 70px"><br />
            <br />
             Rule-6</td>
        <td style="width: 106px; height: 65px; border-right: red thin solid; border-top: red thin solid; border-left: red thin solid; border-bottom: red thin solid;" valign="top">
            <img id=5 class="normal" src="IUPACAlkaneAlphabeticalOrder.gif" onclick="SelectImage(5)" style="width: 83px; height: 70px"><br />
            <br />
             Rule-7</td>
    </tr>
<tr>
    <td colspan="8" valign="top">
        &nbsp;<br>
	<img id=0 src="" style="width: 904px; border-left-color: red; border-bottom-color: red; border-top-style: solid; border-top-color: red; border-right-style: solid; border-left-style: solid; height: 565px; border-right-color: red; border-bottom-style: solid;">
    </td>
</tr>

</table>


  
    
    </th>
</tr>
</table>
</div>

<div id="divthird" style="display :none">
<table border = "1">
<tr>
<th> 

<asp:Image ID="Image2" runat="server" ImageUrl="~/images/IUPACAlkenesRulesf.jpg" /><br />



<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="928" height="573" id="myMovieName">
<param name="movie" value="images/IUPACAlkene_controller.swf?csConfigFile=IUPACAlkene_config.xml">
<param name="quality" value="high">
<param name="bgcolor" value="#FFFFFF">
<param name="FlashVars" value="csConfigFile=IUPACAlkene_config.xml">
<embed src="images/IUPACAlkene_controller.swf?csConfigFile=IUPACAlkene_config.xml" FlashVars="csConfigFile=IUPACAlkene_config.xml" quality=high bgcolor=#FFFFFF width=928 height=573 type="application/x-shockwave-flash" pluginspace="http://www.macromedia.com/go/getflashplayer">
</embed>
</object>




    
</th>
</tr>
</table>
</div>
<div id="divnew" style="display :none">
<table border = "1">
<tr>
<th> <asp:Image ID="Image3" runat="server" ImageUrl="~/images/IUPACAlkynesRulesf.jpg" /><br />  </th>
</tr>
</table>
</div>
<div id="Menu5" style="display :none">
<table border = "1">
<tr>
<th><asp:Image ID="Image4" runat="server" ImageUrl="~/images/IUPACAlkylhalidesRulesf.jpg" /><br />  </th>
</tr>
</table>
</div>
<div id="Menu6" style="display :none">
<table border = "1">
<tr>
<th> Will be pusblished soon. Refer IIT Question Set. </th>
</tr>
</table>
<br />
<hr />
</div>
</form>
</body>
</html>

