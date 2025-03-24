<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectDetails.aspx.cs" Inherits="DbSarthak.ProjectDetails" MaintainScrollPositionOnPostback="true" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Details</title>
    <link href="/content/bootstrap.min.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="/content/customstyles.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="page-container">
            <!-- Page Header -->
            <div class="page-header">
                <h1 class="page-title">Project Management</h1>
                <a href="Dashboard.aspx" class="dashboard-link">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                        <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
                    </svg>
                    Back to Dashboard
                </a>
            </div>

            <!-- Add New Project Section -->
            <div class="card">
                <h2 class="card-title">Add New Project</h2>
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="PROJECT_ID" DataSourceID="SqlDataSource1" Width="100%" OnPageIndexChanging="FormView1_PageIndexChanging">
                    <InsertItemTemplate>
                        <div class="form-grid">
                            <div class="form-group">
                                <label for="PROJECT_IDTextBox" class="form-label">Project ID:</label>
                                <asp:TextBox ID="PROJECT_IDTextBox" runat="server" Text='<%# Bind("PROJECT_ID") %>' CssClass="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="NAMETextBox" class="form-label">Name:</label>
                                <asp:TextBox ID="NAMETextBox" runat="server" Text='<%# Bind("NAME") %>' CssClass="form-control" />
                            </div>

                            <div class="form-group">
                                <label for="START_DATETextBox" class="form-label">Start Date:</label>
                                <asp:TextBox ID="START_DATETextBox" runat="server" CssClass="form-control" Text='<%# Bind("START_DATE", "{0:yyyy-MM-dd}") %>' TextMode="Date" />
                            </div>
                            <div class="form-group">
                                <label for="DUE_DATETextBox" class="form-label">Due Date:</label>
                                <asp:TextBox ID="DUE_DATETextBox" runat="server" CssClass="form-control" Text='<%# Bind("DUE_DATE", "{0:yyyy-MM-dd}") %>' TextMode="Date" />
                            </div>


                            <div class="form-group">
                                <label for="STATUSTextBox" class="form-label">Status:</label>
                                <asp:DropDownList ID="StatusDropDown" runat="server" CssClass="dropdown-select" SelectedValue='<%# Bind("STATUS") %>'>
                                    <asp:ListItem Text="Planned" Value="Planned" />
                                    <asp:ListItem Text="Ongoing" Value="Ongoing" />
                                    <asp:ListItem Text="Completed" Value="Completed" />
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-actions">
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" />
                            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                        </div>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add New Project" CssClass="btn btn-success" />
                    </ItemTemplate>
                </asp:FormView>
            </div>

            <!-- Project List Section -->
            <div class="card">
                <h2 class="card-title">Project List</h2>
                <div style="overflow-x: auto;">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="PROJECT_ID" DataSourceID="SqlDataSource1"
                        CssClass="data-table" Width="100%" GridLines="None">
                        <Columns>
                            <asp:TemplateField HeaderText="Actions" ItemStyle-Width="120px">
                                <ItemTemplate>
                                    <div class="action-buttons">
                                        <asp:LinkButton ID="btnEdit" runat="server" CommandName="Edit" CssClass="btn btn-warning btn-sm">
                                                                            Edit
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" CssClass="btn btn-danger btn-sm"
                                            OnClientClick="return confirm('Are you sure you want to delete this project?');">
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
                            <asp:BoundField DataField="PROJECT_ID" HeaderText="ID" ReadOnly="True" SortExpression="PROJECT_ID" />
                            <asp:TemplateField HeaderText="Name" SortExpression="NAME">
                                <ItemTemplate>
                                    <%# Eval("NAME") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("NAME") %>' CssClass="form-control" />
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Start Date" SortExpression="START_DATE">
                                <ItemTemplate>
                                    <%# Eval("START_DATE", "{0:d}") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtStartDate" runat="server" Text='<%# Bind("START_DATE", "{0:yyyy-MM-dd}") %>' CssClass="form-control" TextMode="Date" />
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Due Date" SortExpression="DUE_DATE">
                                <ItemTemplate>
                                    <%# Eval("DUE_DATE", "{0:d}") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtDueDate" runat="server" Text='<%# Bind("DUE_DATE", "{0:yyyy-MM-dd}") %>' CssClass="form-control" TextMode="Date" />
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status" SortExpression="STATUS">
                                <ItemTemplate>
                                        <%# Eval("STATUS") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="StatusDropDown" runat="server" CssClass="dropdown-select" SelectedValue='<%# Bind("STATUS") %>'>
                                        <asp:ListItem Text="Planned" Value="Planned" />
                                        <asp:ListItem Text="Ongoing" Value="Ongoing" />
                                        <asp:ListItem Text="Completed" Value="Completed" />
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                DeleteCommand="DELETE FROM &quot;PROJECTS&quot; WHERE &quot;PROJECT_ID&quot; = :PROJECT_ID"
                InsertCommand="INSERT INTO &quot;PROJECTS&quot; (&quot;PROJECT_ID&quot;, &quot;NAME&quot;, &quot;START_DATE&quot;, &quot;DUE_DATE&quot;, &quot;STATUS&quot;) VALUES (:PROJECT_ID, :NAME, :START_DATE, :DUE_DATE, :STATUS)"
                OnSelecting="SqlDataSource1_Selecting"
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;NAME&quot;, &quot;START_DATE&quot;, &quot;DUE_DATE&quot;, &quot;STATUS&quot; FROM &quot;PROJECTS&quot; ORDER BY &quot;PROJECT_ID&quot;"
                UpdateCommand="UPDATE &quot;PROJECTS&quot; SET &quot;NAME&quot; = :NAME, &quot;START_DATE&quot; = :START_DATE, &quot;DUE_DATE&quot; = :DUE_DATE, &quot;STATUS&quot; = :STATUS WHERE &quot;PROJECT_ID&quot; = :PROJECT_ID">
                <DeleteParameters>
                    <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                    <asp:Parameter Name="NAME" Type="String" />
                    <asp:Parameter Name="START_DATE" Type="DateTime" />
                    <asp:Parameter Name="DUE_DATE" Type="DateTime" />
                    <asp:Parameter Name="STATUS" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="NAME" Type="String" />
                    <asp:Parameter Name="START_DATE" Type="DateTime" />
                    <asp:Parameter Name="DUE_DATE" Type="DateTime" />
                    <asp:Parameter Name="STATUS" Type="String" />
                    <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
