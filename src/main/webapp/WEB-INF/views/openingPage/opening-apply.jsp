<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>공고 지원</title>
    <link rel="stylesheet" href="../../../css/global.css">
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
body{
    box-sizing: border-box;
}
.body-section{
    width: 1000px;
    margin: auto;
    font-family: "Pretendard", sans-serif;
}
.header-top{
    height: 100px;
    background-color: white;
}
.title, h3{
    margin-top: 70px;
    font-size: 38px;
    font-weight: 500;
    margin-bottom: 15px;
}
.container-box{
    margin: auto;
    border: 1.5px solid #ddd;
    width: 1000px;
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
.my-profile{
    width: 600px;
}
.one-section{
    display: flex;
    align-items:baseline;
}
.title-sub{
    margin-left: 7px;
    font-size: 20px;
}
.text-box{
    width: 1000px;
    height: 100px;
    border: 2px solid #ddd;
    border-radius: 8px;
    padding: 12px 18px;
    font-size: 18px;
    font-weight: 500;
    text-align: left;    
}
textarea::placeholder {
    color: #999;
    font-size: 22px;
}

.submit-button{
    display: block; 
    margin: auto;
    margin-top: 100px;
    width: 500px;
    height: 50px;
    font-size: 22px;
    color: white;
    background-color: #64DAFE;
    border: none;
    border-radius: 15px;
    margin-bottom: 200px;
}


.history{
    display: flex;
    flex-direction: column;
    justify-content: space-around;
}

.experience-main h3 {
    font-weight: bold;
}


.card {
    margin: auto;
    width: 1040px;
    box-shadow: 0 2px 6px rgba(0,0,0,0.1);
    border-radius: 20px !important;
    padding: 20px 0 20px 0;
    background-color: white;
}

/* 하나의 이력 row */
.entry {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    margin-top: 10px;
    margin-bottom: 10px;
    font-weight: 600;
    font-size: 18px;
    letter-spacing: 1.5px;
}

/* 전체 이력 정보 묶음 */
.pet-care {
    padding: 10px 0;
    display: flex;
    align-items: center;
    justify-content: center;
    width: 100%;
    gap: 40px;
    cursor: pointer;
}

.pet-care.selected {
    border-color:#64DAFE;
    background:rgba(100,218,254,.5);
    border-radius: 10px;
}

/* 날짜 */
.care-date {
    width: 140px;
    text-align: center;
}

/* ~ 표시 */
.care-line {
    width: 30px;
    text-align: center;
}

/* 종 (강아지, 고양이 등) */
.care-speices {
    width: 80px;
    text-align: center;
}

/* 품종 */
.care-breed {
    width: 100px;
    text-align: center;
}

.care-breed-box {
    display: inline-block;
    background-color: #FD9596;
    color: white;
    font-size: 14px;
    padding: 6px 12px;
    border-radius: 12px;
    white-space: nowrap;
}


</style>

<body>
    <%@ include file="/components/header.jsp" %>
    <div class="header-top"></div>
    <div class="body-section">
        <form action ="apply" method="post">
            <input type="hidden" name="uEmail" value="${user.email}">
            <input type="hidden" name="oNo" value="${opening.no}">
        <div class="title">신청할 공고</div>
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
                    <div class="sub-text">
                        ${sDateStr} ~ ${eDateStr}
                    </div>
                </div>
                <div class="price">
                    <div class="sub-title">가격</div>
                    <div class="sub-text">
                         <jsp:include page="../../../components/price.jsp">
                            <jsp:param name="price" value="${opening.price}"/>
                        </jsp:include>
                        원 / ${opening.per}</div>
                </div>
            </div>
            <div class="opening-section">
                <div class="method">
                    <div class="sub-title">돌봄 주소</div>
                    <div class="sub-text">${opening.location}</div>
                </div>
                <div class="prefer">
                    <div class="sub-title">우대사항</div>
                    <div class="sub-text">${opening.prefer}
                    </div>
                </div>
            </div>
        </div>

        <div class="title">내 프로필</div>
        <div class="profile-card my-profile">
            <div class="card-section">
                <div class="card-left">
                    <img src="../../../image/profile_${user.image}.svg" alt="profileImg">
                </div>
                <div class="card-right">
                    <div class="card-pet-left">
                        <div class="pet-name">이메일</div>
                        <div class="pet-name">성별</div>
                        <div class="pet-name">연령대</div>
                        <div class="pet-name">등급</div>
                    </div>

                <div class="card-pet-right">
                    <div class="pet-text">${user.email}</div>
                    <c:choose>
                        <c:when test="${user.gender == 'f'}">
                            <div class="pet-text">여성</div>
                        </c:when>
                        <c:otherwise>
                            <div class="pet-text">남성</div>
                        </c:otherwise>
                    </c:choose>
                    <div class="pet-text">${user.ageGroup}</div>
                    <div class="pet-text">${user.grade}</div>
                </div>
                                
            </div>
        </div>
    </div>
    <div class="one-section">
        <div class="title">신청 한 마디</div>
        <div class="title-sub">(30자 이내)</div>
    </div>

        <textarea class="text-box" id="one-text" name="text" placeholder="나를 어필할 수 있는 간단한 소개를 적어주세요."></textarea>



    <section class="history">
        <div class="owner">
            <h3>돌봄 이력</h3>
            <br>
            <div class="card">
                <div class="entry">
                    <div class="view-mode">
                      <c:choose>
                        <c:when test="${not empty ownerList}">
                          <c:forEach var="exp" items="${ownerList}">
                            <div class="pet-care" data-id="${exp.no}"
                             data-sdate="${exp.sDate}"
                             data-edate="${exp.eDate}"
                             data-species="${exp.species}"
                             data-breed="${exp.breed}">
                              <div class="care-date">${exp.sDate}</div>
                              <div class="care-line">~</div>
                              <div class="care-date">
                                  <c:choose>
                                    <c:when test="${empty exp.eDate}">현재</c:when>
                                    <c:otherwise>${exp.eDate}</c:otherwise>
                                  </c:choose>
                              </div>
                              <div class="care-speices">${exp.species}</div>

                              <div class="care-breed">
                                <div class="care-breed-box">
                                  ${exp.breed}
                                </div>
                              </div>
                            </div>
                          </c:forEach>
                        </c:when>
                        <c:otherwise>
                          <div class="empty">등록된 반려 경험이 없습니다.</div>
                        </c:otherwise>
                      </c:choose>
                    </div>
                    </div>
            </div>
        </div>

        <div class="sitter">
        <h3>
        PerpetCare 시터 이력
        </h3>
        <br>
        <div class="card">
            <div class="entry">
                <c:choose>
                    <c:when test="${not empty sitterList}">
                    <c:forEach var="exp" items="${sitterList}">
                        <div class="pet-care">
                              <div class="care-date">${exp.sDate}</div>
                              <div class="care-line">~</div>
                              <div class="care-date">${exp.eDate}</div>

                              <div class="care-speices">${exp.species}</div>

                              <div class="care-breed">
                                <div class="care-breed-box">
                                  ${exp.breed}
                                </div>
                              </div>
                        </div>
                    </c:forEach>
                    </c:when>
                    <c:otherwise>
                      <div class="empty">등록된 반려 경험이 없습니다.</div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        </div>
    </section>

    <div id="button-wrapper"></div>
        <input type="submit" class="submit-button" value="내 프로필로 지원하기">
    </form>
    </div>
    <%@ include file="/components/footer.html" %>


</body>
</html>