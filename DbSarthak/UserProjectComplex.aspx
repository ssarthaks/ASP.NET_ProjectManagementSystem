<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserProjectComplex.aspx.cs" Inherits="DbSarthak.UserProjectComplex" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Project Details</title>
    <link href="/content/bootstrap.min.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="/content/complexstyles.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="page-container">
            <!-- Page Header -->
            <div class="page-header">
                <h1 class="page-title">User Project Details</h1>
                <a href="Dashboard.aspx" class="dashboard-link">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                        <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                    </svg>
                    Back to Dashboard
                </a>
            </div>

            <!-- Filter Section -->
            <div class="filter-section">
                <h3 class="filter-label">Select a User to view their project details:</h3>
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource2" DataTextField="NAME_ID" DataValueField="USER_ID" 
                    CssClass="filter-dropdown">
                </asp:DropDownList>
            </div> 

            <!-- Data Section -->
            <div class="data-section">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="USER_ID,PROJECT_ID" DataSourceID="SqlDataSource1" 
                    OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                    CssClass="data-table" Width="100%" GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="USER_ID" HeaderText="User ID" ReadOnly="True" SortExpression="USER_ID" />
                        <asp:BoundField DataField="USER_NAME" HeaderText="Name" SortExpression="USER_NAME" />
                        <asp:BoundField DataField="EMAIL" HeaderText="Email" SortExpression="EMAIL" />
                        <asp:BoundField DataField="ROLE" HeaderText="Role" SortExpression="ROLE" />
                        <asp:BoundField DataField="PHONE" HeaderText="Phone" SortExpression="PHONE" />
                        <asp:BoundField DataField="ADDRESS" HeaderText="Address" SortExpression="ADDRESS" />
                        <asp:BoundField DataField="PROJECT_ID" HeaderText="Project ID" ReadOnly="True" SortExpression="PROJECT_ID" />
                        <asp:BoundField DataField="PROJECT_NAME" HeaderText="Project Name" SortExpression="PROJECT_NAME" />
                        <asp:BoundField DataField="START_DATE" HeaderText="Start Date" SortExpression="START_DATE" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="DUE_DATE" HeaderText="Due Date" SortExpression="DUE_DATE" DataFormatString="{0:d}" />
                        <asp:TemplateField HeaderText="Status" SortExpression="STATUS">
                            <ItemTemplate>
                                <span class='<%# GetStatusClass(Eval("STATUS").ToString()) %>'>
                                    <%# Eval("STATUS") %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                OnSelecting="SqlDataSource2_Selecting" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                SelectCommand="SELECT USER_ID, &quot;USER_ID&quot; || '_' || &quot;NAME&quot; AS &quot;NAME_ID&quot; FROM USERS ORDER BY &quot;USER_ID&quot;">
            </asp:SqlDataSource>
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                SelectCommand="SELECT u.user_id, u.name AS user_name, u.email, u.role, u.phone, u.address, p.project_id, p.name AS project_name, p.start_date, p.due_date, p.status FROM users u JOIN user_projects up ON u.user_id = up.users_user_id JOIN projects p ON up.projects_project_id = p.project_id where u.user_id = :user_id">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="user_id" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>

    <script runat="server">
    protected string GetStatusClass(string status)
    {
        switch (status.ToLower())
        {
            case "completed":
                return "status-completed";
            case "ongoing":
                return "status-in-progress";
            case "planned":
                return "status-pending";
            default:
                return "";
        }
    }
</script>
</body>
</html>