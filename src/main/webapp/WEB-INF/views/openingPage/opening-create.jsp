<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>공고 작성하기</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function(){
        $(document).on("click", ".profile-card", function() {
            $(this).toggleClass("selected");

            const selectedPetNos = $(".profile-card.selected").map(function() {
                return $(this).data("pet-no");
            }).get();

            $("#petsInput").val(selectedPetNos.join(",")); // "1,2,3"
        });
    });
    
    $(document).on("click", ".method-btn", function() {
        $(".method-btn").removeClass("selected");
        $(this).addClass("selected");
        const selectedMethod = $(this).val();
        $("#careWayInput").val(selectedMethod);
    });

    $(document).ready(function(){
    $("#saveDateTime").on("click", function(){
        const start = $("#startDateTime").val(); 
        const end = $("#endDateTime").val();

        if(!start || !end){
            alert("시작과 종료 날짜·시간을 모두 선택해주세요.");
            return;
        }

        const startDisplay = start.replace("T", " ");
        const endDisplay = end.replace("T", " ");
        $(".location-btn.period").attr("value", startDisplay +" ~ "+ endDisplay);

        console.log("시작 LocalDateTime:", start);
        console.log("종료 LocalDateTime:", end);

        $("#sDateHidden").val(start);
        $("#eDateHidden").val(end);

        $(".location-btn.period").focus();
        
        $("#myModal").modal("hide");
    });
});

$(document).ready(function(){
    $(".dropdown-item").click(function(e){
        e.preventDefault();

        const selectedType = $(this).text().trim();

        // 버튼 텍스트 변경
        $("#dropdownMenuButton").text(selectedType);

        // 숨겨진 input에 저장 (서버 전송용)
        $("#payTypeInput").val(selectedType);
    });
});

