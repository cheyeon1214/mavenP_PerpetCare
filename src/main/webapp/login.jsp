<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta charset="utf-8" />
    <link rel="stylesheet" href="css/global.css" />
    <link rel="stylesheet" href="css/login.css" />
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
    <title>Login</title>
  </head>
  <body>
    <div class="page-container">
      <%@ include file="/components/header.jsp" %>

      <main class="main-container">
        <div class="login-box">
          <button class="close-btn" onclick="location.href='home.html'">×</button>
          <h2>로그인</h2>

          <form action="login" method="post">
            <input type="text" name="email" placeholder="아이디" class="login-input" />
            <input type="password"  name="pwd" placeholder="비밀번호" class="login-input" />

            <button class="login-btn" type="submit">로그인</button>
          </form>
          <div class="signup-link"><a href="register.jsp">회원가입</a></div>

          <hr class="divider" />
          <p class="other-login-text">다른 로그인</p>

          <button class="social-btn kakao">
            <img id="kakao-icon" src="image/login/kakao.svg" />
            <div class="btn-text">KAKAO로 로그인</div>
          </button>
          <button class="social-btn naver">
            <img id="naver-icon" src="image/login/naver.svg" />
            <div class="btn-text">NAVER로 로그인</div>
          </button>
          <button class="social-btn google">
            <img id="google-icon" src="image/login/google.svg" />
            <div class="btn-text">Google로 로그인</div>
          </button>
        </div>
      </main>
    </div>
  </body>
</html>
