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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
  #header {
     box-shadow: none !important;
  }
  #header-top{
     height: 100px;
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
      display: flex;
      align-items: center;
      cursor: pointer;
  }
  #search-location>* {
      margin: 0 8px;
  }
  #search-location > a {
      text-align: center;
      font-weight: bold;
  }
  #location-name {
      width: 80px;
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
  #keywords > a {
      text-align: center;
      margin-left: 100px;
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
  .modal-footer {
      display: flex;
      justify-content: center;
  }
  .modal-footer > button {
      width: 80%;
      background-color: #64DAFE;
      color: white;
      border: #64DAFE;
      border-radius: 10px;
      padding: 10px 0;
  }
</style>
<script>
    // $(function(){
    //    $('#search-location').click(function(){
    //
    // });
    // });
</script>
<body>
    <%@ include file="/components/header.jsp" %>
    <div id="header-top"></div>
    <div id="search-bar">
        <div id="search-location" data-toggle="modal" data-target="#locModal">
            <svg width="42" height="42" viewBox="0 0 50 50" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M25.0001 23.9583C23.6187 23.9583 22.294 23.4096 21.3172 22.4328C20.3405 21.4561 19.7917 20.1313 19.7917 18.75C19.7917 17.3687 20.3405 16.0439 21.3172 15.0671C22.294 14.0904 23.6187 13.5417 25.0001 13.5417C26.3814 13.5417 27.7062 14.0904 28.6829 15.0671C29.6597 16.0439 30.2084 17.3687 30.2084 18.75C30.2084 19.434 30.0737 20.1112 29.812 20.7431C29.5502 21.375 29.1666 21.9492 28.6829 22.4328C28.1993 22.9165 27.6251 23.3001 26.9932 23.5619C26.3613 23.8236 25.684 23.9583 25.0001 23.9583ZM25.0001 4.16666C21.1323 4.16666 17.423 5.70312 14.6881 8.43802C11.9532 11.1729 10.4167 14.8823 10.4167 18.75C10.4167 29.6875 25.0001 45.8333 25.0001 45.8333C25.0001 45.8333 39.5834 29.6875 39.5834 18.75C39.5834 14.8823 38.047 11.1729 35.3121 8.43802C32.5771 5.70312 28.8678 4.16666 25.0001 4.16666Z" fill="#FD9596"/>
            </svg>
            <a id="location-name">지역명</a>
            <svg width="35" height="35" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M11.6667 16.6667L20.0001 25L28.3334 16.6667" stroke="#888888" stroke-width="4.16667" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
        </div>
        <div id="conditions">
            <div id="keywords">
                <a>위치를 기반으로 원하는 공고를 검색해주세요</a>
                <span class="keyword" style="display:none">잠시 맡아주세요</span>
            </div>
            <div id="search-button">
                <svg width="42" height="42" viewBox="0 0 42 42" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M41.8333 21C41.8333 9.49374 32.5062 0.166656 20.9999 0.166656C9.49367 0.166656 0.166588 9.49374 0.166588 21C0.166588 32.5062 9.49367 41.8333 20.9999 41.8333C32.5062 41.8333 41.8333 32.5062 41.8333 21ZM21.0083 12.1625C20.6177 12.5532 20.3983 13.083 20.3983 13.6354C20.3983 14.1878 20.6177 14.7176 21.0083 15.1083L24.8187 18.9167L12.1603 18.9167C11.6078 18.9167 11.0779 19.1362 10.6872 19.5268C10.2965 19.9176 10.077 20.4475 10.077 21C10.077 21.5525 10.2965 22.0824 10.6872 22.4731C11.0779 22.8638 11.6078 23.0833 12.1603 23.0833L24.8187 23.0833L21.0083 26.8937C20.6176 27.2847 20.3983 27.8147 20.3985 28.3674C20.3987 28.92 20.6184 29.45 21.0093 29.8406C21.4002 30.2313 21.9303 30.4506 22.4829 30.4504C23.0356 30.4502 23.5655 30.2305 23.9562 29.8396L31.3208 22.4729C31.7113 22.0822 31.9307 21.5524 31.9307 21C31.9307 20.4476 31.7113 19.9178 31.3208 19.5271L23.9583 12.1625C23.7648 11.9688 23.535 11.8151 23.2821 11.7103C23.0292 11.6054 22.7581 11.5515 22.4843 11.5515C22.2105 11.5515 21.9394 11.6054 21.6865 11.7103C21.4336 11.8151 21.2038 11.9688 21.0103 12.1625H21.0083Z" fill="#FD9596"/>
                </svg>
            </div>
        </div>
    </div>
    <div class="modal" id="locModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">지역 선택</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">

                </div>
                <div class="modal-footer">
                    <button type="button" data-dismiss="modal">검색</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>