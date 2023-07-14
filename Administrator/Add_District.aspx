<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/Administrator.master" AutoEventWireup="true" CodeFile="Add_District.aspx.cs" Inherits="Administrator_Add_District" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="w3_agile_team_grid">
				<div class="w3_agile_team_grid_left">
					<h3 class="w3l_header w3_agileits_header"><span>Manage District</span></h3>
		            <p class="sub_para_agile"></p>
				</div>
			</div>
    <table align="center">
        <tr>
            <td style="width:150px">
                Country</td>
            <td class="style4">
                <asp:DropDownList ID="ddlcountry" class="form-control" Width="250px" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ddlcountry_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                    ControlToValidate="ddlcountry" ErrorMessage="*" Font-Size="Large" 
                    ForeColor="#FF3300" InitialValue="---SELECT---"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                State</td>
            <td class="style4">
                <asp:DropDownList ID="ddlstate" class="form-control" Width="250px" runat="server">
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                    ControlToValidate="ddlstate" ErrorMessage="*" Font-Size="Large" 
                    ForeColor="#FF3300" InitialValue="---SELECT---"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                District Name</td>
            <td class="style4">
                <asp:TextBox ID="txtdistrictname" class="form-control" Width="250px" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                    ControlToValidate="txtdistrictname" ErrorMessage="*" Font-Size="Large" 
                    ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                <asp:Label ID="lblmsg" runat="server" ForeColor="#FF3300"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                <asp:Button ID="btnsave" class="btn btn-success" runat="server" onclick="btnsave_Click" Text="Save" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        </table>
                <asp:GridView ID="GridView1" class="table" runat="server" AutoGenerateColumns="False" 
                    onrowdeleting="GridView1_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="Did" HeaderText="District Id" >
                        <HeaderStyle CssClass="bg-primary" ForeColor="White" />
                        </asp:BoundField>
                        <asp:BoundField DataField="District" HeaderText="District" >
                        <HeaderStyle CssClass="bg-primary" ForeColor="White" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Sid" HeaderText="State Id"  >
                        <HeaderStyle CssClass="bg-primary" ForeColor="White" />
                        </asp:BoundField>
                        <asp:CommandField ShowDeleteButton="True" >
                        <HeaderStyle CssClass="bg-primary" ForeColor="White" />
                        </asp:CommandField>
                    </Columns>
                </asp:GridView>
            </asp:Content>

