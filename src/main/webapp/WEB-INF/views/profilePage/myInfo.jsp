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
        .profile-wrap {
            max-width: 640px;
            margin: 40px auto 80px;
            padding: 24px 20px 40px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .profile-title {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 24px;
        }

        .profile-avatar {
            width: 140px; height: 140px;
            border-radius: 24px;
            overflow: hidden;
            background: #f4f2ff;
            display: grid; place-items: center;
            margin-bottom: 10px;
        }
        .profile-avatar img { width: 100%; height: 100%; object-fit: cover; }

        .profile-change-btn {
            border: 1px solid #cfe9ff;
            background: #eaf6ff;
            color: #31a8ff;
            padding: 6px 14px;
            border-radius: 999px;
            font-size: 14px;
            line-height: 1;
            margin-bottom: 28px;
        }

        .profile-form {
            width: 100%;
            max-width: 520px;
            display: grid;
            grid-template-columns: 110px 1fr auto;
            row-gap: 18px;
            column-gap: 14px;
            align-items: center;
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
            border: 1px solid #e9f4ff;
            background: #f6fbff;
            color: #3aa8ff;
            padding: 8px 14px;
            border-radius: 999px;
            font-size: 13px;
            line-height: 1;
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
                <div class="profile-title">프로필</div>

                <!-- 아바타 -->
                <div class="profile-avatar">
                    <img src="${pageContext.request.contextPath}/image/default1.svg" alt="프로필 이미지" />
                </div>
                <button type="button" class="profile-change-btn" id="profileImageChangeBtn">변경</button>

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
                    <input class="profile-input editable" type="password" id="pwd" placeholder="새 비밀번호 입력" />
                    <button type="button" class="profile-cta" id="pwdChangeBtn">변경</button>
                    <div class="profile-help">영문/숫자/특수문자 조합 8자 이상 권장</div>

                    <!-- 전화번호 인증 -->
                    <label class="profile-label">전화번호</label>
                    <input class="profile-input editable" type="tel" id="phone" placeholder="전화번호를 입력하세요" />
                    <button type="button" class="profile-cta" id="phoneVerifyBtn">인증</button>
                </form>
            </div>
        </div>
        <%@ include file="/components/footer.jsp" %>
    </div>
</body>
</html>
