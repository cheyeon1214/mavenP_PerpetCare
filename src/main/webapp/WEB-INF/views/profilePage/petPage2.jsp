<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib
        uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>myPage</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta charset="utf-8" />
    <link rel="stylesheet" href="css/global.css" />
    <link rel="stylesheet" href="../../../css/experiencePage.css" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <!-- Bootstrap CSS -->
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
    />
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>
</head>
<body>
<div class="page-container">
    <%@ include file="/components/header.jsp" %>
    <div class="pet-container">
        <!-- Sidebar -->
        <aside class="sidebar">
            <div class="sidebar-top">
                <div class="profile">
                    <img
                            src="../../../image/profile_1.svg"
                            alt="프로필"
                            class="profile-img"
                    />
                    <div class="info">
                        <div class="name">taeran</div>
                    </div>
                    <div class="info">
                        <div class="info-left">
                            <div class="grede-text">등급</div>
                            <div class="gender-text">성별</div>
                            <div class="age-text">연령대</div>
                        </div>
                        <div class="info-middle">
                            <img
                                    class="grade-badge"
                                    src="../../../image/grade/grade_Silver.svg"
                                    alt="grade-badge"
                            />
                        </div>
                        <div class="info-right">
                            <div class="grade">Silver</div>
                            <div class="gender">여성</div>
                            <div class="age">20대</div>
                        </div>
                    </div>
                </div>
                <div class="edit-btn-wrapper1">
                    <button class="edit-btn">수정</button>
                </div>
                <div class="nav">
                    <a href="#" class="active">반려동물</a>
                    <a href="/experiencePage" >경험</a>
                    <a href="#">올린 공고</a>
                    <a href="#">신청한 공고</a>
                    <a href="#">최근 본 공고</a>
                </div>
            </div>
            <div class="logout"><a href="#">로그아웃</a></div>
        </aside>

        <!-- Main Content -->
        <div class="container">
            <main class="pet-main">



            </main>
        </div>
    </div>

</div>
</body>
</html>
