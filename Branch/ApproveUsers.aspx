<%@ Page Title="" Language="C#" MasterPageFile="~/Branch/Branch.master" AutoEventWireup="true" CodeFile="ApproveUsers.aspx.cs" Inherits="Branch_ApproveUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
         td {
        padding-top:5px !important;
        padding-bottom:5px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="w3_agile_team_grid">
				<div class="w3_agile_team_grid_left">
					<h3 class="w3l_header w3_agileits_header"><span>Approve User</span></h3>
		            <p class="sub_para_agile"></p>
				</div>
			</div>
    <table align="center" width="100%">
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
                <asp:GridView ID="GridView1" class="table table-responsive table-hover" runat="server" AutoGenerateColumns="False" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="UserId" HeaderText="User Id" >
                        <HeaderStyle CssClass="bg-primary" ForeColor="White" />
                        </asp:BoundField>
                        <asp:BoundField DataField="FirstName" HeaderText="First Name" >
                        <HeaderStyle  CssClass="bg-primary" ForeColor="White" />
                        </asp:BoundField>
                        <asp:BoundField DataField="LastName" HeaderText="Last Name" >
                        <HeaderStyle CssClass="bg-primary" ForeColor="White" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Address" HeaderText="Address" >
                        <HeaderStyle CssClass="bg-primary" ForeColor="White" />
                        </asp:BoundField>
                        <asp:BoundField DataField="State" HeaderText="State" >
                        <HeaderStyle CssClass="bg-primary" ForeColor="White" />
                        </asp:BoundField>
                        <asp:CommandField SelectText="View Details" ShowSelectButton="True" >
                        <HeaderStyle CssClass="bg-primary" ForeColor="White" />
                        </asp:CommandField>
                    </Columns>
                </asp:GridView>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <br />
                <asp:Panel ID="Panel2" runat="server" Visible="False">
                    <table align="center">
                        <tr>
                            <td colspan="3" class="text-center">
                                <h3 class="text-success"><strong>User Details</strong></h3></td>
                        </tr>
                        <tr>
                            <td style="width:150px">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                Type</td>
                            <td>
                                <asp:Label ID="lbltype" runat="server"></asp:Label>
                            </td>
                            <td rowspan="5">
                                <asp:Image ID="imgphoto" runat="server" Height="144px" Width="110px" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                First Name</td>
                            <td>
                                <asp:TextBox ID="txtFirstName" class="form-control" Width="250px" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Last Name</td>
                            <td>
                                <asp:TextBox ID="txtLastName" runat="server" class="form-control" Width="250px" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Gender</td>
                            <td>
                                <asp:Label ID="lblgender" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Date of Birth</td>
                            <td>
                                <asp:TextBox ID="txtDateofBirth" runat="server" class="form-control" Width="250px" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Address</td>
                            <td>
                                <asp:TextBox ID="txtaddress" runat="server" class="form-control" Width="250px" TextMode="MultiLine" 
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                Aadhar No</td>
                            <td>
                                <asp:TextBox ID="txtaadhar_no" runat="server" class="form-control" Width="250px" ReadOnly="True"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style3">
                                Pan No</td>
                            <td class="style3">
                                <asp:TextBox ID="txtpan_no" runat="server" class="form-control" Width="250px" ReadOnly="True"></asp:TextBox>
                            </td>
                            <td rowspan="5">
                                <asp:Panel ID="Panel1" runat="server" Visible="False">
                                    <table class="style1">
                                        <tr>
                                            <td class="style2">
                                                Joint Users</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:GridView ID="GridView2" CssClass="table table-hover" runat="server" AutoGenerateColumns="False">
                                                    <Columns>
                                                        <asp:BoundField DataField="FirstName" HeaderText="First Name" >
                                                        <HeaderStyle CssClass="bg-primary" ForeColor="White" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="LastName" HeaderText="Last Name" >
                                                        <HeaderStyle CssClass="bg-primary" ForeColor="White" />
                                                        </asp:BoundField>
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
                                <asp:Label ID="lblcountry" class="form-control" Width="250px" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                State</td>
                            <td>
                                <asp:Label ID="lblstate" class="form-control" Width="250px" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                District</td>
                            <td>
                                <asp:Label ID="lbldistrict" class="form-control" Width="250px" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Id Proof</td>
                            <td>
                                <asp:Image ID="imgIdProof" class="img img-thumbnail" runat="server" Height="351px" Width="383px" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Username</td>
                            <td>
                                <asp:TextBox ID="txtusername" class="form-control" Width="250px" runat="server" ReadOnly="True"></asp:TextBox>
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
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:Button ID="Button1" class="btn btn-success" runat="server" onclick="Button1_Click" 
                                    Text="Approve" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnfinish" class="btn btn-danger" runat="server" onclick="btnfinish_Click" 
                                    Text="Reject" />
                            </td>
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

