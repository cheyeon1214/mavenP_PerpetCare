<%--
  Created by IntelliJ IDEA.
  User: 사용자
  Date: 25. 8. 7.
  Time: 오후 2:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Grade Notice Modal</title>
  <style>
    button.close{
      padding: 5px 10px;
    }
    .modal-header{
      display:flex;
      justify-content: center;
      align-items: center;
    }
    .modal-title{
      font-weight: bold;
      text-align: center;
      color: #64dafe;
    }

    .grade-each{
      display: flex;
      justify-content:  space-between;
      height: 120px;
      margin: 30px;
      gap:30px;
    }

    .grade-each-image{
      width: 78px;
      height:  78px;
    }

    .grade-each-text{
      width:245px;
    }

    .grade-each-title{
      font-weight: bold;
      font-size: 18px;
    }
  </style>
</head>
<%--<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">--%>
<%--<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>--%>
<%--<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>--%>
<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>--%>
<body>
  <div>
<%--    <button type="button" data-toggle="modal" data-target="#gradeModal">--%>
<%--      모달 열기--%>
<%--    </button>--%>
  </div>
  <div class="modal" id="gradeModal">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-close">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-header">
          <h4 class="modal-title">PerpetCare 등급 안내</h4>
        </div>
        <div class="modal-body">
          <div class="grade-each">
            <div class="grade-each-image">
              <img src="${pageContext.request.contextPath}/image/grade_05_platinum.png">
            </div>
            <div class="grade-each-text">
                <p class="grade-each-title">Platinum</p>
                <p class="grade-each-sub">평가 40개 이상 & 부정 평가 20% 미만</p>
            </div>
          </div>
          <div class="grade-each">
            <div class="grade-each-image">
              <img src="${pageContext.request.contextPath}/image/grade_04_gold.png">
            </div>
            <div class="grade-each-text">
              <p class="grade-each-title">Gold</p>
              <p class="grade-each-sub">평가 20개 이상 40개 미만 & 부정 평가 20% 미만</p>
              <p class="grade-each-sub">평가 40개 이상 & 부정 평가 20% 이상</p>
            </div>
          </div>
          <div class="grade-each">
            <div class="grade-each-image">
              <img src="${pageContext.request.contextPath}/image/grade_03_silver.png">
            </div>
            <div class="grade-each-text">
              <p><span class="grade-each-title">Silver</span><span class="grade-each-sub">&nbsp;&nbsp;🌟시작 레벨 🌟</span></p>
              <p class="grade-each-sub">평가 20개 미만 & 부정 평가 20% 미만</p>
              <p class="grade-each-sub">평가 20개 이상 & 부정 평가 20% 이상</p>
            </div>
          </div>
          <div class="grade-each">
            <div class="grade-each-image">
              <img src="${pageContext.request.contextPath}/image/grade_02_bronze.png">
            </div>
            <div class="grade-each-text">
              <p class="grade-each-title">Bronze</p>
              <p class="grade-each-sub">평가 20개 미만 & 부정 평가 20% 이상</p>
            </div>
          </div>
          <div class="grade-each">
            <div class="grade-each-image">
              <img src="${pageContext.request.contextPath}/image/grade_01_iron.png">
            </div>
            <div class="grade-each-text">
              <p class="grade-each-title">Iron</p>
              <p class="grade-each-sub">평가 개수 무관 & 부정 평가 30% 이상</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>