<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>반려동물 정보</title>

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #fefefe;
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 50px;
        }

        .pet-container {
            margin: 50px;
            display: flex;
            align-items: flex-start;
            width: 700px;
            position: relative;
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
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
            background-color: #ff7f9f;
            color: white;
            padding: 4px 12px;
            border-radius: 10px;
            font-weight: bold;
        }

        .pet-info-box {
            background-color: #ffc0cb;
            border-radius: 20px;
            padding: 20px;
            height: 150px;
            width: 480px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            position: relative;
        }

        .pet-info-box p {
            margin: 6px 0;
            font-weight: bold;
            border-bottom: 1px dashed #f399a1;
            padding-bottom: 4px;
        }

        .pet-info-box span {
            font-weight: normal;
            margin-left: 10px;
        }

        .pet-actions {
            position: absolute;
            padding-top: 20px;
            right: 0;
        }

        .btn {
            padding: 8px 16px;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            font-size: 14px;
            margin-left: 10px;
        }

        .btn-delete {
            background-color: #00cfff;
            color: white;
        }

        .btn-edit {
            background-color: white;
            color: #00cfff;
            border: 1px solid #00cfff;
        }
        .add-card {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 500px;
            height: 50px;
            margin-top: 80px;
            border-radius: 30px;
            background-color: white;
            border: 2px solid #00cfff;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s;
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
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
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
            border: 1px solid #f99;
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
        }
        .btn-cancel{
            background-color: white;
            color: #00cfff;
            border: 1px solid #00cfff;
        }
        #addFormContainer {
            display: flex;
            align-items: flex-start;
        }
        .header-top{
            margin-top: 100px;
            background-color: white;
        }
    </style>
</head>
<body>
<%@ include file="/components/header.jsp" %>
<div class="header-top"></div>

<c:forEach var="pet" items="${petList}">
<div class="pet-container">
    <div class="pet-image">
        <img src="data:image/jpeg;base64,${pet.base64Image}" alt="펫 이미지">
        <div class="pet-name">${pet.name}</div>
    </div>

    <div class="right-side">
        <div class="pet-info-box">
            <p>종<span>${pet.species}</span></p>
            <p>품종<span>${pet.breed}</span></p>
            <p>성별<span>${pet.gender}</span></p>
            <p>나이<span>${pet.age}</span></p>
        </div>

      <div class="pet-actions">
        <button class="btn btn-delete" data-uEmail="${pet.uEmail}" data-pet-no="${pet.no}">삭제</button>
        <button class="btn btn-edit">수정</button>
      </div>
    </div>
</div>
 </c:forEach>
<div class="add-card" id="addPetBtn">
    <div class="plus-icon">+</div>
    반려동물 추가하기
</div>
<div class="pet-add-container"  style="display: none">
    <form id="addFormContainer" action="/registerPet" method="post" enctype="multipart/form-data">
        <div class="image-box">
        <img id="preview" alt="미리보기 이미지"></div>
        <input type="file" id="petImage" name="imageFile" accept="image/*" style="display:none;">
        <div class="form-fields">
            <div class="form-group">
                <%-- session 넣으면 수정해야함!!!!!!!!!!!!!--%>
                <input type="hidden" name="uEmail" value="codus@naver.com">
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
        <button class="btn btn-cancel">취소</button>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        $('#addPetBtn').on('click', function() {//반려동물 등록하기 버튼 누르면 폼 생기게
            $('.pet-add-container').show();
        });
        $('.btn-cancel').on('click', function(e) { //취소
            e.preventDefault(); //폼에서 submit 안되게
            $('.pet-add-container').hide();
        });
        $('.btn-register').on('click', function() {
            $('#addFormContainer').submit()[0].reset(); // 강제로 form submit
        });
        $('.image-box').on('click', function(){
            $('#petImage').click();
        });
            $('#petImage').on('change', function(event) {
            const file = event.target.files[0];
            if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                $('#preview').attr('src', e.target.result);
            };
            reader.readAsDataURL(file);
        }
    });
            $('.btn-delete').on('click', function() {
                // const uEmail = $(this).data('uEmail'); //session 할때 이거 임시로 밑에거
                const uEmail = $('input[name="uEmail"]').val();
                const no = $(this).data('pet-no');
                const confirmDelete = confirm("정말로 이 펫을 삭제하시겠습니까?");
                if (confirmDelete) {
                    location.href = '/deletePet?uEmail='+uEmail+'&no='+no;
                }
            });
    });
</script>
</body>
</html>
