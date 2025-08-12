<%--
  Created by IntelliJ IDEA.
  User: 사용자
  Date: 25. 8. 11.
  Time: 오후 8:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta charset="utf-8"/>
<link rel="stylesheet" href="../../../css/global.css"/>
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
        padding-bottom: 300px;
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
        display: flex;
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

    .my-pet-box, .my-pet-box-edit, .my-pet-box-add {
        margin-bottom: 20px;
    }

    .my-pet-img, .my-pet-img-edit, .my-pet-img-add {
        width: 200px;
        height: 200px;
        background-color: lightgray;
        border-radius: 20px;
        position: relative;
    }

    .my-pet-img img, .my-pet-img-edit img, .my-pet-img-add img {
        width: 200px;
        height: 200px;
        border-radius: 20px;
        object-fit: cover;
        display: block;
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
        width: 500px;
        height: 200px;
        background: radial-gradient(ellipse, #fee6e6, #fecdce 35%, #FD9596);
        border-radius: 20px;
        padding-top: 5px;
        padding-left: 75px;
    }

    .my-pet-info-row {
        width: 80%;
        display: flex;
        justify-content: space-around;
        padding: 10px 20px;
    }

    hr {
        border-top: 2px dashed #FD9596;
        width: 200px;
        padding: 0;
        margin-top: 10px;
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
        text-align: center;
        padding-right: 20px;
        margin: 5px 0 20px 0;
    }

    .button-delete, .button-complete, .button-add {
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

    .button-update, .button-cancel {
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
        margin: 50px auto 30px auto;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 10px;
        border-radius: 10px;
        box-shadow: 2px 4px 10px rgba(0, 0, 0, 0.25);
        cursor: pointer;
    }

    #button-add-pet > svg {
        margin: 0 5px;
    }

    #button-add-pet > span {
        color: #404040;
        font-weight: bold;
    }

    /*  반려동물 > 수정 박스 */
    .my-pet-box-edit, .my-pet-box-add {
        /*display: none;*/
    }

    .my-pet-info-edit, .my-pet-info-add {
        width: 500px;
        height: 200px;
        border-radius: 20px;
        box-shadow: 2px 4px 10px rgba(0, 0, 0, 0.25);
        padding-left: 75px;
    }

    .my-pet-info-row-edit, .my-pet-info-row-add {
        width: 80%;
        display: flex;
        justify-content: space-around;
        text-align: center;
        padding: 5px 20px;
        align-items: center;
    }

    .my-pet-info-title-edit, .my-pet-info-title-add {
        width: 100px;
        text-align: left;
        font-weight: bold;
        margin-right: 20px;
    }

    .my-pet-info-text-edit, [type="text"], select, .my-pet-info-text-add {
        width: 200px;
        text-align: center;
        color: dimgray;
    }

    [type='date'] {
        width: 200px;
        text-align: center;
        color: dimgray;
    }

    [type="text"], select, [type="date"] {
        border: 2px solid #fdb4b5;
        border-radius: 10px;
    }

    .my-pet-info-text-edit > label, .my-pet-info-text-add > label {
        padding: 0 7px;
    }
    .empty-pet{
      width: 700px;
      margin: 50px auto 30px auto;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 10px;
      border-radius: 10px;
      box-shadow: 2px 4px 10px rgba(0, 0, 0, 0.25);
    }

    .select-species{
      width: 188px;
      padding: 3px 0;
    }
