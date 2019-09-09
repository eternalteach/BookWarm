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
<input id='status' name='status' type='text'>
<br/>
<br/>
<br/>
<br/>
<br/>
<textarea id='bookData'>22222</textarea>
<br/>
<br/>
<br/>
<br/>
<br/>
<button id='click'>버튼</button>
</div>
<br/>
<br/>
<br/>
<br/>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"
              integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
              crossorigin="anonymous"></script>
 
<div id="getBookTable"></div>




<script>
let bookData="";
//bookData={"documents":[{"authors":["조앤 K. 롤링"],"contents":"선과 악의 대립 속에서 평범한 어린 소년이 한 사람의 영웅으로 성장해나가는 보편적인 테마를 바탕으로 빈틈없는 소설적 구성과 생생하게 살아 있는 캐릭터, 정교하게 만들어낸 환상의 세계를 접목시킨 21세기의 고전 「해리포터 시리즈」의 제5편『해리포터와 불사조 기사단』 제1부. 사사건건 해리를 괴롭히는 사촌 두들리와 다투다 디멘터의 습격을 받은 해리는 우여곡절 끝에 친구 론과 헤르미온느가 있는 불사조 기사단의 비밀 본부로 가게 된다. 볼드모트에 대항하는","datetime":"2016-09-15T00:00:00.000+09:00","isbn":"8983925604 9788983925602","price":24500,"publisher":"문학수첩","sale_price":22050,"status":"정상판매","thumbnail":"https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1174478%3Ftimestamp%3D20190127040831","title":"해리포터(Harry Potter): 불사조 기사단. 1(양장본 HardCover)","translators":["최인자"],"url":"https://search.daum.net/search?w=bookpage\u0026bookId=1174478\u0026q=%ED%95%B4%EB%A6%AC%ED%8F%AC%ED%84%B0%28Harry+Potter%29%3A+%EB%B6%88%EC%82%AC%EC%A1%B0+%EA%B8%B0%EC%82%AC%EB%8B%A8.+1%28%EC%96%91%EC%9E%A5%EB%B3%B8+HardCover%29"},{"authors":["조디 리벤슨"],"contents":"재미있고 위풍당당하며 무서우면서도 사랑스러운 《해리 포터》 속 생명체와 동물들. 해리의 반려동물 헤드위그부터 평생 동안 단 하나의 마법사 가문을 위해 일하는 집요정, 아즈카반을 지키는 유령 같은 어둠의 생명체 디멘터, 론이 ‘윙가르디움 레비오우사’ 주문을 정확하게 발음하고 간신히 물리친 트롤, 비명을 지르는 맨드레이크 등 『해리포터(Harry Potter): 생명체 금고』에는 이처럼 신비한 생명체들과 관련된 다채로운 이야기를 담고 있다.  《해리 포터","datetime":"2016-11-07T00:00:00.000+09:00","isbn":"8983926279 9788983926272","price":35000,"publisher":"문학수첩","sale_price":31500,"status":"정상판매","thumbnail":"https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1175758%3Ftimestamp%3D20190127041859","title":"해리포터(Harry Potter): 생명체 금고(양장본 HardCover)","translators":["고정아"],"url":"https://search.daum.net/search?w=bookpage\u0026bookId=1175758\u0026q=%ED%95%B4%EB%A6%AC%ED%8F%AC%ED%84%B0%28Harry+Potter%29%3A+%EC%83%9D%EB%AA%85%EC%B2%B4+%EA%B8%88%EA%B3%A0%28%EC%96%91%EC%9E%A5%EB%B3%B8+HardCover%29"},{"authors":["조앤 K. 롤링"],"contents":"선과 악의 대립 속에서 평범한 어린 소년이 한 사람의 영웅으로 성장해나가는 보편적인 테마를 바탕으로 빈틈없는 소설적 구성과 생생하게 살아 있는 캐릭터, 정교하게 만들어낸 환상의 세계를 접목시킨 21세기의 고전 「해리포터 시리즈」가 국내 출간 15주년을 맞았다. 이를 기념해 표지 일러스트를 교체하고 그간 지적되어 온 번역 오류 등을 꼼꼼하게 감수하고 면밀하게 검토해 수정하였고 원서의 다양한 서체를 최대한 반영해 몰입감을 높여 새롭게 시리즈를 펴냈다.  손","datetime":"2014-12-18T00:00:00.000+09:00","isbn":"8983925329 9788983925329","price":9000,"publisher":"문학수첩","sale_price":8100,"status":"정상판매","thumbnail":"https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1169809%3Ftimestamp%3D20190127033309","title":"해리포터: 마법사의 돌. 2","translators":["김혜원"],"url":"https://search.daum.net/search?w=bookpage\u0026bookId=1169809\u0026q=%ED%95%B4%EB%A6%AC%ED%8F%AC%ED%84%B0%3A+%EB%A7%88%EB%B2%95%EC%82%AC%EC%9D%98+%EB%8F%8C.+2"},{"authors":["Rowling J K/ GrandPre Mary (ILT)"],"contents":"해리 포터와 친구들의 마법학교에서의 모험과 성장을 그린 베스트셀러 소설. 무서운 이모부부와 함께 계단 밑 작은 방에서 비참한 삶을 살던 해리는 부엉이 한 마리가 배달한 초대장에 인생이 바뀌기 시작한다. 새로운 친구와 온갖 마법을 배우며 해리는 어둠의 힘과 결투를 벌이는데....   Harry Potter 시리즈 모두보기 -\u0026gt; Click!     Harry Potter has never been the star of a Quidditch team, scoring","datetime":"1999-09-07T00:00:00.000+09:00","isbn":"059035342X 9780590353427","price":13100,"publisher":"Scholastic","sale_price":7800,"status":"정상판매","thumbnail":"https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1755607%3Ftimestamp%3D20190201023135","title":"Harry Potter and the Sorcerer's Stone","translators":[],"url":"https://search.daum.net/search?w=bookpage\u0026bookId=1755607\u0026q=Harry+Potter+and+the+Sorcerer%27s+Stone"},{"authors":["조앤 K. 롤링"],"contents":"All seven phenomenal Harry Potter paperback books by best selling author J.K. Rowling are available together for the first time in an elegant paperback boxed set!   ★ Set Includes ★  - Harry Potter and the Sorcerer's Stone - Harry Potter and the Chamber","datetime":"2009-07-07T00:00:00.000+09:00","isbn":"0545162076 9780545162074","price":99000,"publisher":"Scholastic","sale_price":57600,"status":"정상판매","thumbnail":"https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F2457417%3Ftimestamp%3D20190420101432","title":"해리포터 Harry Potter Paperback Boxset #1-7","translators":[],"url":"https://search.daum.net/search?w=bookpage\u0026bookId=2457417\u0026q=%ED%95%B4%EB%A6%AC%ED%8F%AC%ED%84%B0+Harry+Potter+Paperback+Boxset+%231-7"},{"authors":["조디 리벤슨"],"contents":"죽음의 성물, 호그와트 비밀 지도, 마법사의 돌을 비롯 호그와트 학생들의 사랑스런 러브레터까지!  ★특별 부록★ 책 속의 책: 음유시인 비들 이야기 원본 블랙 가계도 태피스트리","datetime":"2018-11-30T00:00:00.000+09:00","isbn":"8983927240 9788983927248","price":35000,"publisher":"문학수첩","sale_price":31500,"status":"정상판매","thumbnail":"https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F4818238%3Ftimestamp%3D20190302225046","title":"해리포터 마법 도구 금고(양장본 HardCover)","translators":["고정아"],"url":"https://search.daum.net/search?w=bookpage\u0026bookId=4818238\u0026q=%ED%95%B4%EB%A6%AC%ED%8F%AC%ED%84%B0+%EB%A7%88%EB%B2%95+%EB%8F%84%EA%B5%AC+%EA%B8%88%EA%B3%A0%28%EC%96%91%EC%9E%A5%EB%B3%B8+HardCover%29"},{"authors":["롱테일북스 편집부"],"contents":"「원서 읽는 단어장」 시리즈 『Harry Potter And The Sorcerer's Stone』. 영어원서에 나온 어려운 어휘들을 정리하여 원서 읽기의 부담감을 줄이고 보다 효과적으로 영어실력을 쌓을 수 있도록 도와주는 책이다. 'The Trace of Harry Potter'를 통해 원서를 제대로 읽고 이해하고 있는지 측정해보고, 'The Sorcerer's Vocabulary'를 통해 원서에 등장하는 어려운 어휘를 알아본다. \u0026lt;빈도","datetime":"2014-07-31T00:00:00.000+09:00","isbn":"8956054428 9788956054421","price":6000,"publisher":"롱테일북스","sale_price":5400,"status":"정상판매","thumbnail":"https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F723961%3Ftimestamp%3D20190124152055","title":"해리포터와 마법사의 돌(Harry Potter and the Sorcerer's Stone)(원서 읽는...","translators":[],"url":"https://search.daum.net/search?w=bookpage\u0026bookId=723961\u0026q=%ED%95%B4%EB%A6%AC%ED%8F%AC%ED%84%B0%EC%99%80+%EB%A7%88%EB%B2%95%EC%82%AC%EC%9D%98+%EB%8F%8C%28Harry+Potter+and+the+Sorcerer%27s+Stone%29%28%EC%9B%90%EC%84%9C+%EC%9D%BD%EB%8A%94+%EB%8B%A8%EC%96%B4%EC%9E%A5%29"},{"authors":["JK라림"],"contents":"","datetime":"2002-01-01T00:00:00.000+09:00","isbn":"702003344X 9787020033447","price":13500,"publisher":"인민문학출판사","sale_price":-1,"status":"","thumbnail":"https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F2715084%3Ftimestamp%3D20190215164737","title":"합리파특(밀실)(중문)-해리포터","translators":["마애신"],"url":"https://search.daum.net/search?w=bookpage\u0026bookId=2715084\u0026q=%ED%95%A9%EB%A6%AC%ED%8C%8C%ED%8A%B9%28%EB%B0%80%EC%8B%A4%29%28%EC%A4%91%EB%AC%B8%29-%ED%95%B4%EB%A6%AC%ED%8F%AC%ED%84%B0"},{"authors":[],"contents":"","datetime":"2002-01-01T00:00:00.000+09:00","isbn":"702003344X 9787020033447","price":13500,"publisher":"인민문학출판사","sale_price":36240,"status":"정상판매","thumbnail":"","title":"합리파특(밀실)(중문)-해리포터","translators":[],"url":"https://search.daum.net/search?w=bookpage\u0026bookId=323702\u0026q=%ED%95%A9%EB%A6%AC%ED%8C%8C%ED%8A%B9%28%EB%B0%80%EC%8B%A4%29%28%EC%A4%91%EB%AC%B8%29-%ED%95%B4%EB%A6%AC%ED%8F%AC%ED%84%B0"},{"authors":["편집부"],"contents":"","datetime":"2001-12-01T00:00:00.000+09:00","isbn":" 2015106000012","price":40000,"publisher":"인민문학출판사","sale_price":-1,"status":"","thumbnail":"","title":"합리파특(해리포터)(중문)(전4권)","translators":[],"url":"https://search.daum.net/search?w=bookpage\u0026bookId=295140\u0026q=%ED%95%A9%EB%A6%AC%ED%8C%8C%ED%8A%B9%28%ED%95%B4%EB%A6%AC%ED%8F%AC%ED%84%B0%29%28%EC%A4%91%EB%AC%B8%29%28%EC%A0%844%EA%B6%8C%29"}],"meta":{"is_end":false,"pageable_count":239,"total_count":277}};

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
              page:1,
              size:20,
             target:'title'
          },
          success : function(result){
     		 bookData=result;
     		makeBookTable(result);
          }
      });
    }
}    /* 
let date = data.datetime;
$('#datetime').val(date.split('T')[0]); */
/*latest : 최신순,accuracy : 정확도  */
 function makeBookTable(bookData){
	 let option = [
 	    {field:"title",      width:200},
 	    {field:"contents", width:100},
 	    {field:"url", width:100},
 	    {field:"isbn", width:100},
 	    {field:"authors", width:100},
 	    {field:"publisher", width:100},
 	    {field:"translators", width:100},
 	    {field:"price", width:100},
 	    {field:"sale_price", width:100},
 	    {field:"thumbnail", width:100},
 	    {field:"status", width:100},
 	    {field:"datetime",   width:100}
 	
 	];

 	var getBookTable = $("#getBookTable");
 	var table = $("<table>").appendTo(getBookTable);
 	$.each( bookData.documents, function( index, row) {
		var tr = $("<tr>").appendTo(table);
		$.each( option, function( i, fieldInfo ) {
			var td = $("<td>").appendTo(tr);
			td.html( row[fieldInfo.field]);
 	    });
 	});
 }
</script>
<%@ include file="includes/footer/footer-4.jsp"%>
