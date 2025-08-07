<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>공고 보기</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

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
        margin: 0;
    }

    #title {
        position: fixed;
        top: 180px; /* 헤더 높이때문에 */
        left: 170px;
        font-weight: bold;
        font-size: 40px;
        height: 60px;
        background: white;
        z-index: 0;
        display: flex;
        align-items: center;
    }

    /* 내용 스크롤 영역 */
    #scroll-body {
        position:relative;
        top: 300px; 
        left: 0;
        right: 0;
        bottom: 0;
        z-index: 1;
        box-sizing: border-box;
        background-color: #fff;
    }
    #body-form{
        border-radius: 80px 80px 0 0;
        box-shadow: 0 10px 20px rgba(0,0,0,0.4), 0 20px 20px rgba(0,0,0,0.5);
        height: 2200px;
    }
    .body-center{
        margin: auto;
        width: 600px;
    }
    .sub-title{
        padding-left: 10px;
        font-size: 22px;
        font-weight: 600;
    }
    .sub-title-section{
        padding-top: 50px;
        display: flex;
        align-items: center;
    }
    .profile-card{
        margin-top: 30px;
        display: flex;
        background-color: white;
        border-radius: 5px;
        padding: 20px;
        border-radius: 20px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.16);
        transition: border-color 0.3s, box-shadow 0.3s;
        cursor: pointer;
    }

    .card-section{
        display: flex;
        align-items: center;
    }
    .card-right{
        display: flex;
    }
    .card-right-name{
        padding-left: 20px;
        display: flex;
        flex-direction: column;
        font-weight: 700;
        font-size: 19px;
    }
    .card-right-text{
        padding-left: 50px;
        display: flex;
        flex-direction: column;
        font-weight: 500;
        font-size: 19px;
    }
    .card-name,.card-text{
        padding: 7px;
    }
    .pet-name,.pet-text{
        padding: 4px;
    }
    .card-left img {
        width: 160px;
        height: 160px;
        border-radius: 20px;
        object-fit: cover;
    }
    .method-line{
        display: flex;
        align-items: center;
        padding: 5px;
        margin-top: 20px;
    }
    .method-btn{
        cursor: pointer;
        background-color: white;
        border: none;
        border-radius: 20px;
        width: 216px;
        height: 50px;
        margin-left: 28px;
        font-size: 18px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.16);
    }

    .method-text{
        font-size: 20px;
        margin-left: 10px;
        margin-right: 10px;
    }
    .location-btn{
        background-color: white;
        border: none;
        border-radius: 20px;
        width: 460px;
        height: 50px;
        margin-left: 28px;
        font-size: 18px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.16);
    }
    #location{
        background: url('../../../image/location_icon.png') no-repeat 8px center;
    }
    .pay-dropdown {
        border: 1.5px solid #FD9596;
        border-radius: 50px;
        color: #FD9596;
        font-weight: 600;
        background-color: white;
        padding: 5px 15px;
    }

    .pay-amount {
        display: inline-block;
        margin-left: 10px;
        font-size: 18px;
        font-weight: bold;
        margin-left: 20px;
        width: 150px
    }

    .pay-unit {
        margin-left: 5px;
        font-weight: bold;
        margin-left: 18px;
        font-size: 20px;
    }

    .pay-section{
        display: flex;
        align-items: center;
        margin: 20px;
    }


    .textarea{
        font-size: 20px;
        font-weight: 500;
        margin: 20px;
    }

    .submit-button{
        display: block; 
        margin: auto;
        margin-top: 100px;
        width: 300px;
        height: 50px;
        font-size: 22px;
        color: white;
        background-color: #64DAFE;
        border: none;
        border-radius: 15px;
    }


    
