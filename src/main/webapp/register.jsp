<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Register</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta charset="utf-8" />
    <link rel="stylesheet" href="css/global.css" />
    <link rel="stylesheet" href="css/register.css" />
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
  </head>
  <body>
    <div class="page-container">
      <%@ include file="/components/header.jsp" %>

      <main class="main-container">
        <div class="register-box">
          <button class="close-btn" onclick="location.href='home.html'">
            ×
          </button>
          <h2>회원가입</h2>

          <form action="register" method="post">
            <input
              type="text"
              name="name"
              placeholder="이름"
              class="register-name"
            />
            <input
              type="text"
              name="rrn"
              placeholder="생년월일(주민등록번호 앞 7자리)"
              maxlength="8"
              class="register-rrn"
            />
            <div class="email-verify">
              <input
                type="email"
                name="email"
                placeholder="이메일"
                id="email-input"
              />
              <button type="button" class="email-verify-btn">본인 인증</button>
            </div>
            <div class="code-verify">
              <input
                type="text"
                name="code"
                placeholder="인증번호"
                id="email-code-input"
              />
              <button type="button" class="code-verify-btn">확인</button>
            </div>
            <input
              type="password"
              name="pwd"
              placeholder="비밀번호"
              class="register-pwd"
            />
            <div class="pwd-match">
              <input
                type="password"
                name="confirm-pwd"
                placeholder="비밀번호 확인"
                class="register-pwd-ok"
              />
              <div class="pwd-match-message"></div>
            </div>
            <input
              type="text"
              name="phone"
              placeholder="전화번호(숫자만 적어주세요)"
              class="register-phone"
              maxlength="11"
            />
            <button class="register-btn" type="submit">회원가입</button>
          </form>
          <div class="signup-link"><a href="login.jsp">로그인</a></div>
        </div>
      </main>
    </div>
  </body>
  <script>
    document
      .querySelector(".register-rrn")
      .addEventListener("input", function () {
        let val = this.value.replace(/[^0-9]/g, "");

        if (val.length > 7) val = val.slice(0, 7);
        if (val.length > 6) val = val.slice(0, 6) + "-" + val.slice(6);

        this.value = val;
      });

    $('.email-verify-btn').on('click', function () {
      const email = $('#email-input').val();
      const button = $(this);

      $.post('/sendCode', {email},function(result){
        if(result === 'ok'){
            alert("이메일 전송 완료 ");
        }else{
            alert("이메일 전송 실패!!");
        }

        button.css("background-color", "#FD9596");
        button.css("color", "white");
      });
    });

    $('.code-verify-btn').on('click',function(){
      let email = $('#email-input').val();
      let code = $('#email-code-input').val();
      const button = $(this);

      $.post('/verifyCode',{email,code},function(result){
        if(result === "ok" ){
            alert("인증 완료!");
        }else{
            alert("인증 실패!");
        }
        button.css("background-color", "#FD9596");
        button.css("color", "white");

      });
    });
    $(function () {
      $('.register-pwd, .register-pwd-ok').on('input', function () {
        const pwd = $('.register-pwd').val();
        const confirmPwd = $('.register-pwd-ok').val();
        const messageEl = $('.pwd-match-message');

        if (!confirmPwd) {
          messageEl.text('').hide();
          return;
        }

        if (pwd === confirmPwd) {
          messageEl
                  .text('비밀번호 일치!')
                  .css('color', 'green')
                  .show();
        } else {
          messageEl
                  .text('비밀번호 불일치!')
                  .css('color', 'red')
                  .show();
        }
      });
    });
  </script>
</html>
