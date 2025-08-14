<%--
  Created by IntelliJ IDEA.
  User: raniii
  Date: 25. 8. 8.
  Time: 오후 2:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta charset="utf-8" />
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
    />
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
    />
    <link rel="stylesheet" href="css/global.css" />
    <link rel="stylesheet" href="css/home.css" />
    <title>Title</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<section class="home-content">
    <div class="sky">
        <img id="logo" src="image/logo.png" alt="Logo" />
        <img id="cloud" src="image/homeImg/signincloud.png" />
        <div class="search-bar">
            <img
                    src="image/homeImg/searchcloud.png"
                    alt="Search"
                    class="search-bg"
            />
            <div class="search-content">
                <span class="search-text">Search Here!</span>
                <img
                        src="image/homeImg/search.png"
                        alt="돋보기"
                        class="search-icon"
                />
            </div>
        </div>
        <c:choose>
            <c:when test="${not empty sessionScope.user}">
                <!-- 로그인한 경우 -->
                <div class="sign-in mypage">
                    <a href="/pet?email=${user.email}">
                        <img src="image/homeImg/signincloud.png" alt="My Page" />
                        <strong>My Page</strong>
                    </a>
                </div>
            </c:when>
            <c:otherwise>
                <!-- 로그인 안한 경우 -->
                <div class="sign-in sign-in">
                    <a href="/login">
                        <img src="image/homeImg/signincloud.png" alt="Sign In" />
                        <strong>Sign in</strong>
                    </a>
                </div>
            </c:otherwise>
        </c:choose>

        <div class="park-container position-relative">
            <div class="park1">
                <img
                        src="image/homeImg/park1.png"
                        class="park1-img"
                        alt="Park Layer 1"
                />
                <img src="image/homeImg/tree-2.png" class="park1-tree2-img" />
                <img src="image/homeImg/tree-3.png" class="park1-tree3-img" />
                <img src="image/homeImg/blackcat.png" class="park-cat-img" />
                <img src="image/homeImg/479-368.png" class="park1-man1-img" />
                <img src="image/homeImg/878-294.png" class="park1-man2-img" />
                <div class="opening-btn">
                    <img
                            src="image/homeImg/opening-btn.png"
                            class="opening-img"
                            alt="공고버튼"
                    />
                    <div class="opening-text">공고 작성<br />하러 가기!!</div>
                </div>
            </div>
            <div class="park2">
                <img
                        src="image/homeImg/park2.png"
                        class="park2-img"
                        alt="Park Layer 2"
                />
                <img src="image/homeImg/671-1060.png" class="park2-dog-img" />
                <img src="image/homeImg/879-989.png" class="park2-man-img" />
                <div class="section">
                    <div class="sec sec-1">
                        <img src="image/homeImg/section.png" class="section-bg" />
                        <img
                                src="image/homeImg/sec1.svg"
                                class="section-illustration-1"
                        />
                        <div class="section-text">
                            여행 갈 때<br /><strong
                                style="color: #ef5d34; font-family: 'Madimi One', cursive"
                        >perpetcare</strong
                        >
                        </div>
                    </div>
                    <div class="sec sec-2">
                        <img src="image/homeImg/section.png" class="section-bg" />
                        <img
                                src="image/homeImg/sec2.png"
                                class="section-illustration-2"
                        />
                        <div class="section-text">
                            안전한 sitter가 필요할 때<br /><strong
                                style="color: #ef5d34; font-family: 'Madimi One', cursive"
                        >perpetcare</strong
                        >
                        </div>
                    </div>
                    <div class="sec sec-3">
                        <img src="image/homeImg/section.png" class="section-bg" />
                        <img
                                src="image/homeImg/sec3.png"
                                class="section-illustration-3"
                        />
                        <div class="section-text">
                            일이 바쁠 때<br /><strong
                                style="color: #ef5d34; font-family: 'Madimi One', cursive"
                        >perpetcare</strong
                        >
                        </div>
                    </div>
                </div>
                <div class="video-wrapper">
                    <div class="video-content">
                        <h4>당신의 가장 가까운 펫시터</h4>
                        <h2>PerpetCare</h2>
                        <h5>혼자 있을 반려동물 걱정은 이제 내려놓으세요.</h5>
                    </div>
                    <iframe width="700" height="400" src="https://www.youtube.com/embed/qEEiyycYXMA?si=kx3DE9OJ2bTqC8vf" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                </div>
            </div>
            <div class="park3">
                <img
                        src="image/homeImg/park3.png"
                        class="park3-img"
                        alt="Park Layer 3"
                />
                <div class="park-spacer"></div>
                <div class="footer-content">
                    <img src="image/footer.png" class="footer-img" />

                    <div class="footer-text-wrapper">
                        <div class="footer-left">
                            <h4>Contact</h4>
                            <p>Taeran Lee</p>
                            <p>Yoenjung Jang</p>
                            <p>Chaeyeon Kawk</p>
                        </div>

                        <div class="footer-right">
                            <h4>Service</h4>
                            <p>펫 시터 매칭 서비스</p>
                        </div>
                    </div>

                    <div class="footer-bottom">
                        © 2025 한국소프트웨어산업협회. All rights reserved.
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
<script>
    const tree2 = document.querySelector(".park1-tree2-img");
    const tree3 = document.querySelector(".park1-tree3-img");
    const cat = document.querySelector(".park-cat-img");

    function jumpCat() {
        cat.classList.remove("tree-hover-jump");
        void cat.offsetWidth;
        cat.classList.add("tree-hover-jump");
    }

    tree2.addEventListener("mouseenter", jumpCat);
    tree3.addEventListener("mouseenter", jumpCat);

    const man = document.querySelector(".park2-man-img");
    const dog = document.querySelector(".park2-dog-img");
    const section = document.querySelector(".park2");

    const barkSound = new Audio("sound/bark.mp3");

    const observer = new IntersectionObserver(
        (entries) => {
            entries.forEach((entry) => {
                if (entry.isIntersecting) {
                    man.classList.add("grow");

                    dog.classList.remove("run");
                    void dog.offsetWidth;
                    dog.classList.add("run");

                    barkSound.currentTime = 0;
                    barkSound.play();
                } else {
                    man.classList.remove("grow");
                }
            });
        },
        {
            threshold: 0.6,
        }
    );

    observer.observe(section);

    document.addEventListener(
        "click",
        () => {
            barkSound.play().then(() => {
                barkSound.pause();
                barkSound.currentTime = 0;
            });
        },
        { once: true }
    );

    $(document).ready(function() {
        $(document).on('click', '.search-bar', function(){
            location.href='/search';
        }); // click
    }); // ready
        $(document).on('click', '.opening-text', function () {
        window.location.href = "/opening/create";
    });
</script>
</html>
