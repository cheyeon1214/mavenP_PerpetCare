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
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/smoothness/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
<%--<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.13.2/i18n/datepicker-ko.js"></script>--%>
<style>
    #header {
        box-shadow: none !important;
    }
    #header-top{
        height: 100px;
        background-color: white;
    }
    body {
        font-family: "Pretendard Variable", sans-serif;
    }
    /* 상단 검색창 */
    #search-bar{
        position: fixed;
        z-index: 50;
        background-color: #64DAFE;
        width: 100%;
        height: 100px;
        display: flex;
        justify-content: center;
        align-items: center;
        box-shadow: 2px 2px 5px rgba(59, 59, 59, 0.5);
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
        margin-left: 120px;
        color: #888888;
    }
    #keyword-careWay, #keyword-species {
        height: 42px;
        color: white;
        background-color: #FD9596;
        border-radius: 20px;
        padding: 7px 14px;
        margin-right: 10px;
    }
    #arrow-button {
        cursor: pointer;
    }
    /* 지역 검색 모달창 */
    #modal-body-first, .modal-footer {
        display: flex;
        justify-content: center;
    }
    #location-input {
        width: 80%;
        padding: 0 10px;
        margin-bottom: 10px;
    }
    #modal-body-second {
        width: 90%;
        height: 400px;
        overflow-y: auto;
        padding-left: 50px;
    }
    .location-list {
        padding: 0 0 5px 0;
        border-bottom: 1px solid #cccccc;
    }
    .location-list.selected {
        cursor: pointer;
        font-weight: bold;
    }
    .modal-footer > button {
        width: 80%;
        background-color: #64DAFE;
        color: white;
        border: #64DAFE;
        border-radius: 10px;
        padding: 10px 0;
    }
    /* 메인 바디 부분 */
    #main {
        display: flex;
        margin-top: 150px;
    }
    /* 검색 필터 부분 */
    #filter {
        display: flex;
        justify-content: end;
    }
    #filter-box {
        width: 60%;
        height: 700px;
        background-color: white;
        padding: 20px 0 10px 0;
        border-radius: 10px;
        box-shadow: 2px 2px 5px rgba(59, 59, 59, 0.5);
    }
    #filter-box > div, #filter-sdate-box, #filter-edate-box {
        margin-bottom: 20px;
    }
    .filter-title {
        font-weight: bold;
        font-size: large;
        padding-left: 20px;
    }
    .filter-sub {
        display: flex;
        justify-content: center;
        flex-wrap: wrap;
    }
    #filterSdate, #filterEdate {
        width: 80%;
        text-align: center;
        padding: 4px 10px;
        border: 2px solid #fdb4b5;
        border-radius: 20px;
    }
    input[name=careWayBtn] {
        width: 80%;
        color: dimgray;
        background-color: white;
        padding: 5px 0;
        margin-bottom: 10px;
        text-align: center;
        font-weight: bold;
        border: 2px solid #fdb4b5;
        border-radius: 20px;
    }
    input[name=careWayBtn].selected {
        color: white;
        background-color: #fdb4b5;
        transition: box-shadow 0.3s ease;
    }
    input[name=speciesBtn] {
        font-size: small;
        color: dimgray;
        background-color: white;
        padding: 5px 20px;
        margin: 5px;
        text-align: center;
        font-weight: bold;
        border: 2px solid #fdb4b5;
        border-radius: 20px;
    }
    input[name=speciesBtn].selected {
        color: white;
        background-color: #fdb4b5;
        transition: box-shadow 0.3s ease;
    }
    #filter-button-box {
        display: flex;
        justify-content: center;
    }
    #filterBtn {
        width: 80%;
        padding: 5px 0;
        color: white;
        font-weight: bold;
        background-color: #64DAFE;
        border: none;
        border-radius: 5px;
    }
    /* 공고 리스트 부분 */
    #opening-list {
        padding-right: 150px;
    }
    #list-order-section {
        display: flex;
        justify-content: end;
        padding-right: 100px;
    }
    form[name='filterOrder'] select {
        appearance: none;          /* 브라우저 기본 스타일 제거 */
        -webkit-appearance: none;
        -moz-appearance: none;
        width: 120px;
        padding: 10px 20px;
        border-radius: 20px;
        border: none;
        box-shadow: 2px 2px 5px rgba(59, 59, 59, 0.5);
        cursor: pointer;
        background-image: url("data:image/svg+xml;charset=UTF-8,%3Csvg width='20' height='20' fill='gray' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M5 8l5 5 5-5H5z'/%3E%3C/svg%3E");
        background-repeat: no-repeat;
        background-position: right 12px center;
        background-size: 16px 16px;
    }
    #list-card-section {
        display:flex;
        justify-content: start;
        flex-wrap: wrap;
    }
    .opening-card {
        background-color: white;
        width: 250px;
        height: 350px;
        margin: 20px;
        padding: 5px 15px;
        border: none;
        border-radius: 20px;
        box-shadow: 2px 2px 5px rgba(59, 59, 59, 0.5);
    }
    .opening-card-image {
        display:flex;
        justify-content: center;
        position:relative;
    }
    .opening-card-image > img {
        /*width: 90%;*/
        margin-top: 10px;
        border-radius: 20px;
        width: 200px;
        height: 200px;
        border-radius: 20px;
        object-fit: cover;
    }
    .opening-card-image > img:hover {
        cursor: pointer;
        opacity: 0.7;
    }
    .opening-card-species {
        position:absolute;
        width: 74px;
        top: 160px;
        left: 30px;
        padding: 5px 10px;
        margin: 5px;
        font-weight: bold;
        color: white;
        background-color: #FD9596;
        border-radius: 20px;
    }
    .opening-card-loc {
        position:absolute;
        width: 74px;
        top: 160px;
        left: 110px;
        padding: 5px 10px;
        margin: 5px;
        font-weight: bold;
        color: white;
        background-color: #64DAFE;
        border-radius: 20px;
    }
    .opening-card-date {
        display: flex;
        justify-content: start;
        margin: 10px;
        font-weight: bold;
    }
    .opening-card-careway {
        display: flex;
        justify-content: start;
        margin: 10px;
    }
    .opening-card-priceper {
        display: flex;
        justify-content: end;
        margin: 10px;
        font-size: large;
        font-weight: bold;
    }
