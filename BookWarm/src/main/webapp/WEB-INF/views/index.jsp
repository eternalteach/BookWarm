<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="includes/header/header-transparent.jsp"%>
<!-- context -->

제목 검색 :
<input id='search' name='search' type='text'>
<button onclick="searchTitle($('#search').val());">검색</button>

title :
<input id='title' name='title' type='text'>
contents :
<input id='contents' name='contents' type='text'>
url :
<input id='url' name='url' type='text'>
isbn :
<input id='isbn' name='isbn' type='text'>
datetime :
<input id='datetime' name='datetime' type='text'>
authors :
<input id='authors' name='authors' type='text'>
publisher :
<input id='publisher' name='publisher' type='text'>
translators :
<input id='translators' name='translators' type='text'>
price :
<input id='price' name='price' type='text'>
sale_price :
<input id='sale_price' name='sale_price' type='text'>
thumbnail :
<input id='thumbnail' name='thumbnail' type='text'>
<div>
<img src='https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1606323%3Ftimestamp%3D20190131055230' id='thumbnail'>
</div>
status :
<input id='status' name='status' type='text'>
<script>
function searchTitle(title){
alert($('#search').val());
alert(title);
    event.preventDefault();
    if(title !== undefined && title !== ""){
        $.ajax({
          url: "https://dapi.kakao.com/v3/search/book",
          headers: {'Authorization': 'KakaoAK a419f03c87401f1ade43abeb89afac92'},
          type : "get",
          data:{
              query: title,
             target:'title'
          },
          success : function(result){
              let data = result.documents[0];
              alert(data);
              $("#title").val(data.title);
              $('#contents').val(data.contents);
              $('#url').val(data.url);
              $("#isbn").val(data.isbn);
              $('#authors').val(data.authors);
              $('#publisher').val(data.publisher);
              $('#translators').val(data.translators);
              $('#price').val(data.price);
              $('#sale_price').val(data.sale_price);
              $('#thumbnail').attr("src", data.thumbnail);
              $('#status').val(data.status);
              let date = data.datetime;
              $('#datetime').val(date.split('T')[0]);
          }
      });
    }
}
</script>
<%@ include file="includes/footer/footer-4.jsp"%>
