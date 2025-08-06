<%--
  Created by IntelliJ IDEA.
  User: 사용자
  Date: 25. 8. 6.
  Time: 오전 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
  #header {
     box-shadow: none !important;
  }
  #header-top{
     height: 110px;
     background-color: white;
  }
  #search-bar{
    position: fixed;
    /* top: 100px; 헤더 높이만큼 아래 */
    left: 0;
    background-color: #64DAFE;
    width: 100%;
    height: 100px;
    display: flex;
    justify-content: center;
    align-items: center;
  }
  #search-location, #conditions {
      background-color: white;
      height: 60px;
      border-radius: 30px;
      margin: 10px;
      box-shadow: 0 5px 10px rgba(0,0,0,0.2);
  }
  #search-location {
      width: 200px;
  }
  #conditions {
      width: 600px;
      display:flex;
      align-items: center;
  }
  #keywords {
      width: 520px;
      margin-left: 20px;
  }
  #keywords > p {
      text-align: center;
      color: #888888;
  }
  .keyword {
      height: 42px;
      color: white;
      background-color: #FD9596;
      border-radius: 20px;
      padding: 7px 14px;
      margin-right: 10px;
  }
  #search-button {
      cursor: pointer;
  }
</style>
<body>
    <%@ include file="/components/header.jsp" %>
    <div id="header-top"></div>
    <div id="search-bar">
        <div id="search-location">

        </div>
        <div id="conditions">
            <div id="keywords">
                <p>위치를 기반으로 원하는 공고를 검색해주세요</p>
                <span class="keyword" style="display:none"></span>
            </div>
            <div id="search-button">
                <svg width="42" height="42" viewBox="0 0 42 42" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M41.8333 21C41.8333 9.49374 32.5062 0.166656 20.9999 0.166656C9.49367 0.166656 0.166588 9.49374 0.166588 21C0.166588 32.5062 9.49367 41.8333 20.9999 41.8333C32.5062 41.8333 41.8333 32.5062 41.8333 21ZM21.0083 12.1625C20.6177 12.5532 20.3983 13.083 20.3983 13.6354C20.3983 14.1878 20.6177 14.7176 21.0083 15.1083L24.8187 18.9167L12.1603 18.9167C11.6078 18.9167 11.0779 19.1362 10.6872 19.5268C10.2965 19.9176 10.077 20.4475 10.077 21C10.077 21.5525 10.2965 22.0824 10.6872 22.4731C11.0779 22.8638 11.6078 23.0833 12.1603 23.0833L24.8187 23.0833L21.0083 26.8937C20.6176 27.2847 20.3983 27.8147 20.3985 28.3674C20.3987 28.92 20.6184 29.45 21.0093 29.8406C21.4002 30.2313 21.9303 30.4506 22.4829 30.4504C23.0356 30.4502 23.5655 30.2305 23.9562 29.8396L31.3208 22.4729C31.7113 22.0822 31.9307 21.5524 31.9307 21C31.9307 20.4476 31.7113 19.9178 31.3208 19.5271L23.9583 12.1625C23.7648 11.9688 23.535 11.8151 23.2821 11.7103C23.0292 11.6054 22.7581 11.5515 22.4843 11.5515C22.2105 11.5515 21.9394 11.6054 21.6865 11.7103C21.4336 11.8151 21.2038 11.9688 21.0103 12.1625H21.0083Z" fill="#FD9596"/>
                </svg>
            </div>
        </div>
    </div>
</body>
</html>
