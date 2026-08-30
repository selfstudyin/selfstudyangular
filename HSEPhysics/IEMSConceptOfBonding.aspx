<%@ Page Language="VB" AutoEventWireup="false" CodeFile="IEMSConceptOfBonding.aspx.vb" Inherits="IEMSConceptOfBonding" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>IEMS - Selfstudy.in Topics : Concept Of Bonding </title>
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
 onclick ="javascript:jvtab(this.id,'divuser','divmenu','divthird','divnew','Menu5','Menu6')">s Orbital</a>

<a id="menu" href="javascript:void(0);" class="tooloff" 
 onclick="javascript:jvtab(this.id,'divmenu','divthird','divuser','divnew','Menu5','Menu6')">p Orbital</a>

<a id="third" href="javascript:void(0);" class="tooloff" 
 onclick="javascript:jvtab(this.id,'divthird','divuser','divmenu','divnew','Menu5','Menu6')">d Orbital</a>

<a id="forthmenu" href="javascript:void(0);" class="tooloff" 
 onclick="javascript:jvtab(this.id,'divnew','divthird','divuser','divmenu','Menu5','Menu6')">f Orbital</a>

<a id="fifthMenuID" href="javascript:void(0);" class="tooloff" 
 onclick="javascript:jvtab(this.id,'Menu5','divnew','divthird','divuser','divmenu','Menu6')">g orbital</a>


<a id="sixthMenuID" href="javascript:void(0);" class="tooloff" 
 onclick="javascript:jvtab(this.id,'Menu6','Menu5','divnew','divthird','divuser','divmenu')">Quantum Number</a>

</div>
<div id="divuser" style="display :none">
<table border="1">
<tr>
<th> 

 <div>
        <table style="width: 788px; height: 38px">
            <tr>
                <td style="width: 521px; height: 26px; text-align: center;">
                    <span style="font-size: 48pt; color: blue"><span style="font-size: 14pt">
                Modern Concept Of Bonding</span> </span>
                </td>
            </tr>
            <tr>
                <td style="width: 521px; height: 16px">
                    <span style="font-size: 14pt">
                Orbital &nbsp; Structure Of Atom &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></td>
            </tr>
            <tr>
                <td style="width: 521px; height: 287px" >
                    <asp:Image ID="Image1" runat="server" Height="217px" ImageUrl="~/images/RunningFan.jpg"
                        Width="123px" />
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/images/ElectronCloud.png" Width="381px" /><p style="text-align: left"> 
                        <span style="font-size: 14pt; font-family: Calibri">Look at the rotating fan , can you see the blades of this Fan ? No you can’t see, similarly a moving electron appearance is like diffused cloud called electron cloud. </span>
</p>
<p style="text-align: left">
    <span style="font-size: 14pt; font-family: Calibri">
The shape and size of this region in space around the nucleus where the probability of finding the electron is maximum is called Orbital. </span>

            </p>                    
                        
                        </td>
                        
                       
                
               
            </tr>
            <tr>
                <td style="width: 521px; height: 287px">
                    &nbsp;
                    <asp:Image ID="Image3" runat="server" ImageUrl="~/images/SOrbital.gif" AlternateText="S Orbital 3 Dimenstion" BorderColor="Blue" BorderStyle="Outset" ImageAlign="Middle" ToolTip="S orbital" />
                    <p style="text-align: left">
                        <span style="font-size: 14pt; font-family: Calibri">
                    S orbital is spherical in shape. It can accomodate maximum 2 electrons. One of the electron rotates in clock wise direction and other electron rotates in anticlockwise direction. The spin (clockwise or anti clockwise) of electron is represented by spin quantum number. When electron rotates clock wise we say spin quantum number (s) is +1/2 when it rotates anti clockwise we say spin is - 1 /2. </span>
                    </p>
                    
                    </td>
            </tr>
            <tr>
                <td style="width: 521px; height: 287px">
                    <asp:Image ID="Image4" runat="server" Height="300px" ImageUrl="~/images/SOrbitalClockwiseSpin.png"
                        Width="224px" />
                    <asp:Image ID="Image5" runat="server" Height="301px" ImageUrl="~/images/SOrbitalAntiClockwiseSpin.png"
                        Width="222px" />
                    <asp:Image ID="Image6" runat="server" ImageUrl="~/images/SMaxmimHoldingCapacity.png"
                        Width="307px" /></td>
            </tr>
            <tr>
           
                 
            </tr>
        </table>
    
    </div>
   </th>
