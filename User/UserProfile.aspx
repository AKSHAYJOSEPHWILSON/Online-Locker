<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="UserProfile.aspx.cs" Inherits="Branch_UserDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .style1
        {
            width: 100%;
        }
        .style3
        {
            height: 24px;
        }
        .style4
    {
        height: 26px;
    }
        .style5
        {
            height: 25px;
        }
        td {
            padding-top:10px !important;
            padding-bottom:10px !important;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="w3_agile_team_grid">
				<div class="w3_agile_team_grid_left">
					<h3 class="w3l_header w3_agileits_header"><span>User Profile</span></h3>
		            <p class="sub_para_agile"></p>
				</div>
			</div>
    <table align="center" class="style1" __designer:mapid="17b">
        <tr __designer:mapid="17c">
            <td __designer:mapid="17d">
                User Id</td>
            <td __designer:mapid="17e">
                <asp:Label ID="lbluserId" runat="server"></asp:Label>
            </td>
            <td __designer:mapid="17e">
                &nbsp;</td>
            <td rowspan="7" __designer:mapid="17f">
                <asp:Image ID="imgphoto" class="img img-thumbnail" runat="server" Height="144px" Width="110px" />
            </td>
        </tr>
        <tr __designer:mapid="181">
            <td __designer:mapid="182">
                                Type</td>
            <td __designer:mapid="183">
                <asp:Label ID="lbltype" runat="server"></asp:Label>
            </td>
            <td __designer:mapid="183">
                &nbsp;</td>
        </tr>
        <tr __designer:mapid="185">
            <td __designer:mapid="186">
                                First Name</td>
            <td __designer:mapid="187">
                <asp:TextBox ID="txtFirstName" class="form-control" Width="250px" 
                    runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtFirstName" ErrorMessage="*" Font-Size="Large" 
                    ForeColor="#FF3300"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="txtFirstName" ErrorMessage="Invalid First Name" 
                    ForeColor="#FF3300" ValidationExpression="^[a-zA-Z ]*$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr __designer:mapid="189">
            <td __designer:mapid="18a">
                                Last Name</td>
            <td __designer:mapid="18b">
                <asp:TextBox ID="txtLastName" class="form-control" Width="250px" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtLastName" ErrorMessage="*" Font-Size="Large" 
                    ForeColor="#FF3300"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                    ControlToValidate="txtLastName" ErrorMessage="Invalid Last Name" 
                    ForeColor="#FF3300" ValidationExpression="^[a-zA-Z ]*$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr __designer:mapid="18d">
            <td __designer:mapid="18e">
                                Gender</td>
            <td __designer:mapid="18f">
                <asp:Label ID="lblgender" runat="server"></asp:Label>
            </td>
            <td __designer:mapid="18f">
                &nbsp;</td>
        </tr>
        <tr __designer:mapid="191">
            <td __designer:mapid="192">
                                Date of Birth</td>
            <td __designer:mapid="193">
                <asp:TextBox ID="txtDateofBirth" class="form-control" Width="250px" 
                    runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtDateofBirth" ErrorMessage="*" Font-Size="Large" 
                    ForeColor="#FF3300"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                    ControlToValidate="txtDateofBirth" ErrorMessage="Invalid Date Format" 
                    ForeColor="#FF3300" 
                    ValidationExpression="^(((0?[1-9]|[12]\d|3[01])[\.\-\/](0?[13578]|1[02])[\.\-\/]((1[6-9]|[2-9]\d)?\d{2}|\d))|((0?[1-9]|[12]\d|30)[\.\-\/](0?[13456789]|1[012])[\.\-\/]((1[6-9]|[2-9]\d)?\d{2}|\d))|((0?[1-9]|1\d|2[0-8])[\.\-\/]0?2[\.\-\/]((1[6-9]|[2-9]\d)?\d{2}|\d))|(29[\.\-\/]0?2[\.\-\/]((1[6-9]|[2-9]\d)?(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)|00|[048])))$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr __designer:mapid="195">
            <td __designer:mapid="196">
                                Address</td>
            <td __designer:mapid="197">
                <asp:TextBox ID="txtaddress" class="form-control" Width="250px" runat="server" 
                    TextMode="MultiLine"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtaddress" ErrorMessage="*" Font-Size="Large" 
                    ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr __designer:mapid="199">
            <td __designer:mapid="19a">
                                Aadhar No</td>
            <td __designer:mapid="19b">
                <asp:TextBox ID="txtaadhar_no" class="form-control" Width="250px" 
                    runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="txtaadhar_no" ErrorMessage="*" Font-Size="Large" 
                    ForeColor="#FF3300"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtaadhar_no" ErrorMessage="Invalid" ForeColor="#FF3300" 
                    ValidationExpression="^\d{12}$"></asp:RegularExpressionValidator>
            </td>
            <td __designer:mapid="19d">
                                &nbsp;</td>
        </tr>
        <tr __designer:mapid="19e">
            <td class="style3" __designer:mapid="19f">
                                Pan No</td>
            <td class="style3" __designer:mapid="1a0">
                <asp:TextBox ID="txtpan_no" class="form-control" Width="250px" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="txtpan_no" ErrorMessage="*" Font-Size="Large" 
                    ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </td>
            <td rowspan="4" __designer:mapid="1a2">
                &nbsp;</td>
        </tr>
        <tr __designer:mapid="1b0">
            <td __designer:mapid="1b1">
                                Country</td>
            <td>
                                <asp:DropDownList ID="ddlcountry" class="form-control" Width="250px" runat="server"
                    AutoPostBack="True" onselectedindexchanged="ddlcountry_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="ddlcountry" ErrorMessage="*" Font-Size="Large" 
                    ForeColor="#FF3300" InitialValue="---SELECT---"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr __designer:mapid="1b4">
            <td __designer:mapid="1b5">
                                State</td>
            <td __designer:mapid="1b6">
                <asp:DropDownList ID="ddlstate" runat="server" class="form-control" Width="250px" AutoPostBack="True" 
                    onselectedindexchanged="ddlstate_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="ddlstate" ErrorMessage="*" Font-Size="Large" 
                    ForeColor="#FF3300" InitialValue="---SELECT---"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr __designer:mapid="1b8">
            <td __designer:mapid="1b9" class="style5">
                                District</td>
            <td __designer:mapid="1ba" class="style5">
                <asp:DropDownList ID="ddldistrict" class="form-control" Width="250px" runat="server">
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ControlToValidate="ddldistrict" ErrorMessage="*" Font-Size="Large" 
                    ForeColor="#FF3300" InitialValue="---SELECT---"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr __designer:mapid="1c0">
            <td __designer:mapid="1c1" class="style4">
                                Photo</td>
            <td __designer:mapid="1c2" class="style4">
                <asp:FileUpload ID="fuphoto" class="form-control" Width="250px" runat="server" />
                <asp:Button ID="btnupload" runat="server" onclick="btnupload_Click" 
                    class="btn btn-success" Text="Upload" CausesValidation="False" />
            </td>
            <td __designer:mapid="1c2" class="style4">
                &nbsp;</td>
            <td __designer:mapid="1c4" class="style4">
                                &nbsp;</td>
        </tr>
        <tr __designer:mapid="1c0">
            <td __designer:mapid="1c1" class="style4">
                                Username</td>
            <td __designer:mapid="1c2" class="style4">
                <asp:TextBox ID="txtusername" class="form-control" Width="250px" runat="server"></asp:TextBox>
            </td>
            <td __designer:mapid="1c2" class="style4">
                &nbsp;</td>
            <td __designer:mapid="1c4" class="style4">
                                </td>
        </tr>
        <tr __designer:mapid="1c5">
            <td __designer:mapid="1c6">
                                &nbsp;</td>
            <td __designer:mapid="1c7">
                &nbsp;<asp:Button ID="Button3" class="btn btn-success" runat="server" onclick="Button3_Click" 
                    Text="Update" />
&nbsp;&nbsp;&nbsp;
                </td>
            <td __designer:mapid="1c7">
                &nbsp;</td>
            <td __designer:mapid="1c8">
                                &nbsp;</td>
        </tr>
        <tr __designer:mapid="1c9">
            <td __designer:mapid="1ca">
                                &nbsp;</td>
            <td __designer:mapid="1cb">
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                </td>
            <td __designer:mapid="1cb">
                                &nbsp;</td>
            <td __designer:mapid="1ce">
                                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

