<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/Administrator.master" AutoEventWireup="true" CodeFile="AddBranch.aspx.cs" Inherits="Administrator_AddBranch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <style type="text/css">
        td
        {
           padding-top:5px !important;
           padding-bottom:5px !important;

        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="w3_agile_team_grid">
				<div class="w3_agile_team_grid_left">
					<h3 class="w3l_header w3_agileits_header"><span>Add New Branch</span></h3>
		            <p class="sub_para_agile"></p>
				</div>
			</div>
    <table align="center">
        <tr>
            <td style="width:150px">
                Place</td>
            <td class="style2">
                <asp:TextBox ID="txtplace" class="form-control" Width="250px" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                    ControlToValidate="txtplace" ErrorMessage="*" Font-Size="Large" 
                    ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Address</td>
            <td class="style2">
                <asp:TextBox ID="txtaddress" class="form-control" Width="250px" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                    ControlToValidate="txtaddress" ErrorMessage="*" Font-Size="Large" 
                    ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Email</td>
            <td class="style2">
                <asp:TextBox ID="txtemail" class="form-control" Width="250px" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                    ControlToValidate="txtemail" ErrorMessage="*" Font-Size="Large" 
                    ForeColor="#FF3300"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtemail" ErrorMessage="Invalid Email" ForeColor="#FF3300" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Mobile</td>
            <td class="style2">
                <asp:TextBox ID="txtmobile" class="form-control" Width="250px" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
                    ControlToValidate="txtemail" ErrorMessage="*" Font-Size="Large" 
                    ForeColor="#FF3300"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="txtmobile" ErrorMessage="Invalid Mobile Number" 
                    ForeColor="#FF3300" ValidationExpression="^\d{10,12}$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style4">
                Website</td>
            <td class="style5">
                <asp:TextBox ID="txtwebsite" class="form-control" Width="250px" placeholder="http://www.example.com" runat="server"></asp:TextBox>
            </td>
            <td class="style6">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
                    ControlToValidate="txtwebsite" ErrorMessage="*" Font-Size="Large" 
                    ForeColor="#FF3300"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                    ControlToValidate="txtwebsite" ErrorMessage="Invalid Website" 
                    ForeColor="#FF3300" 
                    ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                NoOfLockers</td>
            <td class="style2">
                <asp:TextBox ID="txtnooflockers" class="form-control" Width="250px" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" 
                    ControlToValidate="txtnooflockers" ErrorMessage="*" Font-Size="Large" 
                    ForeColor="#FF3300"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToValidate="txtnooflockers" ErrorMessage="Invalid Number" 
                    ForeColor="#FF3300" Operator="GreaterThanEqual" Type="Integer" 
                    ValueToCompare="1"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Username</td>
            <td class="style2">
                <asp:TextBox ID="txtusername" class="form-control" Width="250px" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" 
                    ControlToValidate="txtusername" ErrorMessage="*" Font-Size="Large" 
                    ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Password</td>
            <td class="style2">
                <asp:TextBox ID="txtpassword" class="form-control" Width="250px" runat="server" 
                    TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" 
                    ControlToValidate="txtpassword" ErrorMessage="*" Font-Size="Large" 
                    ForeColor="#FF3300"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtpassword" ErrorMessage="Password must contains at least 8 characters,one digit,special character" ForeColor="Red" ValidationExpression="^.*(?=.{8,})(?=.*[\d])(?=.*[\W]).*$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Verify Password</td>
            <td class="style2">
                <asp:TextBox ID="txtverifypassword" class="form-control" Width="250px" 
                    runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" 
                    ControlToValidate="txtverifypassword" ErrorMessage="*" Font-Size="Large" 
                    ForeColor="#FF3300"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator2" runat="server" 
                    ControlToCompare="txtpassword" ControlToValidate="txtverifypassword" 
                    ErrorMessage="Not Match" ForeColor="#FF3300"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
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
            <td class="style2">
                <asp:Button ID="Button1" class="btn btn-success" runat="server" Text="Register" 
                    onclick="Button1_Click" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

