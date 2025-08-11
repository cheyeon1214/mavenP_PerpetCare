<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>공고 지원</title>
    <link rel="stylesheet" href="../../../css/global.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- Chart.js CDN -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>
    <script>

    </script>
</head>
<style>
    body {
        box-sizing: border-box;
        font-family: "Pretendard", sans-serif;
    }

    .body-section {
        width: 1000px;
        margin: auto;
    }

    .header-top {
        height: 100px;
        background-color: white;
    }

    .title {
        margin-top: 70px;
        font-size: 38px;
        font-weight: bold;
        margin-bottom: 15px;
    }

    .container-box {
        margin: auto;
        border: 1.5px solid #ddd;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.16);
        border-radius: 20px;
        padding-bottom: 20px;
    }

    .pet-section {
        display: flex;
        margin: 30px;
        align-items: center;
    }

    #pet-img {
        width: 170px;
        height: 170px;
        border-radius: 20px;
        object-fit: cover;
    }

    .pet-name, .pet-text {
        padding: 4px;
    }

    .card-pet-left {
        margin-left: 30px;
        padding-left: 20px;
        display: flex;
        flex-direction: column;
        font-weight: 700;
        font-size: 19px;
    }

    .card-pet-right {
        margin-left: 50px;
        display: flex;
        flex-direction: column;
        font-weight: 500;
        font-size: 19px;
    }

    #line {
        margin: 30px;
        border: 1px solid rgb(182, 182, 182);
    }

    .opening-section {
        display: flex;
        padding: 20px;
    }

    .method {
        width: 30%;
        padding-left: 20px;
    }

    .period {
        width: 40%;
        padding-left: 20px;
    }

    .price {
        width: 30%;
        padding-left: 20px;
    }

    .prefer {
        width: 60%;
        padding-left: 20px;
    }

    .sub-title {
        font-size: 21px;
        font-weight: 700;
    }

    .sub-text {
        font-size: 20px;
        margin-top: 5px;
        margin-left: 10px;
    }


    .applicant-table thead tr {
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.16);
        border-radius: 20px;
    }

    .applicant-table thead th {
        background-color: rgba(100, 218, 254, 0.5);
        padding: 20px;
        font-weight: 600;

        font-size: 19px;
    }

    .applicant-table thead tr th:first-child {
        border-top-left-radius: 20px;
        border-bottom-left-radius: 20px;
    }

    .applicant-table thead tr th:last-child {
        border-top-right-radius: 20px;
        border-bottom-right-radius: 20px;
    }

    .applicant-table tbody tr {
        background: white;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.16);
        border-radius: 20px;
    }

    .applicant-table tbody tr td:first-child {
        border-top-left-radius: 20px;
        border-bottom-left-radius: 20px;
    }

    .applicant-table tbody tr td:last-child {
        border-top-right-radius: 20px;
        border-bottom-right-radius: 20px;
    }

    .applicant-table tbody td {
        padding: 20px;
        vertical-align: middle;
    }

    .gif {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        text-align: center;
        position: relative;
    }

    .gif-text {
        font-size: 40px;
        font-weight: bold;
        position: absolute;
        top: 80%;
        z-index: 1;
    }

    .action-links a{
        text-decoration: none;
        color: black;
        margin: 40px;
    }
    .action-links{
        justify-content: center;
        display: flex;
    }
    .divider{
        display: flex;
        align-items: center;
    }

</style>

<body>
<%@ include file="/components/header.jsp" %>
<div class="header-top"></div>
<div class="body-section">
    <div class="title">공고</div>
    <div class="container-box">
        <div class="pet-section">
            <div class="pet-img">
                <img src="data:image/jpeg;base64,${firstPet.base64Image}" alt="petImg" id="pet-img">
            </div>
            <div class="card-pet-left">
                <div class="pet-name">이름</div>
                <div class="pet-name">종</div>
                <div class="pet-name">품종</div>
                <div class="pet-name">성별</div>
                <div class="pet-name">나이</div>
            </div>
            <div class="card-pet-right">
                <div class="pet-text">${firstPet.name}</div>
                <div class="pet-text">${firstPet.species}</div>
                <div class="pet-text">${firstPet.breed}</div>
                <c:choose>
                    <c:when test="${firstPet.gender == 'f'}">
                        <div class="pet-text">암컷</div>
                    </c:when>
                    <c:otherwise>
                        <div class="pet-text">수컷</div>
                    </c:otherwise>
                </c:choose>
                <div class="pet-text">${firstPet.age}</div>
            </div>
        </div>
        <hr id="line">
        <div class="opening-section">
            <div class="method">
                <div class="sub-title">돌봄 방법</div>
                <div class="sub-text">${opening.careWay}</div>
            </div>
            <div class="period">
                <div class="sub-title">돌봄 기간</div>
                <div class="sub-text">${sDateStr} ~ ${eDateStr}</div>
            </div>
            <div class="price">
                <div class="sub-title">가격</div>
                <div class="sub-text">${opening.price}원 / ${opening.per}</div>
            </div>
        </div>
        <div class="opening-section">
            <div class="method">
                <div class="sub-title">돌봄 주소</div>
                <div class="sub-text">${opening.location}</div>
            </div>
            <div class="prefer">
                <div class="sub-title">우대사항</div>
                <div class="sub-text">${opening.prefer}</div>
            </div>
        </div>
    </div>
    <div class="gif">
        <dotlottie-wc
                src="https://lottie.host/0d8e16fa-73d1-4aa3-a00d-b5ee87fbd105/l0hO5FXkad.lottie"
                style="width: 600px;height: 600px;display: block;"
                speed="0.6"
                autoplay
                loop
        ></dotlottie-wc>
        <p class="gif-text">지원 완료!</p>
    </div>
    <div class="action-links">
        <a href="/home.jsp" class="home-link">홈으로 가기</a>
        <span class="divider">|</span>
        <a href="/search" class="apply-link">다른 공고 보러가기</a>
    </div>
</div>
<div class="footer-space"></div>
<script
        src="https://unpkg.com/@lottiefiles/dotlottie-wc@0.6.2/dist/dotlottie-wc.js"
        type="module"
></script>
</body>
</html>