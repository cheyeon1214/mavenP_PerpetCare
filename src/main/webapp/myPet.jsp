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
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta charset="utf-8" />
<link rel="stylesheet" href="css/global.css" />
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
  }
  .pet-container {
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

  .grade-badge {
    height: 16px;
    vertical-align: middle;
    margin-top: 4px;
    cursor:pointer;
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

  /* 반려동물 메인 */
  .container {
    display:flex;
    justify-content: center;
    padding-left: 200px;
  }
  .pet-main {
    width: 80%;
    margin-top: 50px;
  }
  .display-flex {
    display: flex;
    justify-content: center;
    align-items: center;
  }
  .my-pet-img {
    width: 200px;
    height:200px;
    background-color: lightgray;
    border-radius: 20px;
    position: relative;
  }
  .my-pet-name {
    position: absolute;
    width: 80px;
    top: 150px;
    left: 60px;
    padding: 5px 10px;
    border-radius: 10px;
    text-align: center;
    color: white;
    font-weight: bold;
    background-color: #FD9596;
  }
  .my-pet-info {
    width:500px;
    height: 200px;
    background: radial-gradient(ellipse, #fee6e6, #fecdce 35%, #FD9596);
    border-radius: 20px;
    padding-top: 10px;
    padding-left: 75px;
  }
  .my-pet-info-edit {
    width:500px;
    height: 200px;
    border-radius: 20px;
    box-shadow: 2px 4px 10px rgba(0, 0, 0, 0.25);
    padding-left: 75px;
  }
  .my-pet-info-row {
    width: 80%;
    display: flex;
    justify-content: space-around;
    padding: 10px 20px;
  }
  .my-pet-info-row-edit {
    width: 80%;
    display: flex;
    justify-content: space-around;
    padding: 5px 20px;
  }
  .have-dashed {
    border-bottom: 2px dashed #FD9596;
  }
  .my-pet-info-title {
    width: 150px;
    text-align: center;
    font-weight: bold;
  }
  .my-pet-info-text {
    width: 200px;
    text-align: center;
  }
  .button-row {
    display: flex;
    justify-content: end;
    padding-right: 20px;
    margin: 5px 0 20px 0;
  }
  .button-delete, .button-complete {
    background-color: #64dafe;
    color: white;
    font-weight: bold;
    width: 100px;
    border: none;
    border-radius: 10px;
    box-shadow: 0 4px 4px rgba(0, 0, 0, 0.25);
    padding: 5px;
    margin: 5px;
  }
  .button-update {
    background-color: white;
    color: #64dafe;
    font-weight: bold;
    width: 100px;
    border: none;
    border-radius: 10px;
    box-shadow: 0 4px 4px rgba(0, 0, 0, 0.25);
    padding: 5px;
    margin: 5px;
  }
  #button-add-pet {
    width: 700px;
    margin: 0 auto;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 10px;
    border-radius: 10px;
    box-shadow: 2px 4px 10px rgba(0, 0, 0, 0.25);
  }
  #button-add-pet > svg {
    margin: 0 5px;
  }
  #button-add-pet > span {
    color:#404040;
    font-weight: bold;
  }
</style>
<script>

