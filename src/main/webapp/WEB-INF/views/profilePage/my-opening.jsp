<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>myPage</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta charset="utf-8" />
    <link rel="stylesheet" href="../css/global.css" />
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
            box-sizing: border-box;
        }

        .container{
            margin-left: 400px;
        }

        .opening-container {
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

        .grade-badge {  height: 16px;  vertical-align: middle; margin-top: 4px; cursor: pointer;}

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

        .create-btn{
            display: block;
            margin-left: auto;
            margin-top: 50px;
            width: 250px;
            height: 45px;
            font-size: 20px;
            font-weight: 500;
            color: white;
            background-color: #64DAFE;
            border: none;
            border-radius: 15px;
            /*box-shadow: 0 1px 6px rgba(0,0,0,0.4);*/
        }

        .line-img{
            fill: #FD9596;
        }

        .sub-title-section{
            display: flex;
            align-items: center;
        }

        .sub-title{
            padding-left: 10px;
            font-size: 22px;
            font-weight: 600;
            color: #FD9596;
        }

        .opening-section{
            margin-top: 120px;
            box-shadow: 0 1px 6px rgba(0,0,0,0.4);
            border-radius: 20px;
            cursor: pointer;
        }

        .opening-section.empty-section{
            margin-bottom: 95px;
        }

        .opening-section-line{
            display: flex;
            font-size: 19px;
        }

        .pet-img{
            width: 200px;
            height: 200px;
            border-radius: 20px;
            object-fit: cover;
            box-shadow:  0 4px 6px rgba(0, 0, 0, 0.25);
        }
        .opening-pet-img{
            margin-top: -80px;
            width: 300px;
        }

        .card-text-section{
            padding: 30px;
            width: 400px;
        }

        .pet-main{
            margin-left: 50px;
        }

        .card-text-title{
            font-weight: 700;
            margin-bottom: 6px;
        }

        .card-text-section-left{
            width: 290px;
            padding: 30px;

        }

        .card-text-section-prefer{
            padding: 30px;
            margin-right: 100px;
        }

        .card-section-method{
            margin-bottom: 30px;
        }

        .two-btn{
            display: flex;
            justify-content: flex-end;
            gap: 8px;
            padding-top: 20px;
        }

        .blue-btn{
            color: white;
            background-color: #64DAFE;
            border-radius: 13px;
            border: none;
            box-shadow: 0 1px 4px rgba(0,0,0,0.25);
            font-size: 18px;
            font-weight: 550;
            padding: 4px 32px;
        }

        .white-btn{
            color: #64DAFE;
            background-color: white;
            border-radius: 13px;
            border: none;
            box-shadow: 0 1px 4px rgba(0,0,0,0.25);
            font-size: 18px;
            font-weight: 550;
            padding: 4px 32px;
        }

        .sub-title-finish{
            padding-left: 10px;
            font-size: 22px;
            font-weight: 600;
            color: #64DAFE;
        }

        .finish{
            background-color: #F6F6F6;
        }

        .apply-profile{
            display: flex;
            width: 100%;
            align-items: center;

            margin-top: 20px;
            padding: 20px;
            justify-content: space-between;
        }

        .apply-section-wrapper{
            box-shadow: 0 1px 4px rgba(0,0,0,0.25);
            border-radius: 20px;
        }

        .user-img{
            width: 100px;
            height: 100px;
            border-radius: 20px;
            box-shadow: 0 1px 4px rgba(0,0,0,0.25);
        }
        .user-profile{
            display: flex;
            align-items: center;
            gap: 30px;

        }

        .review-btn{
            margin-right: 20px;
            padding: 4px 20px;
        }

        .user-bold-text{
            font-size: 19px;
            font-weight: 650;
            margin-right: 40px;
        }

        .user-thin-text{
            font-size: 18px;
            font-weight: 400;
        }

        .user-info {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .non-match-text{
            font-weight: 600;
            font-size: 19px;
            color: #404040;
        }

        .non-matching{
            justify-content: center;
        }

        .edit-mode { display: none; }
        /* is-editing 상태일 때만 편집 모드 보이기 */
        .opening-section-wrapper.is-editing .view-mode { display: none; }
        .opening-section-wrapper.is-editing .edit-mode{
            display: initial;
            border-radius: 15px;
            border: 1.5px solid #FD9596;
            padding: 4px 9px;
        }

        .opening-section-wrapper.is-editing .edit-price { width:10ch; }   /* 가격 */
        .opening-section-wrapper.is-editing .edit-per   { width:6ch;  }   /* 단위(시급/건당 등) */
        .opening-section-wrapper.is-editing .edit-care  { width:15ch; }   /* 돌봄방법 */
        .opening-section-wrapper.is-editing .edit-location  { width:15ch; }   /* 주소 */
        .opening-section-wrapper.is-editing .edit-prefer  {
            width:56ch; height: 12ch;
        }   /* 우대사항(짧게) */
        .opening-section-wrapper.is-editing .edit-detail{
            width: 60ch;
            min-height: 8em;
            border-radius: 15px;
            border: 1.5px solid #FD9596;
            padding: 6px 9px;
            resize: vertical;
        }
        .location-btn {
            background-color: white;
        }

        /* 지역 검색 모달창 */
        #modal-body-first, .modal-footer {
            display: flex;
            justify-content: center;
        }
        #location-input {
            width: 80%;
            padding: 0 10px;
            margin-bottom: 10px;
        }
        #modal-body-second {
            width: 90%;
            height: 400px;
            overflow-y: auto;
            padding-left: 50px;
        }
        .location-list {
            padding: 0 0 5px 0;
            border-bottom: 1px solid #cccccc;
        }
        .location-list.selected {
            cursor: pointer;
            font-weight: bold;
        }
        #locModal .modal-footer > button {
            width: 80%;
            background-color: #64DAFE;
            color: white;
            border: #64DAFE;
            border-radius: 10px;
            padding: 10px 0;
        }
        .reviewBox{

        }
        .reviews-wrapper{
            display: flex;
            justify-content: space-around;
        }

        .positive-reviews{
            display: flex;
            flex-direction: column;
        }

        .negative-reviews{
            display: flex;
            flex-direction: column;
        }

        .p-btn, .n-btn{
            width: 400px;
            padding: 12px 20px;
            border-radius: 25px;
            /*box-shadow: 0 4px 10px rgba(0, 0, 0, 0.25);*/
            border: none;
            background-color: white;
            margin-top: 20px;
            font-size: 18px;
            font-weight: 500;
        }

        .p-btn{
            box-shadow: 0 0 7px rgba(253, 149, 150, 0.8);
        }

        .n-btn{
            box-shadow: 0 0 7px rgba(100, 218, 254, 0.8);
        }

        .review-notice{
            text-align: center;
            font-size: 19px;
            font-weight: 600;
            margin-top: 30px;
            padding-bottom: 30px;
        }

        /* 클릭된 상태 */
        .p-btn.selected {
            background-color: rgba(253, 149, 150, 0.8);
            color: white;
        }
        .n-btn.selected {
            background-color: rgba(100, 218, 254, 0.8);
            color: white;
        }


    </style>
    <script>
        $(document).ready(function(){
            // 지역 검색 비동기
            $('#location-input').on("keyup", function(){
                let word = $(this).val().trim();

                if(word.length > 0) {
                    $.ajax({
                        // 요청
                        url: "/api/search/location",
                        type: "GET",
                        data: {word: word}, // 서버에 ?word=검색어 로 전달
                        // 응답
                        success: function(data){
                            var html = "";
                            data.forEach(function(item){
                                html += "<p class='location-list' id='"
                                    +item.lcode
                                    +"'>"
                                    +item.address
                                    +"</p>";
                            })
                            $('#modal-body-second').html(html);
                        },
                        error: function(xhr, status, error){
                            console.log("에러 발생 : ", xhr.responseText);
                        }
                    })
                }
            });

            // 지역 선택
            $(document).on('click', '.location-list', function() {
                $('.location-list').removeClass('selected');
                $(this).addClass('selected');
                let address = $(this).text();
                let lcode = $(this).attr('id');
                $('#selectedAddr').val(address); // hidden input에 값을 저장해 둠
                $('#selectedCode').val(lcode); // hidden input에 값을 저장해 둠
                console.log("주소 : "+address+", 코드 : "+lcode);
            });

            // 필터 적용 1
            $(document).on('click', 'button[name=locationBtn]', function() {
                let address = $('#selectedAddr').val();
                let lcode = $('#selectedCode').val();
                if(!lcode) {
                    alert("지역을 하나 선택해주세요.");
                    return false;
                } else {
                    $('[name=location]').val(lcode); // db에 전달할 input value 값
                    $(".location-btn").html(address);
                    $('#locModal').modal('hide');
                }
            }); // modal btn click

        }); // ready
        // 카드 클릭 → applyList 이동 (edit 모드면 이동 금지)
        $(document).on('click', '.opening-section', function (e) {
            const form = $(this).closest('form.opening-section-wrapper');

            // 편집 중이면 카드 클릭 막기
            if (form.hasClass('is-editing')) return;

            const oNo = $(this).data('no');
            if (!oNo) return;
            window.location.href = "/applyList?no=" + oNo;
        });

        $(document).on('click', '.delete-btn', function (e) {
            e.stopPropagation(); // 카드 클릭 이벤트 막기

            if (!confirm("정말 이 공고를 삭제하시겠습니까?")) {
                return;
            }

            const form = $(this).closest('form');
            const no = form.find('input[name="no"]').val();

            $.ajax({
                url: '/opening/delete',
                type: 'POST',
                data: { no: no },
                success: function (res) {
                    if (res === 'ok') {
                        alert("삭제가 완료되었습니다.");
                        location.reload();
                    } else {
                        alert("삭제 중 문제가 발생했습니다.");
                    }
                },
                error: function () {
                    alert("서버와 통신 중 오류가 발생했습니다.");
                }
            });
        });

        function toggleEdit(btn){

            const wrapper = btn.closest('form');             // 폼을 잡아옴
            const editing = wrapper.classList.toggle('is-editing');
            btn.value = editing ? '완료' : '수정';

            // 편집모드 종료(=완료)면 폼 전송
            if (!editing) {
                wrapper.submit();
            }
        }

        // 리뷰 열기/닫기 + 버튼 상태 토글(평가하기↔제출하기)
        $(document).on("click", ".review-btn", function (e) {
            e.stopPropagation();
            const $btn  = $(this);
            const $wrap = $btn.closest('.apply-section-wrapper');
            const $box  = $wrap.find('.reviewBox');

            // 열고 닫기
            $box.stop(true,true).slideToggle(250);

            // 버튼 상태 토글
            const mode = $btn.data('mode') || 'review';
            if (mode === 'review') {
                $btn.data('mode','submit').val('제출하기');
            } else {
                // 제출 시도
                const selected = $wrap.find('.option-btn.selected');
                if (!selected.length) {
                    alert('평가 항목을 하나 선택해주세요.');
                    return;
                }
                const text = selected.val();           // 사용자가 클릭한 문구
                $wrap.find('.rateValue').val(text);    // hidden에 저장

                const codeMap = {
                    "답장이 빠르고 매너가 좋아요.": "P01",
                    "아이를 잘 케어해줘요.": "P02",
                    "시간 약속을 잘 지켜요.": "P03",
                    "돌봄 서비스 설명이 기재된 내용과 같아요.": "P04",
                    "특별한 케어를 해줘요.": "P05",
                    "답장이 느리고 매너가 별로에요.": "N01",
                    "아이 케어가 잘 이루어지지 않았어요.": "N02",
                    "시간 약속을 잘 지키지 못해요.": "N03",
                    "돌봄 서비스 설명이 기재된 내용과 달라요.": "N04",
                    "아이에게 트라우마가 생겼어요.": "N05"
                };
                const code = codeMap[text] || 'other';

                const oNo   = $btn.data('ono')   || $wrap.data('ono');
                const email = $btn.data('email') || $wrap.data('email');

                // 서버 전송 (엔드포인트/파라미터 맞게 수정)
                $.ajax({
                    url: '/rate/add',
                    type: 'POST',
                    data: { oNo: oNo, toEmail: email, code: code },
                    success: function(){
                        alert('평가가 등록되었습니다.');
                        // 초기화
                        $btn
                            .val('평가완료')
                            .prop('disabled', true) // 클릭 불가 처리
                            .addClass('done'); // 스타일 클래스 추가 (선택사항)
                        $box.slideUp(200);
                        $wrap.find('.option-btn').removeClass('selected');
                    },
                    error: function(){
                        alert('등록 중 오류가 발생했습니다.');
                    }
                });
            }
        });

        // 옵션 하나만 선택(카드별로 스코프)
        $(document).on('click', '.option-btn', function(){
            const $wrap = $(this).closest('.apply-section-wrapper');
            $wrap.find('.option-btn').removeClass('selected');
            $(this).addClass('selected');
        });



    </script>
