<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib
        uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>myPage</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta charset="utf-8" />
    <link rel="stylesheet" href="css/global.css" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
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

        .petPage-container {
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

        .container{
            padding: 40px;
            display: flex;
            justify-content: center;
        }

        .pet-container {
            margin: 50px;
            display: flex;
            align-items: flex-start;
            width: 700px;
            position: relative;
        }

        .pet-view-mode {
            display: flex;
        }

        .pet-edit-container {
            display: flex;
        }

        .pet-image {
            width: 190px;
            height: 190px;
            border-radius: 20px;
            overflow: hidden;
            position: relative;
        }

        .pet-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 20px;
        }

        .pet-name {
            position: absolute;
            bottom: 15px;
            left: 50%;
            transform: translateX(-50%);
            background-color: #FD9596;
            color: white;
            padding: 4px 12px;
            border-radius: 10px;
            width: 50px;
            text-align: center;
            /*font-weight: bold;*/
        }

        .pet-info-box {
            /*background-color: #FD9596;*/
            /*opacity: 0.5;*/
            border-radius: 20px;
            padding: 20px;
            height: 150px;
            width: 480px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            position: relative;

        }
        .pet-info-rox {
            /*background-color: #FD9596;*/
            /*opacity: 0.5;*/
            border-radius: 20px;
            height: 150px;
            width: 480px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            position: relative;
            flex-direction: column
        }

        .info-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            font-size: 16px;
            font-weight: bold;
            border-bottom: 1px dashed #ffb6b6;
            padding-bottom: 6px;
            width: 100%;
        }

        .value {
            font-weight: normal;
            width: 50%;
        }
        #editFormContainer .pet-info-box {
            background-color: white;
            box-shadow: 0.3px 1px 2px 3px rgba(0, 0, 0, 0.1);
        }

        #viewContainer .pet-info-rox {
            border-radius: 20px;
            box-shadow: inset 0 0 100px rgba(255, 100, 102, 1);
            padding: 20px;
        }

        .pet-info-box p {
            margin: 4px 0;
            font-weight: bold;
            padding-bottom: 11px;
            margin-left: 3px;
        }

        .pet-info-box span {
            font-weight: normal;
            margin-left: 30px;
        }

        .pet-actions {
            position: absolute;
            padding-top: 20px;
            right: 0;
        }

        .btn {
            padding: 8px 16px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-size: 14px;
            margin-left: 10px;
            box-shadow: 0.2px 0.5px 1px 2px rgba(0, 0, 0, 0.1);
        }

        .btn-delete {
            background-color: #00cfff;
            color: white;
            width: 90px;
        }

        .btn-edit {
            background-color: white;
            color: #00cfff;
            width: 90px;
        }

        .btn-save {
            background-color: #00cfff;
            color: white;
            width: 90px;
        }

        .add-card {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 700px;
            height: 50px;
            margin-top: 80px;
            border-radius: 20px;
            background-color: white;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s;
            box-shadow: 0.9px 2px 2px 2px rgba(0, 0, 0, 0.1);
        }

        .plus-icon {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            background-color: #00cfff;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            margin-right: 10px;
            font-weight: bold;
        }

        /*이 밑으로 반려동물 추가 폼 css */
        .pet-add-container {
            width: 700px;
            margin-top: 50px;
            display: flex;
            flex-direction: column;
        }

        /*#preview {*/
        /*    width: 100px;*/
        /*    height: 100px;*/
        /*}*/

        .image-box {
            width: 240px;
            height: 240px;
            background-color: #dcdcdc;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 32px;
            color: #888;
            border-radius: 20px;
            cursor: pointer;
        }

        .image-box img {
            width: 240px;
            height: 240px;
            object-fit: cover;
        }

        .form-fields {
            background-color: #f9f9f9;
            border-radius: 20px;
            padding: 20px;
            height: 200px;
            width: 480px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            flex: 1;
        }

        .form-group {
            margin-bottom: 12px;
        }

        .form-group label {
            display: inline-block;
            width: 90px;
            font-weight: bold;
        }

        .form-group input,
        .form-group select {
            padding: 6px 10px;
            border: 1px solid #FD9596;
            border-radius: 20px;
            width: 200px;
        }

        .form-group input[type="radio"] {
            width: auto;
        }

        .form-group .radio-group {
            display: inline-block;
            margin-left: 10px;
        }

        .pet-add-actions {
            width: 700px;
            display: flex;
            justify-content: flex-end;
            margin: 10px auto 0;
            padding-top: 20px;
        }

        .btn-register {
            background-color: #00cfff;
            color: white;
            width: 90px;
        }

        .btn-add-cancel {
            background-color: white;
            color: #00cfff;
            width: 90px;
        }


        #addFormContainer {
            display: flex;
            align-items: flex-start;
        }

        .header-top {
            margin-top: 100px;
            background-color: white;
        }
    </style>
