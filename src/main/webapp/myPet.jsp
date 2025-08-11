<%--
  Created by IntelliJ IDEA.
  User: 사용자
  Date: 25. 8. 11.
  Time: 오후 8:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
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
  .grade-badge {
    height: 16px;
    vertical-align: middle;
    cursor: pointer;
  }
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
    text-decoration: none !important;
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
</style>
<script>

</script>
<body>
<%@ include file="/components/header.jsp" %>
  <div class="petPage-container">
    <!-- Sidebar -->
    <aside class="sidebar">
      <div class="sidebar-top">
        <div class="profile">
          <img src="../../..${user.imagePath}" alt="프로필" class="profile-img" />
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
              <img class="grade-badge" id="gradeBadge"
                   src="../../../image/grade/grade_${user.grade}.svg" alt="grade-badge" />
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
          <a href="/petPage" class="active">반려동물</a>
          <a href="/experiencePage" >경험</a>
          <a href="/opening/mine">올린 공고</a>
          <a href="/opening/myApply">신청한 공고</a>
          <a href="/opening/recent">최근 본 공고</a>
        </div>
      </div>
      <div class="logout"><a href="#">로그아웃</a></div>
    </aside>

    <div>


    </div>

  </div>
</body>
</html>
