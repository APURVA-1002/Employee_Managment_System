<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="EmployeeManagment.Welcome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .welcome-container {
            margin: 50px auto;
            padding: 20px;
            width: 80%;
            max-width: 600px;
            background-color: #f5f5f5;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .welcome-message {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
            text-align: center;
        }

        .dashboard-section {
            margin-bottom: 30px;
        }

        .dashboard-section h2 {
            font-size: 20px;
            margin-bottom: 10px;
        }

        .dashboard-section ul {
            list-style-type: none;
            padding: 0;
        }

        .dashboard-section li {
            margin-bottom: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="welcome-container">
        <div class="welcome-message">
            Welcome to Employee Management System
        </div>
        <div class="dashboard-section">
            <h2>Dashboard</h2>
            <ul>
                <li>Total Employees: 50</li>
                <li>Total Departments: 5</li>
                <li>Average Salary: $60,000</li>
            </ul>
        </div>
        <div class="dashboard-section">
            <h2>Recent Activity</h2>
            <ul>
                <li>New employee hired - [ABC]</li>
                <li>Meeting scheduled for March 29th, 2024</li>
                <li>Employee performance evaluations due next week</li>
            </ul>
        </div>
        <div class="dashboard-section">
            <h2>Upcoming Events</h2>
            <ul>
                <li>Team building event - March 20th, 2024</li>
                <li>Department meeting - March 25th, 2024</li>
            </ul>
        </div>
        <div class="dashboard-section">
            <h2>Settings</h2>
            <ul>
                <li><a href="EmployeeData.aspx">Employee Details</a></li>
                <li><a href="Register.aspx">Registration Page</a></li>
            </ul>
        </div>
    </div>
</asp:Content>
