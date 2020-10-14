<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucHeader.ascx.cs" Inherits="Benchkart.ucHeader" %>
<style>
    .dropdown-menu > li.kopie > a
    {
        padding-left: 10px;
    }
    .dropdown-submenu
    {
        position: relative;
    }
    .dropdown-submenu > .dropdown-menu
    {
        top: 0;
        left: 100%;
        margin-top: -6px;
        margin-left: -1px;
        -webkit-border-radius: 0 6px 6px 6px;
        -moz-border-radius: 0 6px 6px 6px;
        border-radius: 0 6px 6px 6px;
    }
    .dropdown-submenu > a:after
    {
        border-color: transparent transparent transparent #5a5a5a;;
        border-style: solid;
        border-width: 5px 0 5px 5px;
        content: " ";
        display: block;
        float: right;
        height: 0;
        margin-right: -10px;
        margin-top: 5px;
        width: 0;
    }
    .dropdown-submenu:hover > a:after
    {
        border-left-color: #555;
    }
    .dropdown-menu > li > a:hover, .dropdown-menu > .active > a:hover
    {
        text-decoration: underline;
    }
    @media (max-width: 767px)
    {
        .navbar
        {
            display: none;
        }
    }
    @media (min-width: 768px)
    {
        .navbar
        {
            margin-bottom: 0px;
            min-height: 0px;
            
        }
        ul.nav li:hover > ul.dropdown-menu
        {
            display: block;
        }
        #navbar
        {
            text-align: center;
        }
        .navbar-nav > li > a
        {
            padding-top: 5px;
            padding-bottom: 10px;
            color: Black;
        }
        .navbar-collapse.collapse
        {
            padding-left: 50px;
        }
    }
</style>
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
        background-color: #45a049;
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
<div style="background-color: White; color: Black; display: flow-root; height: 50px;">
    <div style="float: left; margin-left: 30px; margin-top: 12px; font-size: 20px; font-weight: bold; color: #5a5a5a;">
        Benchkart</div>
    <div style="float: right; margin-right: 20px; font-size: 15px; z-index: 1001;">
        <div class="topnav" id="myTopnav">
            <a href="Customer/Signup.aspx?Value=login" style="text-decoration: none;">Login</a> <a href="Customer/Signup.aspx?Value=signup" style="text-decoration: none;">
                Signup</a> <a href="Partner/Signup.aspx" style="background-color: #4CAF50; border-radius: 5px;
                    font-size: 15px; margin-top: 10px; padding: 3px 8px 3px 8px; color: White; margin-left: 10px;
                    text-decoration: none;">IT Partner Signup</a> <a class="icon" onclick="myFunction()">
                        <i class="fa fa-bars"></i></a>
        </div>
    </div>
</div>
<div id="navbar">
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
</div>
