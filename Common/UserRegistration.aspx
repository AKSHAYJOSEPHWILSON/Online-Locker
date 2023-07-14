<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Common.master" AutoEventWireup="true" CodeFile="UserRegistration.aspx.cs" Inherits="Common_UserRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    .style2
    {
        text-align: center;
    }
        td {
            padding-top:10px !important;
            padding-bottom:10px !important;
        }
    </style>
        <link href="../web/css/jquery-ui.min.css" rel="stylesheet"> 
<script type="text/javascript" src="../web/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="../web/js/jquery-ui.min.js"></script>
     <script>
         $(function () {

             $("#<%= txtDateofBirth.ClientID %>").datepicker({
                 dateFormat: 'dd/mm/yy',
                 maxDate: '31/12/2015'
             });
         });
  </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="w3_agile_team_grid">
				<div class="w3_agile_team_grid_left">
					<h3 class="w3l_header w3_agileits_header"><span>User Registration</span></h3>
		            <p class="sub_para_agile"></p>
				</div>
			</div>
    <table align="center" class="style1">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td rowspan="7">
                <asp:Image ID="imgphoto" runat="server" class="img img-thumbnail" Height="144px" Width="116px" 
                    ImageUrl="~/User/Photo/dummy_profile.png" />
            </td>
        </tr>
        <tr>
            <td>
                Type</td>
            <td>
                <asp:DropDownList ID="ddltype" class="form-control" Width="250px" runat="server">
                    <asp:ListItem>Individual</asp:ListItem>
                    <asp:ListItem>Join Account</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                First Name</td>
            <td>
                <asp:TextBox ID="txtFirstName" class="form-control" Width="250px" runat="server"></asp:TextBox>
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
        <tr>
            <td>
                Last Name</td>
            <td>
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
            <td>
                Gender</td>
            <td>
                
                <asp:RadioButtonList ID="rdogender" Width="250px" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True">Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:RadioButtonList>
              
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Date of Birth</td>
            <td>
                <asp:TextBox ID="txtDateofBirth" class="form-control" Width="250px" placeholder="dd/MM/yyyy" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtDateofBirth" ErrorMessage="*" Font-Size="Large" 
                    ForeColor="#FF3300"></asp:RequiredFieldValidator>
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                    ControlToValidate="txtDateofBirth" ErrorMessage="Invalid Date" 
                    ForeColor="#FF3300" 
                    
                    
                    ValidationExpression="(((0|1)[0-9]|2[0-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                Address</td>
            <td>
                <asp:TextBox ID="txtaddress" class="form-control" Width="250px" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtaddress" ErrorMessage="*" Font-Size="Large" 
                    ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Aadhar No</td>
            <td>
                <asp:TextBox ID="txtaadhar_no" class="form-control" Width="250px" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="txtaadhar_no" ErrorMessage="*" Font-Size="Large" 
                    ForeColor="#FF3300"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtaadhar_no" ErrorMessage="Invalid" ForeColor="#FF3300" 
                    ValidationExpression="^\d{12}$"></asp:RegularExpressionValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Pan No</td>
            <td>
                <asp:TextBox ID="txtpan_no" class="form-control" Width="250px" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="txtpan_no" ErrorMessage="*" Font-Size="Large" 
                    ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </td>
            <td rowspan="7">
                <asp:Panel ID="Panel1" runat="server" Visible="False">
                    <table class="style1">
                        <tr>
                            <td class="style2">
                                Joint Users</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridView1" class="table table-responsive table-bordered" runat="server" AutoGenerateColumns="False">
                                    <Columns>
                                        <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                                        <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Joint Account Id :
                                <asp:Label ID="lbljointId" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
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
        <tr>
            <td>
                State</td>
            <td>
                <asp:DropDownList ID="ddlstate" class="form-control" Width="250px" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ddlstate_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="ddlstate" ErrorMessage="*" Font-Size="Large" 
                    ForeColor="#FF3300" InitialValue="---SELECT---"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                District</td>
            <td>
                <asp:DropDownList ID="ddldistrict" class="form-control" Width="250px" runat="server">
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ControlToValidate="ddldistrict" ErrorMessage="*" Font-Size="Large" 
                    ForeColor="#FF3300" InitialValue="---SELECT---"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Branch</td>
            <td>
                <asp:DropDownList ID="ddlbranch" class="form-control" Width="250px" runat="server">
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                    ControlToValidate="ddlbranch" ErrorMessage="*" Font-Size="Large" 
                    ForeColor="#FF3300" InitialValue="---SELECT---"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Photo</td>
            <td>
                <asp:FileUpload ID="fuphoto" class="form-control" Width="250px" runat="server" />
&nbsp;<asp:Button ID="btnupload" runat="server" onclick="btnupload_Click" 
                    class="btn btn-success" Text="Upload" CausesValidation="False" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Id Proof</td>
            <td>
                <asp:FileUpload ID="fuIdProof" class="form-control" Width="250px" runat="server" />
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                    ControlToValidate="fuIdProof" ErrorMessage="*" Font-Size="Large" 
                    ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Username</td>
            <td>
                <asp:TextBox ID="txtusername" class="form-control" placeholder="Enter Email Here" Width="250px" runat="server"></asp:TextBox>
            </td>
            <td colspan="2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                    ControlToValidate="txtusername" ErrorMessage="*" Font-Size="Large" 
                    ForeColor="#FF3300"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtusername" ErrorMessage="Invalid Email Address" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                Password</td>
            <td>
                <asp:TextBox ID="txtpassword" class="form-control" Width="250px" runat="server" 
                    TextMode="Password"></asp:TextBox>
            </td>
            <td colspan="2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                    ControlToValidate="txtpassword" ErrorMessage="*" Font-Size="Large" 
                    ForeColor="#FF3300"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtpassword" ErrorMessage="Password must contains at least 8 characters,one digit,special character" ForeColor="Red" ValidationExpression="^.*(?=.{8,})(?=.*[\d])(?=.*[\W]).*$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                Verify Password</td>
            <td>
                <asp:TextBox ID="txtverifypassword" class="form-control" Width="250px" 
                    runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td colspan="2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                    ControlToValidate="txtverifypassword" ErrorMessage="*" Font-Size="Large" 
                    ForeColor="#FF3300"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtpassword" ControlToValidate="txtverifypassword" ErrorMessage="Not Match" ForeColor="Red"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Register" class="btn btn-success"
                    onclick="Button1_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnfinish" runat="server" onclick="btnfinish_Click" class="btn btn-danger"
                    Text="Finish" Visible="False" CausesValidation="False" />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

