<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/Administrator.master" AutoEventWireup="true" CodeFile="ManageBranchDetails.aspx.cs" Inherits="Administrator_ManageBranchDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="w3_agile_team_grid">
				<div class="w3_agile_team_grid_left">
					<h3 class="w3l_header w3_agileits_header"><span>Manage Branch</span></h3>
		            <p class="sub_para_agile"></p>
				</div>
			</div>
    <table align="center">
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
                    oncancelcommand="DataList1_CancelCommand" 
                    ondeletecommand="DataList1_DeleteCommand" oneditcommand="DataList1_EditCommand" 
                    onitemcommand="DataList1_ItemCommand" onupdatecommand="DataList1_UpdateCommand" 
                    CssClass="row" RepeatLayout="Flow" RepeatDirection="Horizontal">
                    <EditItemTemplate>
                        <div class="" style="border:1px solid grey;min-height:200px;padding:15px;margin:5px">
                        <table align="center" width="100%">
                            <tr>
                                <td>
                                    Branch Id</td>
                                <td>
                                    <asp:Label ID="lblbranchId" runat="server" Text='<%# Eval("BranchId") %>'></asp:Label>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    Place</td>
                                <td>
                                    <asp:TextBox ID="txtplace" class="form-control" Width="250px" runat="server" Text='<%# Eval("Place") %>'></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                                        ControlToValidate="txtplace" ErrorMessage="*" Font-Size="Large" 
                                        ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Address</td>
                                <td>
                                    <asp:TextBox ID="txtaddress" class="form-control" Width="250px" runat="server" TextMode="MultiLine" 
                                        Text='<%# Eval("Address") %>'></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                                        ControlToValidate="txtaddress" ErrorMessage="*" Font-Size="Large" 
                                        ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Email</td>
                                <td>
                                    <asp:TextBox ID="txtemail" class="form-control" Width="250px" runat="server" Text='<%# Eval("Email") %>'></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                                        ControlToValidate="txtemail" ErrorMessage="*" Font-Size="Large" 
                                        ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                        ControlToValidate="txtemail" ErrorMessage="Invalid Email" ForeColor="#FF3300" 
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Mobile</td>
                                <td>
                                    <asp:TextBox ID="txtmobile" class="form-control" Width="250px" runat="server" Text='<%# Eval("Mobile") %>'></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
                                        ControlToValidate="txtmobile" ErrorMessage="*" Font-Size="Large" 
                                        ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                        ControlToValidate="txtmobile" ErrorMessage="Invalid Mobile Number" 
                                        ForeColor="#FF3300" ValidationExpression="^\d{10,12}$"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Website</td>
                                <td>
                                    <asp:TextBox ID="txtwebsite" class="form-control" Width="250px" runat="server" Text='<%# Eval("Website") %>'></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
                                        ControlToValidate="txtwebsite" ErrorMessage="*" Font-Size="Large" 
                                        ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                        ControlToValidate="txtwebsite" ErrorMessage="Invalid Website" 
                                        ForeColor="#FF3300" 
                                        ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    NoOfLockers</td>
                                <td>
                                    <asp:TextBox ID="txtnooflockers" class="form-control" Width="250px" runat="server" 
                                        Text='<%# Eval("NoOfLockers") %>'></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" 
                                        ControlToValidate="txtnooflockers" ErrorMessage="*" Font-Size="Large" 
                                        ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                        ControlToValidate="txtnooflockers" ErrorMessage="Invalid Number" 
                                        ForeColor="#FF3300" Operator="GreaterThanEqual" Type="Integer" 
                                        ValueToCompare="1"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Username</td>
                                <td>
                                    <asp:TextBox ID="txtusername" class="form-control" Width="250px" runat="server" Text='<%# Eval("Username") %>'></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" 
                                        ControlToValidate="txtusername" ErrorMessage="*" Font-Size="Large" 
                                        ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                </td>
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
                               
                                    <asp:Button ID="Button4" runat="server" class="btn btn-success" CommandName="Update" Text="Update" />
                                    &nbsp;&nbsp;&nbsp;
                               
                                    <asp:Button ID="Button2" runat="server" class="btn btn-danger" Text="Cancel" CommandName="Cancel" 
                                        CausesValidation="False" />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                            </div>
                    </EditItemTemplate>
                    <ItemStyle CssClass="col-md-6" />
                    <ItemTemplate>
                        <div class="" style="border:1px solid grey;min-height:200px;padding:15px;margin:5px">
                        <table align="center" width="100%">
                            <tr>
                                <td style="width:150px">
                                    Branch Id</td>
                                <td style="width:200px">
                                    <asp:Label ID="lblbranchId" runat="server" Text='<%# Eval("BranchId") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Place</td>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Place") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Address</td>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Email</td>
                                <td>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Mobile</td>
                                <td>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Mobile") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Website</td>
                                <td>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("Website") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    NoOfLockers</td>
                                <td>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("NoOfLockers") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Username</td>
                                <td>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("Username") %>'></asp:Label>
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
                                    <asp:Button ID="Button5" runat="server" class="btn btn-warning" CommandArgument='<%# Eval("BranchId") %>' CommandName="List" Text="View Users List" />
                                </td>
                                <td>
                                    <asp:Button ID="Button1" runat="server" class="btn btn-success" CommandName="Edit" Text="Edit" />
                                    <asp:Button ID="Button3" runat="server" class="btn btn-danger" CommandName="Delete" Text="Delete" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    &nbsp;&nbsp;&nbsp;
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
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

