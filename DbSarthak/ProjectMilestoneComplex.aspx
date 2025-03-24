<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectMilestoneComplex.aspx.cs" Inherits="DbSarthak.ProjectMilestoneComplex" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Milestone Details</title>
    <link href="/content/bootstrap.min.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="/content/complexstyles.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="page-container">
            <!-- Page Header -->
            <div class="page-header">
                <h1 class="page-title">Project Milestone Details</h1>
                <a href="Dashboard.aspx" class="dashboard-link">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                        <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
                    </svg>
                    Back to Dashboard
                </a>
            </div>

            <!-- Filter Section -->
            <div class="filter-section">
                <h3 class="filter-label">Select a Project to view its milestones:</h3>
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"
                    DataSourceID="SqlDataSource2" DataTextField="NAME" DataValueField="PROJECT_ID"
                    CssClass="filter-dropdown">
                </asp:DropDownList>
            </div>

            <!-- Data Section -->
            <div class="data-section">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="PROJECT_ID,MILESTONE_ID" DataSourceID="SqlDataSource1"
                    CssClass="data-table" Width="100%" GridLines="None">
                    <Columns>
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
                        <asp:BoundField DataField="MILESTONE_ID" HeaderText="Milestone ID" ReadOnly="True" SortExpression="MILESTONE_ID" />
                        <asp:BoundField DataField="MILESTONE_NAME" HeaderText="Milestone Name" SortExpression="MILESTONE_NAME" />
                        <asp:BoundField DataField="MILESTONE_DUE_DATE" HeaderText="Milestone Due Date" SortExpression="MILESTONE_DUE_DATE" DataFormatString="{0:d}" />
                    </Columns>
                </asp:GridView>
            </div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                SelectCommand="SELECT p.project_id, p.name AS project_name, p.start_date, p.due_date, p.status, m.milestone_id, m.name AS milestone_name, m.due_date AS milestone_due_date FROM projects p JOIN milestones m ON p.project_id = m.projects_project_id where p.project_id = :project_id">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="project_id" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;NAME&quot; FROM &quot;PROJECTS&quot;"></asp:SqlDataSource>
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
