<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.eapps-instagram-feed-posts-slider-inner {
	width: 1300px !important;
}

.wrap_inner_left {
	float: left;
	padding-top: 80px;
}

.wrap_inner_right {
	float: right;
	width: 580px;
	padding-top: 80px;
	text-align: right;
}

.pg_txt {
	width: 100%;
	overflow: hidden;
	color: #999;
	line-height: 36px;
}

.pg_txt a {
	color: #999;
}

.isms_con {
	position: absolute;
	bottom: 0;
	right: 4%;
}

.isms_con .con {
	float: left;
	width: 40px;
	height: 36px;
	font-size: 14px;
	cursor: default;
	background: url(http://xexymix.jpg3.kr/xexymix/2020/main/isms_img_c.png)
		no-repeat center;
	background-size: cover;
}

.isms_con .con:hover p {
	display: block;
	transform-origin: 100% 0%;
	-webkit-animation: fadeIn 0.3s ease-in-out;
	animation: fadeIn 0.3s ease-in-out;
}

.isms_con .con p {
	display: none;
	text-align: left;
	background-color: #fff;
	width: 190px;
	height: 38px;
	padding: 4px 5px;
	border: 1px solid #dfdfdf;
	position: absolute;
	right: 180px;
	top: -40px;
	color: #888;
	font-size: 11px;
}

.isms_con .txt {
	float: left;
	padding-left: 10px;
	font-size: 12px;
	color: #999;
	line-height: 36px;
}

@
-webkit-keyframes fadeIn { 0% {
	opacity: 0;
	transform: scale(0.6);
}

100%
{
opacity
:
100%;

		
transform
:
 
scale
(1);

	
}
}
@
keyframes fadeIn { 0% {
	opacity: 0;
}
100%
{
opacity
:
100%;
 
}
}

#ftWrap { clear:both; width:100%; padding-bottom:80px; border-top: 1px solid #999; background-color: #fff; margin:0 auto;}
#footer { max-width:1500px; min-width:100px; position:relative; overflow:hidden; padding:0; margin:0 auto; width:900px;}
#footer .footerLogo { text-align:left; }
#footer .footerLogo > a { display:block; width:107px; text-align:center; }

#footer /* .topArea { margin-bottom:40px; } */
#footer .topArea > div {display:inline-block; *display:inline; vertical-align:top; padding-left:50px; text-align:right; }
#footer .topArea > div dt {font-size:14px; font-weight:bold; margin-bottom:10px; }
#footer .topArea > div dd {margin-bottom:7px; color:#999; font-size:12px; }
#footer .topArea > div dd a {color:#999; font-size:12px; display:inline-block; }
#footer .topArea > div dd.tel {font-size:22px; margin-bottom:15px; font-weight:500; color:#111; }
#footer .topArea > div p.msg {color:#999; font-size:12px; margin-top:20px; line-height:1.6; }
#footer .topArea > div.lang dd,
#footer .topArea > div.sns dd {display:inline-block; *display:inline; vertical-align:top; margin-right:7px; }
#footer .topArea > div.lang { width:271px; }
#footer .topArea .cs .cs_btn { display: block; height:29px; line-height:29px; background: #000; color:#fff; padding:0px;}
#footer .topArea .cs .cs_btn span { font-size:9px; margin-left:4px; }

#footer .footerBottom .topArea {margin-bottom:0; }
#footer .footerBottom address span { color:#999; font-size:12px; *display: inline; *zoom: 1; position: relative; padding-right: 19px; vertical-align: top; line-height:2;}
#footer .footerBottom address span a { color:#999; }
#footer .footerBottom address span:after {display: block; content: ''; position: absolute; top: 50%; right: 9px; width: 1px; height: 9px; background: #a5a5a5; -webkit-transform: translate(0,-50%); -ms-transform: translate(0,-50%); transform: translate(0,-50%); }
#footer .footerBottom address span.last:after {width:0; }
#footer .footerBottom address .copyright {margin-top:20px; font-size:12px; color:#999; line-height:2; }
#footer .footerBottom address .copyright img {vertical-align:middle; }
#footer .footerBottom address .copyright a {color:#999; text-decoration:underline; line-height:2; }
#footer .footerBottom .menu {margin:20px 0; }
#footer .footerBottom .menu li {display: inline-block; *display: inline; *zoom: 1; }
#footer .footerBottom .menu li a { color:#999; font-size:12px; display: inline-block; *display: inline; *zoom: 1; position: relative; vertical-align: top; line-height:2; }
#footer .footerBottom .menu li a:after {display: block; content: ''; position: absolute; top: 50%; right: -5px; width: 1px; height: 9px; background: #a5a5a5; -webkit-transform: translate(0,-50%); -ms-transform: translate(0,-50%); transform: translate(0,-50%); }
#footer .footerBottom .menu li.last a:after {width:0; }


#right_q {position:fixed; top:50%; right:0; z-index:30; -webkit-transform:translate(0,-50%); -ms-transform:translate(0,-50%); transform:translate(0,-50%); display:none; }
#right_q ul {overflow:hidden;  border-bottom:0; background:#fff; border-top:1px solid #c6c6c6;}
#right_q ul li { border-bottom:1px solid #c6c6c6; border-left:1px solid #c6c6c6;}
#right_q ul li a {display:block; width:58px; height:48px; background:#fff no-repeat center; color:transparent; text-indent:-9999px; cursor:pointer;}
#right_q ul li.up a {background-image:url('/design/xexymix/image/q_up.png');}
#right_q ul li.down a {background-image:url('/design/xexymix/image/q_down.png');}
#right_q ul li.recent a {background-image:url('/design/xexymix/image/q_recent.png');}
#right_q ul li.kakao a {background-image:url('/design/xexymix/image/q_kakao.png');}
</style>
</head>
<body>
	<div id="ftWrap" style="padding-bottom: 0px; height:500; width=:700px; margin:0;">
		<div id="footer" style="height:500px; width:900px;">

			<div class="wrap_inner_left">
				<div class="footerLogo">
					<a href="goodsList?gCategory=Vegetable"><img
						src="images/Main_Logo.png" width="75", height="75"></a>
				</div>
				<div class="footerBottom">
					<ul class="menu" style="padding-left: 0px; text-align:left;">
						<li><a href="goodsList?gCategory=Vegetable">브랜드 스토리</a></li>
						<li><a href="goodsList?gCategory=Vegetable" target="_blank">회사소개</a></li>
						<li><a href="goodsList?gCategory=Vegetable">이용약관</a></li>
						<li class="privacy"><a href="goodsList?gCategory=Vegetable"><b>개인정보처리방침</b></a></li>
						<li class="last"><a href="notice">고객센터</a></li>
					</ul>
					<address class="info">
						<span>사업자명 : (주)오늘의밥</span> <span>대표자명 : 박세희,송지민,이윤석,전우진,홍진우</span> <span
							class="last">팩스 : 00-0000-0000</span> <br> <div style="text-align:left;"><span>주소 :
							서울시 강남구 테헤란로 124 삼원타워 5F</span> <span class="last">대표전화
							: 1234-1234</span> <br> <span>사업자등록번호 : 000-00-00000
							<a href="goodsList?gCategory=Vegetable">[사업자정보확인]</a>
						</span> <span class="last">통신판매업신고번호 : 2022-서울강남-00000</span> <br> <span
							class="last">제안/제휴문의 : 온라인 <a
							href="goodsList?gCategory=Vegetable">todaysRecipe@google.com</a>
						</span> <br> <span class="last">개인정보보호책임자 : 송지민 <a
							href="goodsList?gCategory=Vegetable">(thdwlals41@naver.com)</a></span></div>
					</address>
				</div>
			</div>

			<div class="wrap_inner_right" style="float:left; width:300px; vertical-align:center;">
				<div class="topArea">
					<div class="cs">
						<dl>
							<dd class="tel">1234-1234</dd>
							<dd>평일 &nbsp; 09:30 - 18:30</dd>
							<dd>점심 &nbsp; 13:30 - 14:30</dd>
							<dd>휴일 &nbsp; 토/일/공휴일</dd>
						</dl>
						<a href="notice" class="cs_btn" style="margin:0; text-align:center; width:150px; margin-left:auto;">고객만족센터
						</a>
					</div>
					
				</div>
				<div class="topArea">
					<div class="sns">
						<dl>
							<dt>SNS</dt>
							<dd>
								<a href="https://github.com/Acorn11th-2Team/Todays-Recipe" target="_blank"><img
									src="images/items/github.png"
									alt="오늘뭐먹조github" width="35" height="35"></a>
							</dd>
							<!-- <dd>
								<a href="https://www.instagram.com/xexymix/" target="_blank"><img
									src="http://xexymix.jpg3.kr/xexymix/2020/main/footer_insta.png"
									alt="제시믹스 인스타그램"></a>
							</dd>
							<dd>
								<a
									href="https://www.youtube.com/channel/UC1oWjNJHLCJn8UXWaIbqYjg"
									target="_blank"><img
									src="http://xexymix.jpg3.kr/xexymix/2020/main/footer_youtube.png"
									alt="유튜브"></a>
							</dd> -->
						</dl>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- #ftWrap -->
</body>
</html>