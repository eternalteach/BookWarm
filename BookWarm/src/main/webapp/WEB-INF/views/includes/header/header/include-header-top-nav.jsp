<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<nav class="collapse">
	<ul class="nav nav-pills" id="mainNav">
		<li class="dropdown"><a class="dropdown-item dropdown-toggle active" href="library">My Library</a>
			<ul class="dropdown-menu">
				<li><a class="dropdown-item" href="library">My Library</a></li>
				<li><a class="dropdown-item" href="reviewMain">My Review</a></li>
				<li><a class="dropdown-item" href="record">My Record</a></li><!-- <span class="tip tip-primary">Landing</span> -->
			</ul>
		</li>
		
		<li class="dropdown"><a class="dropdown-item dropdown-toggle" href="communityboard">Community</a>
			<ul class="dropdown-menu">
				<li><a class="dropdown-item" href="communityboard">Community Board</a></li>
				<li><a class="dropdown-item" href="openreivew">Open Review</a></li>
				<li><a class="dropdown-item" href="chat">Chatting</a></li>
			</ul>
		</li>
		
		<li class="dropdown"><a class="dropdown-item dropdown-toggle" href="#">Books </a>
			<ul class="dropdown-menu">
				<li><a class="dropdown-item" href="shoplist">shoplist</a></li>
				<li><a class="dropdown-item" href="shop-cart">cart</a></li>
				<li><a class="dropdown-item" href="#">주문내역 확인</a></li>
			</ul>
		</li>
		
		<!-- make icon -->
		<li class="dropdown"><a class="dropdown-item dropdown-toggle" href="#">User Info</a>
			<ul class="dropdown-menu">
				<li><a class="dropdown-item" href="#">My Info</a></li>
				<li><a class="dropdown-item" href="#">Message</a></li>
			</ul>
		</li>
		
		<!-- only access Administrator -->
		<li class="dropdown"><a class="dropdown-item dropdown-toggle" href="#">Admin </a>
			<ul class="dropdown-menu">
				<li><a class="dropdown-item" href="#">사용자 관리</a></li>
				<li><a class="dropdown-item" href="#">삭제된 게시글 관리</a></li>
			</ul>
		</li>
		
	</ul>
</nav>

