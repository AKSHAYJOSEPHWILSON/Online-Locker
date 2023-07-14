<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/Administrator.master" AutoEventWireup="true" CodeFile="LockerOperationHistory.aspx.cs" Inherits="User_ViewLockerDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="w3_agile_team_grid">
				<div class="w3_agile_team_grid_left">
					<h3 class="w3l_header w3_agileits_header"><span>Locker Operation History</span></h3>
		            <p class="sub_para_agile"></p>
				</div>
			</div>
    <table align="center" class="style1">
    <tr>
        <td>
            &nbsp;</td>
        <td class="text-center">
            <asp:Label ID="lblmsg" runat="server" ForeColor="#FF3300"></asp:Label>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            <asp:DataList ID="DataList1" runat="server" 
                onitemcommand="DataList1_ItemCommand">
                <ItemTemplate>
                    <table align="center" class="style1">
                        <tr>
                            <td class="style2" colspan="3">
                                <strong>Allocation Details</strong></td>
                            <td style="width:30px">&nbsp;</td>
                            <td class="style2">
                                <strong>Locker Operation History</strong></td>
                        </tr>
                        <tr>
                            <td class="style2" colspan="3">&nbsp;</td>
                            <td style="width:30px">&nbsp;</td>
                            <td class="style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width:150px">
                                Allocation Id</td>
                            <td style="width:30px">
                                :</td>
                            <td>
                                <asp:Label ID="lblallocationId" runat="server" 
                                    Text='<%# Eval("AllocationId") %>'></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                            <td rowspan="5">
                                <asp:DataList ID="DataList3" runat="server">
                                    <ItemTemplate>
                                        <table align="center" class="style1">
                                            <tr>
                                                <td style="width:150px">
                                                    Operation Request Id</td>
                                                <td style="width:150px">
                                                    <asp:Label ID="lblOperationreqId" runat="server" 
                                                        Text='<%# Eval("OpRequestId") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    User Id</td>
                                                <td>
                                                    <asp:Label ID="lblUserId" runat="server" Text='<%# Eval("UserId") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Operation Date</td>
                                                <td>
                                                    <asp:Label ID="lblOperationDate" runat="server" Text='<%# Eval("Date") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Operate Time</td>
                                                <td>
                                                    <asp:Label ID="lblOperationTime" runat="server" Text='<%# Eval("Time") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Status</td>
                                                <td>
                                                    <asp:Label ID="lblStatus" runat="server" style="font-weight: 700" 
                                                        Text='<%# Eval("Status") %>'></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:DataList>
                                <br />
                                <asp:Label ID="lblmessage" runat="server" ForeColor="#FF3300"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Locker No/Id</td>
                            <td>
                                :</td>
                            <td>
                                <asp:Label ID="lbllockerId" runat="server" Text='<%# Eval("LockerId") %>'></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                Issued Date</td>
                            <td>
                                :</td>
                            <td>
                                <asp:Label ID="lbldate" runat="server" Text='<%# Eval("Date") %>'></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style3">
                                Current Status</td>
                            <td class="style3">
                                :</td>
                            <td class="style3">
                                <asp:Label ID="lblstatus" runat="server" ForeColor="#FF3300" 
                                    style="font-weight: 700; font-size: x-large" Text='<%# Eval("Status") %>'></asp:Label>
                            </td>
                            <td class="style3">&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:Panel ID="Panel1" runat="server" Visible="False">
                                    <table align="center" class="style1">
                                        <tr>
                                            <td class="style2">
                                                <strong>Join User Details</strong></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:DataList ID="DataList2" runat="server">
                                                    <ItemTemplate>
                                                        <table align="center" class="style1">
                                                            <tr>
                                                                <td>
                                                                    User Id</td>
                                                                <td>
                                                                    <asp:Label ID="lbluserId" runat="server" Text='<%# Eval("UserId") %>'></asp:Label>
                                                                </td>
                                                                <td rowspan="5">
                                                                    <asp:Image ID="imgphoto" runat="server" Height="116px" 
                                                                        ImageUrl='<%# Eval("Photo") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    First Name</td>
                                                                <td>
                                                                    <asp:Label ID="lblfirstname" runat="server" Text='<%# Eval("FirstName") %>'></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Last Name</td>
                                                                <td>
                                                                    <asp:Label ID="lbllastname" runat="server" Text='<%# Eval("LastName") %>'></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Gender</td>
                                                                <td>
                                                                    <asp:Label ID="lblgender" runat="server" Text='<%# Eval("Gender") %>'></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Date of Birth</td>
                                                                <td>
                                                                    <asp:Label ID="lbldateofbirth" runat="server" Text='<%# Eval("DateOfBirth") %>'></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Address</td>
                                                                <td>
                                                                    <asp:Label ID="lbladdress" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                                                                </td>
                                                                <td>
                                                                    &nbsp;</td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>
                                                </asp:DataList>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
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
</table>
</asp:Content>

