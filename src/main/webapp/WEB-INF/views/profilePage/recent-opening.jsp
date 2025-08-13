<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib
        uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>myPage</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta charset="utf-8" />
    <link rel="stylesheet" href="/css/global.css" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
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

        .recent-container {
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

        /*    main */
        #list-card-section {
            display:flex;
            justify-content: start;
            flex-wrap: wrap;
            margin-left: 200px;
            margin-top: 30px;
        }
        .opening-card {
            background-color: white;
            width: 250px;
            height: 350px;
            margin: 20px;
            padding: 5px 15px;
            border: none;
            border-radius: 20px;
            box-shadow: 2px 2px 5px rgba(59, 59, 59, 0.5);
        }
        .opening-card-image {
            display:flex;
            justify-content: center;
            position:relative;
        }
        .opening-card-image > img {
            /*width: 90%;*/
            margin-top: 10px;
            border-radius: 20px;
            width: 200px;
            height: 200px;
            object-fit: cover;
        }
        .opening-card-image > img:hover {
            cursor: pointer;
            opacity: 0.7;
        }
        .opening-card-species {
            position:absolute;
            width: 74px;
            top: 160px;
            left: 30px;
            padding: 5px 10px;
            margin: 5px;
            font-weight: bold;
            color: white;
            background-color: #FD9596;
            border-radius: 20px;
            text-align: center;
        }
        .opening-card-loc {
            position:absolute;
            width: 74px;
            top: 160px;
            left: 110px;
            padding: 5px 10px;
            margin: 5px;
            font-weight: bold;
            color: white;
            background-color: #64DAFE;
            border-radius: 20px;
            text-align: center;
        }
        .opening-card-date {
            display: flex;
            justify-content: start;
            margin: 10px;
        }
        .opening-card-date > span {
            font-size: small;
            font-weight: bold;
        }
        .opening-card-careway {
            display: flex;
            justify-content: start;
            margin: 10px;
        }
        .opening-card-priceper {
            display: flex;
            justify-content: end;
            margin: 10px;
            font-size: large;
            font-weight: bold;
        }
    </style>
    <script>
        $(document).ready(function() {

            // image mouseenter
            $(document).on('mouseenter', '.opening-card-image > img', function () {
                $(this).closest('.opening-card-image').find('.opening-card-species').css('display', 'inline');
                $(this).closest('.opening-card-image').find('.opening-card-loc').css('display', 'inline');
            });
            // image mouseenter
            $(document).on('mouseleave', '.opening-card-image > img', function () {
                $(this).closest('.opening-card-image').find('.opening-card-species').css('display', 'none');
                $(this).closest('.opening-card-image').find('.opening-card-loc').css('display', 'none');
            });
        });
    </script>
    <script>
        $(function() {
            const RECENT_KEY = 'recentNos';

            function getRecentNos() {
                try {
                    const raw = localStorage.getItem(RECENT_KEY);
                    const arr = raw ? JSON.parse(raw) : [];
                    return Array.isArray(arr) ? arr : [];
                } catch { return []; }
            }

            // 카드 HTML 생성
            function renderCards(items) {
                let html = '';
                items.forEach(item => {
                    const sDate = (item.sDate || '').split('T')[0];
                    const eDate = (item.eDate || '').split('T')[0];
                    const dong  = (item.location || '').split(',').pop().trim();
                    const pet   = (item.pets && item.pets[0]) ? item.pets[0] : {};
                    const img64 = pet.base64Image || '';
                    const species = pet.species || '';

                    html +=
                        "<div class='opening-card' data-no='" + item.no + "'>" +
                        "  <div class='opening-card-image'>" +
                        "    <img src='data:image/jpeg;base64," + img64 + "'>" +
                        "    <span class='opening-card-species' style='display:none'>#" + species + "</span>" +
                        "    <span class='opening-card-loc' style='display:none'>#" + dong + "</span>" +
                        "  </div>" +
                        "  <div class='opening-card-date'>" +
                        "    <span>" + sDate + "</span>&nbsp;~&nbsp;<span>" + eDate + "</span>" +
                        "  </div>" +
                        "  <div class='opening-card-careway'><p>" + (item.careWay || '') + "</p></div>" +
                        "  <div class='opening-card-priceper'>" +
                        "    <span class='opening-card-price'>"
                        + (item.price ? parseInt(item.price, 10).toLocaleString() : '')
                        + "</span>원 / " +
                        "    <span class='opening-card-per'>" + (item.per || '') + "</span>" +
                        "  </div>" +
                        "</div>";
                });
                $('#list-card-section').html(html);
            }

            // 로드 시 recentNos 가져와 서버에 조회
            const ids = getRecentNos();
            if (ids.length === 0) {
                $('#list-card-section').html("<p style='margin-left:200px;margin-top:20px;'>최근 본 공고가 없습니다.</p>");
                return;
            }

            $.ajax({
                url: "/opening/by-ids",
                type: "GET",
                traditional: true, // ids=1&ids=2&ids=3 형태 전송 허용
                data: { ids: ids }, // List<Integer> 바인딩
                success: function(list) {
                    const order = new Map(ids.map((id, idx) => [String(id), idx]));
                    list.sort((a, b) => (order.get(String(a.no)) ?? 0) - (order.get(String(b.no)) ?? 0));
                    renderCards(list);
                },
                error: function(xhr) {
                    console.log("최근 공고 불러오기 실패:", xhr.responseText);
                    $('#list-card-section').html("<p style='margin-left:200px;margin-top:40px;'>최근 공고를 불러오지 못했습니다.</p>");
                }
            });

            // 카드 클릭 이동 + 로컬스토리지 저장
            $(document).on('click', '.opening-card', function () {
                let oNo = $(this).data('no');
                if (!oNo) return;
                oNo = String(oNo);
                // 기존 목록 가져오기
                let recentNos = JSON.parse(localStorage.getItem('recentNos')) || [];

                // 중복 제거 (이미 있으면 삭제)
                recentNos = recentNos.filter(id => id !== oNo);

                // 앞에 추가
                recentNos.unshift(oNo);

                // 최대 6개까지만 유지
                if (recentNos.length > 6) {
                    recentNos = recentNos.slice(0, 6);
                }

                localStorage.setItem('recentNos', JSON.stringify(recentNos));

                window.location.href = "/opening/detail?no=" + oNo;
            });
        });
    </script>
