<%@ Page Title="About" Language="C#"  AutoEventWireup="true" CodeBehind="Cars.aspx.cs" Inherits="CarFactory.Contact" %>
<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <link rel="stylesheet" href="/Content/bootstrap.min.css">
    <link rel="stylesheet" href="/Content/GridStyles.css">
    <style>
       body{
            background-color:gainsboro;
        }
    </style>
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
            <h1>Cars</h1>
            <%--<img src="Images/Ferrari.jpg" class="img-responsive img-circle" style="display:inline" alt="Bird" width="350" height="350" />--%>
        </div>
         <div class="container-fluid">
             <asp:GridView ID="GridViewCars" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" CssClass="mydatagrid" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" width="750px">
                 <Columns>
                     <asp:BoundField DataField="Car_Name" HeaderText="Car_Name" SortExpression="Car_Name" />
                     <asp:BoundField DataField="Year_of_release" HeaderText="Year_of_release" SortExpression="Year_of_release" />
                     <asp:BoundField DataField="Mf_Name" HeaderText="Mf_Name" SortExpression="Mf_Name" />
                 </Columns>
             </asp:GridView>
             <input type="button" id="addbtn" class="btn btn-primary" value="+Add NewCar" />
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CarFactoryConnectionString %>" SelectCommand="SELECT [Car_Name], [Year_of_release],m.Mf_Name FROM [Cars] c,[Manufacturers] m where c.MfID=m.MfID"></asp:SqlDataSource>
        </div>
        <div class="row">
        <div class="col-md-2">
        <div class="panel panel-primary" id="AddCarForm" style="display:none; margin-top: 50px; width:600px;">
            <div class="panel-heading">Fill the new car details</div>
            <asp:Label ID="LableCarName" runat="server" Text="Car Name"></asp:Label>
            <asp:TextBox ID="TextCarName" runat="server" Width="188px"></asp:TextBox>
            <br />
              <asp:Label ID="LabelYrRelease" runat="server" Text="Year Of Release"></asp:Label>
              <asp:TextBox ID="TextYrRelease" runat="server"></asp:TextBox>   
                 <br />
                 <asp:Label ID="LabelManf" runat="server" Text="Label">Manufacturer</asp:Label>
                 <asp:DropDownList ID="DropDownList1" runat="server" ></asp:DropDownList>
        <p>
            &nbsp;</p>
        <p>          
          <asp:Button ID="ButtonAddCar" runat="server" Text="Add Car" CssClass="btn btn-default" OnClick="ButtonAddCar_Click"/>
             </p>
        </div>
        </div>
        <div class="col-md-2">
            <img src="Images/car-logos-5.jpg" height="450" width="450" style="margin-left:600px"/>
        </div>
        </div>
        </form>

        
</body>
    <script type="text/javascript">

        $(document).ready(function () {
            $('#addbtn').click(function () {
                $('#AddCarForm').toggle();
            });
        });

        </script>
</html>

    

