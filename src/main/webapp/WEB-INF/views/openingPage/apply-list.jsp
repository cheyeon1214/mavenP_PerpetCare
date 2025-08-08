<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>공고 지원</title>
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
    $(document).ready(function() {
        $(".accept-btn").click(function() {
            const aNo = $(this).data("ano");
            const oNo = $(this).data("ono");

            if (confirm("이메일을 전송하시겠습니까?")) {
                $.ajax({
                    url: "/acceptApply",
                    type: "POST",
                    data: {
                        aNo: aNo,
                        oNo: oNo
                    },
                    success: function(res) {
                        alert("수락 처리 및 이메일 전송이 완료되었습니다.");
                        location.href = "/applyList?no=" + oNo; // 새로고침
                    },
                    error: function() {
                        alert("처리 중 오류가 발생했습니다.");
                    }
                });
            }
        });

        $(".reject-btn").click(function () {
            const aNo = $(this).data("ano");
            const oNo = $(this).data("ono");

            if (confirm("정말 거절하시겠습니까?")) {
                $.ajax({
                    url: "/rejectApply",
                    type: "POST",
                    data: {
                        aNo: aNo
                    },
                    success: function () {
                        alert("거절 처리 완료");
                        location.href = "/applyList?no=" + oNo;
                    },
                    error: function () {
                        alert("거절 처리 중 오류 발생");
                    }
                });
            }
        });
    });

</script>
</head>
<style>
body{
    box-sizing: border-box;
}
.body-section{
    width: 1000px;
    margin: auto;
}
.header-top{
    height: 100px;
    background-color: white;
}
.title{
    margin-top: 70px;
    font-size: 38px;
    font-weight: bold;
    margin-bottom: 15px;
}
.container-box{
    margin: auto;
    border: 1.5px solid #ddd;
    box-shadow: 0 4px 15px rgba(0,0,0,0.16);
    border-radius: 20px;
    padding-bottom: 20px;
}
.pet-section{
    display:flex;
    margin: 30px;
    align-items: center;
}

#pet-img {
    width: 170px;
    height: 170px;
    border-radius: 20px;
    object-fit: cover;
}
.pet-name,.pet-text{
    padding: 4px;
}

.card-pet-left{
    margin-left: 30px;
    padding-left: 20px;
    display: flex;
    flex-direction: column;
    font-weight: 700;
    font-size: 19px;
}
.card-pet-right{
    margin-left: 50px;
    display: flex;
    flex-direction: column;
    font-weight: 500;
    font-size: 19px;
}
#line{
    margin: 30px;
    border: 1px solid rgb(182, 182, 182);
}
.opening-section{
    display: flex;
    padding: 20px;
}
.method{
    width: 30%;
    padding-left: 20px;
}
.period{
    width: 40%;
    padding-left: 20px;
}
.price{
    width: 30%;
    padding-left: 20px;
}
.prefer{
    width: 60%;
    padding-left: 20px;
}
.sub-title{
    font-size: 21px;
    font-weight: 700;
}
.sub-text{
    font-size: 20px;
    margin-top: 5px;
    margin-left: 10px;
}

.applicant-table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0 15px;
    text-align: center;
}

.applicant-table thead tr {
    box-shadow: 0 4px 15px rgba(0,0,0,0.16);
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
    box-shadow: 0 4px 15px rgba(0,0,0,0.16);
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

.user-profile {
    width: 100px;
    height: 100px;
    border-radius: 10px;
    object-fit: cover;
}


.accept-btn {
    background-color: #64DAFE;
    border: none;
    padding: 7px 40px;
    border-radius: 10px;
    color: white;
    cursor: pointer;
    font-weight: bold;
    font-size: 17px;
    box-shadow: 0 4px 5px rgba(0,0,0,0.1);
}

.reject-btn {
    margin-top: 10px;
    background-color: white;
    border: none;
    padding: 7px 40px;
    border-radius: 10px;
    color: #64DAFE;
    cursor: pointer;
    font-weight: bold;
    font-size: 17px;
    box-shadow: 0 4px 5px rgba(0,0,0,0.1);
}

.grade-space{
    margin-top: 5px;
    font-size: 15px;
    font-weight: 500;
}

.chart-container {
    margin-top: 30px;
    display: flex;
    justify-content: space-between;
    margin-bottom: 200px;
}

.chart-card {
    background: white;
    border-radius: 15px;
    padding: 50px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.1);
}

