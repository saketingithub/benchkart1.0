<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Post-COVID.aspx.cs" Inherits="Benchkart.PostCOVID" %>

<!DOCTYPE html>

<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <% if(!Benchkart.AppSettings.isDevelopmentMode()) { %>
            <script async src="https://www.googletagmanager.com/gtag/js?id=UA-142828286-2"></script>
            window.dataLayer = window.dataLayer || [];
            function gtag() { dataLayer.push(arguments); }
            gtag('js', new Date());

            gtag('config', 'UA-142828286-2');
    <% } %>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Post COVID</title>
    <meta content="Post COVID - Get Ready for the New Normal" name="description">
    <meta content="Post, COVID, Business, Digital, Software" name="keywords">

    <!-- Favicons -->
    <link href="favicon.ico" rel="icon">
    <link href="assetscovid/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="assetscovid/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assetscovid/vendor/icofont/icofont.min.css" rel="stylesheet">
    <link href="assetscovid/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="assetscovid/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="assetscovid/vendor/venobox/venobox.css" rel="stylesheet">
    <link href="assetscovid/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="assetscovid/vendor/aos/aos.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="assetscovid/css/style.css" rel="stylesheet">
</head>

<body>

    <!-- ======= Header ======= -->
    <header id="header" class="fixed-top ">
        <div class="container d-flex align-items-center justify-content-between">

            <h3><a href="https://www.benchkart.com" class="scrollto"><span style="color: #18D26E;">bench</span><span style="color: coral;">kart</span></a></h3>
            <!-- Uncomment below if you prefer to use an image logo -->
            <!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

            <%--  <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li class="active"><a href="index.html">Home</a></li>
          <li><a href="#about">About</a></li>
          <li><a href="#services">Services</a></li>
          <li><a href="#portfolio">Portfolio</a></li>
          <li><a href="#team">Team</a></li>
          <li class="drop-down"><a href="">Drop Down</a>
            <ul>
              <li><a href="#">Drop Down 1</a></li>
              <li class="drop-down"><a href="#">Deep Drop Down</a>
                <ul>
                  <li><a href="#">Deep Drop Down 1</a></li>
                  <li><a href="#">Deep Drop Down 2</a></li>
                  <li><a href="#">Deep Drop Down 3</a></li>
                  <li><a href="#">Deep Drop Down 4</a></li>
                  <li><a href="#">Deep Drop Down 5</a></li>
                </ul>
              </li>
              <li><a href="#">Drop Down 2</a></li>
              <li><a href="#">Drop Down 3</a></li>
              <li><a href="#">Drop Down 4</a></li>
            </ul>
          </li>
          <li><a href="#contact">Contact</a></li>

        </ul>
      </nav>--%><!-- .nav-menu -->

            <a href="https://www.benchkart.com" class="get-started-btn scrollto">Home</a>

        </div>
    </header>
    <!-- End Header -->

    <!-- ======= Hero Section ======= -->
    <section id="hero" class="d-flex align-items-center justify-content-center">
        <div class="container" data-aos="fade-up">

            <div class="row justify-content-center" data-aos="fade-up" data-aos-delay="150">
                <div class="col-xl-6 col-lg-8">
                    <h1>Get Ready for the New Normal</h1>
                </div>
            </div>

            <%-- <div class="row mt-5 justify-content-center" data-aos="zoom-in" data-aos-delay="250">
        <div class="col-xl-2 col-md-4 col-6">
          <div class="icon-box">
            <i class="ri-store-line"></i>
            <h3><a href="Customer/Post_Project?id=18">Websites by experts</a></h3>
          </div>
        </div>
        <div class="col-xl-2 col-md-4 col-6 ">
          <div class="icon-box">
            <i class="ri-bar-chart-box-line"></i>
            <h3><a href="Customer/Post_Project?id=23">Monthly packages for marketing</a></h3>
          </div>
        </div>
        <div class="col-xl-2 col-md-4 col-6 mt-4 mt-md-0">
          <div class="icon-box">
            <i class="ri-calendar-todo-line"></i>
            <h3><a href="Customer/Post_Project?id=32">Lead Generation for B2B</a></h3>
          </div>
        </div>
        <div class="col-xl-2 col-md-4 col-6 mt-4 mt-xl-0">
          <div class="icon-box">
            <i class="ri-paint-brush-line"></i>
            <h3><a href="Customer/Post_Project?id=27">Social Media Marketing</a></h3>
          </div>
        </div>
        <div class="col-xl-2 col-md-4 col-6 mt-4 mt-xl-0">
          <div class="icon-box">
            <i class="ri-database-2-line"></i>
            <h3><a href="Customer/Post_Project?id=51">Outbound Calling</a></h3>
          </div>
        </div>
      </div>--%>
        </div>
    </section>
    <!-- End Hero -->

    <main id="main">

        <!-- ======= About Section ======= -->
        <section id="about" class="about">
            <div class="container" data-aos="fade-up">

                <div class="row">
                    <div class="col-lg-6 order-1 order-lg-2" data-aos="fade-left" data-aos-delay="100">
                        <img src="assetscovid/img/COVID2b.png" class="img-fluid" alt="" />

                    </div>
                    <div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content" data-aos="fade-right" data-aos-delay="100">
                        <h3>What are the learnings from how 250+ businesses are coping with COVID19 impact?</h3>
                        <p class="font-italic">
                            Kislay Kumar, our CEO, summarizes "This is the time to choose wisely. Companies must analyse which block they are in, based on the Lockdown impact (High, Low) & Long-term impact (High, Low). We recommend 4 strategies depending on which block they are in".
                        </p>
                        <ul>
                            <li><i class="ri-check-double-line"></i><b>Invest</b>: If your business is not negatively impacted by the lockdown, this is a good time to invest into marketing & set the business up for future. Take advantage of the downturn to get good deals on your IT infrastructure upgradation, process outsourcing or cloud migration. Industries like ed-tech, specific players in pharma & health, business consulting and e-retailing are investing a lot right now.</li>
                            <li><i class="ri-check-double-line"></i><b>Pilot</b>: On the other extreme, industries like travel & tourism, bars & restaurants, sports & fitness have both a short term & long-term challenge, unless they try new approaches. They also should not spend excessively on these new approaches. Quick small-scale pilot projects are an effective way to test new ideas. Finding reliable partners in this journey is key to long term success.</li>
                            <li><i class="ri-check-double-line"></i><b>Digitize</b>: Industries like Retail, esp. of essential goods, had minimal impact in the short term, but are likely to be impacted by increase in e-commerce in the longer term. Business owners here need to look at improving online presence, increasing digital marketing and adding services like home delivery and digital payments.</li>
                            <li><i class="ri-check-double-line"></i><b>Conserve</b>:  Some businesses, esp. Start-ups were impacted more due to the challenges with finding talent & capital. Re-directing the spends from full time employees into out-sourcing, from office spaces to work from home, and from traditional media to social media are some of the ways they are smartening up in the short run to keep the dreams for a great future alive.</li>
                        </ul>

                    </div>
                </div>

            </div>
        </section>
        <!-- End About Section -->

        <!-- ======= Clients Section ======= -->
        <%-- <section id="clients" class="clients">
      <div class="container" data-aos="zoom-in">

        <div class="owl-carousel clients-carousel">
          <img src="assetscovid/img/clients/client-1.png" alt="">
          <img src="assetscovid/img/clients/client-2.png" alt="">
          <img src="assetscovid/img/clients/client-3.png" alt="">
          <img src="assetscovid/img/clients/client-4.png" alt="">
          <img src="assetscovid/img/clients/client-5.png" alt="">
          <img src="assetscovid/img/clients/client-6.png" alt="">
          <img src="assetscovid/img/clients/client-7.png" alt="">
          <img src="assetscovid/img/clients/client-8.png" alt="">
        </div>

      </div>
    </section>--%><!-- End Clients Section -->

        <!-- ======= Features Section ======= -->
        <section id="features" class="features">
            <div class="container" data-aos="fade-up">
                <div class="row">
                   
                    <div class="image col-lg-6" style='background-image: url("assetscovid/img/features.jpg");' data-aos="fade-right"></div>
                    <div class="col-lg-6" data-aos="fade-left" data-aos-delay="100">
                         <h4>Based on these experiences, we recommend you to look at 5 of the below projects for your business. </h4><br />
                        <div class="icon-box mt-5 mt-lg-0" data-aos="zoom-in" data-aos-delay="150">
                            <i class="bx bx-receipt"></i>
                            <h4>Websites by experts</h4>
                            <p>New technologies, improved features & SEO and integration of ecommerce will ensure that your online presence is helping you transform & grow. Look out for agencies with relevant experience so that they can add to your plans rather than just execute. Study reference websites to plan your feature list & layout better.</p>
                        </div>
                        <div class="icon-box mt-5" data-aos="zoom-in" data-aos-delay="150">
                            <i class="bx bx-cube-alt"></i>
                            <h4>Monthly packages for marketing</h4>
                            <p>Many of us know about digital marketing, but find it hard to take the first step. We have worked with leading digital marketing agencies to create starter monthly packages. Seek our Free consultation services to begin the journey.</p>
                        </div>
                        <div class="icon-box mt-5" data-aos="zoom-in" data-aos-delay="150">
                            <i class="bx bx-images"></i>
                            <h4>Lead Generation for B2B</h4>
                            <p>While all companies benefit from an efficient lead generation strategy, its role in B2B businesses is even more. Be clear on your target segment and selling proposition, and then work with experts in the field.</p>
                        </div>
                        <div class="icon-box mt-5" data-aos="zoom-in" data-aos-delay="150">
                            <i class="bx bx-shield"></i>
                            <h4>Social Media Marketing</h4>
                            <p>Organizations, big & small are seeing dramatic shift in spend from traditional media into social media. Use of Facebook, Instagram, Twitter & Linkedin, apart from Google has created new avenues for companies to engage with customers, influencers and partners. </p>
                        </div>
                        <div class="icon-box mt-5" data-aos="zoom-in" data-aos-delay="150">
                            <i class="bx bx-receipt"></i>
                            <h4>Outbound Calling</h4>
                            <p>As geography coverage & field sales execution has become difficult, do try out outbound calling to reach partners, customers or influencers. Our quality agencies & project management processes will help you have complete ‘peace of mind’ when you outsource through us. </p>
                        </div>
                    </div>
                </div>

            </div>
        </section>
        <!-- End Features Section -->

        <!-- ======= Services Section ======= -->
       <%-- <section id="services" class="services">
            <div class="container" data-aos="fade-up">

                <div class="section-title">
                    <h2>Services</h2>
                    <p>Check our Services</p>
                </div>

                <div class="row">
                    <div class="col-lg-4 col-md-6 d-flex align-items-stretch" data-aos="zoom-in" data-aos-delay="100">
                        <div class="icon-box">
                            <div class="icon"><i class="bx bxl-dribbble"></i></div>
                            <h4><a href="">Lorem Ipsum</a></h4>
                            <p>Voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi</p>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0" data-aos="zoom-in" data-aos-delay="200">
                        <div class="icon-box">
                            <div class="icon"><i class="bx bx-file"></i></div>
                            <h4><a href="">Sed ut perspiciatis</a></h4>
                            <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore</p>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0" data-aos="zoom-in" data-aos-delay="300">
                        <div class="icon-box">
                            <div class="icon"><i class="bx bx-tachometer"></i></div>
                            <h4><a href="">Magni Dolores</a></h4>
                            <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia</p>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="100">
                        <div class="icon-box">
                            <div class="icon"><i class="bx bx-world"></i></div>
                            <h4><a href="">Nemo Enim</a></h4>
                            <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis</p>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="200">
                        <div class="icon-box">
                            <div class="icon"><i class="bx bx-slideshow"></i></div>
                            <h4><a href="">Dele cardo</a></h4>
                            <p>Quis consequatur saepe eligendi voluptatem consequatur dolor consequuntur</p>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="300">
                        <div class="icon-box">
                            <div class="icon"><i class="bx bx-arch"></i></div>
                            <h4><a href="">Divera don</a></h4>
                            <p>Modi nostrum vel laborum. Porro fugit error sit minus sapiente sit aspernatur</p>
                        </div>
                    </div>

                </div>

            </div>
        </section>--%>
        <!-- End Services Section -->

        <!-- ======= Cta Section ======= -->
        <section id="cta" class="cta">
            <div class="container" data-aos="zoom-in">

                <div class="text-center">
                    <h3>Post Project For Free</h3>
                    <p>Find & work with the Right Agency for the Right Price. Get India’s finest agencies across Digital Marketing, IT Services & BPO to work for you. Have complete ‘peace of mind’ with our processes for Quality, Safety & Support.</p>
                    <a class="cta-btn" href="Customer/Post_Project">Post Your Project</a>
                </div>

            </div>
        </section>
        <!-- End Cta Section -->

        <!-- ======= Portfolio Section ======= -->
   <%--     <section id="portfolio" class="portfolio">
            <div class="container" data-aos="fade-up">

                <div class="section-title">
                    <h2>Portfolio</h2>
                    <p>Check our Portfolio</p>
                </div>

                <div class="row" data-aos="fade-up" data-aos-delay="100">
                    <div class="col-lg-12 d-flex justify-content-center">
                        <ul id="portfolio-flters">
                            <li data-filter="*" class="filter-active">All</li>
                            <li data-filter=".filter-app">App</li>
                            <li data-filter=".filter-card">Card</li>
                            <li data-filter=".filter-web">Web</li>
                        </ul>
                    </div>
                </div>

                <div class="row portfolio-container" data-aos="fade-up" data-aos-delay="200">

                    <div class="col-lg-4 col-md-6 portfolio-item filter-app">
                        <div class="portfolio-wrap">
                            <img src="assetscovid/img/portfolio/portfolio-1.jpg" class="img-fluid" alt="">
                            <div class="portfolio-info">
                                <h4>App 1</h4>
                                <p>App</p>
                                <div class="portfolio-links">
                                    <a href="assetscovid/img/portfolio/portfolio-1.jpg" data-gall="portfolioGallery" class="venobox" title="App 1"><i class="bx bx-plus"></i></a>
                                    <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6 portfolio-item filter-web">
                        <div class="portfolio-wrap">
                            <img src="assetscovid/img/portfolio/portfolio-2.jpg" class="img-fluid" alt="">
                            <div class="portfolio-info">
                                <h4>Web 3</h4>
                                <p>Web</p>
                                <div class="portfolio-links">
                                    <a href="assetscovid/img/portfolio/portfolio-2.jpg" data-gall="portfolioGallery" class="venobox" title="Web 3"><i class="bx bx-plus"></i></a>
                                    <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6 portfolio-item filter-app">
                        <div class="portfolio-wrap">
                            <img src="assetscovid/img/portfolio/portfolio-3.jpg" class="img-fluid" alt="">
                            <div class="portfolio-info">
                                <h4>App 2</h4>
                                <p>App</p>
                                <div class="portfolio-links">
                                    <a href="assetscovid/img/portfolio/portfolio-3.jpg" data-gall="portfolioGallery" class="venobox" title="App 2"><i class="bx bx-plus"></i></a>
                                    <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6 portfolio-item filter-card">
                        <div class="portfolio-wrap">
                            <img src="assetscovid/img/portfolio/portfolio-4.jpg" class="img-fluid" alt="">
                            <div class="portfolio-info">
                                <h4>Card 2</h4>
                                <p>Card</p>
                                <div class="portfolio-links">
                                    <a href="assetscovid/img/portfolio/portfolio-4.jpg" data-gall="portfolioGallery" class="venobox" title="Card 2"><i class="bx bx-plus"></i></a>
                                    <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6 portfolio-item filter-web">
                        <div class="portfolio-wrap">
                            <img src="assetscovid/img/portfolio/portfolio-5.jpg" class="img-fluid" alt="">
                            <div class="portfolio-info">
                                <h4>Web 2</h4>
                                <p>Web</p>
                                <div class="portfolio-links">
                                    <a href="assetscovid/img/portfolio/portfolio-5.jpg" data-gall="portfolioGallery" class="venobox" title="Web 2"><i class="bx bx-plus"></i></a>
                                    <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6 portfolio-item filter-app">
                        <div class="portfolio-wrap">
                            <img src="assetscovid/img/portfolio/portfolio-6.jpg" class="img-fluid" alt="">
                            <div class="portfolio-info">
                                <h4>App 3</h4>
                                <p>App</p>
                                <div class="portfolio-links">
                                    <a href="assetscovid/img/portfolio/portfolio-6.jpg" data-gall="portfolioGallery" class="venobox" title="App 3"><i class="bx bx-plus"></i></a>
                                    <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6 portfolio-item filter-card">
                        <div class="portfolio-wrap">
                            <img src="assetscovid/img/portfolio/portfolio-7.jpg" class="img-fluid" alt="">
                            <div class="portfolio-info">
                                <h4>Card 1</h4>
                                <p>Card</p>
                                <div class="portfolio-links">
                                    <a href="assetscovid/img/portfolio/portfolio-7.jpg" data-gall="portfolioGallery" class="venobox" title="Card 1"><i class="bx bx-plus"></i></a>
                                    <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6 portfolio-item filter-card">
                        <div class="portfolio-wrap">
                            <img src="assetscovid/img/portfolio/portfolio-8.jpg" class="img-fluid" alt="">
                            <div class="portfolio-info">
                                <h4>Card 3</h4>
                                <p>Card</p>
                                <div class="portfolio-links">
                                    <a href="assetscovid/img/portfolio/portfolio-8.jpg" data-gall="portfolioGallery" class="venobox" title="Card 3"><i class="bx bx-plus"></i></a>
                                    <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6 portfolio-item filter-web">
                        <div class="portfolio-wrap">
                            <img src="assetscovid/img/portfolio/portfolio-9.jpg" class="img-fluid" alt="">
                            <div class="portfolio-info">
                                <h4>Web 3</h4>
                                <p>Web</p>
                                <div class="portfolio-links">
                                    <a href="assetscovid/img/portfolio/portfolio-9.jpg" data-gall="portfolioGallery" class="venobox" title="Web 3"><i class="bx bx-plus"></i></a>
                                    <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </section>--%>
        <!-- End Portfolio Section -->

        <!-- ======= Counts Section ======= -->
        <section id="counts" class="counts">
            <div class="container" data-aos="fade-up">

                <div class="row no-gutters">
                    <div class="image col-xl-5 d-flex align-items-stretch justify-content-center justify-content-lg-start" data-aos="fade-right" data-aos-delay="100"></div>
                    <div class="col-xl-7 pl-0 pl-lg-5 pr-lg-1 d-flex align-items-stretch" data-aos="fade-left" data-aos-delay="100">
                        <div class="content d-flex flex-column justify-content-center">
                            <h3>Partner with agencies which are industry experts</h3>
                            <p>
                                The right agency partner will not only execute your plans but bring their own wealth of experience to add to your plans.
                            </p>
                            <div class="row">
                                <div class="col-md-6 d-md-flex align-items-md-stretch">
                                    <div class="count-box">
                                        <i class="icofont-simple-smile"></i>
                                        <span data-toggle="counter-up">100</span><span>+</span>
                                        <p><strong>Agencies</strong> in each major category including Websites, Digital Marketing, Mobile Applications and Software Development.</p>
                                    </div>
                                </div>

                                <div class="col-md-6 d-md-flex align-items-md-stretch">
                                    <div class="count-box">
                                        <i class="icofont-document-folder"></i>
                                        <span data-toggle="counter-up">51</span>
                                        <p><strong>Cities</strong> in India represented by Agencies on our platform. More than 3/4th of them also serve SMEs in US, Europe, Middle East & Asia Pacific.</p>
                                    </div>
                                </div>

                                <div class="col-md-6 d-md-flex align-items-md-stretch">
                                    <div class="count-box">
                                        <i class="icofont-clock-time"></i>
                                        <span>2:43</span>
                                        <p><strong>Hours </strong> have been spent on an average by our consultants on every customer who needed help getting their project defined</p>
                                    </div>
                                </div>

                                <div class="col-md-6 d-md-flex align-items-md-stretch">
                                    <div class="count-box">
                                        <i class="icofont-award"></i>
                                        <span data-toggle="counter-up">15</span>
                                        <p><strong>Point checklist</strong> has been used by us to review each agency including customer ratings, infrastructure, online reputation, management, ownership structure and industry experience.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End .content-->
                    </div>
                </div>

            </div>
        </section>
        <!-- End Counts Section -->

        <!-- ======= Testimonials Section ======= -->
      <%--  <section id="testimonials" class="testimonials">
            <div class="container" data-aos="zoom-in">

                <div class="owl-carousel testimonials-carousel">

                    <div class="testimonial-item">
                        <img src="assetscovid/img/testimonials/testimonials-1.jpg" class="testimonial-img" alt="">
                        <h3>Saul Goodman</h3>
                        <h4>Ceo &amp; Founder</h4>
                        <p>
                            <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                            Proin iaculis purus consequat sem cure digni ssim donec porttitora entum suscipit rhoncus. Accusantium quam, ultricies eget id, aliquam eget nibh et. Maecen aliquam, risus at semper.
              <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                        </p>
                    </div>

                    <div class="testimonial-item">
                        <img src="assetscovid/img/testimonials/testimonials-2.jpg" class="testimonial-img" alt="">
                        <h3>Sara Wilsson</h3>
                        <h4>Designer</h4>
                        <p>
                            <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                            Export tempor illum tamen malis malis eram quae irure esse labore quem cillum quid cillum eram malis quorum velit fore eram velit sunt aliqua noster fugiat irure amet legam anim culpa.
              <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                        </p>
                    </div>

                    <div class="testimonial-item">
                        <img src="assetscovid/img/testimonials/testimonials-3.jpg" class="testimonial-img" alt="">
                        <h3>Jena Karlis</h3>
                        <h4>Store Owner</h4>
                        <p>
                            <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                            Enim nisi quem export duis labore cillum quae magna enim sint quorum nulla quem veniam duis minim tempor labore quem eram duis noster aute amet eram fore quis sint minim.
              <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                        </p>
                    </div>

                    <div class="testimonial-item">
                        <img src="assetscovid/img/testimonials/testimonials-4.jpg" class="testimonial-img" alt="">
                        <h3>Matt Brandon</h3>
                        <h4>Freelancer</h4>
                        <p>
                            <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                            Fugiat enim eram quae cillum dolore dolor amet nulla culpa multos export minim fugiat minim velit minim dolor enim duis veniam ipsum anim magna sunt elit fore quem dolore labore illum veniam.
              <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                        </p>
                    </div>

                    <div class="testimonial-item">
                        <img src="assetscovid/img/testimonials/testimonials-5.jpg" class="testimonial-img" alt="">
                        <h3>John Larson</h3>
                        <h4>Entrepreneur</h4>
                        <p>
                            <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                            Quis quorum aliqua sint quem legam fore sunt eram irure aliqua veniam tempor noster veniam enim culpa labore duis sunt culpa nulla illum cillum fugiat legam esse veniam culpa fore nisi cillum quid.
              <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                        </p>
                    </div>

                </div>

            </div>
        </section>--%>
        <!-- End Testimonials Section -->

        <!-- ======= Team Section ======= -->
       <%-- <section id="team" class="team">
            <div class="container" data-aos="fade-up">

                <div class="section-title">
                    <h2>Team</h2>
                    <p>Check our Team</p>
                </div>

                <div class="row">

                    <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
                        <div class="member" data-aos="fade-up" data-aos-delay="100">
                            <div class="member-img">
                                <img src="assetscovid/img/team/team-1.jpg" class="img-fluid" alt="">
                                <div class="social">
                                    <a href=""><i class="icofont-twitter"></i></a>
                                    <a href=""><i class="icofont-facebook"></i></a>
                                    <a href=""><i class="icofont-instagram"></i></a>
                                    <a href=""><i class="icofont-linkedin"></i></a>
                                </div>
                            </div>
                            <div class="member-info">
                                <h4>Walter White</h4>
                                <span>Chief Executive Officer</span>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
                        <div class="member" data-aos="fade-up" data-aos-delay="200">
                            <div class="member-img">
                                <img src="assetscovid/img/team/team-2.jpg" class="img-fluid" alt="">
                                <div class="social">
                                    <a href=""><i class="icofont-twitter"></i></a>
                                    <a href=""><i class="icofont-facebook"></i></a>
                                    <a href=""><i class="icofont-instagram"></i></a>
                                    <a href=""><i class="icofont-linkedin"></i></a>
                                </div>
                            </div>
                            <div class="member-info">
                                <h4>Sarah Jhonson</h4>
                                <span>Product Manager</span>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
                        <div class="member" data-aos="fade-up" data-aos-delay="300">
                            <div class="member-img">
                                <img src="assetscovid/img/team/team-3.jpg" class="img-fluid" alt="">
                                <div class="social">
                                    <a href=""><i class="icofont-twitter"></i></a>
                                    <a href=""><i class="icofont-facebook"></i></a>
                                    <a href=""><i class="icofont-instagram"></i></a>
                                    <a href=""><i class="icofont-linkedin"></i></a>
                                </div>
                            </div>
                            <div class="member-info">
                                <h4>William Anderson</h4>
                                <span>CTO</span>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
                        <div class="member" data-aos="fade-up" data-aos-delay="400">
                            <div class="member-img">
                                <img src="assetscovid/img/team/team-4.jpg" class="img-fluid" alt="">
                                <div class="social">
                                    <a href=""><i class="icofont-twitter"></i></a>
                                    <a href=""><i class="icofont-facebook"></i></a>
                                    <a href=""><i class="icofont-instagram"></i></a>
                                    <a href=""><i class="icofont-linkedin"></i></a>
                                </div>
                            </div>
                            <div class="member-info">
                                <h4>Amanda Jepson</h4>
                                <span>Accountant</span>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </section>--%>
        <!-- End Team Section -->

        <!-- ======= Contact Section ======= -->
       <%-- <section id="contact" class="contact">
            <div class="container" data-aos="fade-up">

                <div class="section-title">
                    <h2>Contact</h2>
                    <p>Contact Us</p>
                </div>

                <div>
                    <iframe style="border: 0; width: 100%; height: 270px;" src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12097.433213460943!2d-74.0062269!3d40.7101282!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xb89d1fe6bc499443!2sDowntown+Conference+Center!5e0!3m2!1smk!2sbg!4v1539943755621" frameborder="0" allowfullscreen></iframe>
                </div>

                <div class="row mt-5">

                    <div class="col-lg-4">
                        <div class="info">
                            <div class="address">
                                <i class="icofont-google-map"></i>
                                <h4>Location:</h4>
                                <p>A108 Adam Street, New York, NY 535022</p>
                            </div>

                            <div class="email">
                                <i class="icofont-envelope"></i>
                                <h4>Email:</h4>
                                <p>info@example.com</p>
                            </div>

                            <div class="phone">
                                <i class="icofont-phone"></i>
                                <h4>Call:</h4>
                                <p>+1 5589 55488 55s</p>
                            </div>

                        </div>

                    </div>

                    <div class="col-lg-8 mt-5 mt-lg-0">

                        <form action="forms/contact.php" method="post" role="form" class="php-email-form">
                            <div class="form-row">
                                <div class="col-md-6 form-group">
                                    <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                                    <div class="validate"></div>
                                </div>
                                <div class="col-md-6 form-group">
                                    <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email" />
                                    <div class="validate"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" />
                                <div class="validate"></div>
                            </div>
                            <div class="form-group">
                                <textarea class="form-control" name="message" rows="5" data-rule="required" data-msg="Please write something for us" placeholder="Message"></textarea>
                                <div class="validate"></div>
                            </div>
                            <div class="mb-3">
                                <div class="loading">Loading</div>
                                <div class="error-message"></div>
                                <div class="sent-message">Your message has been sent. Thank you!</div>
                            </div>
                            <div class="text-center">
                                <button type="submit">Send Message</button>
                            </div>
                        </form>

                    </div>

                </div>

            </div>
        </section>--%>
        <!-- End Contact Section -->

    </main><!-- End #main -->

    <!-- ======= Footer ======= -->
       <footer id="footer">
            <div class="footer-top">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-3 col-md-6 footer-info">
                            <h1>benchkart</h1>
                            <p>Benchkart is a new age digital marketplace for procurement of digital B2B services. Founded by an erstwhile member of Microsoft India Leadership, we are committed to solving the challenges in procurement of services, especially for start-ups and small businesses across the world.</p>
                        </div>

                        <div class="col-lg-3 col-md-6 footer-links">
                            <h4>Useful Links</h4>
                            <ul>
                                <li><i class="ion-ios-arrow-right"></i><a href="https://www.benchkart.com">Home</a></li>
                                <li><i class="ion-ios-arrow-right"></i><a href="About" target="_blank">About us</a></li>
                                <li><i class="ion-ios-arrow-right"></i><a href="Html/Faq.html" target="_blank">FAQs</a></li>
                                <li><i class="ion-ios-arrow-right"></i><a href="Partner/Signup">Become a Partner</a></li>
                                <li><i class="ion-ios-arrow-right"></i><a href="Policies/Terms-of-use-for-Clients.html" target="_blank">TERMS OF USE FOR CLIENTS</a></li>
                                <li><i class="ion-ios-arrow-right"></i><a href="Policies/Terms-of-use-for-Partners.html" target="_blank">TERMS OF USE FOR PARTNERS</a></li>
                                <li><i class="ion-ios-arrow-right"></i><a href="Policies/Benchkart-Privacy-Policy.html" target="_blank">PRIVACY POLICY</a></li>

                            </ul>
                        </div>

                        <div class="col-lg-3 col-md-6 footer-contact">
                            <h4>Contact Us</h4>
                            <p>
                                DW 254, Nirvana Country
                            <br>
                                Gurgaon, Haryana  122018<br>
                                India
                            <br>
                                <strong>Phone:</strong> +91 9911780051<br>
                                <strong>Email:</strong> outsource@benchkart.com<br>
                            </p>

                           <%-- <div class="social-links">
                                <a href="https://twitter.com/benchkart?ref_src=twsrc%5Etfw" target="_blank" class="twitter"><i class="fa fa-twitter"></i></a>
                                <a href="https://facebook.com/benchkart-111486960437160" target="_blank" class="bxl-facebook"><i class="fa fa-facebook"></i></a>
                               
                                <a href="https://linkedin.com/company/benchkart" class="linkedin" target="_blank"><i class="fa fa-linkedin"></i></a>
                            </div>--%>

                        </div>

                        <div class="col-lg-3 col-md-6 footer-newsletter">
                            <h4>BECOME A PARTNER</h4>
                            <p>We are inviting only a few of India's top rated (mid-sized) agencies to join the benchkart platform. If you feel your domain expertise & innovation can add value to our customers, please let our assessment team know.</p>
                            <%--<form action="" method="post">
                            <input type="email" name="email"><input type="submit" value="Subscribe">
                        </form>--%>
                        </div>

                    </div>
                </div>
            </div>

            <div class="container">
                <div class="copyright">
                    &copy; Copyright <strong>2020 Benchkart Services Pvt Ltd</strong>. All Rights Reserved
                </div>
                <div class="credits">
                </div>
            </div>
            <!--Start of Tawk.to Script-->
            <%--<script type="text/javascript">
                var Tawk_API = Tawk_API || {}, Tawk_LoadStart = new Date();
                (function () {
                    var s1 = document.createElement("script"), s0 = document.getElementsByTagName("script")[0];
                    s1.async = true;
                    s1.src = 'https://embed.tawk.to/5d983f3fdb28311764d765fe/default';
                    s1.charset = 'UTF-8';
                    s1.setAttribute('crossorigin', '*');
                    s0.parentNode.insertBefore(s1, s0);
                })();
            </script>--%>
            <!--End of Tawk.to Script-->



        </footer>
    <!-- End Footer -->

    <a href="#" class="back-to-top"><i class="ri-arrow-up-line"></i></a>
    <div id="preloader"></div>

    <!-- Vendor JS Files -->
    <script src="assetscovid/vendor/jquery/jquery.min.js"></script>
    <script src="assetscovid/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assetscovid/vendor/jquery.easing/jquery.easing.min.js"></script>
    <script src="assetscovid/vendor/php-email-form/validate.js"></script>
    <script src="assetscovid/vendor/owl.carousel/owl.carousel.min.js"></script>
    <script src="assetscovid/vendor/isotope-layout/isotope.pkgd.min.js"></script>
    <script src="assetscovid/vendor/venobox/venobox.min.js"></script>
    <script src="assetscovid/vendor/waypoints/jquery.waypoints.min.js"></script>
    <script src="assetscovid/vendor/counterup/counterup.min.js"></script>
    <script src="assetscovid/vendor/aos/aos.js"></script>

    <!-- Template Main JS File -->
    <script src="assetscovid/js/main.js"></script>

</body>

</html>
