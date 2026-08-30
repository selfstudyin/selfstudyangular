<%@ Page Language="VB" AutoEventWireup="false" CodeFile="IEMSHybridization.aspx.vb" Inherits="IEMSHybridization" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>IEMS - Selfstudy.in Organic Chemistry - Hybridization </title>
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

window.onload = function()
{
//alert("on load");
var activeLink = document.getElementById('hiddentab').value;
if (activeLink)
{
document.getElementById(activeLink).className ='toolon';
}
var divsn = document.getElementById("div" + activeLink);
//alert(divsn.value);

if(divsn)
{
divsn.style.display="block";
}
}

function jvtab(activlink,activtab,passvtab,passv2,divnew,Menu5,Menu6)
{
// alert(":activelink-  "+ activlink + ":activtab-  "+ activtab + ":passvtab- "+ passvtab + ":passv2- "+ passv2 + ":divnew- "+ divnew + ":Menu5 -" + Menu5 + ": Menu6- "+ Menu6)
var existing=document.getElementById('hiddentab').value;
// alert(existing);
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
 onclick ="javascript:jvtab(this.id,'divuser','divmenu','divthird','divnew','Menu5','Menu6')">Sigma and Pi Bond</a>

<a id="menu" href="javascript:void(0);" class="tooloff" 
 onclick="javascript:jvtab(this.id,'divmenu','divthird','divuser','divnew','Menu5','Menu6')">Hybridization</a>

<a id="third" href="javascript:void(0);" class="tooloff" 
 onclick="javascript:jvtab(this.id,'divthird','divuser','divmenu','divnew','Menu5','Menu6')">sp3 </a>

<a id="forthmenu" href="javascript:void(0);" class="tooloff" 
 onclick="javascript:jvtab(this.id,'divnew','divthird','divuser','divmenu','Menu5','Menu6')">sp2 </a>

<a id="fifthMenuID" href="javascript:void(0);" class="tooloff" 
 onclick="javascript:jvtab(this.id,'Menu5','divnew','divthird','divuser','divmenu','Menu6')">sp</a>


<a id="sixthMenuID" href="javascript:void(0);" class="tooloff" 
 onclick="javascript:jvtab(this.id,'Menu6','Menu5','divnew','divthird','divuser','divmenu')">IIT Questions</a>

</div>
<div id="divuser" style="display :none">
<table border="1">
<tr>
<th style="width: 793px; text-align: left;"> 

 
                Sigma and Pi Bond
                 Types of covalent bond
                        Lets see how molecular orbital can form bonding. What you need to know is s subshell is spherical in shape and p is dumble in shape. p has three orientations p<sub>x</sub>,p<sub>y</sub> and p<sub>z</sub>. There are two main types of covelent bonds. <br />
                            <br />
                        1. Sigma bond<br />
                        2. Pi bond<br />
                        
                       
1.Sigma Bond : A sigma bond is formed by the linear or end-to-end overlap of orbitals.


          
            
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/sigmabond1.jpg" />
          
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/images/sigmabond2.jpg" />
          
                    <asp:Image ID="Image3" runat="server" ImageUrl="~/images/sigmabond3.jpg" />
        
                    <asp:Image ID="Image6" runat="server" ImageUrl="~/images/sigmabond4.jpg" />
                    <asp:Image ID="Image7" runat="server" ImageUrl="~/images/sigmabond5.jpg" />
                 
                    
                  (2)   Pi- Bond : A pi bond is formed by parallel or side-by-side overlap of  p orbitals.

                    
                   
                    <asp:Image ID="Image4" runat="server" ImageUrl="~/images/pibond1.jpg" />
           
                    <asp:Image ID="Image5" runat="server" ImageUrl="~/images/pibond2.jpg" />
         
            <asp:Image ID="Image8" runat="server" ImageUrl="~/images/sigmapiethylene.jpg" />
   
            <asp:Image ID="Image9" runat="server" ImageUrl="~/images/sigmapibondAcetylene.jpg" />
    <br />
    
       Difference between Sigma Bond and Pi Bond : <br />
             
       (1) Sigma bond being direct overlap , electrons are strongly held than side wise overlap of Pi-electrons. Hence Pi electrons are more easily broken and reactive than sigma electrons. Sigma bond is stronger than Pi bond.
<br />
               
(2) Rotation of atoms is not possible around a Pi bond. If any attempt is made to rotate, the lobes of p orbitals will no longer be co-planer and will not overlap to form pi bond. This restriction in rotation around a pi bond is responsible for Cis and Trans isomerism in alkanes.

  <br />
               
  </th>
  
</tr>
   
</table>
</div>
<div id="divmenu" style="display :none">
<table border = "1">
<tr>
<th style="text-align: left"> 
Hybridization: Carbon has Six Electrons. Its electronic configuration is 1S<sup>2</sup>2S<sup>2</sup>2P<sup>2</sup>. In more detail
we can write 1S<sup>2</sup>2S<sup>2</sup>2px<sup>1</sup>2py<sup>1</sup>2pz<sup>0</sup>. When energy supplied to carbon atom in the 
form of heat or light the 2S orbital electron gains energy and jumps to higher energy shell that is occupies vacant 2pz<sup>0</sup>.
This is called Excited state of Carbon atom. So we can write 1S<sup>2</sup>2S<sup>1</sup>2px<sup>1</sup>2py<sup>1</sup>2pz<sup>1</sup>.
Now we have singly occupied 4 subshell 2s and 3p (px,py,pz).<br />
The excited state orbitals mixed (hybridized) to give four new equivalent orbitals. These new orbitals are known as sp<sup>3</sup> orbitals as they are formed
by mixing one pure s orbital and three p orbitals.
<br />
This process of mixing of pure orbitals to give a set of new equivalent orbitals is termed as Hybridization.
<br />
C(Hybridized State) = 1s<sup>2</sup>2(sp<sup>3</sup>)<sup>1</sup>2(sp<sup>3</sup>)<sup>1</sup>2(sp<sup>3</sup>)<sup>1</sup>2(sp<sup>3</sup>)<sup>1</sup>
     <br />
     Depending upon the number of hydrogen atoms available for bonding either 2s electron mixes with 2p electron to form 4 equivalent energy orbital,3 equivalent energy orbital or 2 equivalent energy orbital.
     we call them sp<sup>3</sup>,sp<sup>2</sup> and sp hybridization respectively.
     </th>
</tr>
</table>
</div>

<div id="divthird" style="display :none">
<table border = "1">
<tr>

Whenever carbon is bonded to four other atoms or groups ( as in methane ) , it uses sp<sup>3</sup> hybride orbitals.

</tr>
<tr>
<th> <asp:Image ID="Image11" runat="server" ImageUrl="~/images/sp3hybridization.gif" />
   </th>
</tr>
</table>
    <asp:Image ID="Image16" runat="server" ImageUrl="~/images/sp3Methane.gif" /><br />
    <asp:Image ID="Image10" runat="server" ImageUrl="~/images/sp3Ethane.jpg" /><br />
</div>
<div id="divnew" style="display :none">
<table border = "1">
<tr>
Whenever carbon is bonded to three other atoms or groups ( as in ethylene ) , it uses sp<sup>2</sup> hybride orbitals.

</tr>
<tr>
<th> <asp:Image ID="Image12" runat="server" ImageUrl="~/images/sp2hybridization.gif" />
  
    <asp:Image ID="Image13" runat="server" ImageUrl="~/images/sp2ethylene.gif" /> </th>
</tr>
</table>
</div>
<div id="Menu5" style="display :none">
<table border = "1">
<tr>

Whenever carbon is bonded to two other atoms or groups ( as in acetylene ) , it uses sp hybride orbitals.

</tr>
<tr>
<th style="width: 1059px">
    <asp:Image ID="Image14" runat="server" ImageUrl="~/images/sphybridization.gif" />
    <asp:Image ID="Image15" runat="server" ImageUrl="~/images/spacetylene.gif" />
     </th>
</tr>
</table>
</div>
<div id="Menu6" style="display :none">
<table border = "1">
<tr>
<th> Please Ref. IIT Question Set , we will soon publish how to attempt IIT Question related to hybridization. </th>
</tr>
</table>
<br />
<hr />
</div>
</form>
</body>
</html>


