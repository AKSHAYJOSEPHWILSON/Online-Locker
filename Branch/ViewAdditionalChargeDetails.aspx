<%@ Page Title="" Language="C#" MasterPageFile="~/Branch/Branch.master" AutoEventWireup="true" CodeFile="ViewAdditionalChargeDetails.aspx.cs" Inherits="User_ViewRentDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 333px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="w3_agile_team_grid">
				<div class="w3_agile_team_grid_left">
					<h3 class="w3l_header w3_agileits_header"><span>Additional Charge Details</span></h3>
		            <p class="sub_para_agile"></p>
				</div>
			</div>
    <table align="center" class="nav-justified">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">
                </td>
            <td class="auto-style1">
                <asp:GridView ID="GridView1" class="table" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="ChargeId" HeaderText="Id" >
                        <HeaderStyle CssClass="bg-primary" ForeColor="White" />
                        </asp:BoundField>
                        <asp:BoundField DataField="LockerId" HeaderText="Locker Id" >
                        <HeaderStyle CssClass="bg-primary" ForeColor="White" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Charge" HeaderText="Charge" >
                        <HeaderStyle CssClass="bg-primary" ForeColor="White" />
                        </asp:BoundField>
                        <asp:BoundField DataField="PeriodFrom" HeaderText="From" >
                        <HeaderStyle CssClass="bg-primary" ForeColor="White" />
                        </asp:BoundField>
                        <asp:BoundField DataField="PeriodTo" HeaderText="To" >
                        <HeaderStyle CssClass="bg-primary" ForeColor="White" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Date" HeaderText="Date" >
                        <HeaderStyle CssClass="bg-primary" ForeColor="White" />
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
            </td>
            <td class="auto-style1">
                </td>
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

