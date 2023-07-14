<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Common.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Common_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="w3_agile_team_grid">
				<div class="w3_agile_team_grid_left">
					<h3 class="w3l_header w3_agileits_header"><span>Login</span></h3>
		            <p class="sub_para_agile"></p>
				</div>
			</div>
    <table align="center">
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style3">
                Username</td>
            <td class="style3">
                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
            <td class="style2">
                <asp:TextBox ID="txtusername" class="form-control" Width="250px" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" 
                    ControlToValidate="txtusername" ErrorMessage="*" Font-Size="Large" 
                    ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style3">
                Password</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style2">
                <asp:TextBox ID="txtpassword" class="form-control" Width="250px" runat="server" 
                    TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" 
                    ControlToValidate="txtpassword" ErrorMessage="*" Font-Size="Large" 
                    ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style2">
                <asp:Label ID="lblmsg" runat="server" ForeColor="Red"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style2">
                <asp:Button ID="Button1" class="btn btn-success" runat="server" onclick="Button1_Click" Text="Login" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style2">
                <asp:LinkButton ID="LinkButton1" class="btn btn-link" runat="server" 
                    onclick="LinkButton1_Click" CausesValidation="False">Forgot Password ?</asp:LinkButton>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

