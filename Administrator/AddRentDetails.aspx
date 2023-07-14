<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/Administrator.master" AutoEventWireup="true" CodeFile="AddRentDetails.aspx.cs" Inherits="Administrator_AddRentDetails" %>

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
					<h3 class="w3l_header w3_agileits_header"><span>Manage Rent Details</span></h3>
		            <p class="sub_para_agile"></p>
				</div>
			</div>
    <table align="center" class="nav-justified">
        <tr>
            <td >
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style2">
                Locker Yearly Rent</td>
            <td class="style1">
                <asp:TextBox ID="txtYearlyRent" class="form-control" Width="250px" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtYearlyRent" ErrorMessage="*" Font-Size="X-Large" 
                    ForeColor="#FF3300"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToValidate="txtYearlyRent" ErrorMessage="Invalid Amount" 
                    ForeColor="#FF3300" Operator="GreaterThan" Type="Integer" ValueToCompare="0"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style2">
                Additional Operation Charge</td>
            <td class="style1">
                <asp:TextBox ID="txtadditionalOp" class="form-control" Width="250px" 
                    runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtadditionalOp" ErrorMessage="*" Font-Size="X-Large" 
                    ForeColor="#FF3300"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator2" runat="server" 
                    ControlToValidate="txtadditionalOp" ErrorMessage="Invalid Amount" 
                    ForeColor="#FF3300" Operator="GreaterThan" Type="Integer" ValueToCompare="0"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td class="style1">
                <asp:Label ID="lblmsg" runat="server" ForeColor="#FF3300"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td class="style1">
                <asp:Button ID="btnsave" class="btn btn-success" runat="server" Text="Save" 
                    onclick="btnsave_Click" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:GridView ID="GridView1" class="table" runat="server" 
                    AutoGenerateColumns="False" onrowcancelingedit="GridView1_RowCancelingEdit" 
                    onrowdeleting="GridView1_RowDeleting" onrowediting="GridView1_RowEditing" 
                    onrowupdating="GridView1_RowUpdating">
                    <Columns>
                        <asp:BoundField DataField="RentId" HeaderText="Rent Id" ReadOnly="True" >
                        <HeaderStyle CssClass="bg-primary" ForeColor="White" />
                        </asp:BoundField>
                        <asp:BoundField DataField="YearlyRent" HeaderText="Yearly Rent" >
                        <HeaderStyle CssClass="bg-primary" ForeColor="White" />
                        </asp:BoundField>
                        <asp:BoundField DataField="AdditionalCharge" HeaderText="Additional Charge" >
                        <HeaderStyle CssClass="bg-primary" ForeColor="White" />
                        </asp:BoundField>
                        <asp:CommandField ShowDeleteButton="True" >
                        <HeaderStyle CssClass="bg-primary" ForeColor="White" />
                        </asp:CommandField>
                        <asp:CommandField ShowEditButton="True" >
                        <HeaderStyle CssClass="bg-primary" ForeColor="White" />
                        </asp:CommandField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

