<%@ Page Title="About" Language="C#"  AutoEventWireup="true" CodeBehind="Manufacturers.aspx.cs" Inherits="CarFactory.About" %>
<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <link rel="stylesheet" href="/Content/bootstrap.min.css">
    <link rel="stylesheet" href="/Content/GridStyles.css">
</head>

    <body>
    <form runat="server">
        <asp:ScriptManager runat="server">
            <Scripts>
                <%--To learn more about bundling scripts in ScriptManager see https://go.microsoft.com/fwlink/?LinkID=301884 --%>
                <%--Framework Scripts--%>
                <asp:ScriptReference Name="MsAjaxBundle" />
                <asp:ScriptReference Name="jquery" />
                <asp:ScriptReference Name="bootstrap" />
                <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                <asp:ScriptReference Name="WebFormsBundle" />
                <%--Site Scripts--%>
            </Scripts>
        </asp:ScriptManager>
        <div class="jumbotron bg2 text-center">
            <h1>Manufacturers</h1>
        </div>
         <div class="container-fluid">

             <asp:GridView ID="GridViewManufacturers" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows">
                 <Columns>
                     <asp:BoundField DataField="Mf_Name" HeaderText="Manufacturer" SortExpression="Mf_Name" />
                     <asp:BoundField DataField="Mf_Location" HeaderText="Location" SortExpression="Mf_Location" />
                 </Columns>
             </asp:GridView>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CarFactoryConnectionString %>" SelectCommand="SELECT [Mf_Name], [Mf_Location] FROM [Manufacturers]"></asp:SqlDataSource>
              <br />
             <input type="button" value="+ NewManufacturer" class="btn btn-primary" id="newManf" />
            
             <br />
             <br />
             <br />
             <br />
          
        </div>
            <div class="row">
            <div class="col-md-2">
             <div id="f1" style="display:none;">
                <asp:Label ID="LableManfName" runat="server" Text="Name"></asp:Label>
                <asp:TextBox ID="TextManfName" runat="server"></asp:TextBox>
                 <br />
                <asp:Label ID="LabelLocation" runat="server" Text="Location"></asp:Label>
                <asp:TextBox ID="TextLocation" runat="server" style="margin-right: 0px" Width="189px"></asp:TextBox>

                 <br />
                 <br />
                 <br />
                 <br />

                <asp:Button ID="ButtonAdd" runat="server" Text="Add Manufacturer" CssClass="btn btn-default" OnClick="ButtonAdd_Click" />
           </div>        
          </div>
                  <div class="col-md-2">
                <img src="Images/carlogosM.jpg" height="450" width="450" style="margin-left:750px"/>
            </div>
          </div>

        </form>
</body>
    <script type="text/javascript">

        $(document).ready(function () {
            $('#newManf').click(function () {
                $('#f1').toggle();
            });
        });

        </script>
  
</html>

    

