<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubtaskDetails.aspx.cs" Inherits="DbSarthak.SubtaskDetails" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Subtask Details</title>
    <link href="/content/bootstrap.min.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="/content/customstyles.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="page-container">
            <!-- Page Header -->
            <div class="page-header">
                <h1 class="page-title">Subtask Management</h1>
                <a href="Dashboard.aspx" class="dashboard-link">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                        <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
                    </svg>
                    Back to Dashboard
                </a>
            </div>

            <!-- Add New Subtask Section -->
            <div class="card">
                <h2 class="card-title">Add New Subtask</h2>
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="SUBTASK_ID" DataSourceID="SqlDataSource1" Width="100%">
                    <InsertItemTemplate>
                        <div class="form-grid">
                            <div class="form-group">
                                <label for="SUBTASK_IDTextBox" class="form-label">Subtask ID:</label>
                                <asp:TextBox ID="SUBTASK_IDTextBox" runat="server" Text='<%# Bind("SUBTASK_ID") %>' CssClass="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="NAMETextBox" class="form-label">Name:</label>
                                <asp:TextBox ID="NAMETextBox" runat="server" Text='<%# Bind("NAME") %>' CssClass="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="START_DATETextBox" class="form-label">Start Date:</label>
                                <asp:TextBox ID="START_DATETextBox" runat="server" Text='<%# Bind("START_DATE") %>' CssClass="form-control" TextMode="Date" />
                            </div>
                            <div class="form-group">
                                <label for="END_DATETextBox" class="form-label">Due Date:</label>
                                <asp:TextBox ID="END_DATETextBox" runat="server" Text='<%# Bind("END_DATE") %>' CssClass="form-control" TextMode="Date" />
                            </div>
                            <div class="form-group">
                                <label for="STATUSTextBox" class="form-label">Status:</label>
                                <asp:DropDownList ID="StatusDropDown" runat="server" CssClass="dropdown-select" SelectedValue='<%# Bind("STATUS") %>'>
                                     <asp:ListItem Text="Planned" Value="Planned" />
 <asp:ListItem Text="Ongoing" Value="Ongoing" />
 <asp:ListItem Text="Completed" Value="Completed" />
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label for="USERS_USER_IDTextBox" class="form-label">User:</label>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3"
                                    DataTextField="NAME" DataValueField="USER_ID"
                                    SelectedValue='<%# Bind("USERS_USER_ID") %>' CssClass="dropdown-select">
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label for="TASKS_TASK_IDTextBox" class="form-label">Task:</label>
                                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2"
                                    DataTextField="NAME" DataValueField="TASK_ID"
                                    SelectedValue='<%# Bind("TASKS_TASK_ID") %>' CssClass="dropdown-select">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-actions">
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" />
                            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                        </div>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add New Subtask" CssClass="btn btn-success" />
                    </ItemTemplate>
                </asp:FormView>
            </div>

            <!-- Subtask List Section -->
            <div class="card">
                <h2 class="card-title">Subtask List</h2>
                <div style="overflow-x: auto;">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="SUBTASK_ID" DataSourceID="SqlDataSource1"
                        CssClass="data-table" Width="100%" GridLines="None">
                        <Columns>
                            <asp:TemplateField HeaderText="Actions" ItemStyle-Width="120px">
                                <ItemTemplate>
                                    <div class="action-buttons">
                                        <asp:LinkButton ID="btnEdit" runat="server" CommandName="Edit" CssClass="btn btn-warning btn-sm">
                                            Edit
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" CssClass="btn btn-danger btn-sm"
                                            OnClientClick="return confirm('Are you sure you want to delete this subtask?');">
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
                            <asp:BoundField DataField="SUBTASK_ID" HeaderText="ID" ReadOnly="True" SortExpression="SUBTASK_ID" />
                            <asp:BoundField DataField="NAME" HeaderText="Name" SortExpression="NAME" ControlStyle-CssClass="form-control" />
                            <asp:TemplateField HeaderText="Start Date" SortExpression="START_DATE">
                                <ItemTemplate>
                                    <%# Eval("START_DATE", "{0:d}") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="START_DATETextBox" runat="server" Text='<%# Bind("START_DATE", "{0:yyyy-MM-dd}") %>' CssClass="form-control" TextMode="Date" />
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Due Date" SortExpression="END_DATE">
                                <ItemTemplate>
                                    <%# Eval("END_DATE", "{0:d}") %>
                                </ItemTemplate>
                                <EditItemTemplate>  
                                    <asp:TextBox ID="END_DATETextBox" runat="server" Text='<%# Bind("END_DATE", "{0:yyyy-MM-dd}") %>' CssClass="form-control" TextMode="Date" />
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
                            <asp:TemplateField HeaderText="User" SortExpression="USERS_USER_ID">
                                <ItemTemplate>
                                    <asp:DropDownList ID="DropDownList3" Enabled="False" runat="server" DataSourceID="SqlDataSource3"
                                        DataTextField="NAME" DataValueField="USER_ID"
                                        SelectedValue='<%# Bind("USERS_USER_ID") %>' CssClass="dropdown-select">
                                    </asp:DropDownList>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList3Edit" runat="server" DataSourceID="SqlDataSource3"
                                        DataTextField="NAME" DataValueField="USER_ID"
                                        SelectedValue='<%# Bind("USERS_USER_ID") %>' CssClass="dropdown-select">
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Task" SortExpression="TASKS_TASK_ID">
                                <ItemTemplate>
                                    <asp:DropDownList ID="DropDownList4" Enabled="False" runat="server" DataSourceID="SqlDataSource2"
                                        DataTextField="NAME" DataValueField="TASK_ID"
                                        SelectedValue='<%# Bind("TASKS_TASK_ID") %>' CssClass="dropdown-select">
                                    </asp:DropDownList>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList4Edit" runat="server" DataSourceID="SqlDataSource2"
                                        DataTextField="NAME" DataValueField="TASK_ID"
                                        SelectedValue='<%# Bind("TASKS_TASK_ID") %>' CssClass="dropdown-select">
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                DeleteCommand="DELETE FROM &quot;SUBTASKS&quot; WHERE &quot;SUBTASK_ID&quot; = :SUBTASK_ID"
                InsertCommand="INSERT INTO &quot;SUBTASKS&quot; (&quot;SUBTASK_ID&quot;, &quot;NAME&quot;, &quot;START_DATE&quot;, &quot;END_DATE&quot;, &quot;USERS_USER_ID&quot;, &quot;STATUS&quot;, &quot;TASKS_TASK_ID&quot;) VALUES (:SUBTASK_ID, :NAME, :START_DATE, :END_DATE, :USERS_USER_ID, :STATUS, :TASKS_TASK_ID)"
                OnSelecting="SqlDataSource1_Selecting"
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                SelectCommand="SELECT &quot;SUBTASK_ID&quot;, &quot;NAME&quot;, &quot;START_DATE&quot;, &quot;END_DATE&quot;, &quot;USERS_USER_ID&quot;, &quot;STATUS&quot;, &quot;TASKS_TASK_ID&quot; FROM &quot;SUBTASKS&quot; ORDER BY &quot;SUBTASK_ID&quot;"
                UpdateCommand="UPDATE &quot;SUBTASKS&quot; SET &quot;NAME&quot; = :NAME, &quot;START_DATE&quot; = :START_DATE, &quot;END_DATE&quot; = :END_DATE, &quot;USERS_USER_ID&quot; = :USERS_USER_ID, &quot;STATUS&quot; = :STATUS, &quot;TASKS_TASK_ID&quot; = :TASKS_TASK_ID WHERE &quot;SUBTASK_ID&quot; = :SUBTASK_ID">
                <DeleteParameters>
                    <asp:Parameter Name="SUBTASK_ID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="SUBTASK_ID" Type="Decimal" />
                    <asp:Parameter Name="NAME" Type="String" />
                    <asp:Parameter Name="START_DATE" Type="DateTime" />
                    <asp:Parameter Name="END_DATE" Type="DateTime" />
                    <asp:Parameter Name="USERS_USER_ID" Type="Decimal" />
                    <asp:Parameter Name="STATUS" Type="String" />
                    <asp:Parameter Name="TASKS_TASK_ID" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="NAME" Type="String" />
                    <asp:Parameter Name="START_DATE" Type="DateTime" />
                    <asp:Parameter Name="END_DATE" Type="DateTime" />
                    <asp:Parameter Name="USERS_USER_ID" Type="Decimal" />
                    <asp:Parameter Name="STATUS" Type="String" />
                    <asp:Parameter Name="TASKS_TASK_ID" Type="Decimal" />
                    <asp:Parameter Name="SUBTASK_ID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                SelectCommand="SELECT &quot;TASK_ID&quot;, &quot;TASK_ID&quot; || '_' || &quot;NAME&quot; AS NAME FROM &quot;TASKS&quot; ORDER BY TASK_ID"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                SelectCommand="SELECT &quot;USER_ID&quot;, &quot;USER_ID&quot; || '_' || &quot;NAME&quot; AS NAME FROM &quot;USERS&quot; ORDER BY USER_ID"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
