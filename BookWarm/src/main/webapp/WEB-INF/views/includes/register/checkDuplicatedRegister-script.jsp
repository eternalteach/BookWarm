   <script>
   	$(document).ready(function() {
   		
   		// 중복메세지 받아오기
   		var message = $('#msg');
   		if(message.val()=='true') {
   			alert("id, pw가 이미 존재하는 유저입니다.");
   		}
   		
   		// 이메일 선택
   		$('#selectEmail').on('click', function() {
   			var selected = $(this).val();
   			var user_mail2 = $('#user_mail2');
   			
   			if(selected=="선택") {
   				// 선택창 아직 선택하기 이전 >> 입력창 비우기
   				user_mail2.val('');
   			}else if(selected=="typeEmail"){
   				// 직접 입력하기 선택 >> 입력창 비우기
   				user_mail2.val('');
   				user_mail2.attr('placeholder', 'type your email here!')
   			}else {
   				// 네이버, 구글, 다음 주소 선택 >> input창에 넣어주기
   				user_mail2.val(selected);
   			}
   		})
   		
   		// 전송 버튼 클릭시 >> 모든 창 안 채워져있으면 경고창
   		$('#chkDuplicatedBtn').on('click', function() {
   			var user_name = $('#user_name').val();
   			var user_mail1 = $('#user_mail1').val();
   			var user_mail2 = $('#user_mail2').val();
   			var mail = user_mail1+"@"+user_mail2;
   			
   			var mailExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

   			
   			if(user_name=="" || user_mail1=="" || user_mail2=="") {
   				alert("모든 폼을 작성해주세요.");
   			}else if(user_mail2.split('.').length!=2 || !mailExp.test(mail)) {
    			// 이메일 직접 입력하기 선택시 경고창
    			// 1. @뒷부분에 ooo.ooo 형태로 안 되어있는경우
    			// 2. 특문 들어간 경우
    			// 3. 한글 들어간 경우
   				alert("이메일 주소의 형식이 잘못 되었습니다.");
   			}else {
   				$(this).attr('type', 'submit');
   			}
   			
   			
   		})
   		
   	})
</script>