</head>
<body>
<div class="page-container">
    <%@ include file="/components/header.jsp" %>
    <div class="opening-container">
        <!-- Sidebar -->
        <aside class="sidebar">
            <div class="sidebar-top">
                <div class="profile">
                    <img
                            src="../../..${user.imagePath}"
                            alt="프로필"
                            class="profile-img"
                    />
                    <div class="info">
                        <div class="name">${user.name}</div>
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
                                    id="gradeBadge"
                                    src="../../../image/grade/grade_${user.grade}.svg"
                                    alt="grade-badge"
                            />
                        </div>
                        <div class="info-right">
                            <div class="grade">${user.grade}</div>
                            <div class="gender">${user.genderStr}</div>
                            <div class="age">${user.ageGroup}</div>
                        </div>
                    </div>
                </div>
                <div class="edit-btn-wrapper1">
                    <button class="edit-btn">수정</button>
                </div>
                <div class="nav">
                    <a href="#">반려동물</a>
                    <a href="/experiencePage" >경험</a>
                    <a href="/opening/mine" class="active">올린 공고</a>
                    <a href="/opening/myApply">신청한 공고</a>
                    <a href="/opening/recent">최근 본 공고</a>
                </div>
            </div>
            <div class="logout"><a href="#">로그아웃</a></div>
        </aside>

        <!-- Main Content -->
        <div class="container">
            <main class="pet-main">
                <input type="button" class="create-btn" value="공고 작성하러 가기" onclick="location.href='/opening/create'">
                <!-- 진행중인 공고 -->
                <div class="sub-title-section">
                    <div class="sub-img">
                        <img src="../../../image/subtitle_line_red.svg" alt="line" class="line-img">
                    </div>
                    <div class="sub-title">진행중인 공고</div>
                </div>
                <c:choose>
                <c:when test="${empty ongoing}">
                <div class="opening-section empty-section" style="margin-top: 50px; padding:24px; border-radius:20px; text-align:center;">
                    진행중인 공고가 없습니다.
                </div>
                </c:when>
                <c:otherwise>
                <c:forEach var="op" items="${ongoing}">
                <form class="opening-section-wrapper" action="/opening/update" method="post">
                <input type="hidden" name="no" value="${op.no}">
                <input type="hidden" name="uEmail" value="${op.uEmail}">
                <input type="hidden" name="createdAt" value="${op.createdAt}">
                <input type="hidden" name="close" value="${op.close}">
                <input type="hidden" name="isMatch" value="${op.isMatch}">
                <input type="hidden" name="detail" value="${op.detail}">
                <div class="opening-section" data-no="${op.no}">
                    <div class="opening-section-line">
                        <div class="opening-pet-img">
                            <img src="data:image/jpeg;base64,${firstPets[op.no].base64Image}" alt="petImg" class="pet-img">
                        </div>
                        <div class="card-text-section">
                            <div class="card-text-title">돌봄 기간</div>
                            <span>
                                ${op.sDateStr}
                                ~
                                ${op.eDateStr}
                            </span>
                            <input type="hidden" name="sDate" value="${op.sDate}">
                            <input type="hidden" name="eDate" value="${op.eDate}">
