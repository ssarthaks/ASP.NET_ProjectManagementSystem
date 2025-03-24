<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MilestoneDetails.aspx.cs" Inherits="DbSarthak.MilestoneDetails" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Milestone Details</title>
    <link href="/content/bootstrap.min.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="/content/customstyles.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="page-container">
            <!-- Page Header -->
            <div class="page-header">
                <h1 class="page-title">Milestone Management</h1>
                <a href="Dashboard.aspx" class="dashboard-link">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                        <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
                    </svg>
                    Back to Dashboard
                </a>
            </div>

            <!-- Add New Milestone Section -->
            <div class="card">
                <h2 class="card-title">Add New Milestone</h2>
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="MILESTONE_ID" DataSourceID="SqlDataSource1" Width="100%">
                    <InsertItemTemplate>
                        <div class="form-grid">
                            <div class="form-group">
                                <label for="MILESTONE_IDTextBox" class="form-label">Milestone ID:</label>
                                <asp:TextBox ID="MILESTONE_IDTextBox" runat="server" Text='<%# Bind("MILESTONE_ID") %>' CssClass="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="NAMETextBox" class="form-label">Name:</label>
                                <asp:TextBox ID="NAMETextBox" runat="server" Text='<%# Bind("NAME") %>' CssClass="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="DUE_DATETextBox" class="form-label">Due Date:</label>
                                <asp:TextBox ID="DUE_DATETextBox" runat="server" Text='<%# Bind("DUE_DATE") %>' CssClass="form-control" TextMode="Date" />
                            </div>
                            <div class="form-group">
                                <label for="PROJECTS_PROJECT_IDTextBox" class="form-label">Project:</label>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1"
                                    DataTextField="NAME" DataValueField="PROJECT_ID"
                                    SelectedValue='<%# Bind("PROJECTS_PROJECT_ID") %>' CssClass="dropdown-select">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                                    SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;PROJECT_ID&quot; || '_' || &quot;NAME&quot; AS &quot;NAME&quot; FROM &quot;PROJECTS&quot;"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="form-actions">
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" />
                            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                        </div>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add New Milestone" CssClass="btn btn-success" />
                    </ItemTemplate>
                </asp:FormView>
            </div>

            <!-- Milestone List Section -->
            <div class="card">
                <h2 class="card-title">Milestone List</h2>
                <div style="overflow-x: auto;">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MILESTONE_ID" DataSourceID="SqlDataSource1"
                        CssClass="data-table" Width="100%" GridLines="None">
                        <Columns>
                            <asp:TemplateField HeaderText="Actions" ItemStyle-Width="120px">
                                <ItemTemplate>
                                    <div class="action-buttons">
                                        <asp:LinkButton ID="btnEdit" runat="server" CommandName="Edit" CssClass="btn btn-warning btn-sm">
                                            Edit
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" CssClass="btn btn-danger btn-sm"
                                            OnClientClick="return confirm('Are you sure you want to delete this milestone?');">
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
                            <asp:BoundField DataField="MILESTONE_ID" HeaderText="ID" ReadOnly="True" SortExpression="MILESTONE_ID" />
                            <asp:TemplateField HeaderText="Name" SortExpression="NAME">
                                <ItemTemplate>
                                    <%# Eval("NAME") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("NAME") %>' CssClass="form-control" />
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Due Date" SortExpression="DUE_DATE">
                                <ItemTemplate>
                                    <%# Eval("DUE_DATE", "{0:yyyy-MM-dd}") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtDueDate" runat="server" Text='<%# Bind("DUE_DATE", "{0:yyyy-MM-dd}") %>' CssClass="form-control" TextMode="Date" />
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Project" SortExpression="PROJECTS_PROJECT_ID">
                                <ItemTemplate>
                                    <asp:DropDownList ID="DropDownList2" Enabled="False" runat="server" DataSourceID="SqlDataSource2"
                                        DataTextField="NAME" DataValueField="PROJECT_ID"
                                        SelectedValue='<%# Bind("PROJECTS_PROJECT_ID") %>' CssClass="dropdown-select">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                                        SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;PROJECT_ID&quot; || '_' || &quot;NAME&quot; AS &quot;NAME&quot; FROM &quot;PROJECTS&quot; ORDER BY &quot;PROJECT_ID&quot;"></asp:SqlDataSource>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2"
                                        DataTextField="NAME" DataValueField="PROJECT_ID"
                                        SelectedValue='<%# Bind("PROJECTS_PROJECT_ID") %>' CssClass="dropdown-select">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                                        SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;PROJECT_ID&quot; || '_' || &quot;NAME&quot; AS &quot;NAME&quot; FROM &quot;PROJECTS&quot; ORDER BY &quot;PROJECT_ID&quot;"></asp:SqlDataSource>
                                </EditItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                DeleteCommand="DELETE FROM &quot;MILESTONES&quot; WHERE &quot;MILESTONE_ID&quot; = :MILESTONE_ID"
                InsertCommand="INSERT INTO &quot;MILESTONES&quot; (&quot;MILESTONE_ID&quot;, &quot;NAME&quot;, &quot;DUE_DATE&quot;, &quot;PROJECTS_PROJECT_ID&quot;) VALUES (:MILESTONE_ID, :NAME, :DUE_DATE, :PROJECTS_PROJECT_ID)"
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                SelectCommand="SELECT &quot;MILESTONE_ID&quot;, &quot;NAME&quot;, &quot;DUE_DATE&quot;, &quot;PROJECTS_PROJECT_ID&quot; FROM &quot;MILESTONES&quot; ORDER BY &quot;MILESTONE_ID&quot;"
                UpdateCommand="UPDATE &quot;MILESTONES&quot; SET &quot;NAME&quot; = :NAME, &quot;DUE_DATE&quot; = :DUE_DATE, &quot;PROJECTS_PROJECT_ID&quot; = :PROJECTS_PROJECT_ID WHERE &quot;MILESTONE_ID&quot; = :MILESTONE_ID">
                <DeleteParameters>
                    <asp:Parameter Name="MILESTONE_ID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="MILESTONE_ID" Type="Decimal" />
                    <asp:Parameter Name="NAME" Type="String" />
                    <asp:Parameter Name="DUE_DATE" Type="DateTime" />
                    <asp:Parameter Name="PROJECTS_PROJECT_ID" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="NAME" Type="String" />
                    <asp:Parameter Name="DUE_DATE" Type="DateTime" />
                    <asp:Parameter Name="PROJECTS_PROJECT_ID" Type="Decimal" />
                    <asp:Parameter Name="MILESTONE_ID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
