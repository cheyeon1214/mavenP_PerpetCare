<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib
        uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Register</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta charset="utf-8" />
    <link rel="stylesheet" href="../../../css/global.css" />

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <!-- jQuery ... jQuery 가 Bootstrap 보다 앞에 와야 함 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
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
            margin-right: 200px !important;
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

        .line-img{
            fill: #FD9596;
        }

        .sub-title-section{
            display: flex;
            align-items: center;
            margin-top: 95px;
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
        .apply-section-wrapper{
            box-shadow: 0 1px 4px rgba(0,0,0,0.25);
            border-radius: 20px;
        }
    </style>
</head>
<script>
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
            const text = selected.val();
            $wrap.find('.rateValue').val(text);

            const codeMap = {
                "답장이 빠르고 매너가 좋아요.": "P06",
                "급여 지급이 빨라요.": "P07",
                "시간 약속을 잘 지켜요.": "P08",
                "돌봄 근무 내용이 기재된 내용과 같아요.": "P09",
                "아이가 친화적이라 어려움이 없어요.": "P10",
                "답장이 느리고 매너가 별로에요.": "N06",
                "급여 지급이 늦어요.": "N07",
                "시간 약속을 잘 지키지 못해요.": "N08",
                "돌봄 근무 내용이 기재된 내용과 달라요.": "N09",
                "공고자의 과한 서비스 요구가 있어요.": "N10"
            };
            const code = codeMap[text] || 'other';

            const oNo   = $btn.data('ono')   || $wrap.data('ono');
            const email = $btn.data('email') || $wrap.data('email');

            $.ajax({
                url: '/rate/add',
                type: 'POST',
                data: { oNo: oNo, toEmail: email, code: code },
                success: function(){
                    alert('평가가 등록되었습니다.');
                    $btn
                        .val('평가완료')
                        .prop('disabled', true)
                        .addClass('done');
                    $box.slideUp(200);
                    $wrap.find('.option-btn').removeClass('selected');
                },
                error: function(){
                    alert('등록 중 오류가 발생했습니다.');
                }
            });
        }
    });

    $(document).on('click', '.option-btn', function(){
        const $wrap = $(this).closest('.apply-section-wrapper');
        $wrap.find('.option-btn').removeClass('selected');
        $(this).addClass('selected');
    });

    $(document).on('click', '.user-img', function () {
        const email = $(this).data('email');
        if (!email) return;

        window.location.href = "/experience?email=" + email;
    });