<%--                            <div class="card-text">2025-08-08 ~ 2025-08-09</div>--%>
                        </div>
                        <div class="card-text-section">
                            <div class="card-text-title">가격</div>
                            <span class="view-mode">${op.price}</span>
                            <input class="edit-mode edit-price" type="text" name="price" value="${op.price}">
                            /
                            <span class="view-mode">${op.per}</span>
                            <input class="edit-mode edit-per" type="text" name="per" value="${op.per}">
<%--                            <div class="card-text">${op.price} / ${op.per}</div>--%>
                        </div>
                    </div>

                    <div class="opening-section-line">
                        <div class="card-text-section-left">
                            <div class="card-section-method">
                                  <div class="card-text-title">돌봄 방법</div>
                                  <div class="card-text">
                                    <span class="view-mode">${op.careWay}</span>
                                    <input class="edit-mode edit-care" type="text" name="careWay" value="${op.careWay}">
                                  </div>
                            </div>
                            <div class="card-section-method">
                                <div class="card-text-title">돌봄 주소</div>
                                <div class="card-text">
                                    <span class="view-mode">${op.location}</span>
                                    <button type="button" class="edit-mode edit-location location-btn" data-toggle="modal" data-target="#locModal">${op.location}</button>
                                    <input type="hidden" id="selectedCode" name="location" value="${op.location}"/>
                                    <input type="hidden" id="selectedAddr" name="selectedAddr" />
                                </div>
                            </div>
                        </div>
                        <div class="card-text-section-prefer">
                            <div class="card-text-title">우대사항</div>
                            <div class="card-text">
                                <span class="view-mode">${op.prefer}</span>
                                <textarea class="edit-mode edit-prefer" name="prefer">${op.prefer}</textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="two-btn">
                    <input type="button" class="blue-btn delete-btn" value="삭제">
                    <input type="button" class="white-btn" value="수정" onclick="toggleEdit(this)">
                </div>
                </form>
                </c:forEach>
                </c:otherwise>
                </c:choose>

                <div class="sub-title-section">
                    <div class="sub-img">
                        <img src="../../../image/subtitle_line.svg" alt="line" class="line-img">
                    </div>
                    <div class="sub-title-finish">마감된 공고</div>
                </div>

                <!-- 마감된 공고 -->
                <c:choose>
                <c:when test="${empty matched and empty closed}">
                <div class="opening-section" style="margin-top: 50px; padding:24px; border-radius:20px; text-align:center;">
                    마감된 공고가 없습니다.
                </div>
                </c:when>
                <c:otherwise>
                <c:forEach var="op" items="${matched}">
                <div class="opening-section finish">
                    <div class="opening-section-line">
                        <div class="opening-pet-img">
                            <img src="data:image/jpeg;base64,${firstPets[op.no].base64Image}" alt="petImg" class="pet-img">
                        </div>
                        <div class="card-text-section">
                            <div class="card-text-title">돌봄 기간</div>
                            <div class="card-text">2025-08-08 ~ 2025-08-09</div>
                        </div>
                        <div class="card-text-section">
                            <div class="card-text-title">가격</div>
                            <div class="card-text"><fmt:formatNumber value="${op.price}" pattern="#,###"/> / ${op.per}</div>
                        </div>
                    </div>

                    <div class="opening-section-line">
                        <div class="card-text-section-left">
                            <div class="card-section-method">
                                <div class="card-text-title">돌봄 방법</div>
                                <div class="card-text">
                                    ${op.careWay}
                                </div>
                            </div>
                            <div class="card-section-method">
                                <div class="card-text-title">돌봄 주소</div>
                                <div class="card-text">${op.location}</div>
                            </div>
                        </div>
                        <div class="card-text-section-prefer">
                            <div class="card-text-title">우대사항</div>
                            <div class="card-text">
                                ${op.prefer}
                            </div>
                        </div>
                    </div>
                </div>
                <c:set var="acc" value="${acceptedByOpening[op.no]}"/>
                <div class="apply-section-wrapper" data-ono="${op.no}" data-email="${acc.uEmail}">
                    <div class="apply-profile">
                        <div class="apply-left">
                            <div class="user-profile">
                                <img src="../../../image/profile_${acc.uImage}.svg" alt="user-img" class="user-img">
                                <div class="user-info">
                                    <div class="user-text">
                                        <span class="user-bold-text">Email</span>
                                        <span class="user-thin-text">${acc.uEmail}</span>
                                    </div>
                                    <div class="user-text">
                                        <span class="user-bold-text">Grade</span>
                                        <span class="user-thin-text">
                                            <img src="../../../image/grade/grade_${acc.uGrade}.svg" alt="user-grade" class="grade-img">
                                            ${acc.uGrade}
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="rate-btn">
                            <c:choose>
                                <c:when test="${isRatedMap[op.no]}">
                                    <input type="button" value="평가완료" class="blue-btn review-btn" disabled>
                                </c:when>
                                <c:otherwise>
                                    <input type="button" value="평가하기" class="blue-btn review-btn">
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="reviewBox" style="display:none;">
                        <div class="reviews-wrapper">
                            <div class="positive-reviews">
                                <input class="option-btn p-btn" type="button" value="답장이 빠르고 매너가 좋아요.">
                                <input class="option-btn p-btn" type="button" value="아이를 잘 케어해줘요.">
                                <input class="option-btn p-btn" type="button" value="시간 약속을 잘 지켜요.">
                                <input class="option-btn p-btn" type="button" value="돌봄 서비스 설명이 기재된 내용과 같아요.">
                                <input class="option-btn p-btn" type="button" value="특별한 케어를 해줘요.">
                            </div>
                            <div class="negative-reviews">
                                <input class="option-btn n-btn" type="button" value="답장이 느리고 매너가 별로에요.">
                                <input class="option-btn n-btn" type="button" value="아이 케어가 잘 이루어지지 않았어요.">
                                <input class="option-btn n-btn" type="button" value="시간 약속을 잘 지키지 못해요.">
                                <input class="option-btn n-btn" type="button" value="돌봄 서비스 설명이 기재된 내용과 달라요.">
                                <input class="option-btn n-btn" type="button" value="아이에게 트라우마가 생겼어요.">
                            </div>
                        </div>

                        <div class="review-notice">
                            가장 가까운 평가 하나만 선택해주세요.
                        </div>
                        <input type="hidden" id="rateValue">
                    </div>
                </div>
                </c:forEach>

                <!-- 마감된 공고 -->

                <c:forEach var="op" items="${closed}">
                <div class="opening-section finish">
                    <div class="opening-section-line">
                        <div class="opening-pet-img">
                            <img src="data:image/jpeg;base64,${firstPets[op.no].base64Image}" alt="petImg" class="pet-img">
                        </div>
                        <div class="card-text-section">
                            <div class="card-text-title">돌봄 기간</div>
                            <div class="card-text">2025-08-08 ~ 2025-08-09</div>
                        </div>
                        <div class="card-text-section">
                            <div class="card-text-title">가격</div>
                            <div class="card-text"><fmt:formatNumber value="${op.price}" pattern="#,###"/> / ${op.per}</div>
                        </div>
                    </div>

                    <div class="opening-section-line">
                        <div class="card-text-section-left">
                            <div class="card-section-method">
                                <div class="card-text-title">돌봄 방법</div>
                                <div class="card-text">${op.careWay}</div>
                            </div>
                            <div class="card-section-method">
                                <div class="card-text-title">돌봄 주소</div>
                                <div class="card-text">${op.location}</div>
                            </div>
                        </div>
                        <div class="card-text-section-prefer">
                            <div class="card-text-title">우대사항</div>
                            <div class="card-text">
                                ${op.prefer}
                            </div>
                        </div>
                    </div>
                </div>
                <div class="apply-section-wrapper">
                <div class="apply-profile non-matching">
                    <div class="non-match-text">매칭이 되지 않았습니다.</div>
                </div>
                </div>
                </c:forEach>
                </c:otherwise>
                </c:choose>

            </main>
        </div>
    </div>

    <div class="modal" id="locModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">지역 선택</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <div id="modal-body-first">
                        <input type="text" id="location-input" placeholder="찾으시는 지역을 입력하세요" autocomplete="off">
                    </div>
                    <div id="modal-body-second">
                        <p class="location-list" style="display: none">서울시, 종로구</p>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" name="locationBtn">검색</button>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../../../components/gradeModal.jsp" />
</div>
</body>
<script>
    //모달창
    $('#gradeBadge').on('click', function(){
        $('#gradeModal').modal('show');
    });
</script>
</html>
