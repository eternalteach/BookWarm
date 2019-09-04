   <div class="wrapper">
      <div class="page has-sidebar has-right-sidebar bordered">

         <section class="page-header b-bordered t-bordered">
            <div class="container">
               <div class="row">
                  <div class="col-sm-12">
                     <h1 class="title">Shop - Checkout</h1>
                     <ol class="breadcrumb pull-right">
                        <li><a href="#">Home</a></li>
                        <li><a href="#">Shop</a></li>
                        <li class="active">Checkout</li>
                     </ol>
                  </div>
               </div>
            </div>
         </section>

         <div class="page-inner no-border">

            <section class="section-primary main-color">

               <div class="container">

                  <div class="row">

                     <div class="col-md-7">
						<!-- 폼 작성부분(왼쪽) -->
                        <div class="smart-forms">

                           <div class="form-header pt-0 pl-0">
                              <h4 class="fs-24">결제 상세 정보</h4>
                           </div>

                           <form method="post" action="/" id="accountx">
                              <div class="form-body pl-0">

                                 <div class="spacer-b30">
                                    <div class="tagline"><span>Personal Information </span></div><!-- .tagline -->
                                 </div>

                                 <div class="section">
                                    <label class="field prepend-icon">
                                       <input type="text" name="name" id="name" class="gui-input" placeholder="이름">
                                       <span class="field-icon"><i class="fa fa-user"></i></span>
                                    </label>
                                 </div><!-- end section -->

                                 <div class="section">
                                    <label class="field prepend-icon">
                                       <input type="email" name="email" id="email" class="gui-input" placeholder="Email">
                                       <span class="field-icon"><i class="fa fa-envelope"></i></span>
                                    </label>
                                 </div><!-- end section -->

                                 <div class="section">
                                    <label for="mobile" class="field prepend-icon">
                                       <input type="tel" name="mobile" id="mobile" class="gui-input" placeholder="휴대폰 번호">
                                       <span class="field-icon"><i class="fa fa-phone-square"></i></span>
                                    </label>
                                 </div><!-- end section -->

                                 <hr class="invisible" />
                                 <div class="spacer-t20 spacer-b30">
                                    <div class="tagline"><span> 배송 주소 </span></div><!-- .tagline -->
                                 </div>

                                 <div class="section">

                                    <label class="field prepend-icon">
                                       <input type="text" name="firstaddr" id="firstaddr" class="gui-input" placeholder="Street address">
                                       <span class="field-icon"><i class="fa fa-building-o"></i></span>
                                    </label>
                                 </div><!-- end section -->

                                 <div class="section">
                                    <label class="field prepend-icon">
                                    	<!-- 삽입 시작 -->
                                    	<input type="text" id="sample4_postcode" placeholder="우편번호">
									    <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
									    <input type="text" id="sample4_roadAddress" placeholder="도로명주소">
									    <input type="text" id="sample4_jibunAddress" placeholder="지번주소">
									    <span id="guide" style="color:#999;display:none"></span>
									    <input type="text" id="sample4_detailAddress" placeholder="상세주소">
									    <input type="text" id="sample4_extraAddress" placeholder="참고항목">
									
									    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
									    <script>
									        //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
									        function sample4_execDaumPostcode() {
									            new daum.Postcode({
									                oncomplete: function(data) {
									                    // data는 사용자가 선택한 주소 정보를 담고 있는 객체.
									                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
									
									                    // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
									                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
									                    var roadAddr = data.roadAddress; // 도로명 주소 변수
									                    var extraRoadAddr = ''; // 참고 항목 변수
									
									                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
									                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
									                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
									                        extraRoadAddr += data.bname;
									                    }
									                    // 건물명이 있고, 공동주택일 경우 추가한다.
									                    if(data.buildingName !== '' && data.apartment === 'Y'){
									                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
									                    }
									                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
									                    if(extraRoadAddr !== ''){
									                        extraRoadAddr = ' (' + extraRoadAddr  + ')';
									                    }
									
									                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
									                    document.getElementById('sample4_postcode').value = data.zonecode;
									                    document.getElementById("sample4_roadAddress").value = roadAddr;
									                    document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
									                    
									                    // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
									                    if(roadAddr !== ''){
									                        document.getElementById("sample4_extraAddress").value = extraRoadAddr;
									                    } else {
									                        document.getElementById("sample4_extraAddress").value = '';
									                    }
									
									                    var guideTextBox = document.getElementById("guide");
									                    // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
									                    if(data.autoRoadAddress) {
									                        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
									                        guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
									                        guideTextBox.style.display = 'block';
									
									                    } else if(data.autoJibunAddress) {
									                        var expJibunAddr = data.autoJibunAddress;
									                        guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
									                        guideTextBox.style.display = 'block';
									                    } else {
									                        guideTextBox.innerHTML = '';
									                        guideTextBox.style.display = 'none';
									                    }
									                }
									            }).open();
									        }
									    </script>
                                    	<!-- 삽입 끝 -->
                                    	<button type="button" class="orgBtn" onclick="getAddressInfo()">조회</button></td>
                                       <input type="text" name="lastaddr" id="lastaddr" class="gui-input" placeholder="주소">
                                       <span class="field-icon"><i class="fa fa-map-marker"></i></span>
                                    </label>
                                 </div><!-- end section -->

                                 <div class="section">
                                    <label class="field select">
                                       <select id="location" name="location">
                                          <option value="">Select country...</option>
                                          <option value="AL">Albania</option>
                                          <option value="DZ">Algeria</option>
                                          <option value="AD">Andorra</option>
                                          <option value="AO">Angola</option>
                                          <option value="AI">Anguilla</option>
                                          <option value="AG">Antigua and Barbuda</option>
                                          <option value="AR">Argentina</option>
                                          <option value="AM">Armenia</option>
                                          <option value="AW">Aruba</option>
                                          <option value="AU">Australia</option>
                                          <option value="AT">Austria</option>
                                          <option value="AZ">Azerbaijan Republic</option>
                                          <option value="BS">Bahamas</option>
                                          <option value="BH">Bahrain</option>
                                          <option value="BB">Barbados</option>
                                          <option value="BE">Belgium</option>
                                          <option value="BZ">Belize</option>
                                          <option value="BJ">Benin</option>
                                          <option value="BM">Bermuda</option>
                                          <option value="BT">Bhutan</option>
                                          <option value="BO">Bolivia</option>
                                          <option value="BA">Bosnia and Herzegovina</option>
                                          <option value="BW">Botswana</option>
                                          <option value="BR">Brazil</option>
                                          <option value="BN">Brunei</option>
                                          <option value="BG">Bulgaria</option>
                                          <option value="BF">Burkina Faso</option>
                                          <option value="BI">Burundi</option>
                                          <option value="KH">Cambodia</option>
                                          <option value="CA">Canada</option>
                                          <option value="CV">Cape Verde</option>
                                          <option value="KY">Cayman Islands</option>
                                          <option value="TD">Chad</option>
                                          <option value="CL">Chile</option>
                                          <option value="C2">China Worldwide</option>
                                          <option value="CO">Colombia</option>
                                          <option value="KM">Comoros</option>
                                          <option value="CK">Cook Islands</option>
                                          <option value="CR">Costa Rica</option>
                                          <option value="HR">Croatia</option>
                                          <option value="CY">Cyprus</option>
                                          <option value="CZ">Czech Republic</option>
                                          <option value="CD">Democratic Republic of the Congo</option>
                                          <option value="DK">Denmark</option>
                                          <option value="DJ">Djibouti</option>
                                          <option value="DM">Dominica</option>
                                          <option value="DO">Dominican Republic</option>
                                          <option value="EC">Ecuador</option>
                                          <option value="EG">Egypt</option>
                                          <option value="SV">El Salvador</option>
                                          <option value="ER">Eritrea</option>
                                          <option value="EE">Estonia</option>
                                          <option value="ET">Ethiopia</option>
                                          <option value="FK">Falkland Islands</option>
                                          <option value="FO">Faroe Islands</option>
                                          <option value="FJ">Fiji</option>
                                          <option value="FI">Finland</option>
                                          <option value="FR">France</option>
                                          <option value="GF">French Guiana</option>
                                          <option value="PF">French Polynesia</option>
                                          <option value="GA">Gabon Republic</option>
                                          <option value="GM">Gambia</option>
                                          <option value="GE">Georgia</option>
                                          <option value="DE">Germany</option>
                                          <option value="GI">Gibraltar</option>
                                          <option value="GR">Greece</option>
                                          <option value="GL">Greenland</option>
                                          <option value="GD">Grenada</option>
                                          <option value="GP">Guadeloupe</option>
                                          <option value="GT">Guatemala</option>
                                          <option value="GN">Guinea</option>
                                          <option value="GW">Guinea Bissau</option>
                                          <option value="GY">Guyana</option>
                                          <option value="HN">Honduras</option>
                                          <option value="HK">Hong Kong</option>
                                          <option value="HU">Hungary</option>
                                          <option value="IS">Iceland</option>
                                          <option value="IN">India</option>
                                          <option value="ID">Indonesia</option>
                                          <option value="IE">Ireland</option>
                                          <option value="IL">Israel</option>
                                          <option value="IT">Italy</option>
                                          <option value="JM">Jamaica</option>
                                          <option value="JP">Japan</option>
                                          <option value="JO">Jordan</option>
                                          <option value="KZ">Kazakhstan</option>
                                          <option value="KE">Kenya</option>
                                          <option value="KI">Kiribati</option>
                                          <option value="KW">Kuwait</option>
                                          <option value="KG">Kyrgyzstan</option>
                                          <option value="LA">Laos</option>
                                          <option value="LV">Latvia</option>
                                          <option value="LS">Lesotho</option>
                                          <option value="LI">Liechtenstein</option>
                                          <option value="LT">Lithuania</option>
                                          <option value="LU">Luxembourg</option>
                                          <option value="MG">Madagascar</option>
                                          <option value="MW">Malawi</option>
                                          <option value="MY">Malaysia</option>
                                          <option value="MV">Maldives</option>
                                          <option value="ML">Mali</option>
                                          <option value="MT">Malta</option>
                                          <option value="MH">Marshall Islands</option>
                                          <option value="MQ">Martinique</option>
                                          <option value="MR">Mauritania</option>
                                          <option value="MU">Mauritius</option>
                                          <option value="YT">Mayotte</option>
                                          <option value="MX">Mexico</option>
                                          <option value="FM">Micronesia</option>
                                          <option value="MN">Mongolia</option>
                                          <option value="MS">Montserrat</option>
                                          <option value="MA">Morocco</option>
                                          <option value="MZ">Mozambique</option>
                                          <option value="NA">Namibia</option>
                                          <option value="NR">Nauru</option>
                                          <option value="NP">Nepal</option>
                                          <option value="NL">Netherlands</option>
                                          <option value="AN">Netherlands Antilles</option>
                                          <option value="NC">New Caledonia</option>
                                          <option value="NZ">New Zealand</option>
                                          <option value="NI">Nicaragua</option>
                                          <option value="NE">Niger</option>
                                          <option value="NU">Niue</option>
                                          <option value="NF">Norfolk Island</option>
                                          <option value="NO">Norway</option>
                                          <option value="OM">Oman</option>
                                          <option value="PW">Palau</option>
                                          <option value="PA">Panama</option>
                                          <option value="PG">Papua New Guinea</option>
                                          <option value="PE">Peru</option>
                                          <option value="PH">Philippines</option>
                                          <option value="PN">Pitcairn Islands</option>
                                          <option value="PL">Poland</option>
                                          <option value="PT">Portugal</option>
                                          <option value="QA">Qatar</option>
                                          <option value="CG">Republic of the Congo</option>
                                          <option value="RE">Reunion</option>
                                          <option value="RO">Romania</option>
                                          <option value="RU">Russia</option>
                                          <option value="RW">Rwanda</option>
                                          <option value="KN">Saint Kitts and Nevis Anguilla</option>
                                          <option value="PM">Saint Pierre and Miquelon</option>
                                          <option value="VC">Saint Vincent and Grenadines</option>
                                          <option value="WS">Samoa</option>
                                          <option value="SM">San Marino</option>
                                          <option value="ST">São Tomé and Príncipe</option>
                                          <option value="SA">Saudi Arabia</option>
                                          <option value="SN">Senegal</option>
                                          <option value="RS">Serbia</option>
                                          <option value="SC">Seychelles</option>
                                          <option value="SL">Sierra Leone</option>
                                          <option value="SG">Singapore</option>
                                          <option value="SK">Slovakia</option>
                                          <option value="SI">Slovenia</option>
                                          <option value="SB">Solomon Islands</option>
                                          <option value="SO">Somalia</option>
                                          <option value="ZA">South Africa</option>
                                          <option value="KR">South Korea</option>
                                          <option value="ES">Spain</option>
                                          <option value="LK">Sri Lanka</option>
                                          <option value="SH">St. Helena</option>
                                          <option value="LC">St. Lucia</option>
                                          <option value="SR">Suriname</option>
                                          <option value="SJ">Svalbard and Jan Mayen Islands</option>
                                          <option value="SZ">Swaziland</option>
                                          <option value="SE">Sweden</option>
                                          <option value="CH">Switzerland</option>
                                          <option value="TW">Taiwan</option>
                                          <option value="TJ">Tajikistan</option>
                                          <option value="TZ">Tanzania</option>
                                          <option value="TH">Thailand</option>
                                          <option value="TG">Togo</option>
                                          <option value="TO">Tonga</option>
                                          <option value="TT">Trinidad and Tobago</option>
                                          <option value="TN">Tunisia</option>
                                          <option value="TR">Turkey</option>
                                          <option value="TM">Turkmenistan</option>
                                          <option value="TC">Turks and Caicos Islands</option>
                                          <option value="TV">Tuvalu</option>
                                          <option value="UG">Uganda</option>
                                          <option value="UA">Ukraine</option>
                                          <option value="AE">United Arab Emirates</option>
                                          <option value="GB">United Kingdom</option>
                                          <option value="US">United States</option>
                                          <option value="UY">Uruguay</option>
                                          <option value="VU">Vanuatu</option>
                                          <option value="VA">Vatican City State</option>
                                          <option value="VE">Venezuela</option>
                                          <option value="VN">Vietnam</option>
                                          <option value="VG">Virgin Islands (British)</option>
                                          <option value="WF">Wallis and Futuna Islands</option>
                                          <option value="YE">Yemen</option>
                                          <option value="ZM">Zambia</option>
                                       </select>
                                       <i class="arrow double"></i>
                                    </label>
                                 </div><!-- end section -->

                                 <div class="frm-row">

                                    <div class="section colm colm3">
                                       <label class="field prepend-icon">
                                          <input type="text" name="zip" id="zip" class="gui-input" placeholder="Zip">
                                          <span class="field-icon"><i class="fa fa-certificate"></i></span>
                                       </label>
                                    </div><!-- end section -->

                                    <div class="section colm colm4">
                                       <label class="field prepend-icon">
                                          <input type="text" name="city" id="city" class="gui-input" placeholder="City">
                                          <span class="field-icon"><i class="fa fa-building-o"></i></span>
                                       </label>
                                    </div><!-- end section -->

                                    <div class="section colm colm5">
                                       <label class="field select">
                                          <select id="states" name="states">
                                             <option value="">Choose state</option>
                                             <option value="AL">Alabama</option>
                                             <option value="AK">Alaska</option>
                                             <option value="AZ">Arizona</option>
                                             <option value="AR">Arkansas</option>
                                             <option value="CA">California</option>
                                             <option value="CO">Colorado</option>
                                             <option value="CT">Connecticut</option>
                                             <option value="DE">Delaware</option>
                                             <option value="DC">District Of Columbia</option>
                                             <option value="FL">Florida</option>
                                             <option value="GA">Georgia</option>
                                             <option value="HI">Hawaii</option>
                                             <option value="ID">Idaho</option>
                                             <option value="IL">Illinois</option>
                                             <option value="IN">Indiana</option>
                                             <option value="IA">Iowa</option>
                                             <option value="KS">Kansas</option>
                                             <option value="KY">Kentucky</option>
                                             <option value="LA">Louisiana</option>
                                             <option value="ME">Maine</option>
                                             <option value="MD">Maryland</option>
                                             <option value="MA">Massachusetts</option>
                                             <option value="MI">Michigan</option>
                                             <option value="MN">Minnesota</option>
                                             <option value="MS">Mississippi</option>
                                             <option value="MO">Missouri</option>
                                             <option value="MT">Montana</option>
                                             <option value="NE">Nebraska</option>
                                             <option value="NV">Nevada</option>
                                             <option value="NH">New Hampshire</option>
                                             <option value="NJ">New Jersey</option>
                                             <option value="NM">New Mexico</option>
                                             <option value="NY">New York</option>
                                             <option value="NC">North Carolina</option>
                                             <option value="ND">North Dakota</option>
                                             <option value="OH">Ohio</option>
                                             <option value="OK">Oklahoma</option>
                                             <option value="OR">Oregon</option>
                                             <option value="PA">Pennsylvania</option>
                                             <option value="RI">Rhode Island</option>
                                             <option value="SC">South Carolina</option>
                                             <option value="SD">South Dakota</option>
                                             <option value="TN">Tennessee</option>
                                             <option value="TX">Texas</option>
                                             <option value="UT">Utah</option>
                                             <option value="VT">Vermont</option>
                                             <option value="VA">Virginia</option>
                                             <option value="WA">Washington</option>
                                             <option value="WV">West Virginia</option>
                                             <option value="WI">Wisconsin</option>
                                             <option value="WY">Wyoming</option>
                                          </select>
                                          <i class="arrow double"></i>
                                       </label>
                                    </div><!-- end .col8 section -->
                                 </div><!-- end frm-row section -->

                                 <div class="section">
                                    <label class="field option option-yellow">
                                       <input type="checkbox" name="info" checked>
                                       <span class="checkbox"></span>
                                       Save my information <em class="small-text fine-grey"> (No worries, its secure) </em>
                                    </label>
                                 </div><!-- end section -->
                              </div><!-- end .form-body section -->
                           </form>
                        </div>
                        <!-- 폼 작성부분(왼쪽) -->
                       
                     </div>

                     <div class="col-md-5">

                        <div class="smart-forms smart-container wrap-3">

                           <div class="form-header">
                              <h4 class="fs-24">Your Order</h4>
                           </div><!-- end .form-header section -->
                           <form method="post" action="/" id="account2">
                              <div class="form-body pt-15">
                                 <div class="table-responsive">
                                    <table class="table cart-totals">
                                       <tbody>
                                          <tr class="cart_item">
                                             <td class="cart-product-name"></td>
                                             <td class="cart-product-name"><strong>상품명</strong></td>
			                           		 <td class="cart-product-name"><strong>가격</strong></td>
			                           		 <td class="cart-product-name"><strong>수량</strong></td>
			                           		 <td class="cart-product-name"><strong>합계</strong></td>
                                          </tr>
                                          <c:forEach items="${list}" var="list">
				                             <tr>
				                           	 	<td class="cart-product-name amount"><img width="50" height="50" src="${list.book_img}"></td>
				                           	 	<td class="cart-product-name amount">${list.book_title}</td>
				                           		<td class="cart-product-name amount">${list.book_price_for_sale}</td>
				                           		<td class="cart-product-name amount">${list.cart_cnt}</td>
				                           		<td class="cart-product-name amount">${list.total}</td>
				                             </tr>
							   			  </c:forEach>
							   			  
                                          <tr class="cart_item">
                                             <td class="cart-product-name">
                                                <strong>배송비</strong>
                                             </td>

                                             <td class="cart-product-name">
                                                <span class="amount">${delivery}</span>
                                             </td>
                                          </tr>
                                          <tr class="cart_item">
                                             <td class="cart-product-name">
                                                <strong>결제 금액</strong>
                                             </td>

                                             <td class="cart-product-name">
                                                <span class="amount color"><strong>${subTotal}원</strong></span>
                                             </td>
                                          </tr>
                                       </tbody>
                                    </table>

                                    <!--<a href="shop.html" class="btn btn-primary w-100">Proceed to Checkout</a>-->
                                 </div>

                                 <div class="spacer-t40 spacer-b30">
                                    <div class="tagline"><span> Payment Details </span></div><!-- .tagline -->
                                 </div>

                                 <div class="section">
                                    <p class="small-text fine-grey">Please choose a preferred method of payment below </p>
                                 </div><!-- end section -->

                                 <div class="section pb-15">

                                    <label class="field option option-yellow">
                                       <input type="radio" name="payment" checked>
                                       <span class="radio"></span> Credit Card
                                    </label>

                                    <label class="field option option-yellow">
                                       <input type="radio" name="payment">
                                       <span class="radio"></span> Paypal
                                    </label>

                                    <label class="field option option-yellow">
                                       <input type="radio" name="payment">
                                       <span class="radio"></span> Check
                                    </label>
                                 </div><!-- end section -->

                                 <div class="fmx">

                                    <div class="section">
                                       <label class="field prepend-icon">
                                          <input type="text" name="cardname" id="cardname" class="gui-input" placeholder="Name on card...">
                                          <span class="field-icon"><i class="fa fa-user"></i></span>
                                       </label>
                                    </div><!-- end section -->

                                    <div class="section">
                                       <label class="field prepend-icon">
                                          <input type="text" name="cardno" class="gui-input" placeholder="Card number...">
                                          <span class="field-icon"><i class="fa fa-credit-card"></i></span>
                                       </label>
                                    </div><!-- end section -->
                                 </div><!-- end frm-row section -->

                                 <div class="frm-row">

                                    <div class="section colm colm6">
                                       <label for="cardmonth" class="field select">
                                          <select id="cardmonth" name="cardmonth">
                                             <option value="">Expiry month...</option>
                                             <option value="01">01 - Jan</option>
                                             <option value="02">02 - Feb</option>
                                             <option value="03">03 - Mar</option>
                                             <option value="04">04 - Apr</option>
                                             <option value="05">05 - May</option>
                                             <option value="06">06 - Jun</option>
                                             <option value="07">07 - Jul</option>
                                             <option value="08">08 - Aug</option>
                                             <option value="09">09 - Sep</option>
                                             <option value="10">10 - Oct</option>
                                             <option value="11">11 - Nov</option>
                                             <option value="12">12 - Dec</option>
                                          </select>
                                          <i class="arrow double"></i>
                                       </label>
                                    </div><!-- end section -->

                                    <div class="section colm colm6">
                                       <label class="field select">
                                          <select id="cardyear" name="cardyear">
                                             <option value="">Expiry year...</option>
                                             <option value="2014">2014</option>
                                             <option value="2015">2015</option>
                                             <option value="2016">2016</option>
                                             <option value="2017">2017</option>
                                             <option value="2018">2018</option>
                                             <option value="2019">2019</option>
                                             <option value="2020">2020</option>
                                             <option value="2021">2021</option>
                                             <option value="2022">2022</option>
                                             <option value="2023">2023</option>
                                             <option value="2024">2024</option>
                                             <option value="2025">2025</option>
                                             <option value="2026">2026</option>
                                          </select>
                                          <i class="arrow double"></i>
                                       </label>
                                    </div><!-- end section -->
                                 </div><!-- end frm-row section -->

                                 <div class="frm-row">

                                    <div class="section colm colm6">
                                       <label class="field prepend-icon">
                                          <input type="text" name="secno" id="secno" class="gui-input" placeholder="Security number...">
                                          <b class="tooltip tip-left-top"><em> This is a four diigit number at the back of your card </em></b>
                                          <span class="field-icon"><i class="fa fa-barcode"></i></span>
                                       </label>
                                    </div><!-- end section -->

                                    <div class="section colm colm6">
                                       <p> <a href="#" class="smart-link"> What is this? </a>  </p>
                                    </div><!-- end section -->
                                 </div><!-- end frm-row section -->
                              </div><!-- end .form-body section -->
                              <div class="form-footer">
                                 <button type="submit" class="btn btn-primary w-100">Proceed to confirm </button>
                              </div><!-- end .form-footer section -->
                           </form>
                        </div>
                     </div>
                  </div>
               </div>
            </section>
         </div>

      </div>

      <div class="modal fade" id="exampleModalLabel33" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel33" aria-hidden="true">
         <div class="modal-dialog" style="max-width:345px" role="document">
            <div class="modal-content">
               <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel33">Login via</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                  </button>
               </div>
               <div class="modal-body">
                  <div class="clearfix" id="login-dp">

                     <div class="social-buttons text-center">
                        <a href="#" class="btn btn-fb ls-0"><i class="fa fa-facebook"></i> Facebook</a>
                        <a href="#" class="btn btn-tw ls-0"><i class="fa fa-twitter"></i> Twitter</a>
                     </div>
                     <div class="special-heading line center">
                        <h5 class="special-heading-inner mb-10"><span class="o-7"> or </span></h5>
                     </div>
                     <form class="form" role="form" method="post" action="login" accept-charset="UTF-8" id="login-nav">
                        <div class="form-group">
                           <label class="sr-only" for="exampleInputEmail2">Email address</label>
                           <input type="email" class="form-control" id="exampleInputEmail2" placeholder="Email address" required>
                        </div>
                        <div class="form-group">
                           <label class="sr-only" for="exampleInputPassword2">Password</label>
                           <input type="password" class="form-control" id="exampleInputPassword2" placeholder="Password" required>
                           <div class="help-block text-right pt-10 fs-13"><a href="" class="read-more">Forget the password ?</a></div>
                        </div>
                        <div class="form-group">
                           <button type="submit" class="btn btn-primary btn-block">Sign in</button>
                        </div>
                        <div class="checkbox-custom checkbox-default">
                           <input id="RememberMe" name="rememberme" type="checkbox">
                           <label for="RememberMe"> keep me logged-in</label>
                        </div>
                     </form>

                     <div class="bottom text-center">
                        New here ? <a href="#"><b>Join Us</b></a>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>

</body>
</html>