</style>
<body>
    <%@ include file="/components/header.jsp" %>


    <div id="title">공고 보기</div>

    <!-- 스크롤 영역 -->
    <div id="scroll-body">
        <div id="body-form">
            <div class="body-center">
                <div class="sub-title-section">
                    <img src="../../../image/subtitle_line.svg" alt="line">
                    <span class="sub-title">공고자</span>
                </div>
                <div class="profile-card">
                    <div class="card-section">
                        <div class="card-left">
                            <img src="../../../image/default1.svg" alt="profileImg">
                        </div>
                        <div class="card-right">
                            <div class="card-right-name">
                                <div class="card-name">이메일</div>
                                <div class="card-name">성별</div>
                                <div class="card-name">연령대</div>
                                <div class="card-name">등급</div>
                            </div>

                            <div class="card-right-text">
                                <div class="card-text">${opening.uEmail}</div>
                                <c:choose>
                                    <c:when test="${user.gender == 'f'}">
                                        <div class="card-text">여성</div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="card-text">남성</div>
                                    </c:otherwise>
                                </c:choose>
                                <div class="card-text">${user.ageGroup}</div>
                                <div class="card-text">${user.grade}</div>
                            </div>
                            
                        </div>
                    </div>
                </div>
                <div class="sub-title-section">
                    <img src="../../../image/subtitle_line.svg" alt="line">
                    <span class="sub-title">돌봄 반려동물</span>
                </div>

                <div class="pet-slider">
                    <c:forEach var="pet" items="${opening.pets}">
                    <div class="profile-card" id="pet-profile">
                        <div class="card-section">
                            <div class="card-left">
                                <img src="../../../image/petImage2.png" alt="petImg" class="petImg">
                            </div>
                            <div class="card-right">
                                <div class="card-right-name">
                                    <div class="pet-name">이름</div>
                                    <div class="pet-name">종</div>
                                    <div class="pet-name">품종</div>
                                    <div class="pet-name">성별</div>
                                    <div class="pet-name">나이</div>
                                </div>

                                <div class="card-right-text">
                                    <div class="pet-text">${pet.name}</div>
                                    <div class="pet-text">${pet.species}</div>
                                    <div class="pet-text">${pet.breed}</div>
                                    <c:choose>
                                        <c:when test="${pet.gender == 'f'}">
                                            <div class="pet-text">암컷</div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="pet-text">수컷</div>
                                        </c:otherwise>
                                    </c:choose>
                                    <div class="pet-text">
                                        ${pet.getAge()}
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    </c:forEach>

                </div>

                <div class="sub-title-section">
                    <img src="../../../image/subtitle_line.svg" alt="line">
                    <span class="sub-title">돌봄 방법 및 기간</span>
                </div>

                <div class="method-section">
                    <div class="method-line">
                        <div class="method-text">돌봄방법</div>
                        <input type="button" class="location-btn" value="${opening.careWay}" id="method">
                    </div>
                    <div class="method-line">
                        <div class="method-text">돌봄위치</div>
                        <input type="button" class="location-btn" value="${opening.location}" id="location">
                    </div>
                    <div class="method-line">
                        <div class="method-text">돌봄기간</div>
                        <input type="button" class="location-btn period" value="${opening.sDate}" data-toggle="modal" data-target="#myModal">
                    </div>
                    
                </div>

                <div class="sub-title-section">
                    <img src="../../../image/subtitle_line.svg" alt="line">
                    <span class="sub-title">가격</span>
                </div>

                <div class="pay-section">
                    <div class="pay-dropdown">${opening.per}</div>
                    <div class="pay-amount">${opening.price} 원</div>
                </div>

                <div class="sub-title-section">
                    <img src="../../../image/subtitle_line.svg" alt="line">
                    <span class="sub-title">우대사항</span>
                </div>
                <div class="textarea" id="prefer">
                    ${opening.prefer}
                </div>
                
                <div class="sub-title-section">
                    <img src="../../../image/subtitle_line.svg" alt="line">
                    <span class="sub-title">추가 안내 사항</span>
                </div>
                <div class="textarea" id="detail">
                    ${opening.detail}
                </div>

                <div id="button-wrapper"></div>
                    <input type="button" class="submit-button" value="지원하기">
                </div>
            </div>
        </div>
</body>
</html>