</head>
<body>
<div class="page-container">
    <%@ include file="/components/header.jsp" %>
    <div class="petPage-container">
        <!-- Sidebar -->
        <aside class="sidebar">
            <div class="sidebar-top">
                <div class="profile">
                    <img
                            src="../../../image/profile_1.svg"
                            alt="프로필"
                            class="profile-img"
                    />
                    <div class="info">
                        <div class="name">taeran</div>
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
                                    src="../../../image/grade/grade_Silver.svg"
                                    alt="grade-badge"
                            />
                        </div>
                        <div class="info-right">
                            <div class="grade">Silver</div>
                            <div class="gender">여성</div>
                            <div class="age">20대</div>
                        </div>
                    </div>
                </div>
                <div class="edit-btn-wrapper1">
                    <button class="edit-btn">수정</button>
                </div>
                <div class="nav">
                    <a href="#" class="active">반려동물</a>
                    <a href="/experiencePage" >경험</a>
                    <a href="#">올린 공고</a>
                    <a href="#">신청한 공고</a>
                    <a href="#">최근 본 공고</a>
                </div>
            </div>
            <div class="logout"><a href="#">로그아웃</a></div>
        </aside>

        <!-- Main Content -->
        <div class="container">
            <main class="pet-main">
                <c:forEach var="pet" items="${petList}">
                    <%--조회 모드--%>
                    <div class="pet-container" data-pet-no="${pet.no}" data-uEmail="${sessionScope.uEmail}">
                        <div class="pet-view-mode" id="viewContainer">
                            <div class="pet-image">
                                <img src="data:image/jpeg;base64,${pet.base64Image}" alt="펫 이미지">
                                <div class="pet-name">${pet.name}</div>
                            </div>

                            <div class="right-side">
                                <div class="pet-info-rox">
                                    <div class="info-row"><span class="label">종</span><span class="value">개</span></div>
                                    <div class="info-row"><span class="label">품종</span><span class="value">말티즈</span></div>
                                    <div class="info-row"><span class="label">성별</span><span class="value">m</span></div>
                                    <div class="info-row"><span class="label">나이</span><span class="value">1살</span></div>
                                </div>

                                <div class="pet-actions">
                                    <button class="btn btn-delete" data-uEmail="${sessionScope.uEmail}" data-pet-no="${pet.no}">삭제</button>
                                    <button class="btn btn-edit" data-uEmail="${sessionScope.uEmail}" data-pet-no="${pet.no}">수정</button>
                                </div>
                            </div>
                        </div>

                            <%-- 수정 모드 --%>
                        <div class="pet-edit-mode" style="display: none;">
                            <form id="editFormContainer" class="pet-edit-container" method="post" action="/updatePet"
                                  enctype="multipart/form-data">
                                <input type="hidden" name="no" value="${pet.no}">
                                <input type="hidden" name="uEmail" value="${sessionScope.uEmail}">

                                <div class="pet-image">
                                    <label>
                                        <img src="data:image/jpeg;base64,${pet.base64Image}" alt="펫 이미지" class="editable-image">
                                        <input type="file" name="imageFile" accept="image/*" style="display:none;">
                                    </label>
                                    <input type="text" name="name" value="${pet.name}" placeholder="이름">
                                </div>
                                <div class="right-side">
                                    <div class="pet-info-box">
                                        <div class="form-group">
                                            <label>종</label>
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
                                        <div class="form-group">
                                            <label>품종</label>
                                            <input type="text" name="breed" placeholder="품종을 입력해주세요">
                                        </div>
                                        <div class="form-group">
                                            <label>성별</label>
                                            <div class="radio-group">
                                                <label><input type="radio" name="gender"
                                                              value="f" ${pet.gender == 'f' ? 'checked' : ''}> 여</label>
                                                <label><input type="radio" name="gender"
                                                              value="m" ${pet.gender == 'm' ? 'checked' : ''}> 남</label>
                                                <label><input type="radio" name="gender"
                                                              value="n" ${pet.gender == 'n' ? 'checked' : ''}> 모름</label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>생년월일</label>
                                            <input type="date" name="bDate" value="${pet.bDate}">
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <div class="pet-actions">
                                <button type="submit" class="btn btn-save">저장</button>
                            </div>

                        </div>
                    </div>
                </c:forEach>
                <div class="add-card" id="addPetBtn">
                    <div class="plus-icon">+</div>
                    반려동물 추가하기
                </div>
                <div class="pet-add-container" style="display: none">
                    <form id="addFormContainer" action="/registerPet" method="post" enctype="multipart/form-data">
                        <div class="image-box">
                            <img id="preview" src="../../../image/default.png" alt="미리보기 이미지"></div>
                        <input type="file" id="petImage" name="imageFile" accept="image/*" style="display:none;">
                        <div class="form-fields">
                            <div class="form-group">
                                <%-- session 넣으면 수정해야함!!!!!!!!!!!!!--%>
                                <input type="hidden" name="uEmail" value="${sessionScope.uEmail}">
                                <label>이름</label>
                                <input type="text" name="name" placeholder="이름을 입력해주세요">
                            </div>
                            <div class="form-group">
                                <label>종</label>
                                <select name="species">
                                    <option value="">반려동물 종을 선택해주세요</option>
                                    <option value="개">개</option>
                                    <option value="고양이">고양이</option>
                                    <option value="토끼">토끼</option>
                                    <option value="물고기">물고기</option>
                                    <option value="새">새</option>
                                    <option value="햄스터">햄스터</option>
                                    <option value="기타">기타</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>품종</label>
                                <input type="text" name="breed" placeholder="품종을 입력해주세요">
                            </div>
                            <div class="form-group">
                                <label>성별</label>
                                <div class="radio-group">
                                    <label><input type="radio" name="gender" value="f"> 여</label>
                                    <label><input type="radio" name="gender" value="m"> 남</label>
                                    <label><input type="radio" name="gender" value="n"> 모름</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>생년월일</label>
                                <input type="date" name="bDate">
                            </div>
                        </div>
                    </form>
                    <div class="pet-add-actions">
                        <button class="btn btn-register" type="submit">등록</button>
                        <button class="btn btn-add-cancel">취소</button>
                    </div>
                </div>
            </main>
        </div>
    </div>

