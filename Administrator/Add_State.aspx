<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/Administrator.master" AutoEventWireup="true" CodeFile="Add_State.aspx.cs" Inherits="Administrator_Add_State" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <style type="text/css">
        td
        {
           padding-top:5px !important;
           padding-bottom:5px !important;

        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div class="w3_agile_team_grid">
				<div class="w3_agile_team_grid_left">
					<h3 class="w3l_header w3_agileits_header"><span>Manage State</span></h3>
		            <p class="sub_para_agile"></p>
				</div>
			</div>
    <table align="center" width="100%">
        <tr>
            <td>&nbsp;</td>
            <td>
                <table align="center">
        <tr>
            <td style="width:150px">
                Country</td>
            <td class="style2">
                <asp:DropDownList ID="ddlcountry" class="form-control" Width="250px" runat="server">
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                    ControlToValidate="ddlcountry" ErrorMessage="*" Font-Size="Large" 
                    ForeColor="#FF3300" InitialValue="--SELECT---"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                State Name</td>
            <td class="style2">
                <asp:TextBox ID="txtstate" class="form-control" Width="250px" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                    ControlToValidate="txtstate" ErrorMessage="*" Font-Size="Large" 
                    ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style2">
                <asp:Label ID="lblmsg" runat="server" ForeColor="#FF3300"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style2">
                <asp:Button ID="Button1" class="btn btn-success" runat="server" onclick="Button1_Click" Text="Save" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        </table>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:GridView ID="GridView1" class="table" runat="server" AutoGenerateColumns="False" 
                    onrowdeleting="GridView1_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="Sid" HeaderText="State Id" >
                        <HeaderStyle CssClass="bg-primary" ForeColor="White" />
                        </asp:BoundField>
                        <asp:BoundField DataField="State" HeaderText="State" >
                        <HeaderStyle CssClass="bg-primary" ForeColor="White" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Cid" HeaderText="Cid" >
                        <HeaderStyle CssClass="bg-primary" ForeColor="White" />
                        </asp:BoundField>
                        <asp:CommandField ShowDeleteButton="True" >
                        <HeaderStyle CssClass="bg-primary" ForeColor="White" />
                        </asp:CommandField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>