</style>
<script>
    $.datepicker.setDefaults({
        dateFormat: "yy-mm-dd",
        dayNamesMin: ["일","월","화","수","목","금","토"],
        monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월",
            "7월", "8월", "9월", "10월", "11월", "12월"],
        showMonthAfterYear: true,
        yearSuffix: "년"
    });

    $(document).ready(function(){

        // image mouseenter
        $(document).on('mouseenter', '.opening-card-image > img', function(){
            $(this).closest('.opening-card-image').find('.opening-card-species').css('display', 'inline');
            $(this).closest('.opening-card-image').find('.opening-card-loc').css('display', 'inline');
        });
        // image mouseenter
        $(document).on('mouseleave', '.opening-card-image > img', function(){
            $(this).closest('.opening-card-image').find('.opening-card-species').css('display', 'none');
            $(this).closest('.opening-card-image').find('.opening-card-loc').css('display', 'none');
        });

        // 지역 검색 비동기
        $('#location-input').on("keyup", function(){
            let word = $(this).val().trim();

            if(word.length > 0) {
                $.ajax({
                    // 요청
                    url: "/api/search/location",
                    type: "GET",
                    data: {word: word}, // 서버에 ?word=검색어 로 전달
                    // 응답
                    success: function(data){
                        var html = "";
                        data.forEach(function(item){
                            html += "<p class='location-list' id='"
                                +item.lcode
                                +"'>"
                                +item.address
                                +"</p>";
                        })
                        $('#modal-body-second').html(html);
                    },
                    error: function(xhr, status, error){
                        console.log("에러 발생 : ", xhr.responseText);
                    }
                })
            }
        });

        // 지역 선택
        $(document).on('click', '.location-list', function() {
            $('.location-list').removeClass('selected');
            $(this).addClass('selected');
            let address = $(this).text();
            let lcode = $(this).attr('id');
            $('#selectedAddr').val(address); // hidden input에 값을 저장해 둠
            $('#selectedCode').val(lcode); // hidden input에 값을 저장해 둠
            console.log("주소 : "+address+", 코드 : "+lcode);
        });

        // 필터 적용 1
        $(document).on('click', 'button[name=locationBtn]', function() {
            let address = $('#selectedAddr').val();
            let lcode = $('#selectedCode').val();
            if(!lcode) {
                alert("지역을 하나 선택해주세요.");
                return false;
            }
            else {
                let dong = address.split(',').pop().trim();
                let selectedLocation = $('#selectedCode').val();
                let selectedClose = false;
                if($('[type=checkbox]').is(':checked')) selectedClose = true;
                let selectedSdate = $('#filterSdate').val() || null;
                let selectedEdate = $('#filterEdate').val() || null;
                let selectedCareWay = $('input[name="careWayBtn"].selected').val();
                let careWay = selectedCareWay ? selectedCareWay.substring(1) : null; // 선택된 값이 있는 경우만 substring 가능
                let selectedSpecies = $('input[name="speciesBtn"].selected').val();
                let species = selectedSpecies ? selectedSpecies.substring(1) : null;
                let selectedOrder = $('#orderWay').val();

                $.ajax({
                    // 요청
                    url: "/api/search/filter",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify({
                        closeFilter: selectedClose,
                        sdate: selectedSdate,
                        edate: selectedEdate,
                        location: selectedLocation,
                        careWay: careWay,
                        species: species,
                        orderBy: selectedOrder
                    }),
                    // 응답
                    success: function(data){
                        console.log(data);
                        $('#location-name').text(dong);
                        var html = "";
                        data.forEach(function(item){
                            html += "<div class='opening-card'> <div class='opening-card-image'> <img src='data:image/jpeg;base64,"
                                +item.pets[0].base64Image
                                + "' ><span class='opening-card-species' style='display:none'>#"
                                + item.pets[0].species
                                +"</span> <span class='opening-card-loc' style='display:none'>#"
                                +dong
                                +"</span></div> <div class='opening-card-date'> <span>"
                                +item.sDate.split('T')[0]
                                +"</span> &nbsp;~&nbsp; <span>"
                                +item.eDate.split('T')[0]
                                +"</span> </div> <div class='opening-card-careway'> <p>"
                                +item.careWay
                                +"</p> </div> <div class='opening-card-priceper'> <span class='opening-card-price'>"
                                +item.price
                                +"</span>원&nbsp;/&nbsp; <span class='opening-card-per'>"
                                +item.per
                                +"</span> </div> </div>";
                        })
                        $('#list-card-section').html(html);
                        $('#locModal').modal('hide');
                    },
                    error: function(xhr, status, error){
                        console.log("에러 발생 : ", xhr.responseText);
                    }
                }); // ajax
            }
        })

        // 시작일 선택 제한
        $("#filterSdate").datepicker({
            dateFormat: "yy-mm-dd",
            changeMonth: true,
            changeYear: true,
            onClose: function (selectedDate) {
                $("#filterEdate").datepicker("option", "minDate", selectedDate);
            }
        });
        // 종료일 선택 제한
        $("#filterEdate").datepicker({
            dateFormat: "yy-mm-dd",
            changeMonth: true,
            changeYear: true,
            onClose: function (selectedDate) {
                $("#filterSdate").datepicker("option", "maxDate", selectedDate);
            }
        });

        // 방법 선택
        $('input[name=careWayBtn]').click(function() {
            if($(this).hasClass('selected')) {
                $(this).removeClass('selected');
                $('#keyword-careWay').css('display', 'none');
            } else {
                $('#keywords>a').detach();
                // 다른 버튼은 모두 해제
                $('input[name="careWayBtn"]').removeClass('selected');
                // 현재 버튼만 선택
                $(this).addClass('selected');
                let keyword = $(this).val();
                $('#keyword-careWay').html(keyword).css('display', 'inline');
            }
        })
        // 종 선택
        $('input[name=speciesBtn]').click(function() {
            if($(this).hasClass('selected')) {
                $(this).removeClass('selected');
                $('#keyword-species').css('display', 'none');
            } else {
                $('#keywords>a').detach();
                // 다른 버튼은 모두 해제
                $('input[name="speciesBtn"]').removeClass('selected');
                // 현재 버튼만 선택
                $(this).addClass('selected');
                let keyword = $(this).val();
                $('#keyword-species').html(keyword).css('display', 'inline');
            }
        })

        // 필터 적용 2
        $('#filterBtn').click(function() {
            // 선택된 지역
            let selectedLocation = $('#selectedCode').val();
            if(!selectedLocation){
                alert("지역을 먼저 선택해주세요.");
            }else{
                let dong = $('#selectedAddr').val().split(',').pop().trim();
                // 선택된 마감 제외 여부
                let selectedClose = false;
                if($('[type=checkbox]').is(':checked')) selectedClose = true;
                // 선택된 기간
                let selectedSdate = $('#filterSdate').val() || null;
                let selectedEdate = $('#filterEdate').val() || null;
                // 선택된 돌봄 방법
                let selectedCareWay = $('input[name="careWayBtn"].selected').val();
                let careWay = selectedCareWay ? selectedCareWay.substring(1) : null; // 선택된 값이 있는 경우만 substring 가능
                // 선택된 반려동물 종
                let selectedSpecies = $('input[name="speciesBtn"].selected').val();
                let species = selectedSpecies ? selectedSpecies.substring(1) : null;
                // 정렬 순
                let selectedOrder = $('#orderWay').val();
                // alert("지역: "+selectedLocation+", 마감 여부 : "+selectedClose+", 시작일: "+selectedSdate+", 종료일: "+selectedEdate+", 돌봄 방법 : "+careWay+", 동물 종 : "+species+", 정렬 :"+selectedOrder);

                $.ajax({
                    // 요청
                    url: "/api/search/filter",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify({
                        closeFilter: selectedClose,
                        sdate: selectedSdate,
                        edate: selectedEdate,
                        location: selectedLocation,
                        careWay: careWay,
                        species: species,
                        orderBy: selectedOrder
                    }),
                    // 응답
                    success: function(data){
                        console.log(data);
                        var html = "";
                        data.forEach(function(item){
                            html += "<div class='opening-card'> <div class='opening-card-image'> <img src='data:image/jpeg;base64,"
                                +item.pets[0].base64Image
                                + "' ><span class='opening-card-species' style='display:none'>#"
                                + item.pets[0].species
                                +"</span> <span class='opening-card-loc' style='display:none'>#"
                                +dong
                                +"</span></div> <div class='opening-card-date'> <span>"
                                +item.sDate.split('T')[0]
                                +"</span> &nbsp;~&nbsp; <span>"
                                +item.eDate.split('T')[0]
                                +"</span> </div> <div class='opening-card-careway'> <p>"
                                +item.careWay
                                +"</p> </div> <div class='opening-card-priceper'> <span class='opening-card-price'>"
                                +item.price
                                +"</span>원&nbsp;/&nbsp; <span class='opening-card-per'>"
                                +item.per
                                +"</span> </div> </div>";
                        })
                        $('#list-card-section').html(html);
                    },
                    error: function(xhr, status, error){
                        console.log("에러 발생 : ", xhr.responseText);
                    }
                }); // ajax
            }
        }); // 필터 적용 버튼 클릭

        // 필터 적용 3
        $('#orderWay').change(function(){
            let selectedLocation = $('#selectedCode').val();
            if(!selectedLocation){
                alert("지역을 먼저 선택해주세요.");
            }else {
                let dong = $('#selectedAddr').val().split(',').pop().trim();
                let selectedClose = false;
                if ($('[type=checkbox]').is(':checked')) selectedClose = true;
                let selectedSdate = $('#filterSdate').val() || null;
                let selectedEdate = $('#filterEdate').val() || null;
                let selectedCareWay = $('input[name="careWayBtn"].selected').val();
                let careWay = selectedCareWay ? selectedCareWay.substring(1) : null; // 선택된 값이 있는 경우만 substring 가능
                let selectedSpecies = $('input[name="speciesBtn"].selected').val();
                let species = selectedSpecies ? selectedSpecies.substring(1) : null;
                let selectedOrder = $('#orderWay').val();

                $.ajax({
                    // 요청
                    url: "/api/search/filter",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify({
                        closeFilter: selectedClose,
                        sdate: selectedSdate,
                        edate: selectedEdate,
                        location: selectedLocation,
                        careWay: careWay,
                        species: species,
                        orderBy: selectedOrder
                    }),
                    // 응답
                    success: function (data) {
                        console.log(data);
                        var html = "";
                        data.forEach(function (item) {
                            html += "<div class='opening-card'> <div class='opening-card-image'> <img src='data:image/jpeg;base64,"
                                +item.pets[0].base64Image
                                + "' ><span class='opening-card-species' style='display:none'>#"
                                + item.pets[0].species
                                +"</span> <span class='opening-card-loc' style='display:none'>#"
                                +dong
                                +"</span></div> <div class='opening-card-date'> <span>"
                                +item.sDate.split('T')[0]
                                +"</span> &nbsp;~&nbsp; <span>"
                                +item.eDate.split('T')[0]
                                +"</span> </div> <div class='opening-card-careway'> <p>"
                                +item.careWay
                                +"</p> </div> <div class='opening-card-priceper'> <span class='opening-card-price'>"
                                +item.price
                                +"</span>원&nbsp;/&nbsp; <span class='opening-card-per'>"
                                +item.per
                                +"</span> </div> </div>";
                        })
                        $('#list-card-section').html(html);
                    },
                    error: function (xhr, status, error) {
                        console.log("에러 발생 : ", xhr.responseText);
                    }
                }); // ajax
            }
        }); // 정렬 적용 변경
    });
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
            <span id="keyword-careWay" style="display:none">#잠시 맡아주세요</span>
            <span id="keyword-species" style="display:none">#개</span>
        </div>
        <div id="arrow-button" style="display:none">
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
                <div id="modal-body-first">
                    <input type="text" id="location-input" placeholder="찾으시는 지역을 입력하세요" autocomplete="off">
                </div>
                <div id="modal-body-second">
                    <p class="location-list" style="display: none">서울시, 종로구</p>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" name="locationBtn">검색</button>
            </div>
        </div>
    </div>
