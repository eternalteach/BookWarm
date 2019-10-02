<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="/warm/resources/js/record.js"></script>
<script type="text/javascript" src="/warm/resources/js/DateJsonToJsp.js"></script>
<section class="section-primary alternate-color b-bordered" style="min-width:170px">
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
							<ul>
                                <li>
                                    <a href="#">
                                		<img src="${bookVO.book_img}" style="display:block; margin:auto; margin-bottom:15px">
                            		</a>
                            	</li>
                                <li style="text-align:center"><strong>${bookVO.book_title}</strong></li>
                                <li style="text-align:center">${fn:substring(bookVO.writer_name, 1, fn:length(bookVO.writer_name)-1)}</li>
                            </ul>
						</div>
					</div>
				</article>
				<div class="progress-bars v2 frontRecordInfo">
					<div class="progress-label">
						<span>Reading</span>
					</div>
					<div class="progress">
						<div id="reading" class="progress-bar bg-info progress-bar-striped progress-bar-animated" data-appear-progress-animation="${recordInfo.reading}%"></div>
						<span class="progress-bar-tooltip">${recordInfo.reading}%</span>
					</div>
					<div class="content-grid-item col-md-12">
						<div class="counters">
							<div class="progress-label">
								<span>ReadingPage</span>&nbsp; &nbsp;<strong class="primary-color" data-to="${recordInfo.readPageNum}" data-plugin-options="{&quot;decimals&quot;: 0}">${recordInfo.readPageNum}</strong>
							</div>
						</div>
						<div class="counters">
							<div class="progress-label">
								<span>TotalPage</span>&nbsp; &nbsp;<strong class="primary-color" data-to="${bookVO.book_tot_page}" data-plugin-options="{&quot;decimals&quot;: 0}">${bookVO.book_tot_page}</strong>
							</div>
						</div>
						<div class="counters">
							<div class="progress-label">
							<!-- open more record modal -->
								<span>Record</span>&nbsp; &nbsp;
								<a href="#modal-more-record" data-toggle="modal" ><strong class="primary-color" data-to="${recordNum}" data-plugin-options="{&quot;decimals&quot;: 0}">${recordNum}</strong></a>
							</div>
							<!-- open add record modal -->
								
						</div>
						<div class="counters">
							<div class="progress-label" style="text-align:center; height:50px">
								<span><button type="button" class="btn" data-toggle="modal" data-target="#modal-add-record" style="margin:0">Record Write</button></span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>


<%@ include file="./modal-record-script.jsp"%>


<!-- Modal -->
<div class="modal fade" id="modal-more-record" tabindex="-1" role="dialog" aria-labelledby="smallModalLabel" aria-hidden="true">
    <div class="modal-dialog undefined">
        <div class="modal-content">
            <div class="modal-body post-content">
                <%@ include file="./modal-more-record.jsp"%>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modal-add-record" tabindex="-1" role="dialog" aria-labelledby="smallModalLabel" aria-hidden="true">
    <div class="modal-dialog undefined">
        <div class="modal-content">
                <%@ include file="./modal-add-record.jsp"%>
        </div>
    </div>
</div>

<div class="modal fade" id="modal-modify-record" tabindex="-1" role="dialog" aria-labelledby="smallModalLabel" aria-hidden="true">
    <div class="modal-dialog undefined">
        <div class="modal-content">
            <div class="modal-body post-content">
                <%@ include file="./modal-modify-record.jsp"%>
            </div>
        </div>
    </div>
</div>
<!-- Modal End -->