#genderChart{
    margin: 30px;
}

#ageChart{
    margin: 30px;
}

.chart-title{
    text-align: center;
    padding-bottom: 20px;
    font-size: 25px;
    font-weight: 600;
}

.text-ellipsis {
    max-width: 300px;
    white-space: nowrap;
    overflow: hidden;       /* 넘치는 부분 숨김 */
    text-overflow: ellipsis; /* 말줄임 (...) 처리 */
}

.status-text{
    font-size: 18px;
    font-weight: 600;
    color: #FD9596;
}
.rejected-row {
    background-color: #F6F6F6 !important;
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
                    <img src="../../../image/petImage2.png" alt="petImg" id="pet-img">
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
        <div class="title">지원자 리스트</div>
        <table class="applicant-table">
            <thead>
                <tr>
                    <th>프로필</th>
                    <th>이메일</th>
                    <th>등급</th>
                    <th>신청한마디</th>
                    <th>수락 / 거절</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="apply" items="${applies}">
                    <tr class="${apply.aStatus eq 'reject' ? 'rejected-row' : (apply.aStatus eq 'accept' ? 'accepted-row' : '')}">
                        <td>
                            <c:choose>
                                <c:when test="${empty apply.uImage}">
                                    <img src="../../../image/profile_1.svg" class="user-profile" alt="userImg"/>
                                </c:when>
                                <c:otherwise>
                                    <img src="../../../image/profile_${apply.uImage}.svg" class="user-profile" alt="userImg"/>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>${apply.uEmail}</td>
                        <td>
                            <img src="../../../image/grade/grade_${apply.uGrade}.svg" class="grade-img" alt="gradeImg">
                            <div class="grade-space">${apply.uGrade}</div>
                        </td>
                        <td class="text-ellipsis">${apply.aText}</td>
                        <c:choose>
                            <c:when test="${apply.aStatus == 'accept'}">
                                <td><div class="status-text">수락됨</div></td>
                            </c:when>
                            <c:when test="${apply.aStatus == 'reject'}">
                                <td><div class="status-text">거절됨</div></td>
                            </c:when>
                            <c:otherwise>
                                <td>
                                    <button class="accept-btn" data-ano="${apply.aNo}" data-ono="${apply.oNo}">수락</button>
                                    <br>
                                    <button class="reject-btn" data-ano="${apply.aNo}" data-ono="${apply.oNo}">거절</button>
                                </td>
                            </c:otherwise>
                        </c:choose>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div class="title">지원자 통계</div>
        <div class="chart-container">
            <div class="chart-card">
                <h3 class="chart-title">지원자 성별</h3>
                <canvas id="genderChart"></canvas>
            </div>
            <div class="chart-card">
                <h3 class="chart-title">지원자 나이대</h3>
                <canvas id="ageChart"></canvas>
            </div>
        </div>
    </div>

    <div class="footer-space"></div>
<script>
    // Chart.js 예시
const ctx1 = document.getElementById('genderChart').getContext('2d');
new Chart(ctx1, {
    type: 'pie',
    data: {
        labels: ['여성', '남성'],
        datasets: [{
            data: [8, 2],
            backgroundColor: ['#FD9596', '#64DAFE']
        }]
    }
});

const ctx2 = document.getElementById('ageChart').getContext('2d');
new Chart(ctx2, {
    type: 'bar',
    data: {
        labels: ['20대', '30대', '40대', '50대'],
        datasets: [{
            label: '지원자 수',
            data: [1, 4, 3, 1],
            backgroundColor: '#FDC814',
            borderRadius: 9 
        }]
    },
    options: {
        aspectRatio: 1, 
        maxBarThickness: 30, 
        plugins: {
            legend: {
                display: false
            },
        },
        scales: {
            x: {
                grid: {
                    display: false
                },
                ticks: {
                    font: {
                        size: 14
                    }
                }
            },
            y: {
                beginAtZero: true,
                max: 5, 
                ticks: {
                    stepSize: 1,
                    callback: function(value) {
                        return value + '명';
                    },
                    font: {
                        size: 14
                    }
                },
                grid: {
                    display: true,
                    color: '#e0e0e0'
                }
            }
        }
    }
});
</script>
</body>
</html>