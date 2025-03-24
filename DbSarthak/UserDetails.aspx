<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserDetails.aspx.cs" Inherits="DbSarthak.UserDetails" MaintainScrollPositionOnPostBack="true" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Details</title>
    <link href="/content/bootstrap.min.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="/content/customstyles.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="page-container">
            <!-- Page Header -->
            <div class="page-header">
                <h1 class="page-title">User Management</h1>
                <a href="Dashboard.aspx" class="dashboard-link">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                        <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                    </svg>
                    Back to Dashboard
                </a>
            </div>

            <!-- Add New User Section -->
            <div class="card">
                <h2 class="card-title">Add New User</h2>
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="USER_ID" DataSourceID="SqlDataSource1" Width="100%">
                    <InsertItemTemplate>
                        <div class="form-grid">
                            <div class="form-group">
                                <label for="USER_IDTextBox" class="form-label">User ID:</label>
                                <asp:TextBox ID="USER_IDTextBox" runat="server" Text='<%# Bind("USER_ID") %>' CssClass="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="NAMETextBox" class="form-label">Name:</label>
                                <asp:TextBox ID="NAMETextBox" runat="server" Text='<%# Bind("NAME") %>' CssClass="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="EMAILTextBox" class="form-label">Email:</label>
                                <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' CssClass="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="ROLETextBox" class="form-label">Role:</label>
                                <asp:TextBox ID="ROLETextBox" runat="server" Text='<%# Bind("ROLE") %>' CssClass="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="PHONETextBox" class="form-label">Phone:</label>
                                <asp:TextBox ID="PHONETextBox" runat="server" Text='<%# Bind("PHONE") %>' CssClass="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="ADDRESSTextBox" class="form-label">Address:</label>
                                <asp:TextBox ID="ADDRESSTextBox" runat="server" Text='<%# Bind("ADDRESS") %>' CssClass="form-control" />
                            </div>
                        </div>
                        <div class="form-actions">
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" />
                            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                        </div>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add New User" CssClass="btn btn-success" />
                    </ItemTemplate>
                </asp:FormView>
            </div>
            
            <!-- User List Section -->
            <div class="card">
                <h2 class="card-title">User List</h2>
                <div style="overflow-x: auto;">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="USER_ID" DataSourceID="SqlDataSource1" 
                        CssClass="data-table" Width="100%" GridLines="None">
                        <Columns>
                            <asp:TemplateField HeaderText="Actions" ItemStyle-Width="120px">
                                <ItemTemplate>
                                    <div class="action-buttons">
                                        <asp:LinkButton ID="btnEdit" runat="server" CommandName="Edit" CssClass="btn btn-warning btn-sm">
                                            Edit
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" CssClass="btn btn-danger btn-sm" 
                                            OnClientClick="return confirm('Are you sure you want to delete this user?');">
                                            Delete
                                        </asp:LinkButton>
                                    </div>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <div class="action-buttons">
                                        <asp:LinkButton ID="btnUpdate" runat="server" CommandName="Update" CssClass="btn btn-success btn-sm">Save</asp:LinkButton>
                                        <asp:LinkButton ID="btnCancel" runat="server" CommandName="Cancel" CssClass="btn btn-secondary btn-sm">Cancel</asp:LinkButton>
                                    </div>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="USER_ID" HeaderText="ID" ReadOnly="True" SortExpression="USER_ID"  ControlStyle-CssClass="form-control"  />
                            <asp:BoundField DataField="NAME" HeaderText="Name" SortExpression="NAME" ControlStyle-CssClass="form-control"  />
                            <asp:BoundField DataField="EMAIL" HeaderText="Email" SortExpression="EMAIL" ControlStyle-CssClass="form-control"  />
                            <asp:BoundField DataField="ROLE" HeaderText="Role" SortExpression="ROLE" ControlStyle-CssClass="form-control"  />
                            <asp:BoundField DataField="PHONE" HeaderText="Phone" SortExpression="PHONE" ControlStyle-CssClass="form-control"  />
                            <asp:BoundField DataField="ADDRESS" HeaderText="Address" SortExpression="ADDRESS" ControlStyle-CssClass="form-control"  />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <!-- SqlDataSource Section -->
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                DeleteCommand="DELETE FROM &quot;USERS&quot; WHERE &quot;USER_ID&quot; = :USER_ID"
                InsertCommand="INSERT INTO &quot;USERS&quot; (&quot;USER_ID&quot;, &quot;NAME&quot;, &quot;EMAIL&quot;, &quot;ROLE&quot;, &quot;PHONE&quot;, &quot;ADDRESS&quot;) VALUES (:USER_ID, :NAME, :EMAIL, :ROLE, :PHONE, :ADDRESS)"
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                SelectCommand="SELECT &quot;USER_ID&quot;, &quot;NAME&quot;, &quot;EMAIL&quot;, &quot;ROLE&quot;, &quot;PHONE&quot;, &quot;ADDRESS&quot; FROM &quot;USERS&quot; ORDER BY &quot;USER_ID&quot;"
                UpdateCommand="UPDATE &quot;USERS&quot; SET &quot;NAME&quot; = :NAME, &quot;EMAIL&quot; = :EMAIL, &quot;ROLE&quot; = :ROLE, &quot;PHONE&quot; = :PHONE, &quot;ADDRESS&quot; = :ADDRESS WHERE &quot;USER_ID&quot; = :USER_ID">
                <DeleteParameters>
                    <asp:Parameter Name="USER_ID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="USER_ID" Type="Decimal" />
                    <asp:Parameter Name="NAME" Type="String" />
                    <asp:Parameter Name="EMAIL" Type="String" />
                    <asp:Parameter Name="ROLE" Type="String" />
                    <asp:Parameter Name="PHONE" Type="String" />
                    <asp:Parameter Name="ADDRESS" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="NAME" Type="String" />
                    <asp:Parameter Name="EMAIL" Type="String" />
                    <asp:Parameter Name="ROLE" Type="String" />
                    <asp:Parameter Name="PHONE" Type="String" />
                    <asp:Parameter Name="ADDRESS" Type="String" />
                    <asp:Parameter Name="USER_ID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>