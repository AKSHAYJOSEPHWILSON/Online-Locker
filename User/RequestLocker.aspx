<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="RequestLocker.aspx.cs" Inherits="User_RequestLocker" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="w3_agile_team_grid">
				<div class="w3_agile_team_grid_left">
					<h3 class="w3l_header w3_agileits_header"><span>Locker Request</span></h3>
		            <p class="sub_para_agile"></p>
				</div>
			</div>
    <table align="center">
        <tr>
            <td style="width:175px">
                User Id</td>
            <td>
                <asp:Label ID="lbluser_id" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Remark</td>
            <td>
                <asp:TextBox ID="txtremark" class="form-control" Width="250px" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Date</td>
            <td>
                <asp:Label ID="lbldate" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Panel ID="Panel1" runat="server">
                    <table align="center" class="style1">
                        <tr>
                            <td>
                                User Verification</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DataList ID="DataList1" runat="server" 
                                    onitemcommand="DataList1_ItemCommand">
                                    <ItemTemplate>
                                        <table class="style1">
                                            <tr>
                                                <td>
                                                    User Id:&nbsp;
                                                    <asp:Label ID="lblUserId" runat="server" style="font-weight: 700" 
                                                        Text='<%# Eval("UserId") %>'></asp:Label>
                                                </td>
                                                <td>
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
                                                <td>
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>Password</td>
                                                <td>
                                                    <asp:TextBox ID="txtpassword" runat="server" class="form-control" TextMode="Password" Width="250px"></asp:TextBox>
                                                </td>
                                                <td>&nbsp;</td>
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
                <asp:Button ID="Button1" class="btn btn-success" runat="server" onclick="Button1_Click" 
                    Text="Request" />
            </td>
        </tr>
    </table>
</asp:Content>