</div>
<div id="main">
    <div class="col-4" id="filter">
        <div id="filter-box">
            <input type="hidden" id="selectedCode" name="selectedCode" />
            <input type="hidden" id="selectedAddr" name="selectedAddr" />
            <div id="filter-close-box">
                <p><span class="filter-title">마감 제외</span>&nbsp;&nbsp;
                    <input type="checkbox" name="filterClose" value="close"></p>
            </div>
            <form>
                <div id="filter-sdate-box">
                    <p class="filter-title"><label for="filterSdate">시작일</label></p>
                    <div class="filter-sub">
                        <input type="text" name="filterSdate" id="filterSdate" placeholder="원하는 시작일을 선택하세요">
                    </div>
                </div>
                <div id="filter-edate-box">
                    <p class="filter-title"><label for="filterEdate">마감일</label></p>
                    <div class="filter-sub">
                        <input type="text" name="filterEdate" id="filterEdate" placeholder="원하는 시작일을 선택하세요">
                    </div>
                </div>
            </form>
            <div id="filter-careWay-box">
                <p class="filter-title">방법</p>
                <div class="filter-sub">
                    <input type="button" name="careWayBtn" value="#여기로 와주세요">
                    <input type="button" name="careWayBtn" value="#잠시 맡아주세요">
                </div>
            </div>
            <div id="filter-species-box">
                <p class="filter-title">반려동물</p>
                <div class="filter-sub">
                    <input type="button" name="speciesBtn" value="#개">
                    <input type="button" name="speciesBtn" value="#고양이">
                    <input type="button" name="speciesBtn" value="#토끼">
                    <input type="button" name="speciesBtn" value="#물고기">
                    <input type="button" name="speciesBtn" value="#새">
                    <input type="button" name="speciesBtn" value="#햄스터">
                    <input type="button" name="speciesBtn" value="#기타">
                </div>
            </div>
            <div id="filter-button-box">
                <button id="filterBtn">필터 적용</button>
            </div>
        </div>
    </div>
    <div class="col-8" id="opening-list">
        <div id="list-order-section">
            <form action="#" name="filterOrder">
                <select id="orderWay">
                    <option value="recent">최근순</option>
                    <option value="old">오래된순</option>
                    <option value="price">금액순</option>
                </select>
            </form>
        </div>
        <div id="list-card-section">
            <%--            <div class="opening-card">
                            <div class="opening-card-image">
                                <img src="${pageContext.request.contextPath}/image/petImage3.png">
                                <span class="opening-card-species" style="display:none">#고양이</span>
                                <span class="opening-card-loc" style="display:none">#혜화동</span>
                            </div>
                            <div class="opening-card-date">
                                <span>2025-08-15</span>
                                &nbsp;~&nbsp;
                                <span>2025-08-17</span>
                            </div>
                            <div class="opening-card-careway">
                                <p>여기로 와주세요</p>
                            </div>
                            <div class="opening-card-priceper">
                                <span class="opening-card-price">20000</span>
                                원&nbsp;/&nbsp;
                                <span class="opening-card-per">건당</span>
                            </div>
                        </div>
                    </div>--%>
        </div>
    </div>
</body>
</html>