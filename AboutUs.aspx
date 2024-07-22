<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="EmployeeManagment.AboutUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        /* CSS styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
        }

        .hero img {
            display: block;
            margin: 0 auto;
            max-width: 100%;
            height: auto;
            margin-bottom: 20px;
        }

        h2 {
            text-align: center;
        }

        p {
            text-align: center;
        }
    </style>
    <section class="hero">
        <h2>Welcome to Our Employee Management System</h2>
        <img src="https://cdn.iconscout.com/icon/free/png-256/free-employee-3704498-3085814.png" alt="Employee Management System">
    </section>

    <section class="mission">
        <h2>Our Mission</h2>
        <p>We provide innovative solutions to simplify employee management processes.</p>
    </section>

    <section class="team">
        <h2>Meet the Team</h2>
        <p>Our team consists of dedicated professionals committed to excellence.</p>
    </section>

    <section class="technology">
        <h2>Technology Stack</h2>
        <p>We use modern technologies such as ASP.NET, C#, HTML, CSS, and JavaScript.</p>
    </section>

    <section class="values">
        <h2>Our Values</h2>
        <p>Customer Satisfaction, Innovation, Integrity.</p>
    </section>

    <section class="testimonials">
        <h2>Testimonials</h2>
        <p>"The Employee Management System has revolutionized the way we handle our workforce. Highly recommended!"</p>
        <p>- Happy Customer</p>
    </section>
</asp:Content>
