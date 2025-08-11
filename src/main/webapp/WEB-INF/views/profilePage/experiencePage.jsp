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
    <!-- jQuery ... jQuery 가 Bootstrap 보다 앞에 와야 함 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
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
                        id="gradeBadge"
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
            <div class="owner">
                <h3>돌봄 이력</h3>
                <br>
                <div class="card">
                    <div class="entry">
                        <!-- View 모드 -->
                        <div class="view-mode owner">
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
                                  <div class="care-date">
                                      <c:choose>
                                        <c:when test="${empty exp.eDate}">현재</c:when>
                                        <c:otherwise>${exp.eDate}</c:otherwise>
                                      </c:choose>
                                  </div>
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
                            <input type="hidden" name="no" />
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
                <div id="careFormWrapper" class="py-4 mx-auto" style="display: none; max-width: 1050px;">
                <div class="card shadow p-3 mb-2" id="add-form">
                    <h4 class="text-center fw-bold mb-4 mx-auto" style="font-size: 1.6rem;">돌봄 이력 작성</h4>
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
                                <span id="edateDisplay" class="badge bg-secondary ms-2" style="display:none;">현재</span>
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
                </div>
                <div class="sitter">
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
                </div>
            </section>

            <section class="review">
                <h3>평가</h3>
                <div class="review-content">
                <div class="keywords">
                    <h4>대표 키워드 TOP3</h4>
                    <br>
                    <ul>
                      <c:choose>
                        <c:when test="${not empty rateList}">
                          <c:forEach var="entry" items="${rateList}">
                              <li>
                                ${entry.key}
                                <span class="count">(${entry.value})</span>
                              </li>
                          </c:forEach>
                          <h6 style="text-align:center; color:#FD9596; margin-top:25px;">전체 평가 (${rateNum})</h6>
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
                        data-percent-positive="${positiveRatio}"
                        data-percent-negative="${negativeRatio}">
                    </canvas>
                </div>
                </div>
            </section>
            </main>
        </div>
      </div>
        <jsp:include page="../../../components/gradeModal.jsp" />
    </div>
  </body>

    <script>

        //모달창
        $('#gradeBadge').on('click', function(){
            $('#gradeModal').modal('show');
        });


        <!-- 차트 스크립트 -->
        $(document).ready(function () {
            const canvas = document.getElementById('ratingChart');
            const ctx = canvas.getContext('2d');

            const positive = parseFloat(canvas.dataset.percentPositive);
            const negative = parseFloat(canvas.dataset.percentNegative);

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

        //owner 에 경험이 없을때//..
        $(function () {
            // owner 리스트가 비었는지 체크
            const ownerEmpty = $('.view-mode .empty').length > 0;

            if (ownerEmpty) {
                // 추가 버튼 보이기
                $('#add-btn-wrapper').removeClass('hidden').addClass('flex-center');
                // 보기/수정/삭제 버튼은 숨김
                $('#edit-save-btn, #delete-cancel-btn').addClass('hidden');
                // $('#careFormWrapper').slideDown();
            }

            // 추가 버튼 클릭 시 폼 열기(네 기존 로직 강화)
            $(document).on('click', '.add-btn', function () {
                $('#careFormWrapper').slideDown();
            });
        });


    // 수정 + 삭제
        $(document).ready(function () {
            let state = 'idle';       // idle | selected | editing
            let selectedId = null;    // 현재 선택된 경험 PK
            const view = $('.view-mode');
            const form = $('#care-edit-form');
            const editBtn = $('#edit-save-btn');
            const delBtn  = $('#delete-cancel-btn');
            const careFormWrapper = $('#careFormWrapper');
            const addBtn =$('#add-btn-wrapper');
            const addForm = $('#add-form form');

            // 초기 UI
            form.addClass('hidden');
            editBtn.addClass('hidden');
            delBtn.addClass('hidden');

            // pet-care 클릭 시 sitter 내부이면 완전 무시
            $(document).on('click', '.pet-care', function () {
                if ($(this).closest('.sitter').length) return; // sitter는 비활성
                if (state === 'editing') return;

                $('.pet-care').removeClass('selected');
                $(this).addClass('selected');
                toSelected($(this).data('id'));
            });

            // 추가 폼 닫기
            function closeAddForm() {
                if (careFormWrapper.is(':visible')) {
                    careFormWrapper.stop(true, true).slideUp();
                    $('#edate').prop('disabled', false);
                    $('#edateDisplay').hide();
                    if (addForm[0]) addForm[0].reset();  // ★ 폼 리셋 (오타 수정)
                }
            }

            $(document).on('click', '.add-btn', function (e) {
                e.preventDefault();
                e.stopPropagation();                              // ★ 전파 차단
                careFormWrapper.stop(true, true).slideDown();
            });

            $('#careFormWrapper').on('click', function (e) {
                e.stopPropagation();                              // ★ 폼 내부 클릭도 전파 차단
            });

            function toIdle() {
                state = 'idle';
                selectedId = null;
                $('.pet-care').removeClass('selected');

                // 폼 완전 숨김
                form.addClass('hidden').hide();
                if (form[0]) form[0].reset();

                // 목록 다시 보이기
                view.removeClass('hidden').show();

                // 버튼 숨김 및 라벨 초기화
                editBtn.addClass('hidden').text('수정').css({ backgroundColor:'', color:'' });
                delBtn.addClass('hidden').text('삭제').css({ backgroundColor:'', color:'' });
                addBtn.addClass('hidden')
            } //toIdle

            function toSelected(id) {
                state = 'selected';
                selectedId = id;
                form.addClass('hidden');
                view.show();
                // 수정/삭제 버튼 노출
                editBtn.removeClass('hidden').text('수정')
                    .css({ backgroundColor:'white', color:'#64DAFE' });
                delBtn.removeClass('hidden').text('삭제')
                    .css({ backgroundColor:'#64DAFE', color:'white' });
            }//toSelected

            function toEditing() {
                state = 'editing';
                editBtn.text('완료').css({ backgroundColor:'#64DAFE', color:'white' });
                delBtn.text('취소').css({ backgroundColor:'white', color:'#64DAFE' });

                // 목록 숨기고 폼 보이기
                view.hide().addClass('hidden');
                form.removeClass('hidden').show();
            }//toEditing

            // 선택된 아이템 → 폼 채우기
            function fillFormFromItem(item) {
                form.find('input[name=no]').val(item.data('id')); // PK
                form.find('input[name=sDate]').val(item.data('sdate'));
                form.find('input[name=eDate]').val(item.data('edate'));
                form.find('select[name=species]').val(item.data('species'));
                form.find('input[name=breed]').val(item.data('breed'));
            }//fillFormFromItem

            // 폼 값 → 리스트 아이템 DOM/데이터 갱신 (리로드 없이 반영)
            function updateItemFromForm(item) {
                const s = form.find('input[name=sDate]').val();
                const e = form.find('input[name=eDate]').val();
                const sp = form.find('select[name=species]').val();
                const br = form.find('input[name=breed]').val();

                // 표시 텍스트 갱신
                item.find('.care-date').eq(0).text(s);
                item.find('.care-date').eq(1).text(e);
                item.find('.care-speices').text(sp);
                item.find('.care-breed-box').text(br);

                // data-* 갱신
                item.data('sdate', s);
                item.data('edate', e);
                item.data('species', sp);
                item.data('breed', br);
            }//update

            // ===== 1) pet-care 클릭 → 선택 상태 =====
            $(document).on('click', '.owner .pet-care', function () {
                if (state === 'editing') return; // 편집 중엔 선택 금지
                $('.owner .pet-care').removeClass('selected');
                $(this).addClass('selected');
                toSelected($(this).data('id'));
            });//click

            // ===== 2) 수정/완료 버튼 =====
            editBtn.on('click', function () {
                if (state === 'selected') {
                    // 수정 시작: 폼 채우고 편집 상태 진입
                    const item = $('.pet-care.selected');
                    if (!item.length) return alert('수정할 항목을 선택하세요.');
                    fillFormFromItem(item);
                    toEditing();
                    return;
                }

                if (state === 'editing') {
                    // 완료(저장)
                    $.ajax({
                        type: 'POST',
                        url: '/experience/update', // 컨트롤러 매핑
                        data: form.serialize(),
                        success: function () {
                            const item = $('.pet-care.selected');
                            if (item.length) updateItemFromForm(item); // DOM 반영
                            toIdle(); // 초기화 (선택도 해제)
                        },
                        error: function () {
                            alert('저장 중 오류가 발생했습니다.');
                            console.log('submit', form.serialize());
                        }
                    });
                }
            });//click

            // ===== 3) 삭제/취소 버튼 =====
            delBtn.on('click', function () {
                if (state === 'selected') {
                    // 삭제 동작
                    const item = $('.pet-care.selected');
                    if (!item.length) return alert('삭제할 항목을 선택하세요.');
                    if (!confirm('정말 삭제하시겠어요?')) return;

                    $.ajax({
                        type: 'POST',
                        url: '/experience/delete',
                        data: { no: item.data('id') },
                        success: function () {
                            item.remove();
                            toIdle();
                        },
                        error: function () {
                            alert('삭제 중 오류가 발생했습니다.');
                        }
                    });
                    return;
                }

                if (state === 'editing') {
                    // 취소: 수정 취소하고 처음 상태로
                    toIdle();
                }
            });//click

            // ===== (옵션) 바깥 클릭 시 전체 해제 =====
            $(document).on('click', function (e) {
                if ($(e.target).closest('.owner .pet-care, .edit-btn-wrapper2, #care-edit-form').length) return;
                if ($('.view-mode .empty').length > 0) {
                    toIdle();
                }else{
                    toIdle();
                    closeAddForm();
                }

            });//click

            // 추가
            $(document).ready(function () {
                let isEditing = false;
                let noEndSelected = false;
                const addBtnWrapper = $('#add-btn-wrapper');

                // 1) 수정 버튼 클릭 → 추가 버튼 토글
                $('#edit-save-btn').on('click', function () {
                    isEditing = !isEditing;

                    if (isEditing) {
                        addBtnWrapper.removeClass('hidden').addClass('flex-center');
                    } else {
                        addBtnWrapper.removeClass('flex-center').addClass('hidden');
                        careFormWrapper.hide(); // 폼 닫기
                    }
                });

                // 2) 추가 버튼 클릭 -> 폼 보이기
                $(document).on('click', '.add-btn', function () {
                    careFormWrapper.slideDown(); // 부드럽게 열림
                });

                // 3) 종료일 없음 버튼 클릭 시 종료일 필드 비우기 + 비활성화
                // 종료일 없음 버튼 클릭 시
                $('#no-end-btn').on('click', function () {
                    $('#edate').val('').prop('disabled', true);
                    $('#edateDisplay').show().text('현재');
                    noEndSelected = true;
                });

                // 4) 폼 제출 -> 디비 추가
                addForm.on('submit', function (e) {
                    e.preventDefault();

                    const data = {
                        species: $('#type').val(),
                        breed: $('#breed').val(),
                        sDate: $('#sdate').val(),
                        eDate: $('#edate').prop('disabled') ? null : $('#edate').val()
                    };

                    $.ajax({
                        type: 'POST',
                        url: '/experience/add',
                        data: data,
                        success: function (res) {
                            alert(res.message || '추가 완료');
                            // 목록 새로고침 or DOM에 새 항목 append
                            location.reload();
                        },
                        error: function (xhr) {
                            alert((xhr.responseJSON && xhr.responseJSON.message) || '추가 중 오류 발생');
                        }
                    });
                });
            });
        });//ready



//추가 시 폼 나올때 부드럽게 스크롤
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


    // 수정시 edate 종료일 없음 눌렀을때
    $(function () {
        $('#no-end-btn').on('change', function () {
            const edate = $('#edate');
            const disp  = $('#edateDisplay');

            if (this.checked) {
                // UI 변경: 날짜 입력 비활성화 + 현재 표시
                edate.val('').prop('disabled', true);
                disp.show();
            } else {
                // 다시 날짜 입력 가능
                edate.prop('disabled', false);
                disp.hide();
            }
        });

        // 제출 시: disabled 상태면 null로 보내기
        $('form').on('submit', function () {
            const edate = $('#edate');
            if (edate.is(':disabled') || !edate.val()) {
                edate.prop('disabled', true); // disabled면 전송 안 됨 :: DB에서 null로 처리
            }
        });
    });

    </script>

</html>
