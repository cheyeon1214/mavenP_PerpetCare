<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib
        uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>myPage</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta charset="utf-8" />
    <link rel="stylesheet" href="css/global.css" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
    <style>
        .page-container {
            font-family: "Pretendard", sans-serif;
            background-color: #ffffff;
            min-height: 100vh;
        }

        .apply-container {
            display: flex;
            margin-top: 100px;
            padding-bottom:300px;
        }

        .header-left {
            margin-left: 60px !important;
        }

        /* 사이드바 */
        .sidebar {
            position: fixed;
            width: 250px;
            height: 680px;
            background: #64dafe;
            border-radius: 0 0 100px 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            z-index: 200;
            box-shadow: 0 4px 4px rgba(0, 0, 0, 0.25);
        }

        .profile {
            text-align: center;
            background-color: #ffffff;
            border-radius: 28px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.25);
            padding: 15px;
        }

        .profile-img {
            width: 120px;
            height: 120px;
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .info .name {
            font-weight: bold;
            font-size: 18px;
        }

        .info {
            margin-bottom: 5px;
            padding: 5px;
            font-size: 16px;
            font-weight: 500;
            display: flex;
            justify-content: space-around;
        }

        .info-left,
        .info-middle,
        .info-right {
            margin-bottom: 5px;
        }

        .info-right {
            color: #fd9596;
            font-weight: 700;
        }

        .grade-badge {
            height: 16px;
            vertical-align: middle;
        }

        .edit-btn-wrapper1 {
            display: flex;
            justify-content: center;
            margin-top: 10px;
        }

        .edit-btn {
            background-color: white;
            margin-bottom: 10px;
            color: #64dafe;
            padding: 5px 30px;
            border-radius: 10px;
            border: none;
            font-size: 15px;
            font-weight: 800;
            cursor: pointer;
            box-shadow: 0 1px 4px rgba(0, 0, 0, 0.25);
        }

        .nav {
            display: flex;
            flex-direction: column;
            gap: 14px;
            text-align: right;
        }

        .nav a {
            text-decoration: none;
            color: #ffffff;
            padding: 5px;
            border-radius: 6px;
            font-weight: bold;
        }

        .nav a.active {
            background-color: white;
            color: #64dafe;
            font-weight: bold;
        }

        .logout {
            text-align: center;
            margin-top: 20px;
            font-size: 10px;
            text-decoration: none;
        }
    </style>
</head>
<body>
<div class="page-container">
    <%@ include file="/components/header.jsp" %>
    <div class="apply-container">
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
