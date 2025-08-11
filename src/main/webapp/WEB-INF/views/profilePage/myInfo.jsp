<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib
        uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>MyInfomation</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta charset="utf-8" />
    <link rel="stylesheet" href="../../../css/global.css" />
    <link rel="stylesheet" href="" />
    <!-- Bootstrap CSS -->
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
    />
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
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
        .main-container{
            margin-top: 100px;
        }
        .profile-wrap {
            max-width: 640px;
            margin: 40px auto 80px;
            padding: 24px 20px 40px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .back-btn {
            position: absolute;
            top: 130px;    /* 위쪽 여백 */
            left: 50px;   /* 왼쪽 여백 */
            background: none;
            border: none;
            font-size: 1.5rem;
            cursor: pointer;
        }

        .profile-title {
            text-align: center;
            font-size: 28px;
            font-weight: 700;
            margin:24px 0;
        }

        .profile-avatar {
            width: 140px;
            height: 140px;
            border-radius: 20px;
            overflow: hidden;
            background: #f4f2ff;
            display: grid; place-items: center;
            margin-bottom: 10px;
        }
        .profile-avatar img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .profile-change-btn {
            background-color: white;
            margin:10px 0 40px 0;
            color: #64dafe;
            padding: 5px 30px;
            border-radius: 10px;
            border: none;
            font-size: 15px;
            font-weight: 800;
            cursor: pointer;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.25);
        }

        .avatar-space {
            display: none;
            gap: 8px;
            margin: 10px 0 18px;
            justify-content: center;
        }
        .avatar {
            width: 42px; height: 42px;
            border-radius: 10px;
            border: 2px solid transparent;
            cursor: pointer;
            object-fit: cover;
            transition: transform .1s ease, border-color .1s ease;
        }
        .avatar:hover {
            transform: translateY(-2px);
        }

        .avatar.selected {
            border-color: #64DAFE;
            box-shadow: 0 0 0 3px rgba(100,218,254,.25);
        }

        .profile-form {
            width: 100%;
            max-width: 520px;
            display: grid;
            grid-template-columns: 110px 1fr auto;
            row-gap: 18px;
            column-gap: 14px;
            align-items: center;
            justify-items: stretch;
        }

        .profile-label {
            text-align: right;
            font-weight: 700;
            color: #333;
            padding-right: 8px;
            white-space: nowrap;
        }

        .profile-input {
            width: 100%;
            border: 1px solid #e6e6e6;
            background: #f4f4f4;
            color: #666;
            border-radius: 10px;
            height: 40px;
            padding: 0 12px;
        }
        .profile-input.editable {
            background: #fff;
            color: #111;
        }
        .profile-help {
            grid-column: 2 / span 2;
            font-size: 12px; color: #999;
            margin-top: -6px;
        }

        .profile-cta {
            background-color: white;
            margin:5px 0 5px;
            color: #64dafe;
            padding: 5px 30px;
            border-radius: 10px;
            border: none;
            font-size: 15px;
            font-weight: 800;
            cursor: pointer;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.25);
        }

        /* 간격 정리 */
        .profile-spacer { height: 18px; grid-column: 1 / -1; }

        /* 반응형 살짝 */
        @media (max-width: 560px) {
            .profile-form { grid-template-columns: 90px 1fr auto; }
            .profile-title { font-size: 24px; }
        }
    </style>
