<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucCustomerMenu.ascx.cs" Inherits="Benchkart.Customer.ucCustomerMenu" %>

<style>
    .topnav
    {
        overflow: hidden;
    }
    
    .topnav a
    {
        float: left;
        display: block;
        color: #4CAF50;
        text-align: center;
        padding: 14px 10px;
        text-decoration: underline;
        font-size: 15px;
    }
    
    .topnav a:hover
    {
        background-color: #18D26E;
        color: white;
    }
    
    .topnav a.active
    {
        background-color: #4CAF50;
        color: white;
    }
    
    .topnav .icon
    {
        display: none;
    }
    
    @media screen and (max-width: 600px)
    {
        .topnav a:not(:first-child)
        {
            display: none;
        }
        .topnav a.icon
        {
            float: right;
            display: block;
        }
    }
    
    @media screen and (max-width: 600px)
    {
        .topnav.responsive
        {
            position: relative;
        }
        .topnav.responsive .icon
        {
            position: absolute;
            right: 0;
            top: 0;
        }
        .topnav.responsive a
        {
            float: none;
            display: block;
            text-align: left;
        }
    }
</style>
<script>
    function myFunction() {
        var x = document.getElementById("myTopnav");
        if (x.className === "topnav") {
            x.className += " responsive";
        } else {
            x.className = "topnav";
        }
    }

</script>
<div style="background-color: black; color: Black; display: flow-root; height: 60px;">
    <div id="logo" style="float: left;">
                <h1 class="header"><a href="https://www.benchkart.com" style="text-decoration: none;"><span style="color: #18D26E;"><span style="font-size: 34px;">|</span> bench</span><span style="color: #F79507;">kart</span></a></h1>
            </div>
    <div style="float: right; margin-right: 20px; font-size: 15px;">
        <div class="topnav" id="myTopnav">
            <a href="Signin" style="text-decoration: none; color: white;">Sign in</a>
        </div>
    </div>
</div>
<%--<div id="navbar">
    <nav class="navbar" role="navigation">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-1">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              </button>
     
            </div>
            <div class="collapse navbar-collapse" id="navbar-collapse-1" style="border: 1px solid #f5f5f5;">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            <ul class="nav navbar-nav">
        
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Website Development <b class="caret"></b></a> 
          <ul class="dropdown-menu">           
            <li><a href="#">Dropdown Link 1</a></li>
            <li><a href="#">Dropdown Link 2</a></li>
            <li><a href="#">Dropdown Link 3</a></li>   
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">E-commerce <b class="caret"></b></a> 
          <ul class="dropdown-menu">           
            <li><a href="#">Dropdown Link 1</a></li>
            <li><a href="#">Dropdown Link 2</a></li>
            <li><a href="#">Dropdown Link 3</a></li>   
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Digital Marketing <b class="caret"></b></a> 
          <ul class="dropdown-menu">           
            <li><a href="#">Dropdown Link 1</a></li>
            <li><a href="#">Dropdown Link 2</a></li>
            <li><a href="#">Dropdown Link 3</a></li>   
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Mobile App Development  <b class="caret"></b></a> 
          <ul class="dropdown-menu">           
            <li><a href="#">Dropdown Link 1</a></li>
            <li><a href="#">Dropdown Link 2</a></li>
            <li><a href="#">Dropdown Link 3</a></li>   
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Software Support <b class="caret"></b></a> 
          <ul class="dropdown-menu">           
            <li><a href="#">Dropdown Link 1</a></li>
            <li><a href="#">Dropdown Link 2</a></li>
            <li><a href="#">Dropdown Link 3</a></li>   
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Data Entry & Analysis <b class="caret"></b></a> 
          <ul class="dropdown-menu">           
            <li><a href="#">Dropdown Link 1</a></li>
            <li><a href="#">Dropdown Link 2</a></li>
            <li><a href="#">Dropdown Link 3</a></li>   
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Business Support Services <b class="caret"></b></a> 
          <ul class="dropdown-menu">           
            <li><a href="#">Dropdown Link 1</a></li>
            <li><a href="#">Dropdown Link 2</a></li>
            <li><a href="#">Dropdown Link 3</a></li>   
          </ul>
        </li>
      </ul>
            </div>
    <!-- /.navbar-collapse -->
        </nav>
</div>--%>