$(document).ready(function() {
    $("form").on("submit", function(e) {
        const petIds = $("#petsInput").val();
        const careWay = $("#careWayInput").val();
        const sDate = $("#sDateHidden").val();
        const eDate = $("#eDateHidden").val();
        const payType = $("#payTypeInput").val();
        const price = $("input[name='price']").val();
        const location = $("input[name='location']").val();

        // 누락 항목 확인
        if (!petIds) {
            alert("반려동물을 선택해주세요.");
            e.preventDefault();
            return;
        }

        if (!careWay) {
            alert("돌봄 방법을 선택해주세요.");
            e.preventDefault();
            return;
        }

        if (!sDate || !eDate) {
            alert("돌봄 시작과 종료 날짜를 선택해주세요.");
            e.preventDefault();
            return;
        }


        // 시작일이 종료일보다 뒤인 경우
        if (new Date(sDate) > new Date(eDate)) {
            alert("시작일은 종료일보다 빠르거나 같아야 합니다.");
            e.preventDefault();
            return;
        }

        if (!payType) {
            alert("급여 단위를 선택해주세요.");
            e.preventDefault();
            return;
        }

        if (!price || isNaN(price) || Number(price) <= 0) {
            alert("유효한 금액을 입력해주세요.");
            e.preventDefault();
            return;
        }

        if (!location || location.trim() === "") {
            alert("돌봄 위치를 입력해주세요.");
            e.preventDefault();
            return;
        }
    });
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
        padding: 20px;
        border-radius: 20px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.16);
        transition: border-color 0.3s, box-shadow 0.3s;
        cursor: pointer;
    }

    #pet-profile.selected {
        background-color: rgba(253, 149, 150, 0.5);
        transition: background-color 0.3s ease; 
        box-shadow: 0 4px 15px rgba(0,0,0,0.16);
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
    .method-btn.selected{   
        box-shadow: 0 4px 15px rgba(253, 149, 150, 0.8);
        transition: box-shadow 0.3s ease; 
    }

    .method-text{
        font-size: 20px;
        margin-left: 10px;
        margin-right: 10px;
    }
    .location-btn{
        cursor: pointer;
        background-color: white;
        border: none;
        border-radius: 20px;
        width: 460px;
        height: 50px;
        margin-left: 28px;
        font-size: 18px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.16);
    }
    .location-btn:hover{
        background-color: rgba(253, 149, 150, 0.3);
        transition: background-color 0.3s ease; 

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

    .pay-dropdown:focus, .pay-dropdown:active {
        box-shadow: none;
    }

    .pay-amount {
        display: inline-block;
        border: 1.5px solid #ddd;
        border-radius: 8px;
        padding: 8px 18px;
        font-size: 18px;
        font-weight: bold;
        margin-left: 20px;
        width: 150px
    }

    .pay-unit {
        font-weight: bold;
        margin-left: 18px;
        font-size: 20px;
    }

    .pay-section{
        display: flex;
        align-items: center;
        margin: 20px;
    }

    .text-box{
        margin-top: 20px;
        width: 600px;
        height: 100px;
        border: 1.5px solid #ddd;
        border-radius: 8px;
        padding: 12px 18px;
        font-size: 18px;
        font-weight: 500;
        text-align: left;    
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

    
    #myModal .modal-dialog {
        margin-top: 150px; 
    }


    
</style>
<body>
    <%@ include file="/components/header.jsp" %>


    <div id="title">공고 작성하기</div>

    <!-- 스크롤 영역 -->
    <div id="scroll-body">
        <div id="body-form">
            <form action="create" method="post">
            <div class="body-center">
                <div class="sub-title-section">
                    <img src="../../../image/subtitle_line.svg" alt="line">
                    <span class="sub-title">공고자</span>
                </div>
                <div class="profile-card">
                    <div class="card-section">
                        <div class="card-left">
                            <img src="../../../image/profile_1.svg" alt="profileImg">
                        </div>
                        <input type="hidden" name="uEmail" value="${user.email}">
                        <div class="card-right">
                            <div class="card-right-name">
                                <div class="card-name">이메일</div>
                                <div class="card-name">성별</div>
                                <div class="card-name">연령대</div>
                                <div class="card-name">등급</div>
                            </div>

                            <div class="card-right-text">
                                <div class="card-text">${user.email}</div>
                                <c:choose>
                                    <c:when test="${user.gender == 'f'}">
                                        <div class="card-text">여성</div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="card-text">남성</div>
                                    </c:otherwise>
                                </c:choose>
                                <div class="card-text">${user.ageGroup}</div>
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
                <input type="hidden" name="petIds" id="petsInput">
                    <c:forEach var="pet" items="${pets}">
                    <div class="profile-card" id="pet-profile" data-pet-no="${pet.no}">
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
                                    <div class="pet-text">${pet.getAge()}</div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                    </c:forEach>

                </div>

                <div class="sub-title-section">
                    <img src="../../../image/subtitle_line.svg" alt="line">
                    <span class="sub-title">돌봄 방법 및 기간 선택</span>
                </div>

                <div class="method-section">
                    <input type="hidden" name="careWay" id="careWayInput">
                    <div class="method-line">
                        <div class="method-text">돌봄방법</div>
                        <input type="button" class="method-btn" value="여기로 와주세요">
                        <input type="button" class="method-btn" value="잠시 맡아주세요">
                    </div>
                    <input type="hidden" name="location" value="서울시 혜화동">
                    <div class="method-line">
                        <div class="method-text">돌봄위치</div>
                        <input type="button" class="location-btn" value="위치를 선택해주세요" id="location">
                    </div>
                    <input type="hidden" name="location">
                    <div class="method-line">
                        <!-- 서버로 전송될 날짜값들 -->
                        <input type="hidden" name="sDate" id="sDateHidden">
                        <input type="hidden" name="eDate" id="eDateHidden">
                        <div class="method-text">돌봄기간</div>
                        <input type="button" class="location-btn period" value="날짜를 선택해주세요" data-toggle="modal" data-target="#myModal">
                    </div>
                    
                </div>

                <div class="sub-title-section">
                    <img src="../../../image/subtitle_line.svg" alt="line">
                    <span class="sub-title">가격</span>
                </div>

                <div class="pay-section">
                    <input type="hidden" name="per" id="payTypeInput">
                    <div class="dropdown">
                        <button class="btn pay-dropdown dropdown-toggle" type="button" id="dropdownMenuButton"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            단위
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="#">일급</a>
                            <a class="dropdown-item" href="#">시급</a>
                            <a class="dropdown-item" href="#">월급</a>
                        </div>
                    </div>
                    <input type="text" class="pay-amount" name="price" placeholder="금액 입력">
                    <div class="pay-unit">원</div>
                </div>

                <div class="sub-title-section">
                    <img src="../../../image/subtitle_line.svg" alt="line">
                    <span class="sub-title">우대사항</span>
                </div>
                <textarea class="text-box" id="prefer" name="prefer"></textarea>
                
                <div class="sub-title-section">
                    <img src="../../../image/subtitle_line.svg" alt="line">
                    <span class="sub-title">추가 안내 사항</span>
                </div>
                <textarea class="text-box" id="prefer" name="detail"></textarea>

                <div id="button-wrapper"></div>
                    <input type="submit" class="submit-button" value="작성하기">
                </div>
            </form>
        </div>
    </div>
    <!-- The Modal -->
    <div class="modal fade" id="myModal">
        <div class="modal-dialog" role="document">
        <div class="modal-content">
        
        <div class="modal-header">
            <h5 class="modal-title" id="dateTimeModalLabel">날짜와 시간 선택</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
        </div>

        <div class="modal-body">
            <div class="form-group">
            <label>시작 날짜·시간</label>
            <input type="datetime-local" id="startDateTime" class="form-control">
            </div>
            <div class="form-group">
            <label>종료 날짜·시간</label>
            <input type="datetime-local" id="endDateTime" class="form-control">
            </div>
        </div>

        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
            <button type="button" id="saveDateTime" class="btn btn-primary">저장</button>
        </div>

        </div>
    </div>
    </div>
</body>
</html>