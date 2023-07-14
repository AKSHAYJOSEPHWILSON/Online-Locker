<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/Administrator.master" AutoEventWireup="true" CodeFile="ViewUsersList.aspx.cs" Inherits="Branch_ViewUsersList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 29px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="w3_agile_team_grid">
				<div class="w3_agile_team_grid_left">
					<h3 class="w3l_header w3_agileits_header"><span>Users</span></h3>
		            <p class="sub_para_agile"></p>
				</div>
			</div>
    <table align="center" class="style1" style="min-height:200px">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:DataList ID="DataList1" class="table" runat="server" 
                    onitemcommand="DataList1_ItemCommand" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <ItemStyle CssClass="col-md-6" />
                    <ItemTemplate>
                        <div class="" style="padding:10px;border:1px solid grey;margin:4px;background-color:#f5f5f5">
                        <table align="center" class="style1">
                            <tr>
                                <td rowspan="6">
                                    <asp:Image ID="Image1" class="img img-thumbnail" runat="server" Height="129px" 
                                        ImageUrl='<%# Eval("Photo") %>' Width="119px" />
                                </td>
                                <td>
                                    First Name</td>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("FirstName") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Last Name</td>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("LastName") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Gemder</td>
                                <td>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Gender") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Date of Birth</td>
                                <td>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("DateOfBirth") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Address</td>
                                <td>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2" colspan="2">
                                    <asp:Button ID="Button1" class="btn btn-success btn-block" runat="server" CommandArgument='<%# Eval("UserId") %>' 
                                        Text="View Details" CommandName="View" />
                                </td>
                            </tr>
                        </table>
                            </div>
                    </ItemTemplate>
                </asp:DataList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="text-center">
                <asp:Label ID="lblmsg" runat="server" ForeColor="#FF3300"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

