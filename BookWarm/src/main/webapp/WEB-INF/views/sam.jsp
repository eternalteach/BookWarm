<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!-- <section class="section-small main-color"> background white-->
<!-- <section class="section-primary alternate-color b-bordered"> -->
<section class="section-primary alternate-color b-bordered">
   <div class="container">
      <div class="row">
         <div class="col-md-12 col-sm-12">
            <div class="special-heading word-underline">
               <h4 class="special-heading-inner">
                  <span> Reading Record </span>
               </h4>
            </div>
            <article class="v_blog-item">
               <div class="v_blog-item-inner row">
                  <div class="v_blog-item-media col-md-12">
                  <input hidden='hidden' id='isbn' name='isbn' type="text" value='&isbn=${BookCoverVO.isbn}'>
                     <a href="#"> <img src="${BookCoverVO.img_src}" />
                     </a>
                  </div>
               </div>
            </article>
            <div class="progress-bars v2">
               <div class="progress-label">
                  <span>Reading</span>
               </div>
               <div class="progress">
                  <div class="progress-bar progress-bar-primary"
                     data-appear-progress-animation="${reading}%"></div>
                  <span class="progress-bar-tooltip">${reading}%</span>
               </div>
               <div class="content-grid-item col-md-12">
                  <div class="counters">
                     <div class="progress-label">
                        <span>ReadingPage</span>&nbsp; &nbsp;<strong
                           class="primary-color" data-to="${readPageNum}"
                           data-plugin-options="{&quot;decimals&quot;: 0}">${readPageNum}</strong>
                     </div>
                  </div>
                  <div class="counters">
                     <div class="progress-label">
                        <span>TotalPage</span>&nbsp; &nbsp;<strong class="primary-color"
                           data-to="${bookTotalPage}"
                           data-plugin-options="{&quot;decimals&quot;: 0}">${bookTotalPage}</strong>
                     </div>
                  </div>
                  <div class="counters">
                     <div class="progress-label">
                        <span>Record</span>&nbsp; &nbsp;<a href="#modalRecordDetail"
                           rel="modal:open"><strong class="primary-color"
                           data-to="${recordNum}"
                           data-plugin-options="{&quot;decimals&quot;: 0}">${recordNum}</strong></a>
                     </div>
                     <div class="special-heading text-left">
                        <a href="boardlogwrite?isbn=${BookCoverVO.isbn}">&nbsp;
                           &nbsp;<strong class="primary-color">Record write</strong>
                        </a>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</section>

<style>
#modalRecordDetail {
   left: 20%;
   top: 20%;
   width: 380px;
   height: 500px;
   padding-left: 15px;
   padding-right: 15px;
}
</style>

<div class="col-md-8 right-side-sidebar v_blog-medium pt-70">
   <div class="row">
      <div class="has-right-sidebar has-one-sidebar">
         <div class="container">
            <div class="row">
               <div id="modalRecordDetail" class="modal">
                  <div class="col-sm-15 v-blog-wrap">
                     <div class="v-blog-items-wrap blog-standard">
                        <ul class="v-blog-items row standard-items clearfix">
                           <li class="v-blog-item col-sm-12">
                              <div class="post-content no-thumb clearfix">
                                 <!-- 박스 -->
                                 <div class="post-header">
                                    <span class="blog-author minor-meta"> Posted by <span
                                       class="entry-author-link"> <span
                                          class="vcard author"> <span
                                             class="v-blog-item-details"> <a href="#"
                                                title="Posts by HB-Themes" rel="author">작성자</a>
                                          </span>
                                       </span>
                                    </span>
                                    </span>
                                    <div class="smart-forms">
                                       <section class="sidebar-widget bordered-sidebar">
                                          <div class="heading">
                                             <h4 class="title">Reading range</h4>
                                          </div>
                                          <div class="section">
                                             <div class="spacer-b15">
                                                <input type="text" id="startRead" class="slider-input"
                                                   value="${startPage}" hidden="hidden"> <input
                                                   type="text" id="endRead" class="slider-input"
                                                   value="${endPage}" hidden="hidden"> <input
                                                   type="text" id="bookTotalPage" value="${bookTotalPage}"
                                                   hidden="hidden">
                                             </div>
                                             <div class="slider-wrapper">
                                                <div id="slider-range"></div>
                                             </div>
                                             <br /> <span>Total &nbsp; p.${startPage} -
                                                p.${endPage}</span>
                                          </div>
                                       </section>
                                    </div>

                                    <c:forEach items="${loginglist}" var="loginglist">
                                       <div class="post-meta-info">
                                          <span class="blog-categories minor-meta"> <span
                                             class="comment-container minor-meta"> <fmt:parseDate
                                                   value="${loginglist.start_date}" var="start_date"
                                                   pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
                                                   value="${start_date}" pattern="yyyy-MM-dd" />
                                          </span> <span class="comment-container minor-meta">
                                                &nbsp;&nbsp;p.${loginglist.start_page}&nbsp;&nbsp;-&nbsp;p.${loginglist.end_page}
                                          </span> <span class="text-sep">&nbsp;|&nbsp;</span> <a
                                             href="boardlogmodify?write_no=${loginglist.write_no}">Modify</a>
                                          </span>
                                       </div>
                                    </c:forEach>
                                    
                                    
                                    <!-- 페이징 처리 -->
                                    <div class="row">
                                       <div class="col-md-12" style="align: center;">
                                          <nav aria-label="Page navigation example">
                                             <ul class="pagination">
                                             
                                             
                                                <c:if test="${pageMaker.prev}">
                                                   <li class="page-item disabled"><a
                                                      class="page-link" href="${pageMaker.startPage -1}"
                                                      tabindex="-1">Previous</a></li>
                                                </c:if>
                                                
                                                
                                                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                                                
                                                
                                                   <li class="page-item ${pageMaker.cri.pageNum==num ? "active":""}">
                                                   		<a class="page-link" href="${num}">${num}</a>
                                                   </li>
                                                   
                                                   
                                                </c:forEach>
                                                
                                                
                                                <c:if test="${pageMaker.next}">
                                                   <li class="page-item"><a class="page-link"
                                                      href="${pageMaker.endPage+1}">Next</a></li>
                                                </c:if>
                                                
                                                
                                                
                                             </ul>
                                          </nav>
                                       </div>
                                    </div>
                                    
                                    
                                    
                                    
                                    <!-- <a>태그가 원래 동작 못하도록 JS처리하기 -->
                                    <form id='actionForm' action="boardlog" method='get'>
                                    <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
                                    <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
                                    </form>
                                 </div>
                              </div>
                           </li>
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
<script>
$(document).ready(function(){
/*    var result='<c:out value="${result}"/>';
   checkModal(result);
   history.replaceState({},null,null);
   function checkModal(result){
      if(result===''||history.state){
         return;
      }
      if(parseInt(result)>0){
      $(".modal-body").html("게시글"+parseInt(result)+"번이 등록되었습니다.");
      }
      $("#myModal").modal("show");
   }
   $("#regBtn").on("click",function(){
      self.location="boardwrite";
   }); */
   var actionForm=$("#actionForm");
   var isbn=$('#isbn').val();
   $(".page-item a").on("click", function(e){
   alert(isbn);
      e.preventDefault();
      console.log('click');
      actionForm.find("input[name='pageNum']").val($(this).attr("href")+isbn);
      actionForm.submit();
   });
});
</script>