</tr>
</table>
</div>
<div id="divmenu" style="display :none">
<table border = "1">
<tr>
<th> 
<div>
        <table style="width: 788px; height: 38px">
        <tr>
        <td>
        <p style="text-align: left">
            <span style="font-size: 14pt; font-family: Calibri">
        p orbital is dumble in shape. In 2nd Orbit onwards this p orbital exists. It can accomodate maximum 6 electrons. p orbital can have 3 possible orientation in space.
        If we consider right handed system of 3 perpendicular axis X,Y and Z, orientation towards X-axis is denoted as p<sub>x</sub>, orientation along Y axis is denoted as p<sub>y</sub> and along Z axis we represent it by p<sub>z</sub>.
        Each of p<sub>x</sub>,p<sub>y</sub> and p<sub>z</sub> can contain two electrons,one with clock wise spin and other with anti clock wise spin. </span>
        
        </p>
        <p style="text-align: left">
            <span style="font-size: 14pt; font-family: Calibri">
        As per the requirement ( say available hydrogen atoms combining with Carbon atom ) electron from p orbitals combine with other energy level orbitals (say 2s orbital electron of carbon ) to make available a set of new equivalent orbitals called hybridization(discussed latter). </span>
         
        </p>
        
        </td>
        
        </tr>
            <tr>
                <td style="width: 521px; height: 26px; text-align: center;">
                    <span style="font-size: 48pt; color: blue"><span style="font-size: 14pt">
                </span> 
                        <asp:Image ID="Image7" runat="server" ImageUrl="~/images/porbital.png" />
                    </span>
                </td>
            </tr>
            </table>
            </div>
            





</th>
</tr>
    <tr>
        <th>
            <asp:Image ID="Image8" runat="server" ImageUrl="~/images/Porbital.gif" />
        </th>
    </tr>
    <tr>
        <th style="height: 34px">
         <asp:Image ID="Image9" runat="server" ImageUrl="~/images/Porbitalcapacity.png" />
            </th>
    </tr>
</table>
</div>

<div id="divthird" style="display :none">
<table border = "1">
<tr>
<th> 
<div>
        <table style="width: 1166px; height: 38px">
        <tr>
        <td style="width: 1195px; height: 40px">
        <p style="text-align: left">
            <span style="font-size: 14pt; font-family: Calibri">
        d orbital is double dumble in shape. In third Orbit onwards this d orbital exists. It can accomodate maximum 10 electrons. d orbital can have 5 possible orientations in space.
        If we consider right handed system of 3 perpendicular axis X,Y and Z, orientation are  denoted as follows.</span>
        
        </p>
       
        
        </td>
        
        </tr>

</table>
</div>
    <asp:Image ID="Image10" runat="server" ImageUrl="~/images/dorbitalorientation.png" /></th>
</tr>
    <tr>
        <th>
            <asp:Image ID="Image11" runat="server" ImageUrl="~/images/3Dorbital.gif" /></th>
    </tr>
</table>
</div>
<div id="divnew" style="display :none">
<table border = "1">
<tr>
<th> <div>
        <table style="width: 1166px; height: 38px">
        <tr>
        <td style="width: 1195px; height: 40px">
        <p style="text-align: left">
            <span style="font-size: 14pt; font-family: Calibri">
        Shape of f orbital is as shown. In fourth Orbit onwards this f orbital exists.The lanthanide series consists of 4f orbitals. It can accomodate maximum 14 electrons. f orbital can have 7 possible orientations in space.
        Orbital quantum number  which denotes  f orbital is 3 i.e. ℓ = 3. It has values from -3 to +3 including Zero. 
        So f orbital can have 7 different magnetic quantum number -3,-2,-1,0,+1,+2 and +3.
         
        If we consider right handed system of 3 perpendicular axis X,Y and Z, orientation are  denoted as follows. </span>
        
        </p>
       
        
        </td>
        
        </tr>
            <tr>
                <td style="width: 1195px;">
                    <asp:Image ID="Image12" runat="server" ImageUrl="~/images/4forbital.gif" /></td>
            </tr>

