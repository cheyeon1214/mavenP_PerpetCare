<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>공고 작성하기</title>
<!-- 1. jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).on("click", ".profile-card", function() {
        $(this).toggleClass("selected");
    });
</script>
</head>
<style>
    body {
        margin: 0;
    }

    #title {
        position: fixed;
        top: 180px; /* 헤더 높이만큼 아래 */
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
        border-radius: 80px;
        box-shadow: 0 10px 20px rgba(0,0,0,0.4), 0 20px 20px rgba(0,0,0,0.5);
        height: 2000px;
    }
    .body-center{
        margin: auto;
        width: 600px;
    }
    .sub-title{
        padding-left: 10px;
        font-size: 20px;
        font-weight: 700;
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
        box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);
        transition: border-color 0.3s, box-shadow 0.3s;
        cursor: pointer;
    }

    .profile-card.selected {
        background-color: rgba(253, 149, 150, 0.5); 
        box-shadow: 0 4px 15px rgba(8, 145, 141, 0.4);
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
    
</style>
<body>
    <%@ include file="/components/header.jsp" %>


    <div id="title">공고 작성하기</div>

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
                                <div class="card-text">ahdalahdahd@naver.com</div>
                                <div class="card-text">여성</div>
                                <div class="card-text">20대</div>
                                <div class="card-text">silver</div>
                            </div>
                            
                        </div>
                    </div>
                </div>
                <div class="sub-title-section">
                    <img src="../../../image/subtitle_line.svg" alt="line">
                    <span class="sub-title">돌봄 반려동물</span>
                </div>

                <div class="pet-slider">
                    <div class="profile-card">
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
                                    <div class="pet-text">로미</div>
                                    <div class="pet-text">고양이</div>
                                    <div class="pet-text">코숏</div>
                                    <div class="pet-text">암컷</div>
                                    <div class="pet-text">1세</div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                    <div class="profile-card">
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
                                    <div class="pet-text">로미</div>
                                    <div class="pet-text">고양이</div>
                                    <div class="pet-text">코숏</div>
                                    <div class="pet-text">암컷</div>
                                    <div class="pet-text">1세</div>
                                </div>
                                
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

</body>
</html>