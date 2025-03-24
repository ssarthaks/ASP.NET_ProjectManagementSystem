<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TopPerformerComplex.aspx.cs" Inherits="DbSarthak.TopPerformerComplex" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Top Performer Details</title>
    <link href="/content/bootstrap.min.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="/content/complexstyles.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="page-container">
            <!-- Page Header -->
            <div class="page-header">
                <h1 class="page-title">Top Performer Details</h1>
                <a href="Dashboard.aspx" class="dashboard-link">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                        <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                    </svg>
                    Back to Dashboard
                </a>
            </div>

            <!-- Filter Section -->
            <div class="filter-section">
                <h3 class="filter-label">Select a Project to view its top performers:</h3>
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource2" DataTextField="NAME" DataValueField="PROJECT_ID" 
                    CssClass="filter-dropdown">
                </asp:DropDownList>
            </div> 

            <!-- Data Section -->
            <div class="data-section">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="USER_ID" DataSourceID="SqlDataSource1" 
                    CssClass="data-table" Width="100%" GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="USER_ID" HeaderText="ID" ReadOnly="True" SortExpression="USER_ID" />
                        <asp:BoundField DataField="USER_NAME" HeaderText="Name" SortExpression="USER_NAME" />
                        <asp:BoundField DataField="EMAIL" HeaderText="Email" SortExpression="EMAIL" />
                        <asp:BoundField DataField="ROLE" HeaderText="Role" SortExpression="ROLE" />
                        <asp:BoundField DataField="PHONE" HeaderText="Phone" SortExpression="PHONE" />
                        <asp:BoundField DataField="ADDRESS" HeaderText="Address" SortExpression="ADDRESS" />
                        <asp:BoundField DataField="TASKS_COMPLETED" HeaderText="Tasks Completed" SortExpression="TASKS_COMPLETED" />
                    </Columns>
                </asp:GridView>
            </div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                SelectCommand="
                    SELECT * FROM (
                        SELECT u.user_id, 
                               u.name AS user_name, 
                               u.email, 
                               u.role, 
                               u.phone, 
                               u.address, 
                               (SELECT COUNT(*)
                                FROM user_tasks ut 
                                JOIN tasks t ON ut.tasks_task_id = t.task_id
                                WHERE ut.users_user_id = u.user_id 
                                  AND t.status = 'Completed' 
                                  AND t.projects_project_id = :project_id
                               ) AS tasks_completed
                        FROM users u
                        ORDER BY tasks_completed DESC
                    )
                    WHERE ROWNUM <= 3
                ">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="project_id" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;NAME&quot; FROM &quot;PROJECTS&quot;">
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>