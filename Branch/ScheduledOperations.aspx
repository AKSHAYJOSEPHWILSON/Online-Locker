<%@ Page Title="" Language="C#" MasterPageFile="~/Branch/Branch.master" AutoEventWireup="true" CodeFile="ScheduledOperations.aspx.cs" Inherits="Branch_ViewLockerRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="w3_agile_team_grid">
				<div class="w3_agile_team_grid_left">
					<h3 class="w3l_header w3_agileits_header"><span>Scheduled Locker Operation</span></h3>
		            <p class="sub_para_agile"></p>
				</div>
			</div>
    <table align="center" width="100%">
        <tr>
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
                <asp:GridView ID="GridView1" class="table table-responsive" runat="server" AutoGenerateColumns="False" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="OpRequestId" HeaderText="Request Id" >
                        <HeaderStyle CssClass="bg-primary" ForeColor="White" />
                        </asp:BoundField>
                        <asp:BoundField DataField="UserId" HeaderText="User Id" >
                        <HeaderStyle CssClass="bg-primary" ForeColor="White" />
                        </asp:BoundField>
<asp:BoundField DataField="LockerId" HeaderText="Locker Id">
                        <HeaderStyle CssClass="bg-primary" ForeColor="White" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Date" HeaderText="Operation Date" >
                        <HeaderStyle CssClass="bg-primary" ForeColor="White" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Time" HeaderText="Operation Time" >
                        <HeaderStyle CssClass="bg-primary" ForeColor="White" />
                        </asp:BoundField>
                        <asp:CommandField SelectText="View Details" ShowSelectButton="True" >
                        <HeaderStyle CssClass="bg-primary" ForeColor="White" />
                        </asp:CommandField>
                    </Columns>
                </asp:GridView>
                <br />
                <asp:Label ID="lblmsg" runat="server" ForeColor="Red"></asp:Label>
            </td>
            <td>
                <br />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Panel ID="Panel1" runat="server" Visible="False">
                    <table align="center">
                        <tr>
                            <td colspan="2">
                                &nbsp;</td>
                            <td colspan="2">
                                <strong>User Details</strong></td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <table align="center" class="style2">
                                    <tr>
                                        <td colspan="2" style="text-align: center">
                                            <strong>Operation Request Details</strong></td>
                                        <td style="text-align: center">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td style="width:50px">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="width:150px">Request Id</td>
                                        <td>
                                            <asp:Label ID="lblrequestid" runat="server"></asp:Label>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            User Id</td>
                                        <td>
                                            <asp:Label ID="lbluserId" runat="server"></asp:Label>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Locker Id/No</td>
                                        <td>
                                            <asp:Label ID="lbllockerId" runat="server"></asp:Label>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Operation Date</td>
                                        <td>
                                            <asp:Label ID="lbldate" runat="server"></asp:Label>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Operation Time</td>
                                        <td>
                                            <asp:Label ID="lbltime" runat="server"></asp:Label>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                            <td colspan="3">
                                <asp:DataList ID="DataList1" runat="server">
                                    <ItemTemplate>
                                        <table align="center" class="style1">
                                            <tr>
                                                <td style="width:100px">
                                                    User Id</td>
                                                <td  style="width:150px">
                                                    <asp:Label ID="lbluserId" runat="server" Text='<%# Eval("UserId") %>'></asp:Label>
                                                </td>
                                                <td rowspan="5">
                                                    <asp:Image ID="imgphoto" class="img img-thumbnail" runat="server" Height="116px" 
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
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
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
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

