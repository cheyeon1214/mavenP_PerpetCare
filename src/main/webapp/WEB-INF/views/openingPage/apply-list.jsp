<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

</script>
</head>
<style>
body{
    box-sizing: border-box;
}
.body-section{
    width: 1000px;
    margin: auto;
    height: 2000px;
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
.profile-card{
    display: flex;
    background-color: white;
    border-radius: 5px;
    padding: 20px;
    border-radius: 20px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.16);
    transition: border-color 0.3s, box-shadow 0.3s;
    cursor: pointer;
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
    display: flex;
    gap: 20px;
}

.chart-card {
    flex: 1;
    background: white;
    border-radius: 15px;
    padding: 20px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.1);
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
                    <div class="pet-text">로미</div>
                    <div class="pet-text">고양이</div>
                    <div class="pet-text">코숏</div>
                    <div class="pet-text">암컷</div>
                    <div class="pet-text">1세</div>
                </div>            
            </div>
            <hr id="line">
            <div class="opening-section">
                <div class="method">
                    <div class="sub-title">돌봄 방법</div>
                    <div class="sub-text">여기로 와주세요</div>
                </div>
                <div class="period">
                    <div class="sub-title">돌봄 기간</div>
                    <div class="sub-text">codus001214@naver.com</div>
                </div>
                <div class="price">
                    <div class="sub-title">가격</div>
                    <div class="sub-text">20,000원 / 시급</div>
                </div>
            </div>
            <div class="opening-section">
                <div class="method">
                    <div class="sub-title">돌봄 주소</div>
                    <div class="sub-text">경기 부천시 범박동</div>
                </div>
                <div class="prefer">
                    <div class="sub-title">우대사항</div>
                    <div class="sub-text">실버 이상이상이면 좋을 것 같습니다. 흡연은 안 하셨으면 좋겠고,  
                        동물을 키워보신 분이시면 좋겠습니다.   
                    </div>
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
                <tr>
                    <td><img src="../../../image/default1.svg" class="user-profile" alt="userImg"></td>
                    <td>codus001214@naver.com</td>
                    <td>
                        <img src="../../../image/grade_Silver.png" class="grade-img" alt="gradeImg">
                        <div class="grade-space">실버</div>
                    </td>
                    <td>언제나 아이들을 먼저 생각합니다.</td>
                    <td>
                        <button class="accept-btn">수락</button>
                        <br>
                        <button class="reject-btn">거절</button>
                    </td>
                </tr>
                <tr>
                    <td><img src="../../../image/default1.svg" class="user-profile" alt="userImg"></td>
                    <td>abracadabra@gmail.com</td>
                    <td>
                        <img src="../../../image/grade_Silver.png" class="grade-img" alt="gradeImg">
                        <div class="grade-space">실버</div>
                    </td>
                    <td>그 누구보다 열심히 하겠습니다!</td>
                    <td>
                        <button class="accept-btn">수락</button>
                        <br>
                        <button class="reject-btn">거절</button>
                        
                    </td>
                </tr>
            </tbody>
        </table>

        <div class="title">지원자 통계</div>
        <div class="chart-container">
            <div class="chart-card">
                <h3>지원자 성별</h3>
                <canvas id="genderChart"></canvas>
            </div>
            <div class="chart-card">
                <h3>지원자 나이대</h3>
                <canvas id="ageChart"></canvas>
            </div>
        </div>
    </div>
        
    
</div>
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
            data: [1, 5, 3, 1],
            backgroundColor: '#FFC107'
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});
</script>
</body>
</html>