</div>
</body>
<script>
    $(document).ready(function () {
        $('#addPetBtn').on('click', function () {//반려동물 등록하기 버튼 누르면 폼 생기게
            $('.pet-add-container').show();
        });
        $('.btn-add-cancel').on('click', function (e) { //취소
            e.preventDefault(); //폼에서 submit 안되게
            $('.pet-add-container').hide();
        });
        $('.btn-register').on('click', function () {
            $('#addFormContainer').submit()[0].reset(); // 강제로 form submit
        });
        $('.btn-save').on('click', function () {
            $('#editFormContainer').submit()[0].reset(); // 강제로 form submit
        });
        $('.image-box').on('click', function () {
            $('#petImage').click();
        });
        $('#petImage').on('change', function (event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    $('#preview').attr('src', e.target.result);
                };
                reader.readAsDataURL(file);
            }
        });
        $('.btn-delete').on('click', function () {
            // const uEmail = $(this).data('uEmail'); //session 할때 이거 임시로 밑에거
            const uEmail = $('input[name="uEmail"]').val();
            const no = $(this).data('pet-no');
            const confirmDelete = confirm("정말로 이 펫을 삭제하시겠습니까?");
            if (confirmDelete) {
                location.href = '/deletePet?uEmail=' + uEmail + '&no=' + no;
            }
        });
        $('.btn-edit').click(function () {
            const uEmail = $('input[name="uEmail"]').val();
            const no = $(this).data('pet-no');
            // const container = $(`.pet-container[data-pet-no="${no}"]`);
            const container = $(".pet-container[data-pet-no='" + no + "']");
            //const container = $(this).closest('.pet-container');
            container.find('.pet-view-mode').hide();
            container.find('.pet-edit-mode').show();

        });

    });
</script>
</html>