</style>
<script>
    $(document).ready(function () {
        // 수정 폼 & 추가 폼 숨겨두기
        const $editForm = $('.my-pet-box-edit'); // jQuery 객체
        $editForm.hide();
        const $addForm = $('#petAddForm');
        $addForm.hide();

        // 수정 버튼 → 해당 카드만 보기→수정 전환
        $(document).on('click', '.button-update', function () {
          const $section = $(this).closest('.pet-section');
          $section.find('.my-pet-box').hide();
          $section.find('.my-pet-box-edit').show();
        });




        // 추가하기
        $('#button-add-pet').on('click', function () {
            $('.pet-add-section').append($addForm.show()); // hide 했기 때문에 show 필수
        }); // add click
        $('.button-cancel').on('click', function () {
            $addForm.hide().detach();
        }); // 추가 취소 버튼

        $('#petImage').on('change', function () {
            const file = this.files && this.files[0];
            if (!file) return;
            // console.log(file.name, file.size, file.type);
            const reader = new FileReader();
            reader.onload = function (e) {
                $('#addPreview').attr('src', e.target.result);
            };
            reader.readAsDataURL(file);
        }); // 이미지 변경 반영
        $('#editImage').on('change', function () {
          const file = this.files && this.files[0];
          if (!file) return;
          // console.log(file.name, file.size, file.type);
          const reader = new FileReader();
          reader.onload = function (e) {
            $('.editPreview').attr('src', e.target.result);
          };
          reader.readAsDataURL(file);
        }) // 이미지 변경 반영

      $(document).on('submit', '.petEditForm', function(e){
        const $form = $(this);
        const no =  $form.find('[name="no"]').val();
        const uEmail =  $form.find('[name="uEmail"]').val();
        const name    = $form.find('[name="name"]').val()?.trim();
        const species = $form.find('[name="species"]').val();
        const breed   = $form.find('[name="breed"]').val()?.trim();
        const gender  = $form.find('[name="gender"]:checked').val(); // 라디오 주의
        const bDate   = $form.find('[name="bDate"]').val();

        // 수정에서는 이미지 선택 optional
        if (!name)   { alert('이름을 입력해주세요.');   e.preventDefault(); return; }
        if (!species){ alert('종을 선택해주세요.');    e.preventDefault(); return; }
        if (!breed)  { alert('품종을 입력해주세요.');  e.preventDefault(); return; }
        if (!gender) { alert('성별을 선택해주세요.');  e.preventDefault(); return; }
        if (!bDate)  { alert('생년월일을 입력해주세요.'); e.preventDefault(); return; }

        // 통과 → e.preventDefault() 하지 않음 = 기본 submit 진행
      });

        $(document).on('submit', '#petAddForm', function (e) {
            // 기본 전송 막음
            e.preventDefault();
            // 변수 저장
            const $form = $('#petAddForm');
            const uEmail = $form.find('[name="uEmail"]').val();
            const name = $form.find('input[name="name"]').val()?.trim();
            const image = $form.find('input[name="imageFile"]')[0]?.files[0];
            const species = $form.find('select[name="species"]').val();
            const breed = $form.find('[name="breed"]').val()?.trim();
            const gender = $form.find('[name="gender"]').val();
            const bDate = $form.find('[name="bDate"]').val();
            // 누락 항목 확인
            if (!name) {
                alert("추가할 반려동물 이름을 입력해주세요.");
                return;
            }
            if (!image) {
                alert("추가할 반려동물 사진을 추가해주세요.");
                return;
            }
            if (!species) {
                alert("추가할 반려동물 종을 선택해주세요.");
                return;
            }
            if (!breed) {
                alert("추가할 반려동물 품종을 입력해주세요.");
                return;
            }
            if (!gender) {
                alert("추가할 반려동물 성별을 선택해주세요.");
                return;
            }
            if (!bDate) {
                alert("추가할 반려동물이 태어난 일을 입력해주세요.");
                return;
            }
            $form[0].submit();
            // 네이티브 전송 (재귀X)
            HTMLFormElement.prototype.submit.call(this);
            // 추가 폼 숨기기
            $addForm.hide().detach();
        }); // 추가 등록 버튼

        // 삭제하기
        $(".button-delete").on('click', function () {
            const no = $(this).closest('.my-pet-box').data('pet-no');
            const uEmail = $(this).data('email');
            // const $delForm = $(this).closest('.my-pet-box');
            if (!confirm("정말 이 반려동물 정보를 삭제하시겠습니까?")) {
                return;
            }
            $.ajax({
                url: '/deletePet',
                type: 'POST',
                data: {no: no},
                success: function (data) {
                    if (data === "ok") {
                        alert("반려동물 정보가 삭제되었습니다.");
                        location.href = "/pet?email=" + uEmail;
                    } else {
                        alert("삭제 중 문제가 발생했습니다.")
                    }
                },
                error: function () {
                    alert("서버와 통신 중 오류가 발생했습니다.");
                }
            }); // ajax
        })

    }); // ready
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
                            src="../../..${profile.imagePath}"
                            alt="프로필"
                            class="profile-img"
                    />
                    <div class="info">
                        <div class="name">${profile.name}</div>
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
                                    src="../../../image/grade/grade_${profile.grade}.svg"
                                    alt="grade-badge"
                            />
                        </div>
                        <div class="info-right">
                            <div class="grade">${profile.grade}</div>
                            <div class="gender">${profile.genderStr}</div>
                            <div class="age">${profile.ageGroup}</div>
                        </div>
                    </div>
                </div>
                <div class="edit-btn-wrapper1">
                <c:choose>
                <c:when test="${isOwner == false}">
                <button class="edit-btn" onclick="location.href='${pageContext.request.contextPath}/myInfo'">수정</button>
                </c:when>
              </c:choose>
                </div>


                <c:choose>
                <c:when test="${!isOwner}">
                <div class="nav">
                    <a href="/pet?email=${profile.email}" class="active">반려동물</a>
                    <a href="/experiencePage">경험</a>
                    <a href="/opening/mine">올린 공고</a>
                    <a href="/opening/myApply">신청한 공고</a>
                    <a href="/opening/recent">최근 본 공고</a>
                </div>
                </c:when>
                <c:otherwise>
                  <div class="nav">
                    <a href="/pet?email=${profile.email}" class="active">반려동물</a>
                    <a href="/experience?email=${profile.email}">경험</a>
                </div>
                </c:otherwise>
                </c:choose>

            </div>
            <c:choose>
                <c:when test="${!isOwner}">
                <div class="logout"><a href="/logout">로그아웃</a></div>
                </c:when>
            </c:choose>

        </aside>
        <div class="container">
            <div class="pet-main">
                <c:choose>
                <c:when test="${pets.size() != 0}">
                <c:forEach var="pet" items="${pets}">
                    <div class="pet-section" data-pet-no="${pet.no}">
                    <form id="petEditForm" action="/updatePet" method="post" enctype="multipart/form-data"
                                  novalidate>
                                  <input type="hidden" name="no" value="${pet.no}">
                                <div class="my-pet-box-edit">
                                    <div class="display-flex">
                                        <div class="my-pet-img-edit">
                                            <img class="editPreview" src="data:image/jpeg;base64,${pet.base64Image}">
                                            <input type="file" id="editImage" name="imageFile" accept="image/*">
                                        </div>
                                        <div class="my-pet-info-edit">
                                            <div class="my-pet-info-row-edit">
                                                <span class="my-pet-info-title-edit">이름</span>
                                                <input type="text" name="name" value="${pet.name}"
                                                       placeholder="${pet.name}">
                                            </div>
                                            <div class="my-pet-info-row-edit">
                                                <span class="my-pet-info-title-edit">종</span>
                                                <select name="species" class="select-species">
                                                    <option value="">반려동물 종을 선택해주세요</option>
                                                    <option value="개" ${pet.species == '개' ? 'selected' : ''}>개</option>
                                                    <option value="고양이" ${pet.species == '고양이' ? 'selected' : ''}>고양이
                                                    </option>
                                                    <option value="토끼" ${pet.species == '토끼' ? 'selected' : ''}>토끼
                                                    </option>
                                                    <option value="물고기" ${pet.species == '물고기' ? 'selected' : ''}>물고기
                                                    </option>
                                                    <option value="새" ${pet.species == '새' ? 'selected' : ''}>새</option>
                                                    <option value="햄스터" ${pet.species == '햄스터' ? 'selected' : ''}>햄스터
                                                    </option>
                                                    <option value="기타" ${pet.species == '기타' ? 'selected' : ''}>기타
                                                    </option>
                                                </select>
                                            </div>
                                            <div class="my-pet-info-row-edit">
                                                <span class="my-pet-info-title-edit">품종</span>
                                                <input type="text" name="breed" value="${pet.breed}"
                                                       placeholder="${pet.breed}">
                                            </div>
                                            <div class="my-pet-info-row-edit">
                                                <span class="my-pet-info-title-edit">성별</span>
                                                <span class="my-pet-info-text-edit">
                                                <label><input type="radio" name="gender"
                                                              value="f" ${pet.gender == 'f' ? 'checked' : ''}> 여</label>
                                                <label><input type="radio" name="gender"
                                                              value="m" ${pet.gender == 'm' ? 'checked' : ''}> 남</label>
                                                <label><input type="radio" name="gender"
                                                              value="n" ${pet.gender == 'n' ? 'checked' : ''}> 모름</label>
                                                </span>
                                            </div>
                                            <div class="my-pet-info-row-edit">
                                                <span class="my-pet-info-title-edit">생년월일</span>
                                                <input type="date" name="bDate" value="${pet.bDate}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="button-row">
                                    <input type="hidden" name="uEmail" value="${profile.email}">
                                        <input type="submit" class="button-complete" name="completeBtn" value="완료" data-email="${profile.email}">
                                    </div>
                                </div>
                            </form>
                        <div class="my-pet-box pet-view-mode">
                            <div class="display-flex">
                                <div class="my-pet-img">
                                    <img class="my-pet-image" src="data:image/jpeg;base64,${pet.base64Image}"
                                         width="200" height="200">
                                    <span class="my-pet-name">${pet.name}</span>
                                </div>
                                <div class="my-pet-info">
                                    <div class="my-pet-info-row have-dashed">
                                        <span class="my-pet-info-title">종</span>
                                        <hr>
                                        <span class="my-pet-info-text">${pet.species}</span>
                                    </div>
                                    <div class="my-pet-info-row have-dashed">
                                        <span class="my-pet-info-title">품종</span>
                                        <hr>
                                        <span class="my-pet-info-text">${pet.breed}</span>
                                    </div>
                                    <div class="my-pet-info-row have-dashed">
                                        <span class="my-pet-info-title">성별</span>
                                        <hr>
                                        <span class="my-pet-info-text">${pet.genderStr}</span>
                                    </div>
                                    <div class="my-pet-info-row">
                                        <span class="my-pet-info-title">나이</span>
                                        <hr>
                                        <span class="my-pet-info-text">${pet.age}</span>
                                    </div>
                                </div>
                            </div>
                            <c:if test="${!isOwner}">
                                <div class="button-row">
                                    <button type="button" class="button-delete" data-email="${profile.email}">삭제</button>
                                    <button type="button" class="button-update" data-email="${profile.email}">수정</button>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </c:forEach>
                </c:when>
                <c:otherwise>
                  <div class="empty-pet">등록된 반려동물이 없습니다.</div>
                </c:otherwise>
                </c:choose>

                <c:choose>
                    <c:when test="${!isOwner}">
                        <div id="button-add-pet">
                            <svg width="30" height="30" viewBox="0 0 40 40" fill="none"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path d="M8.21495 8.21495C9.75526 6.6351 11.5939 5.37681 13.6243 4.5131C15.6547 3.64938 17.8364 3.19742 20.0429 3.18344C22.2493 3.16946 24.4365 3.59373 26.4777 4.43165C28.5189 5.26957 30.3734 6.50445 31.9336 8.06466C33.4938 9.62487 34.7287 11.4794 35.5666 13.5205C36.4045 15.5617 36.8288 17.749 36.8148 19.9554C36.8008 22.1618 36.3489 24.3435 35.4851 26.3739C34.6214 28.4043 33.3631 30.243 31.7833 31.7833C28.6399 34.8193 24.4299 36.4992 20.0599 36.4612C15.69 36.4232 11.5098 34.6704 8.41964 31.5803C5.32951 28.4901 3.57669 24.3099 3.53872 19.94C3.50074 15.57 5.18065 11.36 8.21662 8.21662L8.21495 8.21495ZM21.6666 15C21.6666 14.5579 21.491 14.134 21.1785 13.8214C20.8659 13.5089 20.442 13.3333 19.9999 13.3333C19.5579 13.3333 19.134 13.5089 18.8214 13.8214C18.5089 14.134 18.3333 14.5579 18.3333 15V18.3333H14.9999C14.5579 18.3333 14.134 18.5089 13.8214 18.8214C13.5089 19.134 13.3333 19.5579 13.3333 20C13.3333 20.442 13.5089 20.8659 13.8214 21.1785C14.134 21.491 14.5579 21.6666 14.9999 21.6666H18.3333V25C18.3333 25.442 18.5089 25.8659 18.8214 26.1785C19.134 26.491 19.5579 26.6666 19.9999 26.6666C20.442 26.6666 20.8659 26.491 21.1785 26.1785C21.491 25.8659 21.6666 25.442 21.6666 25V21.6666H24.9999C25.442 21.6666 25.8659 21.491 26.1785 21.1785C26.491 20.8659 26.6666 20.442 26.6666 20C26.6666 19.5579 26.491 19.134 26.1785 18.8214C25.8659 18.5089 25.442 18.3333 24.9999 18.3333H21.6666V15Z"
                                      fill="#64DAFE"/>
                            </svg>
                            <span>반려동물 추가하기</span>
                        </div>
                        <div class="pet-add-section">
                            <form id="petAddForm" action="/registerPet" method="post" enctype="multipart/form-data"
                                  novalidate>
                                <div class="my-pet-box-add">
                                    <div class="display-flex">
                                        <div class="my-pet-img-add">
                                            <img id="addPreview" src="/image/pet_default_profile.png">
                                            <input type="file" id="petImage" name="imageFile" accept="image/*"
                                                   required="required">
                                        </div>
                                        <div class="my-pet-info-add">
                                            <div class="my-pet-info-row-add">
                                                <span class="my-pet-info-title-add">이름</span>
                                                <input type="text" name="name" value="${pet.name}"
                                                       placeholder="${pet.name}" required="required">
                                            </div>
                                            <div class="my-pet-info-row-add">
                                                <span class="my-pet-info-title-add">종</span>
                                                <select class="select-species" name="species" required="required">
                                                    <option value="">반려동물 종을 선택해주세요</option>
                                                    <option value="개" ${pet.species == '개' ? 'selected' : ''}>개</option>
                                                    <option value="고양이" ${pet.species == '고양이' ? 'selected' : ''}>고양이
                                                    </option>
                                                    <option value="토끼" ${pet.species == '토끼' ? 'selected' : ''}>토끼
                                                    </option>
                                                    <option value="물고기" ${pet.species == '물고기' ? 'selected' : ''}>물고기
                                                    </option>
                                                    <option value="새" ${pet.species == '새' ? 'selected' : ''}>새</option>
                                                    <option value="햄스터" ${pet.species == '햄스터' ? 'selected' : ''}>햄스터
                                                    </option>
                                                    <option value="기타" ${pet.species == '기타' ? 'selected' : ''}>기타
                                                    </option>
                                                </select>
                                            </div>
                                            <div class="my-pet-info-row-add">
                                                <span class="my-pet-info-title-add">품종</span>
                                                <input type="text" name="breed" value="${pet.breed}"
                                                       placeholder="${pet.breed}" required="required">
                                            </div>
                                            <div class="my-pet-info-row-add">
                                                <span class="my-pet-info-title-add">성별</span>
                                                <span class="my-pet-info-text-add">
                            <label><input type="radio" name="gender" value="f" ${pet.gender == 'f' ? 'checked' : ''}
                                          required="required"> 여</label>
                            <label><input type="radio" name="gender" value="m" ${pet.gender == 'm' ? 'checked' : ''}> 남</label>
                            <label><input type="radio" name="gender" value="n" ${pet.gender == 'n' ? 'checked' : ''}> 모름</label>
                          </span>
                                            </div>
                                            <div class="my-pet-info-row-add">
                                                <span class="my-pet-info-title-add">생년월일</span>
                                                <input type="date" name="bDate" value="${pet.bDate}"
                                                       required="required">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="button-row">
                                        <input type="hidden" name="uEmail" value="${profile.email}">
                                        <input type="submit" class="button-add" name="addBtn" value="등록">
                                        <button type="button" class="button-cancel" name="cancelBtn">취소</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </c:when>
                </c:choose>
            </div>
        </div>
    </div>
</body>

</html>