</script>
<body>
<div class="page-container">
    <%@ include file="/components/header.jsp" %>
    <div class="apply-container">
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
                    <button class="edit-btn" onclick="location.href='${pageContext.request.contextPath}/myInfo'">수정</button>
                </div>
                <div class="nav">
                    <a href="/pet?email=${user.email}">반려동물</a>
                    <a href="/experiencePage" >경험</a>
                    <a href="/opening/mine">올린 공고</a>
                    <a href="/opening/myApply" class="active">신청한 공고</a>
                    <a href="/opening/recent">최근 본 공고</a>
                </div>
            </div>
            <div class="logout"><a href="/logout"
                   onclick="return confirm('정말 로그아웃하시겠습니까?');">
                   로그아웃
                </a>  </div>
        </aside>

        <!-- Main Content -->
        <div class="container">
            <main class="pet-main">
                <!-- 진행중인 공고 -->
                <div class="sub-title-section">
                    <div class="sub-img">
                        <img src="../../../image/subtitle_line_red.svg" alt="line" class="line-img">
                    </div>
                    <div class="sub-title">진행중인 공고</div>
                </div>
                <c:choose>
                <c:when test="${empty pending}">
                <div class="opening-section" style="margin-top: 50px; padding:24px; border-radius:20px; text-align:center;">
                    진행중인 공고가 없습니다.
                </div>
                </c:when>
                <c:otherwise>
                <c:forEach var="op" items="${pending}">
                <div class="opening-section">
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
                        </div>
                        <div class="card-text-section">
                            <div class="card-text-title">가격</div>
                            <div class="card-text">
                            <span><fmt:formatNumber value="${op.price}" pattern="#,###"/></span>
                                  /
                            <span>${op.per}</span>
                        </div>
                    </div>
                    </div>

                    <div class="opening-section-line">
                        <div class="card-text-section-left">
                            <div class="card-section-method">
                                  <div class="card-text-title">돌봄 방법</div>
                                  <div class="card-text">
                                    <span>${op.careWay}</span>
                                  </div>
                            </div>
                            <div class="card-section-method">
                                <div class="card-text-title">돌봄 주소</div>
                                <div class="card-text">
                                    <span>${op.location}</span>
                                </div>
                            </div>
                        </div>
                        <div class="card-text-section-prefer">
                            <div class="card-text-title">우대사항</div>
                            <div class="card-text">
                                <span>${op.prefer}</span>
                            </div>
                        </div>
                    </div>
                </div>
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
                <c:when test="${empty reject and empty accept}">
                <div class="opening-section" style="margin-top: 50px; padding:24px; border-radius:20px; text-align:center;">
                    마감된 공고가 없습니다.
                </div>
                </c:when>
                <c:otherwise>
                <c:forEach var="op" items="${accept}">
                <div class="opening-section finish">
                    <div class="opening-section-line">
                        <div class="opening-pet-img">
                            <img src="data:image/jpeg;base64,${firstPets[op.no].base64Image}" alt="petImg" class="pet-img">
                        </div>
                        <div class="card-text-section">
                            <div class="card-text-title">돌봄 기간</div>
                            <div class="card-text">
                            <span>
                                ${op.sDateStr}
                                ~
                                ${op.eDateStr}
                            </span>
                            </div>
                        </div>
                        <div class="card-text-section">
                            <div class="card-text-title">가격</div>
                            <div class="card-text">
                            <span><fmt:formatNumber value="${op.price}" pattern="#,###"/></span>
                                  /
                            <span>${op.per}</span></div>
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
                <c:set var="acc" value="${userProfile[op.no]}"/>
                <div class="apply-section-wrapper" data-ono="${op.no}" data-email="${acc.email}">
                    <div class="apply-profile">
                        <div class="apply-left">
                            <div class="user-profile">
                                <img src="../../../image/profile_${acc.image}.svg" alt="user-img" class="user-img" data-email="${acc.email}">
                                <div class="user-info">
                                    <div class="user-text">
                                        <span class="user-bold-text">Email</span>
                                        <span class="user-thin-text">${acc.email}</span>
                                    </div>
                                    <div class="user-text">
                                        <span class="user-bold-text">Grade</span>
                                        <span class="user-thin-text">
                                            <img src="../../../image/grade/grade_${acc.grade}.svg" alt="user-grade" class="grade-img">
                                            ${acc.grade}
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
                                <input class="option-btn p-btn" type="button" value="급여 지급이 빨라요.">
                                <input class="option-btn p-btn" type="button" value="시간 약속을 잘 지켜요.">
                                <input class="option-btn p-btn" type="button" value="돌봄 근무 내용이 기재된 내용과 같아요.">
                                <input class="option-btn p-btn" type="button" value="아이가 친화적이라 어려움이 없어요.">
                            </div>
                            <div class="negative-reviews">
                                <input class="option-btn n-btn" type="button" value="답장이 느리고 매너가 별로에요.">
                                <input class="option-btn n-btn" type="button" value="급여 지급이 늦어요.">
                                <input class="option-btn n-btn" type="button" value="시간 약속을 잘 지키지 못해요.">
                                <input class="option-btn n-btn" type="button" value="돌봄 근무 내용이 기재된 내용과 달라요.">
                                <input class="option-btn n-btn" type="button" value="공고자의 과한 서비스 요구가 있어요.">
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


                <c:forEach var="op" items="${reject}">
                <div class="opening-section finish">
                    <div class="opening-section-line">
                        <div class="opening-pet-img">
                            <img src="data:image/jpeg;base64,${firstPets[op.no].base64Image}" alt="petImg" class="pet-img">
                        </div>
                        <div class="card-text-section">
                            <div class="card-text-title">돌봄 기간</div>
                            <div class="card-text">
                                <span>
                                    ${op.sDateStr}
                                    ~
                                    ${op.eDateStr}
                                </span>
                            </div>
                        </div>
                        <div class="card-text-section">
                            <div class="card-text-title">가격</div>
                            <div class="card-text">
                            <span><fmt:formatNumber value="${op.price}" pattern="#,###"/></span>
                                  /
                            <span>${op.per}</span></div>
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
                <div class="apply-profile opening-section non-matching">
                    <div class="non-match-text">매칭이 되지 않았습니다.</div>
                </div>
                </c:forEach>
                </c:otherwise>
                </c:choose>

            </main>
    </div>

    <jsp:include page="../../../components/gradeModal.jsp" />
</div>
</body>
<script>
    $('#gradeBadge').on('click', function(){
        $('#gradeModal').modal('show');
    });
</script>
</html>
