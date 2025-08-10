<%@ page contentType="text/html; charset=UTF-8" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Register</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta charset="utf-8" />
    <link rel="stylesheet" href="../../../css/global.css" />
    <link rel="stylesheet" href="../../../css/experiencePage.css" />
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
  </head>
  <body>
    <div class="page-container">
      <%@ include file="/components/header.jsp" %>
      <div class="experience-container">
        <!-- Sidebar -->
        <aside class="sidebar">
          <div class="sidebar-top">
            <div class="profile">
              <img
                src="../../..${user.imagePath}"
                alt="프로필"
                class="profile-img"
              />
              <div class="info">
                    <div class="name">${user.name}</div>
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
                        src="../../../image/grade/grade_${user.grade}.svg"
                        alt="grade-badge"
                        />
                    </div>
                    <div class="info-right">
                        <div class="grade">${user.grade}</div>
                        <div class="gender">${user.gender}</div>
                        <div class="age">${user.ageGroup}</div>
                    </div>
              </div>
            </div>
              <c:if test="${not empty user}">
                <div class="edit-btn-wrapper1">
                <button class="edit-btn">수정</button>
                </div>
              </c:if>

            <div class="nav">
              <a href="/petPage">반려동물</a>
              <a href="/experiencePage" class="active">경험</a>
              <c:if test="${not empty user}">
              <a href="#">올린 공고</a>
              <a href="#">신청한 공고</a>
              <a href="#">최근 본 공고</a>
              </c:if>
            </div>
          </div>
        <c:if test="${not empty user}">
          <div class="logout"><a href="/logout">로그아웃</a></div>
        </c:if>
        </aside>

        <!-- Main Content -->
         <div class="container">
            <main class="experience-main">
            <section class="history">
                <h3>돌봄 이력</h3>
                <br>
                <div class="card">
                    <div class="entry">
                        <!-- View 모드 -->
                        <div class="view-mode">
                          <c:choose>
                            <c:when test="${not empty ownerList}">
                              <c:forEach var="exp" items="${ownerList}">
                                <div class="pet-care" data-id="${exp.no}"
                                 data-sdate="${exp.sDate}"
                                 data-edate="${exp.eDate}"
                                 data-species="${exp.species}"
                                 data-breed="${exp.breed}">
                                  <div class="care-date">${exp.sDate}</div>
                                  <div class="care-line">~</div>
                                  <div class="care-date">${exp.eDate}</div>

                                  <div class="care-speices">${exp.species}</div>

                                  <div class="care-breed">
                                    <div class="care-breed-box">
                                      ${exp.breed}
                                    </div>
                                  </div>
                                </div>
                              </c:forEach>
                            </c:when>
                            <c:otherwise>
                              <div class="empty">등록된 반려 경험이 없습니다.</div>
                            </c:otherwise>
                          </c:choose>
                        </div>
                        <!-- 수정모드 -->
                        <form class="edit-mode" id="care-edit-form">
                            <input type="hidden" name="id" />
                            <input type="date" class="input-sdate" name="sDate" />
                            <span style="margin:0 5px;">~</span>
                            <input type="date" class="input-edate" name="eDate" />
                            <select class="input-care-spe" name="species">
                                <option>개</option>
                                <option>고양이</option>
                                <option>새</option>
                                <option>토끼</option>
                                <option>물고기</option>
                                <option>햄스터</option>
                                <option>기타</option>
                            </select>
                            <input type="text" class="input-tag" name="breed"/>
                        </form>
                    </div>
                </div>
                <!-- 수정 버튼 -->
                <div class="edit-btn-wrapper2">
                    <button id="edit-save-btn"   class="btn hidden">수정</button>
                    <button id="delete-cancel-btn" class="btn hidden">삭제</button>
                </div>
                <!-- 추가 버튼 -->
                <div id="add-btn-wrapper" class="hidden">
                <button class="add-btn">+ 돌봄 이력 추가하기</button>
                </div>
                <!-- 폼 -->
                <div id="careFormWrapper" class="container mp-4 mb-5" style="display: none;">
                <div class="card shadow p-4 mb-5" id="add-form">
                    <h4 class="text-center fw-bold mb-4" style="font-size: 1.6rem;">돌봄 이력 작성</h4>
                    
                    <form>
                        <div class="form-group mb-3">
                            <label class="col-sm-2 col-form-label" for="type">종</label>
                            <div class="col-sm-10">
                            <select class="form-control" id="type">
                                <option disabled selected>선택해주세요</option>
                                <option>개</option>
                                <option>고양이</option>
                                <option>새</option>
                                <option>토끼</option>
                                <option>물고기</option>
                                <option>햄스터</option>
                                <option>기타</option>
                            </select>
                            </div>
                        </div>

                        <div class="form-group mb-3">
                            <label class="col-sm-2 col-form-label" for="breed">품종</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="breed" placeholder="품종을 입력해주세요" />
                            </div>
                        </div>

                        <div class="form-group mb-3">
                            <label class="col-sm-2 col-form-label">함께한 기간</label>
                            <div class="d-flex align-items-center flex-wrap gap-2">
                                <div class="col-sm-4">
                                <input type="date" class="form-control" id="sdate" />
                                </div>
                                <div class="col-sm-2">
                                <span class="px-5 mx-auto">~</span>
                                </div>
                                <div class="col-sm-4">
                                <input type="date" class="form-control" id="edate" />
                                </div>
                                <div class="col-sm-2">
                                <button type="button" class="btn btn-outline-danger" id="no-end-btn">종료일 없음</button>
                                </div>
                            </div>
                        </div>
                        <div id="form-btn-wrap">
                        <button type="submit" class="form-btn">저장</button>
                        </div>
                    </form>
                </div>
                </div>
                <h3>
                PerpetCare 시터 이력
                </h3>
                <br>
                <div class="card">
                    <div class="entry">
                        <c:choose>
                            <c:when test="${not empty sitterList}">
                            <c:forEach var="exp" items="${sitterList}">
                                <div class="pet-care">
                                      <div class="care-date">${exp.sDate}</div>
                                      <div class="care-line">~</div>
                                      <div class="care-date">${exp.eDate}</div>

                                      <div class="care-speices">${exp.species}</div>

                                      <div class="care-breed">
                                        <div class="care-breed-box">
                                          ${exp.breed}
                                        </div>
                                      </div>
                                </div>
                            </c:forEach>
                            </c:when>
                            <c:otherwise>
                              <div class="empty">등록된 반려 경험이 없습니다.</div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </section>

            <section class="review">
                <h3>평가 <a href="#" class="more">더보기</a></h3>
                <div class="review-content">
                <div class="keywords">
                    <h4>대표 키워드 TOP3</h4>
                    <br>
                    <ul>
                      <c:choose>
                        <c:when test="${not empty rateList}">
                          <c:forEach var="row" items="${rateList}">
                            <!-- row는 Map. entry는 Map.Entry -->
                            <c:forEach var="entry" items="${row}">
                              <li>
                                ${entry.key}
                                <span class="count">(${entry.value})</span>
                              </li>
                            </c:forEach>
                          </c:forEach>
                        </c:when>
                        <c:otherwise>
                          <li>아직 평가가 없습니다.</li>
                        </c:otherwise>
                      </c:choose>
                    </ul>
                </div>
                <div class="chart">
                    <h4>나의 평가 비율</h4>
                    <br>
                    <canvas
                        id="ratingChart"
                        data-percent-positive="${positivePercent}" 
                        data-percent-negative="${negativePercent}">
                    </canvas>
                </div>
                </div>
            </section>
            </main>
        </div>
      </div>

    </div>
  </body>
    <!-- 차트 스크립트 -->
    <script>
    $(document).ready(function () {
        const canvas = document.getElementById('ratingChart');
        const ctx = canvas.getContext('2d');

        const positive = parseFloat(canvas.dataset.percentPositive || 80); // default 80%
        const negative = parseFloat(canvas.dataset.percentNegative || 20); // default 20%

        new Chart(ctx, {
        type: 'pie',
        data: {
            labels: ['긍정적 평가', '부정적 평가'],
            datasets: [{
            data: [positive, negative],
            backgroundColor: ['#FD9596', '#64DAFE'],
            borderWidth: 1,
            }]
        },
        options: {
            responsive: true,
            plugins: {
            legend: {
                position: 'bottom',
            }
            }
        }
        });
    });

    // 수정 
    $(document).ready(function () {
        let isEditing = false;
        let state = 'idle';       // idle | selected | editing
        let selectedId = null;    // 현재 선택된 경험 PK
        const $form = $('#care-edit-form');

    $('#edit-save-btn').click(function () {
        isEditing = !isEditing;

        // 텍스트 변경
        $(this).text(isEditing ? '완료' : '수정');
        $('#delete-cancel-btn').text(isEditing ? '취소' : '삭제');

        if(isEditing){
            $(this).css('background-color','#64DAFE');
            $(this).css('color','white');
            $('#delete-cancel-btn').css('background-color','white');
            $('#delete-cancel-btn').css('color','#64DAFE');
        }else{
            $(this).css('background-color','white');
            $(this).css('color','#64DAFE');
            $('#delete-cancel-btn').css('background-color','#64DAFE');
            $('#delete-cancel-btn').css('color','white');
        }

        // 모드 전환
        $('.view-mode').toggle(!isEditing);
        $('.edit-mode').toggle(isEditing);

        // 추가 버튼 보이기
        if(isEditing){
             $('#add-btn-wrapper').removeClass('hidden').addClass('flex-center');
             $('#toggle-cancel-btn').removeClass('cancel-btn').addClass('display');
        }else{
            const $form = $('.edit-mode');
            $.ajax({
                type: "POST",
                url: "experience/update",
                data: $form.serialize(),
                success: function (data) {
                    location.reload();
                },error: function (data) {
                    alert("저장중 오류가 발생!!");
                    isEditing = true;
                    $('#toggle-edit-btn').text('완료')
                        .css({ backgroundColor:'#64DAFE', color:'white' });
                    $('.view-mode').toggle(!isEditing);
                    $('.edit-mode').toggle(isEditing);
                }

            });
            $('#add-btn-wrapper').removeClass('flex-center').addClass('hidden');
            $('#toggle-cancel-btn').removeClass('display').addClass('cancel-btn');
        }

    });
    });
    $(document).ready(function () {
    $('.add-btn').click(function () {
        $('#careFormWrapper').slideDown('fast', function () {
            // 폼 위치로 스크롤
            $('html, body').animate({
            scrollTop: $('#careFormWrapper').offset().top - 100
            }, 500);
        });
        });
    });

    $(document).ready(function () {
    $('.btn-outline-danger').click(function () {
        const today = new Date().toISOString().split('T')[0]; // 'YYYY-MM-DD' 형식
        $('#edate').val(today); // 종료일 input에 값 설정
        });

        $('form').on('submit', function (e) {
            if ($('#type').val() !== '선택해주세요' && $('#breed').val().trim()) {
            $('#careFormWrapper').fadeOut();
            }
        });
    });

    </script>

</html>