</table>
</div>
 </th>
</tr>
</table>
</div>
<div id="Menu5" style="display :none">
<table border = "1">
<tr>
<th> 

<div>
        <table style="width: 788px; height: 38px">
        <tr>
        <td>
        <p style="text-align: left">
        In fifth Orbit onwards this g orbital exists. Thinking about its shape ? 
        g can accomodate maximum 18 electrons , number of orientation/sublevels/direction is 9.<br />
        
        h can accomodate maximum 22 electrons and has 11 sublevels.<br />
        i can accomodate maximum 26 electrons and has 13 sublevels.<br />
           
        </p>
        <p style="text-align: left">
        The shapes of atomic orbitals can be understood qualitatively by considering the analogous case of standing waves 
on a circular drum.
        </p>
        
        </td>
        
        </tr>
        </table>
        </div>
        




</th>
</tr>
</table>
</div>
<div id="Menu6" style="display :none">
<table border = "1">
<tr>
<th> 

<div>
        <table style="width: 788px; height: 38px">
            <tr>
                <td>
                    <asp:Image ID="Image13" runat="server" ImageUrl="~/images/QuantumNumber.jpg" /></td>
            </tr>
        <tr>
        <td style="text-align: left">
        <p>
      
            

        </p>
      The principal quantum number n describes the energy of the electron and is always a positive integer.
       For First orbit : n=1, 2nd orbit n=2, 3rd Orbit n=3 and so on.
      
       The azimuthal quantum number ℓ describes the orbital angular momentum of each electron.It determines shape, is a non-negative integer.
      <br />
      for first orbit n=1, only 1 sub shell s exist for which azimuthal quantum number ℓ=0
      <br />
      for 2nd orbit n=2 , there are two subshells, s and p. so ℓ has two values 0 and 1. 0 for s and 1 for p sub shell.
      <br />
      for 3rd orbit n=3 , there are three subshells, s,p and d. so ℓ has three values, 0,1 and 2. 0 for s,1 for p and 2 for d.
      <br />
      for 4th orbit n=4, there are four subshells , s,p,d and f. so ℓ has four values, 0,1,2 and 3. 0 for s,1 for p,2 for d and 3 for f.
      <br />
      for 5th orbit n=5, there are five subshells , s,p,d,f and g. so ℓ has five values, 0,1,2,3 and 4. 0 for s,1 for p,2 for d and 3 for f and 4 for g. 
     
      Magnetic Quantum number m<sub>ℓ</sub> , describes the magnetic moment of an electron in an arbitrary direction, it represents orientation  and is always an integer.
       <br />
       for n=1,in s subshell,ℓ=0, and m<sub>ℓ</sub> =0
       <br />
       for n=2, in s subshell,ℓ=0, and m<sub>ℓ</sub> =0 for p subshell ℓ=1, m<sub>ℓ</sub> has 3 values.+1,0 and -1. 
       <br />
       for n=3, in s subshell,ℓ=0, and m<sub>ℓ</sub> =0 for p subshell ℓ=1, m<sub>ℓ</sub> has 3 values.-1,0,+1.For d subshell ℓ=2, m<sub>ℓ</sub> has 5 values.-2,-1,0,+2,+1.  
        
         
      Spin Quantum number m<sub>s</sub> , describes the whether electron is rotating clockwise or anticlock wise.It has two values +1/2 and --1/2.
       
      
       <br />
        </td>
        
        </tr>
            <tr>
                <td style="text-align: left">
                    <asp:Image ID="Image14" runat="server" ImageUrl="~/images/Quantumno.gif" /></td>
            </tr>
        </table>
        </div>
        


</th>
</tr>
</table>
<br />
<hr />
</div>
    
     
</div>

    
    </form>
</body>
</html>
