<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MilestonesData.aspx.cs" Inherits="DbSarthak.MilestonesData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;MILESTONES&quot; WHERE &quot;MILESTONE_ID&quot; = :MILESTONE_ID" InsertCommand="INSERT INTO &quot;MILESTONES&quot; (&quot;MILESTONE_ID&quot;, &quot;NAME&quot;, &quot;DUE_DATE&quot;, &quot;PROJECTS_PROJECT_ID&quot;) VALUES (:MILESTONE_ID, :NAME, :DUE_DATE, :PROJECTS_PROJECT_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;MILESTONE_ID&quot;, &quot;NAME&quot;, &quot;DUE_DATE&quot;, &quot;PROJECTS_PROJECT_ID&quot; FROM &quot;MILESTONES&quot; ORDER BY &quot;MILESTONE_ID&quot;" UpdateCommand="UPDATE &quot;MILESTONES&quot; SET &quot;NAME&quot; = :NAME, &quot;DUE_DATE&quot; = :DUE_DATE, &quot;PROJECTS_PROJECT_ID&quot; = :PROJECTS_PROJECT_ID WHERE &quot;MILESTONE_ID&quot; = :MILESTONE_ID">
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
            <br />
            The milestone details are given below:<br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MILESTONE_ID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="MILESTONE_ID" HeaderText="MILESTONE_ID" ReadOnly="True" SortExpression="MILESTONE_ID" />
                    <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
                    <asp:BoundField DataField="DUE_DATE" HeaderText="DUE_DATE" SortExpression="DUE_DATE" />
                    <asp:BoundField DataField="PROJECTS_PROJECT_ID" HeaderText="PROJECTS_PROJECT_ID" SortExpression="PROJECTS_PROJECT_ID" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="MILESTONE_ID" DataSourceID="SqlDataSource1">
                <EditItemTemplate>
                    MILESTONE_ID:
                    <asp:Label ID="MILESTONE_IDLabel1" runat="server" Text='<%# Eval("MILESTONE_ID") %>' />
                    <br />
                    NAME:
                    <asp:TextBox ID="NAMETextBox" runat="server" Text='<%# Bind("NAME") %>' />
                    <br />
                    DUE_DATE:
                    <asp:TextBox ID="DUE_DATETextBox" runat="server" Text='<%# Bind("DUE_DATE") %>' />
                    <br />
                    PROJECTS_PROJECT_ID:
                    <asp:TextBox ID="PROJECTS_PROJECT_IDTextBox" runat="server" Text='<%# Bind("PROJECTS_PROJECT_ID") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    MILESTONE_ID:
                    <asp:TextBox ID="MILESTONE_IDTextBox" runat="server" Text='<%# Bind("MILESTONE_ID") %>' />
                    <br />
                    NAME:
                    <asp:TextBox ID="NAMETextBox" runat="server" Text='<%# Bind("NAME") %>' />
                    <br />
                    DUE_DATE:
                    <asp:TextBox ID="DUE_DATETextBox" runat="server" Text='<%# Bind("DUE_DATE") %>' />
                    <br />
                    PROJECTS_PROJECT_ID:
                    <asp:TextBox ID="PROJECTS_PROJECT_IDTextBox" runat="server" Text='<%# Bind("PROJECTS_PROJECT_ID") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                   <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>
        </div>
    </form>
</body>
</html>
