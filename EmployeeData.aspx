<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeeData.aspx.cs" Inherits="EmployeeManagment.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <script type="text/javascript">

        function CalculateSal()
        {
            var grossal = document.getElementById("MainContent_txtgrossal").value;
            var deducts = document.getElementById("MainContent_txtdeducts").value;
            document.getElementById("MainContent_txtnetsal").value = grossal - deducts;
        }

        function ClearControls()
        {
            var ctrls = document.getElementsByTagName('INPUT');
            for (var i = 0; i < ctrls.length; i++)
            {
                if (ctrls[i].id.indexOf("MainContent") >= 0 && ctrls[i].type == 'text')
                    ctrls[i].value = '';
                if (ctrls[i].id.indexOf("MainContent") >= 0 && ctrls[i].type == 'checkbox')
                    ctrls[i].checked = false;
                //if (ctrls[i].id.indexOf("MainContent") >= 0 && ctrls[i].type == 'text')
                    //ctrls[i].selectedIndex = 0;
            }
            return false;

            /*
            document.getElementById("MainContent_txtempid").value = '';
            document.getElementById("MainContent_txtempname").value = '';
            document.getElementById("MainContent_cmbdesignation").selectedIndex = 0;
            document.getElementById("MainContent_txtgrossal").value = '';
            document.getElementById("MainContent_txtdeducts").value = '';
            document.getElementById("MainContent_txtnetsal").value = '';
            document.getElementById("MainContent_chkisactive").checked = false;
            */
        }

        function ValidateData(ctrl, DataType, e)
        {
            debugger;
            var returnflag = true;

            if (DataType == 'int')
            {
                var numbers = '0123456789\b';
                if (numbers.indexOf(e.key.toString()) == -1)
                    returnflag = false;
            }
            if (DataType == 'string')
            {
                var nums = 'abcdefghijklmnopqrstuvwxyz @.-_\b';
                if (nums.indexOf(e.key.toString().toLowerCase()) == -1)
                    returnflag = false;

                if (ctrl.value.split(' ').length >= 3 && e.key == ' ')
                    returnflag = false;
            }
            if (DataType == 'double')
            {
                var nums = '0123456789.\b';
                if (nums.indexOf(e.key.toString()) == -1)
                    returnflag = false;

                if (ctrl.value.indexOf('.') >= 0 && e.key == '.')
                    returnflag = false;
            }
            return returnflag;
        }

        function ValidateControls()
        {
            var returnflag = true;
            if (document.getElementById("MainContent_txtempid").value == '')
            {
                alert("Employee ID can't be null");
                document.getElementById("MainContent_txtempid").focus();
                returnflag = false;
            }
            if (document.getElementById("MainContent_txtempname").value == '') {
                alert("Employee Name can't be null");
                returnflag = false;
            }
            if (document.getElementById("MainContent_txtgrossal").value == '') {
                alert("Gross Salary can't be null");
                returnflag = false;
            }
            if (document.getElementById("MainContent_txtdeducts").value == '') {
                alert("Deductions can't be null");
                returnflag = false;
            }
            if (document.getElementById("MainContent_txtnetsal").value == '') {
                alert("Net Salary can't be null");
                returnflag = false;
            }
            return returnflag;
        }

        function ShowRecords(Row)
        {
            document.getElementById("MainContent_txtempid").value = Row.children[0].innerHTML;
            document.getElementById("MainContent_txtempname").value = Row.children[1].innerHTML;
            document.getElementById("MainContent_cmbdesignation").selectedIndex = Row.children[2].innerHTML;
            document.getElementById("MainContent_txtgrossal").value = Row.children[3].innerHTML;
            document.getElementById("MainContent_txtdeducts").value = Row.children[4].innerHTML;
            document.getElementById("MainContent_txtnetsal").value = Row.children[5].innerHTML;
            if (Row.children[6].innerText == "Y")
                document.getElementById("MainContent_chkisactive").checked = true;
            else
                document.getElementById("MainContent_chkisactive").checked = false;
        }

        function SetColors(Row, color)
        {
            debugger;
            Row.style.backgroundColor = color;
        }

        </script>

    <style>
        /* Style for the table */
        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 8px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        /* Style for form elements */
        .form-input {
            width: calc(100% - 16px);
            padding: 8px;
            box-sizing: border-box;
        }

        /* Style for buttons */
        .btn {
            padding: 8px 20px;
            border: none;
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
            border-radius: 4px;
        }

        .btn:hover {
            background-color: #45a049;
        }

        /* Style for GridView */
        .gridview {
            width: 100%;
            border-collapse: collapse;
        }

        .gridview th, .gridview td {
            padding: 8px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .gridview th {
            background-color: #4CAF50;
            color: white;
        }

        .gridview tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .gridview tr:hover {
            background-color: #ddd;
        }
    </style>

<table border="1" class="styled-table">
    <tr>
        <td>EmployeeID</td>
        <td>
            <asp:TextBox ID="txtempid" runat="server" CssClass="form-input" onkeypress="return ValidateData(this,'int',event);" AutoPostBack="True" OnTextChanged="txtempid_TextChanged"></asp:TextBox>
            <br />
            <asp:HiddenField ID="hdnfndflag" runat="server" Value="false" />
        </td>
    </tr>

    <tr>
        <td>EmployeeName</td>
        <td>
            <asp:TextBox ID="txtempname" runat="server" CssClass="form-input" onkeypress="return ValidateData(this,'string',event);"></asp:TextBox>
        </td>
    </tr>

    <tr>
        <td>Designation</td>
        <td>
            <asp:DropDownList ID="cmbdesignation" runat="server" CssClass="form-input">
                <asp:ListItem>Analyst</asp:ListItem>
                <asp:ListItem>Manager</asp:ListItem>
                <asp:ListItem>TeamLead</asp:ListItem>
                <asp:ListItem>Developer</asp:ListItem>
                <asp:ListItem>Tester</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>

    <tr>
        <td>GrossSalary</td>
        <td>
            <asp:TextBox ID="txtgrossal" runat="server" CssClass="form-input" onkeypress="return ValidateData(this,'double',event);"></asp:TextBox>
        </td>
    </tr>

    <tr>
        <td>Deductions</td>
        <td>
            <asp:TextBox ID="txtdeducts" runat="server" CssClass="form-input" onblur="return CalculateSal();" onkeypress="return ValidateData(this,'double',event);"></asp:TextBox>
        </td>
    </tr>
    
    <tr>
        <td>NetSalary</td>
        <td>
            <asp:TextBox ID="txtnetsal" runat="server" CssClass="form-input"></asp:TextBox>
        </td>
    </tr>

    <tr>
        <td>IsActive</td>
        <td>
            <asp:CheckBox ID="chkisactive" runat="server" />
        </td>
    </tr>

    <tr>
        <td></td>
        <td>
            <asp:Button ID="btnsave" runat="server" Text="Save" CssClass="btn" OnClientClick="return ValidateControls();" OnClick="btnsave_Click" />
            &nbsp;<asp:Button ID="btncancel" runat="server" Text="Cancel" CssClass="btn" OnClientClick="return ClearControls();" />
            &nbsp;<asp:Button ID="btndelete" runat="server" Text="Delete" CssClass="btn" OnClick="btndelete_Click" OnClientClick="return confirm('Do you want to delete?');" />
        </td>
    </tr>
</table>

<asp:GridView ID="grddata" runat="server" CssClass="gridview" OnRowCreated="grddata_RowCreated"></asp:GridView>

</asp:Content>
