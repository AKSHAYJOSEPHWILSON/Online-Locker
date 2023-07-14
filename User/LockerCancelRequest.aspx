<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="LockerCancelRequest.aspx.cs" Inherits="User_SendLockerOperationRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

    .style3
    {
        height: 30px;
    }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
         <div class="w3_agile_team_grid">
				<div class="w3_agile_team_grid_left">
					<h3 class="w3l_header w3_agileits_header"><span>Locker Cancel Request</span></h3>
		            <p class="sub_para_agile"></p>
				</div>
			</div>
    <table align="center">
        <tr>
            <td>
                &nbsp;</td>
            <td style="width:150px">
                &nbsp;</td>
            <td style="width:30px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td __designer:mapid="146">
                Allocation Id</td>
            <td __designer:mapid="146">
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
                                    onitemcommand="DataList1_ItemCommand">
                                    <ItemTemplate>
                                        <table class="style1">
                                            <tr>
                                                <td style="width:150px">
                                                    User Id:&nbsp;
                                                    <asp:Label ID="lblUserId" runat="server" style="font-weight: 700" 
                                                        Text='<%# Eval("UserId") %>'></asp:Label>
                                                </td>
                                                <td  style="width:150px">
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
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>Username</td>
                                                <td>
                                                    <asp:TextBox ID="txtusername" runat="server" class="form-control" Width="250px"></asp:TextBox>
                                                </td>
                                                <td>&nbsp;</td>
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
                                                    <asp:TextBox ID="txtpassword" class="form-control" Width="250px" runat="server"></asp:TextBox>
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
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                Remark</td>
            <td>
                &nbsp;</td>
            <td>
                <asp:TextBox ID="txtremark" class="form-control" Width="250px" runat="server" TextMode="MultiLine"></asp:TextBox>
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
                &nbsp;</td>
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
                <asp:Button ID="Button1" class="btn btn-success" runat="server" onclick="Button1_Click" 
                    Text="Request" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

