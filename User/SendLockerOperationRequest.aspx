<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="SendLockerOperationRequest.aspx.cs" Inherits="User_SendLockerOperationRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

    .style3
    {
        height: 30px;
    }
        .style4
        {
            height: 34px;
        }
    </style>
    <link href="../web/css/jquery-ui.min.css" rel="stylesheet"> 
<script type="text/javascript" src="../web/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="../web/js/jquery-ui.min.js"></script>
     <script>
         $(function () {

             $("#<%= txtdate.ClientID %>").datepicker({
                 dateFormat: 'dd/mm/yy',
                 minDate:new Date()
             });
         });
  </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="w3_agile_team_grid">
				<div class="w3_agile_team_grid_left">
					<h3 class="w3l_header w3_agileits_header"><span>Schedule Locker Operation Request </span></h3>
		            <p class="sub_para_agile"></p>
				</div>
			</div>
    <table align="center">
        <tr>
            <td>
                &nbsp;</td>
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
            <td style="width:150px">
                Allocation Id</td>
            <td style="width:30px">
                :</td>
            <td __designer:mapid="147">
                <asp:Label ID="lblallocationId" runat="server" 
                    Text='<%# Eval("AllocationId") %>'></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td __designer:mapid="14c">
                Locker No/Id</td>
            <td __designer:mapid="14c">
                :</td>
            <td __designer:mapid="14d">
                <asp:Label ID="lbllockerId" runat="server" Text='<%# Eval("LockerId") %>'></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td __designer:mapid="150">
                User Id</td>
            <td __designer:mapid="150">
                :</td>
            <td __designer:mapid="151">
                <asp:Label ID="lbluserId" runat="server" Text='<%# Eval("LockerId") %>'></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td __designer:mapid="150">
                Issued Date</td>
            <td __designer:mapid="150">
                :</td>
            <td __designer:mapid="151">
                <asp:Label ID="lbldate" runat="server" Text='<%# Eval("Date") %>'></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style3" __designer:mapid="154">
                Current Status</td>
            <td class="style3" __designer:mapid="154">
                :</td>
            <td class="style3" __designer:mapid="155">
                <asp:Label ID="lblstatus" runat="server" ForeColor="#FF3300" 
                                    style="font-weight: 700; font-size: x-large" 
                    Text='<%# Eval("Status") %>'></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
            </td>
            <td class="style4">
                Operation Date</td>
            <td class="style4">
                :</td>
            <td class="style4">
                <asp:TextBox ID="txtdate" class="form-control" Width="250px" placeholder="dd/MM/yyyy" runat="server"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtdate" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
               <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtdate" ErrorMessage="Invalid Date" 
                    ForeColor="#FF3300" 
                    
                    
                    ValidationExpression="(((0|1)[0-9]|2[0-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$"></asp:RegularExpressionValidator>
            </td>
            <td class="style4">
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                Operation Time</td>
            <td>
                :</td>
            <td>
                <asp:TextBox ID="txttime" class="form-control" Width="250px" placeholder="HH:MM AM/PM" runat="server"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txttime" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                    ControlToValidate="txttime" ErrorMessage="Invalid Time" ForeColor="#FF3300" 
                    ValidationExpression="((1[0-2]|0?[1-9]):([0-5][0-9]) ?([AaPp][Mm]))"></asp:RegularExpressionValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="lblcharge" runat="server" ForeColor="#FF3300"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td colspan="4">
                <asp:Panel ID="Panel1" runat="server" Visible="False">
                    <table align="center" class="style1">
                        <tr>
                            <td>
                                <strong>User Verification</strong></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DataList ID="DataList1" runat="server" 
                                    onitemcommand="DataList1_ItemCommand" 
                                    onselectedindexchanged="DataList1_SelectedIndexChanged">
                                    <ItemTemplate>
                                        <table class="style1">
                                            <tr>
                                                <td style="width:150px">
                                                    User Id:&nbsp;
                                                    <asp:Label ID="lblUserId" runat="server" style="font-weight: 700" 
                                                        Text='<%# Eval("UserId") %>'></asp:Label>
                                                </td>
                                                <td style="width:150px">
                                                    Name:
                                                    <asp:Label ID="lblfirstname" runat="server" style="font-weight: 700" 
                                                        Text='<%# Eval("FirstName") %>'></asp:Label>
                                                    &nbsp;<asp:Label ID="lbllastname" runat="server" style="font-weight: 700" 
                                                        Text='<%# Eval("LastName") %>'></asp:Label>
                                                </td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Username</td>
                                                <td>
                                                    <asp:TextBox ID="txtusername" class="form-control" Width="250px" runat="server"></asp:TextBox>
                                                </td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Password</td>
                                                <td>
                                                    <asp:TextBox ID="txtpassword" class="form-control" Width="250px" runat="server" 
                                                        TextMode="Password"></asp:TextBox>
                                                </td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td>
                                                    <asp:Button ID="btnverify" runat="server" class="btn btn-warning" CommandName="verify" Text="Verify" />
                                                </td>
                                                <td>&nbsp;</td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:DataList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
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
                <asp:Button ID="Button1" class="btn btn-success" runat="server" onclick="Button1_Click" 
                    Text="Request" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

