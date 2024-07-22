<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="EmployeeManagment.Resister" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .login-form {
            width: 300px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        .login-form h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .login-form label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .login-form input[type="text"],
        .login-form input[type="password"] {
            width: calc(100% - 12px);
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        .login-form .btn {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 3px;
            background-color: #007bff;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .login-form .btn:hover {
            background-color: #0056b3;
        }
        .login-form .signup-link {
            text-align: center;
            margin-top: 15px;
        }
        .login-form .signup-link a {
            color: #007bff;
            text-decoration: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login-form">
        <h2>Registration Form</h2>
        <form runat="server">
            <div>
                <label for="txtUserId">User ID</label>
                <asp:TextBox ID="txtusername" runat="server" CssClass="form-control" placeholder="Enter your User ID"></asp:TextBox>
            </div>
            <div>
                <label for="txtPassword">Password</label>
                <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter your Password"></asp:TextBox>
            </div>
            <asp:LinkButton ID="lbtnresister" runat="server" CssClass="btn" OnClick="lbtnresister_Click" >Resister</asp:LinkButton>
        </form>
    </div>
</asp:Content>
