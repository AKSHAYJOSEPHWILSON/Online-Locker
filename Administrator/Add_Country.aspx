<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/Administrator.master" AutoEventWireup="true" CodeFile="Add_Country.aspx.cs" Inherits="Administrator_Add_Country" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="w3_agile_team_grid">
				<div class="w3_agile_team_grid_left">
					<h3 class="w3l_header w3_agileits_header"><span>Manage Country</span></h3>
		            <p class="sub_para_agile"></p>
				</div>
			</div>
    <table align="center" class="style1">
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td class="style7">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width:150px">
                Country Name</td>
            <td class="style7">
                <asp:TextBox ID="txtcountry" class="form-control" Width="250px" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                    ControlToValidate="txtcountry" ErrorMessage="*" Font-Size="Large" 
                    ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style6">
            </td>
            <td class="style8">
                <asp:Label ID="lblmsg" runat="server" ForeColor="#FF3300"></asp:Label>
            </td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td class="style7">
                <asp:Button ID="Button1" class="btn btn-success" runat="server" onclick="Button1_Click" Text="Save" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td class="style7">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        </table>
                <asp:GridView ID="GridView1" class="table" runat="server" AutoGenerateColumns="False" 
                    onrowdeleting="GridView1_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="Cid" HeaderText="Country Id" ReadOnly="True" >
                        <HeaderStyle CssClass="bg-primary" ForeColor="White" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Country" HeaderText="Country" >
                        <HeaderStyle CssClass="bg-primary" ForeColor="White" />
                        </asp:BoundField>
                        <asp:CommandField ShowDeleteButton="True" >
                        <HeaderStyle CssClass="bg-primary" ForeColor="White" />
                        </asp:CommandField>
                    </Columns>
                </asp:GridView>
            </asp:Content>

