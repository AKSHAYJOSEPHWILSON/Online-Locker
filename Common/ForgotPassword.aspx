<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Common.master" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="Common_ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="w3_agile_team_grid">
				<div class="w3_agile_team_grid_left">
					<h3 class="w3l_header w3_agileits_header"><span>Forgot Password</span></h3>
		            <p class="sub_para_agile"></p>
				</div>
			</div>
    <table align="center" style="min-height:200px">
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
                        <table align="center" class="nav-justified">
                            <tr>
                                <td style="width:150px">
                                    Enter Your Username</td>
                                <td style="width:30px">&nbsp;</td>
                                <td  style="width:150px">
                                    <asp:TextBox ID="txtusername" class="form-control" Width="250px" runat="server"></asp:TextBox>
                                </td>
                                <td  style="width:150px">&nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    &nbsp;</td>
                                <td class="style2">&nbsp;</td>
                                <td class="style3">
                                    <asp:Label ID="lblmsg" runat="server" ForeColor="#FF3300"></asp:Label>
                                </td>
                                <td class="style3">&nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    &nbsp;</td>
                                <td class="style2">&nbsp;</td>
                                <td class="style3">
                                    <asp:Button ID="Button1" class="btn btn-success" runat="server" Text="Next" 
                                        onclick="Button1_Click" />
                                </td>
                                <td class="style3">&nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <table align="center" class="nav-justified">
                            <tr>
                                <td style="width:150px">
                                    First Name</td>
                                <td style="width:30px">&nbsp;</td>
                                <td style="width:150px">
                                    <asp:TextBox ID="txtFirstName" class="form-control" Width="250px" 
                                        runat="server"></asp:TextBox>
                                </td>
                                <td style="width:150px">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="txtFirstName" ErrorMessage="*" Font-Size="Large" 
                                        ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                        ControlToValidate="txtFirstName" ErrorMessage="Invalid First Name" 
                                        ForeColor="#FF3300" ValidationExpression="^[a-zA-Z ]*$"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    Last Name</td>
                                <td class="style2">&nbsp;</td>
                                <td class="style1">
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
                            <tr>
                                <td class="style4">
                                    Date of Birth</td>
                                <td class="style4">&nbsp;</td>
                                <td class="style5">
                                    <asp:TextBox ID="txtDateofBirth" runat="server" class="form-control" 
                                        placeholder="dd/MM/yyyy" Width="250px"></asp:TextBox>
                                </td>
                                <td class="style6">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                        ControlToValidate="txtDateofBirth" ErrorMessage="*" Font-Size="Large" 
                                        ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                                        ControlToValidate="txtDateofBirth" ErrorMessage="Invalid Date Format" 
                                        ForeColor="#FF3300" 
                                        ValidationExpression="^(((0?[1-9]|[12]\d|3[01])[\.\-\/](0?[13578]|1[02])[\.\-\/]((1[6-9]|[2-9]\d)?\d{2}|\d))|((0?[1-9]|[12]\d|30)[\.\-\/](0?[13456789]|1[012])[\.\-\/]((1[6-9]|[2-9]\d)?\d{2}|\d))|((0?[1-9]|1\d|2[0-8])[\.\-\/]0?2[\.\-\/]((1[6-9]|[2-9]\d)?\d{2}|\d))|(29[\.\-\/]0?2[\.\-\/]((1[6-9]|[2-9]\d)?(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)|00|[048])))$"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    Aadhar No</td>
                                <td class="style2">&nbsp;</td>
                                <td class="style1">
                                    <asp:TextBox ID="txtaadhar_no" runat="server" class="form-control" 
                                        Width="250px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                        ControlToValidate="txtaadhar_no" ErrorMessage="*" Font-Size="Large" 
                                        ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                        ControlToValidate="txtaadhar_no" ErrorMessage="Invalid" ForeColor="#FF3300" 
                                        ValidationExpression="^\d{12}$"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    &nbsp;</td>
                                <td class="style2">&nbsp;</td>
                                <td class="style1">
                                    <asp:Label ID="lblmsg1" runat="server" ForeColor="#FF3300"></asp:Label>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    &nbsp;</td>
                                <td class="style2">&nbsp;</td>
                                <td class="style1">
                                    <asp:Button ID="Button2" class="btn btn-success" runat="server" Text="Next" 
                                        onclick="Button2_Click" />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="View3" runat="server">
                        <table align="center" class="nav-justified">
                            <tr>
                                <td style="width:150px">
                                    Old Password</td>
                                <td style="width:30px">&nbsp;</td>
                                <td style="width:150px">
                                    <asp:TextBox ID="txtoldpassword" runat="server" class="form-control" 
                                        Width="250px"></asp:TextBox>
                                </td>
                                <td style="width:150px">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                        ControlToValidate="txtoldpassword" ErrorMessage="*" Font-Size="Large" 
                                        ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    New Password</td>
                                <td class="style2">&nbsp;</td>
                                <td class="style3">
                                    <asp:TextBox ID="txtnewpassword" runat="server" class="form-control" 
                                        Width="250px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                        ControlToValidate="txtnewpassword" ErrorMessage="*" Font-Size="Large" 
                                        ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    Confirm Password</td>
                                <td class="style2">&nbsp;</td>
                                <td class="style3">
                                    <asp:TextBox ID="txtconfirmpassword" runat="server" class="form-control" 
                                        Width="250px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                        ControlToValidate="txtconfirmpassword" ErrorMessage="*" Font-Size="Large" 
                                        ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                        ControlToCompare="txtnewpassword" ControlToValidate="txtconfirmpassword" 
                                        ErrorMessage="Not Match" ForeColor="#FF3300"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    &nbsp;</td>
                                <td class="style2">&nbsp;</td>
                                <td class="style3">
                                    <asp:Label ID="lblmsg2" runat="server" ForeColor="#FF3300"></asp:Label>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    &nbsp;</td>
                                <td class="style2">&nbsp;</td>
                                <td class="style3">
                                    <asp:Button ID="Button3" runat="server" class="btn btn-success" 
                                        onclick="Button3_Click" Text="Change" />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </asp:View>
                </asp:MultiView>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