</head>
<body>
<div class="page-container">
    <%@ include file="/components/header.jsp" %>
    <div class="recent-container">
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
                    <a href="/experience?email=${user.email}" >경험</a>
                    <a href="/my-opening">올린 공고</a>
                    <a href="/apply-opening">신청한 공고</a>
                    <a href="/recent-opening" class="active">최근 본 공고</a>
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

                <div id="list-card-section">
<%--                    <div class="opening-card">--%>
<%--                        <div class="opening-card-image">--%>
<%--                            <img src="${pageContext.request.contextPath}/image/petImage3.png">--%>
<%--                            <span class="opening-card-species" style="display:none">#고양이</span>--%>
<%--                            <span class="opening-card-loc" style="display:none">#혜화동</span>--%>
<%--                        </div>--%>
<%--                        <div class="opening-card-date">--%>
<%--                            <span>2025-08-15</span>--%>
<%--                            &nbsp;~&nbsp;--%>
<%--                            <span>2025-08-17</span>--%>
<%--                        </div>--%>
<%--                        <div class="opening-card-careway">--%>
<%--                            <p>여기로 와주세요</p>--%>
<%--                        </div>--%>
<%--                        <div class="opening-card-priceper">--%>
<%--                            <span class="opening-card-price">20000</span>--%>
<%--                            원&nbsp;/&nbsp;--%>
<%--                            <span class="opening-card-per">건당</span>--%>
<%--                        </div>--%>
<%--                    </div>--%>

                </div>

            </main>
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