</script>
<body>
  <div class="page-container">
  <%@ include file="/components/header.jsp" %>
    <div class="pet-container">
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
            <a href="#" class="active">반려동물</a>
            <a href="/experiencePage" >경험</a>
            <a href="/opening/mine">올린 공고</a>
            <a href="/opening/myApply">신청한 공고</a>
            <a href="#">최근 본 공고</a>
          </div>
        </div>
        <div class="logout"><a href="#">로그아웃</a></div>
      </aside>

      <div class="container">
        <div class="pet-main">
          <div class="my-pet-box pet-view-mode">
            <div class="display-flex">
              <div class="my-pet-img">
                <img class="my-pet-image" src="/image/pet_default_profile.png" width="200" height="200">
                <span class="my-pet-name">쿠로미</span>
              </div>
              <div class="my-pet-info">
                <div class="my-pet-info-row have-dashed">
                  <span class="my-pet-info-title">종</span>
                  <span class="my-pet-info-text">개</span>
                </div>
                <div class="my-pet-info-row have-dashed">
                  <span class="my-pet-info-title">품종</span>
                  <span class="my-pet-info-text">말티즈</span>
                </div>
                <div class="my-pet-info-row have-dashed">
                  <span class="my-pet-info-title">성별</span>
                  <span class="my-pet-info-text">여</span>
                </div>
                <div class="my-pet-info-row">
                  <span class="my-pet-info-title">나이</span>
                  <span class="my-pet-info-text">2살</span>
                </div>
              </div>
            </div>
            <div class="button-row">
              <button type="button" class="button-delete" name="deleteBtn">삭제</button>
              <button type="button" class="button-update" name="updateBtn">수정</button>
            </div>
          </div>

          <div class="my-pet-box my-pet-box-edit">
            <div class="display-flex">
              <div class="my-pet-img">
                <img src="">
                <span class="my-pet-name"></span>
              </div>
              <div class="my-pet-info-edit">
                <div class="my-pet-info-row-edit">
                  <span class="my-pet-info-title">이름</span>
                  <input type="text" name="name" value="${pet.name}" placeholder="${pet.name}">
                </div>
                <div class="my-pet-info-row-edit">
                  <span class="my-pet-info-title">종</span>
                  <select name="species">
                    <option value="">반려동물 종을 선택해주세요</option>
                    <option value="개" ${pet.species == '개' ? 'selected' : ''}>개</option>
                    <option value="고양이" ${pet.species == '고양이' ? 'selected' : ''}>고양이</option>
                    <option value="토끼" ${pet.species == '토끼' ? 'selected' : ''}>토끼</option>
                    <option value="물고기" ${pet.species == '물고기' ? 'selected' : ''}>물고기</option>
                    <option value="새" ${pet.species == '새' ? 'selected' : ''}>새</option>
                    <option value="햄스터" ${pet.species == '햄스터' ? 'selected' : ''}>햄스터</option>
                    <option value="기타" ${pet.species == '기타' ? 'selected' : ''}>기타</option>
                  </select>
                </div>
                <div class="my-pet-info-row-edit">
                  <span class="my-pet-info-title">품종</span>
                  <input type="text" name="breed" value="${pet.breed}" placeholder="${pet.breed}">
                </div>
                <div class="my-pet-info-row-edit">
                  <span class="my-pet-info-title">성별</span>
                  <label><input type="radio" name="gender"
                                value="f" ${pet.gender == 'f' ? 'checked' : ''}> 여</label>
                  <label><input type="radio" name="gender"
                                value="m" ${pet.gender == 'm' ? 'checked' : ''}> 남</label>
                  <label><input type="radio" name="gender"
                                value="n" ${pet.gender == 'n' ? 'checked' : ''}> 모름</label>
                </div>
                <div class="my-pet-info-row-edit">
                  <span class="my-pet-info-title">생년월일</span>
                  <input type="date" name="bDate" value="${pet.bDate}">
                </div>
              </div>
            </div>
            <div class="button-row">
              <button type="button" class="button-complete" name="completeBtn">완료</button>
            </div>
          </div>

          <div id="button-add-pet">
            <svg width="30" height="30" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M8.21495 8.21495C9.75526 6.6351 11.5939 5.37681 13.6243 4.5131C15.6547 3.64938 17.8364 3.19742 20.0429 3.18344C22.2493 3.16946 24.4365 3.59373 26.4777 4.43165C28.5189 5.26957 30.3734 6.50445 31.9336 8.06466C33.4938 9.62487 34.7287 11.4794 35.5666 13.5205C36.4045 15.5617 36.8288 17.749 36.8148 19.9554C36.8008 22.1618 36.3489 24.3435 35.4851 26.3739C34.6214 28.4043 33.3631 30.243 31.7833 31.7833C28.6399 34.8193 24.4299 36.4992 20.0599 36.4612C15.69 36.4232 11.5098 34.6704 8.41964 31.5803C5.32951 28.4901 3.57669 24.3099 3.53872 19.94C3.50074 15.57 5.18065 11.36 8.21662 8.21662L8.21495 8.21495ZM21.6666 15C21.6666 14.5579 21.491 14.134 21.1785 13.8214C20.8659 13.5089 20.442 13.3333 19.9999 13.3333C19.5579 13.3333 19.134 13.5089 18.8214 13.8214C18.5089 14.134 18.3333 14.5579 18.3333 15V18.3333H14.9999C14.5579 18.3333 14.134 18.5089 13.8214 18.8214C13.5089 19.134 13.3333 19.5579 13.3333 20C13.3333 20.442 13.5089 20.8659 13.8214 21.1785C14.134 21.491 14.5579 21.6666 14.9999 21.6666H18.3333V25C18.3333 25.442 18.5089 25.8659 18.8214 26.1785C19.134 26.491 19.5579 26.6666 19.9999 26.6666C20.442 26.6666 20.8659 26.491 21.1785 26.1785C21.491 25.8659 21.6666 25.442 21.6666 25V21.6666H24.9999C25.442 21.6666 25.8659 21.491 26.1785 21.1785C26.491 20.8659 26.6666 20.442 26.6666 20C26.6666 19.5579 26.491 19.134 26.1785 18.8214C25.8659 18.5089 25.442 18.3333 24.9999 18.3333H21.6666V15Z" fill="#64DAFE"/>
            </svg>
            <span>반려동물 추가하기</span>
          </div>

        </div>
      </div>
    </div>
</body>

</html>
