<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="DbSarthak.Dashboard" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
    <link href="/content/bootstrap.min.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="/content/dashboardstyles.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="dashboard-container">
            <!-- Dashboard Header -->
            <div class="dashboard-header">
                <h1 class="dashboard-title">LS Corporation Project Management Dashboard</h1>
            </div>
            
            <!-- Main Dashboard Grid -->
            <div class="dashboard-grid">
                <!-- Menu Section -->
                <div class="menu-section">
                    <h2 class="menu-title">Reports & Management</h2>
                    <div class="menu-grid">
                        <!-- Reports -->
                        <a href="TopPerformerComplex.aspx" class="menu-item report">
                            Top Performer Report
                        </a>
                        <a href="UserProjectComplex.aspx" class="menu-item report">
                            User Project Details Report
                        </a>
                        <a href="ProjectMilestoneComplex.aspx" class="menu-item report">
                            Project Milestone Details Report
                        </a>
                        
                        <!-- Management -->
                        <a href="UserDetails.aspx" class="menu-item management">
                            User Details Management
                        </a>
                        <a href="ProjectDetails.aspx" class="menu-item management">
                            Project Details Management
                        </a>
                        <a href="MilestoneDetails.aspx" class="menu-item management">
                            Milestones Details Management
                        </a>
                        <a href="TaskDetails.aspx" class="menu-item management">
                            Task Details Management
                        </a>
                        <a href="SubtaskDetails.aspx" class="menu-item management">
                            Subtask Details Management
                        </a>
                    </div>
                </div>
                
                <!-- Charts Section -->
                <div class="charts-section">
                    <div class="charts-header">
                        <h2 class="charts-title">Visual Representations</h2>
                    </div>
                    
                    <div class="charts-grid">
                        <!-- First Row of Charts -->
                        <div class="chart-card half">
                            <h3 class="chart-title">Project Status Distribution</h3>
                            <div class="chart-container">
                                <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" Height="312px" Width="355px">
                                    <Series>
                                        <asp:Series ChartType="Pie" Name="Series1" XValueMember="STATUS" YValueMembers="project_count" Label="#VALX: #VALY (#PERCENT{P0})" LabelForeColor="Black">
                                        </asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea3">
                                            <AxisX Title="Status" />
                                            <AxisY Title="Project Count" />
                                        </asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT STATUS, COUNT(*) AS project_count
                                FROM PROJECTS
                                GROUP BY STATUS"></asp:SqlDataSource>
                            </div>
                        </div>
                        
                        <div class="chart-card half">
                            <h3 class="chart-title">Task Count by Status</h3>
                            <div class="chart-container">
                                <asp:Chart ID="Chart3" runat="server" DataSourceID="SqlDataSource3" Width="612px" Height="342px">
                                    <Series>
                                        <asp:Series Name="Series1" XValueMember="STATUS" YValueMembers="TASK_COUNT">
                                        </asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1">
                                            <AxisX Title="Status" TitleFont="Microsoft Sans Serif, 12pt" />
                                            <AxisY Title="Task Count" TitleFont="Microsoft Sans Serif, 12pt" />
                                        </asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT STATUS, COUNT(*) AS task_count
                                FROM TASKS
                                GROUP BY STATUS
                                ORDER BY task_count DESC
                                "></asp:SqlDataSource>
                            </div>
                        </div>
                        
                        <!-- Second Row of Charts -->
                        <div class="chart-card full">
                            <h3 class="chart-title">Average Project Duration by Month</h3>
                            <div class="chart-container">
                                <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource2" Width="1007px" Height="346px">
                                    <Series>
    <asp:Series ChartType="Line" Name="Series1" XValueMember="MONTH" YValueMembers="AVG_DURATION" Label="#VALY" LabelBackColor="White" >
    </asp:Series>
</Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1">
                                            <AxisX Title="Month" TitleFont="Microsoft Sans Serif, 12pt" />
                                            <AxisY Title="Average Duration (Days)" TitleFont="Microsoft Sans Serif, 12pt" />
                                        </asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT TO_CHAR(START_DATE, 'YYYY-MM') AS month,
                                        AVG(DUE_DATE - START_DATE) AS avg_duration
                                FROM PROJECTS
                                GROUP BY TO_CHAR(START_DATE, 'YYYY-MM')
                                ORDER BY month"></asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>