</head>
<body>
    <div class="page-container">
        <%@ include file="/components/header.jsp" %>
        <div class="main-container">
            <div class="profile-wrap">
                <button class="back-btn" onclick="history.back()">←</button>
                <div class="profile-title">프로필</div>
                <!-- 아바타 -->
                <div class="profile-avatar">
                    <img class="profile-img" src="${pageContext.request.contextPath}/image/profile_1.svg" alt="프로필 이미지" />
                </div>
                <button type="button" class="profile-change-btn" id="profileImageChangeBtn">변경</button>
                <div class="avatar-space">
                    <img class="avatar" data-idx="1" src="${pageContext.request.contextPath}/image/profile_1.svg"  />
                    <img class="avatar" data-idx="2" src="${pageContext.request.contextPath}/image/profile_2.svg"  />
                    <img class="avatar" data-idx="3" src="${pageContext.request.contextPath}/image/profile_3.svg"  />
                    <img class="avatar" data-idx="4" src="${pageContext.request.contextPath}/image/profile_4.svg"  />
                    <img class="avatar" data-idx="5" src="${pageContext.request.contextPath}/image/profile_5.svg"  />
                    <img class="avatar" data-idx="6" src="${pageContext.request.contextPath}/image/profile_6.svg"  />
                </div>
                <!-- 정보 폼 -->
                <form class="profile-form" id="profileForm" onsubmit="return false;">
                    <!-- 이메일 (읽기 전용) -->
                    <label class="profile-label">이메일</label>
                    <input class="profile-input" type="email" value="${user.email}" disabled />
                    <span></span>

                    <!-- 이름 (읽기 전용) -->
                    <label class="profile-label">이 름</label>
                    <input class="profile-input" type="text" value="${user.name}" disabled />
                    <span></span>

                    <!-- 성별 (읽기 전용) -->
                    <label class="profile-label">성 별</label>
                    <input class="profile-input" type="text" value="${user.gender}" disabled />
                    <span></span>

                    <div class="profile-spacer"></div>

                    <!-- 비밀번호 변경 -->
                    <label class="profile-label">비밀번호</label>
                    <input class="profile-input editable" name="pwd" type="password" id="pwd" placeholder="새 비밀번호 입력" />
                    <button type="button" class="profile-cta" id="pwdChangeBtn">변경</button>
                    <div class="profile-help">영문/숫자/특수문자 조합 8자 이상 권장</div>

                    <!-- 전화번호 인증 -->
                    <label class="profile-label">전화번호</label>
                    <input class="profile-input editable" name="phone" type="tel" id="phone" placeholder="전화번호를 입력하세요(숫자만)" />
                    <button type="button" class="profile-cta" id="phoneVerifyBtn">인증</button>
                </form>
            </div>
        </div>
        <%@ include file="/components/footer.jsp" %>
    </div>
</body>
<script>
    //프로필 변경 버튼 누르면 이미지 뜨기
    $(function () {
        const $btn  = $('#profileImageChangeBtn');   // "변경"/"완료" 버튼
        const $grid = $('.avatar-space');            // 썸네일 그리드
        const $big  = $('.profile-img');             // 위 큰 이미지

        let mode = 'view'; //

        // 1) 버튼 토글: 변경 -> 선택모드, 완료 -> 저장
        $btn.on('click', function (e) {
            e.preventDefault();

            if (mode === 'view') {
                $grid.css('display', 'flex'); // 선택판 열기
                $btn.text('완료');
                mode = 'pick';
                return;
            }

            // mode === 'pick'  완료(저장)
            const $sel = $grid.find('.avatar.selected');
            if ($sel.length === 0) {
                alert('아바타를 선택하세요.');
                return;
            }
            const idx = $sel.data('idx'); // 1~6

            $btn.prop('disabled', true);

            $.post('/user/imgUpdate', { image: idx })
                .done(function (res) {
                    if (res && res.ok) {
                        // 서버가 돌려준 최신 경로로 큰 이미지 갱신
                        if (res.imagePath) $big.attr('src', res.imagePath);
                        // UI 원복
                        $grid.hide();
                        $btn.text('변경');
                        mode = 'view';
                        $grid.find('.avatar').removeClass('selected');
                    } else {
                        alert('이미지 변경에 실패했습니다.');
                    }
                })
                .fail(function () {
                    alert('서버 오류로 변경에 실패했습니다.');
                })
                .always(function () {
                    $btn.prop('disabled', false);
                });
        });

        // 2) 썸네일 클릭: 선택 표시 + 즉시 미리보기
        $grid.on('click', '.avatar', function () {
            $grid.find('.avatar').removeClass('selected');
            $(this).addClass('selected');

            const src = $(this).attr('src');
            $big.attr('src', src); // 즉시 미리보기
        });
    });

    //비밀번호 변경
    $('#pwdChangeBtn').on('click', function () {
        const pwd = $('#pwd').val();

        $.post('/user/updateUserInfo', { pwd: pwd } ,function (res) {
            if(res.ok) {
                alert('비밀번호 변경 완료!!');
                $('#pwd').val('');
            }else{
                alert('비밀번호를 변경하는데 실패했습니다.');
            }
        },'json');//post
    });//click

    //전화번호 변경
    $('#phoneVerifyBtn').on('click', function () {
        const phone = $('#phone').val();
        $.post('/user/updateUserInfo', { phone: phone }, function (res) {
            if(res.ok) {
                alert('전화번호 변경 성공!!');
                $('#phone').val('');
            }else{
                alert('전화번호 변경 실패.');
            }
        },'json');
    });//click

</script>
</html>
